var dateFormat = require('moment');
let Op = Sequelize.Op;
const web3 = require("@solana/web3.js")
const bs58 = require("bs58")
const nacl = require('tweetnacl')

module.exports = function (model, config) {
    var module = {};

    module.view = async function (req, res) {
        try {
            if (req.params.userID) {
                var userId = req.params.userID;
                var userDetail = await model.User.findByPk(userId).then(userRes=>{
					return userRes;
				})
                var withdrawList = await model.Withdraw.findAll({
                    where: {'user_id': userId}, order: [['id', 'DESC'],], raw: true
                }).then(withdrawRes => {
                    for (var i = 0; i < withdrawRes.length; i++) {
                        withdrawRes[i].transaction_date = dateFormat(withdrawRes[i].transaction_date, 'mm/dd/yyyy');
                    }
                    return withdrawRes;
                }).catch(function (error) {
                    console.log("errorr: ", error);
                });

                /////////////withdrawable amount////////////////
                let turnover_req = parseFloat(userDetail.turnover_req);
                let total_game_deposite = parseFloat(userDetail.total_game_deposite);
                let withdrawables = 0;
                if(turnover_req <= total_game_deposite)
                    withdrawables = parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance);
                else
                    withdrawables = parseFloat(userDetail.normal_balance);

                console.log("withdrawbles", withdrawables);

                /////////////totalBalance///////////
                let totalBalance = parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance);

                if (userDetail !== null) {
                    return res.send(JSON.stringify({"status":'Success','message':'', 'data' : {
                        userDetail: userDetail,
                        withdrawList: withdrawList,
                        withdrawables : withdrawables.toFixed(2),
                        total_balance : totalBalance.toFixed(2)
                    }}));
                    // res.render('frontend/withdraw', {
                    //     error: req.flash("error"),
                    //     success: req.flash("success"),
                    //     vErrors: req.flash("vErrors"),
                    //     auth: req.session,
                    //     config: config,
                    //     alias: 'withdraw',
                    //     userDetail: userDetail,
                    //     withdrawList: withdrawList,
                    //     withdrawables : withdrawables.toFixed(2),
                    //     total_balance : totalBalance.toFixed(2)
                    // });
                } else {
                    return res.send(JSON.stringify({"status":'fail','message':'Please login first'}))
                }
            } else {
                return res.send(JSON.stringify({"status":'fail','message':'Please login first'}))
            }
        } catch (error) {
            return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))
        }
    };

    module.sendPayment = async function (req, res) {
        try {
            var reqPara = req.body;
            let coin=reqPara.amount;
            let userId= reqPara.userID
            var userWalletAddress = reqPara.userWalletPubKey;
            var date = reqPara.date;
            const verifyMessage = new TextEncoder().encode(`Solstonks Withdraw ${coin}, ${date}`)
            var buf = new ArrayBuffer(reqPara.signature.length)
            var bufView = new Uint8Array(buf)
            for(var i = 0; i < reqPara.signature.length; i ++) {
                bufView[i] = reqPara.signature.charCodeAt(i)
            }
            const publicKeyBytes = new web3.PublicKey(userWalletAddress).toBuffer()
            const result = nacl.sign.detached.verify(verifyMessage, bufView, publicKeyBytes)
            
            var userDetail = await model.User.findByPk(userId).then(userRes => {
                return userRes;
            }).catch(err=>{
                console.log('error userDetail => ', err)
            })

            /////////////withdrawable amount////////////////
            let turnover_req = parseFloat(userDetail.turnover_req);
            let total_game_deposite = parseFloat(userDetail.total_game_deposite);
            let withdrawables = 0;
            if(turnover_req <= total_game_deposite)
                withdrawables = parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance);
            else
                withdrawables = parseFloat(userDetail.normal_balance);

            console.log("withdrawbles", withdrawables);

            if(!result) {
                return res.send(JSON.stringify({"status":'fail','message':'Verify Code Error.'}))
            } else if (userDetail) {
                if (parseFloat(withdrawables) >= parseFloat(coin)) {
                    if (coin) {
                        if (userWalletAddress.length !== 0) {
                            try {
                                var withdrawData = {
                                    coin:coin,
                                    userWalletAddress:userWalletAddress,
                                    user_id: userId,
                                    transaction_date: date,
                                };
                                
                                let withdraw = await model.Withdraw.create(withdrawData);

                                var houseWallet = await model.HouseWallet.findAll()
                                const connection = new web3.Connection(web3.clusterApiUrl(config.walletClusterApiUrl), {commitment:'confirmed',confirmTransactionInitialTimeout:120000})
                                let transaction = new web3.Transaction()
                                const HouseW = web3.Keypair.fromSecretKey(bs58.decode(houseWallet[0].password))
                                
                                var balance = await connection.getBalance(new web3.PublicKey(houseWallet[0].address));
                                if( balance < web3.LAMPORTS_PER_SOL * coin){
                                    return res.send(JSON.stringify({"status":'fail','message':'Invalid Balance'}))
                                }
                                transaction.add(web3.SystemProgram.transfer(
                                    {
                                        fromPubkey: HouseW.publicKey,
                                        toPubkey: new web3.PublicKey(userWalletAddress),
                                        lamports: web3.LAMPORTS_PER_SOL * coin
                                    }
                                ))
                                var signature = await web3.sendAndConfirmTransaction( connection, transaction, [HouseW] )
                                console.log("hee", signature)
                                
                                let transactionStatus = await connection.getSignatureStatus(signature)

                                //////////////////withdrawble normal and bonus//////////////////////
                                if(!transactionStatus.value)
                                    return res.send(JSON.stringify({status: 'failed', message: 'transaction is failed! please try again.'}))
                                
                                console.log("withdraw result ==>", transactionStatus, signature);
                                
                                let transData = {
                                    price: coin,
                                    transaction_signature: signature,
                                    transaction_block: transactionStatus.context.slot,
                                    status: "Approved",
                                    };
                                await withdraw.update(transData);
                                
                                    let withdraw_normal = 0;
                                let withdraw_bonus = 0;
                                
                                if(userDetail.normal_balance >= coin){
                                    withdraw_normal = coin;

                                }
                                else
                                {
                                    withdraw_normal = parseFloat(userDetail.normal_balance);
                                    withdraw_bonus = coin - withdraw_normal;
                                }
                                await model.User.update({
                                    total_withdraw: Sequelize.literal('total_withdraw + ' + coin),
                                    normal_balance: Sequelize.literal('normal_balance - ' + withdraw_normal),
                                    bonus_balance: Sequelize.literal('bonus_balance - ' + withdraw_bonus)
                                }, {where: {id: userId}});

                                var _user = await model.User.findByPk(userId);
                                return res.send(JSON.stringify({"status":'success','message':'Withdraw successful!','data' : _user}));



                                
                            
                            } catch (error) {
                                console.log(error);
                                return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))
                            }
                        } else {
                            return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))

                        }
                    } else {
                        return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))

                    }
                } else {
                    return res.send(JSON.stringify({"status":'fail','message':'Insufficient Balance.'}))

                }
            } else {
                return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))

            }
        } catch (error) {
            return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Try again'}))

        }
    };

    module.getWithdraw = async function(request, response){

        try{
            var start = parseInt(request.params.start) || 0;
            var length = parseInt(request.params.length) || 100;
            var search = request.body.search || '';
            var query = {};
            if (search != '') {
                var withdrawCount = await model.Withdraw.count({where:query});
                var withdrawData = await model.Withdraw.findAll({where:{[Op.or]:[{'$userDetail.name$': { [Op.like]: '%'+search+'%' }}]},order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
            }else{
                var withdrawCount = await model.Withdraw.count();
                var withdrawData = await model.Withdraw.findAll({order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
            }
            var withdrawList = new Array();
            for(var i = 0; i < withdrawData.length; i++) {
                var data = {
                    id : withdrawData[i].id,
                    name:withdrawData[i].userDetail.name,
                    avatarUrl : withdrawData[i].userDetail.profile_image,
                    signature:withdrawData[i].transaction_signature,
                    sol_amount:withdrawData[i].coin,
                    price:withdrawData[i].price,
                    created_at:dateFormat(withdrawData[i].transaction_date, "mm-dd-yyyy, hh:MM:ss TT"),
                }
                withdrawList.push(data);
            }
            
            
            return response.send(JSON.stringify({status : 'success', data : withdrawList, count : withdrawCount}));
        }
        catch(error){
            console.log(error);
            return response.send(JSON.stringify({status : 'failed', message : 'something went wrong'}));

        }
		
	};

    return module;
}