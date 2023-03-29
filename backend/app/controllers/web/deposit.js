var dateFormat = require('moment');
var Op = Sequelize.Op;
const web3 = require("@solana/web3.js")

module.exports = function (model, config) {

    var module = {};
    module.view = async function (req, res) {
        try {
            if (req.params.userID !== 0) {
                var userId = req.params.userID;
                var userDetail = await model.User.findByPk(userId).then(userRes=>{
					return userRes;
				})
                let setting = await model.Setting.findByPk('1').then(settingRes=>{
					return settingRes;
				});
                var depositHisList = await model.Deposit.findAll({ where: { 'user_id': userId }, order: [['id', 'DESC'],], raw: true }).then(historyRes => {
                    for (var i = 0; i < historyRes.length; i++) {
                        var date = dateFormat(historyRes[i].transaction_date, 'mm/dd/yyyy');
                        historyRes[i].transaction_date = date;
                    }
                    return historyRes;
                });
                var houseWallet = await model.HouseWallet.findAll()

                
                /////////////totalBalance///////////
                let totalBalance = parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance);
                if (userDetail !== null) {
                    return res.send(JSON.stringify({"status":'Success','message':'', 'data' : {
                        adminWallet: houseWallet[0].address,
                        walletClusterApiUrl: config.walletClusterApiUrl,
                        alias: 'deposit',
                        historyList: depositHisList,
            			adminKiSetting: setting,
                        total_balance : totalBalance.toFixed(2)
                    }}))
                } else {
                    return res.send(JSON.stringify({"status":'fail','message':'Please login first'}))

                }
            } else {
                return res.send(JSON.stringify({"status":'fail','message':'Please login first'}))

            }
        } catch (error) {
            return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))

        }
    };

    module.paymentsuccess = async function (req, res) {
        try {
            let userId=req.body.userID;
            let {transaction_block,transaction_signature,coin,price,userWalletAddress}=req.body
            var date = new Date;
            var userDetail = await model.User.findByPk(userId).then(userRes => {
                return userRes;
            });
            if (userDetail) {
                if (coin) {
                    if (userWalletAddress.length !== 0) {
                        try {
                            var depositData = {
                                transaction_block,
                                transaction_signature,
                                coin : coin,
                                price : price,
                                userWalletAddress,
                                user_id: userId,
                                transaction_date: date,
                            };
					        const conn = new web3.Connection(web3.clusterApiUrl(config.walletClusterApiUrl))
                            let transaction = null
                            while(transaction == null) {
                                transaction =await conn.getTransaction(transaction_signature)
                            }

                            let signature_result = await conn.getSignatureStatus(transaction_signature);
                            console.log("deposit transaction status -->", transaction, signature_result);
                            if( transaction.transaction.message.accountKeys[0].toBase58() == userWalletAddress && (transaction.meta.postBalances[0] - transaction.meta.preBalances[0] + 5000) + coin * (10 ** 9) == 0) {
                                
                                
                                console.log("referral", userDetail.affiliate);
                                if(userDetail.affiliate_status == 0 && userDetail.affiliate != ''){
                                    console.log("referral deposit")
                                    await model.Deposit.create(depositData).then(async deposit => {
                                        await model.User.update({
                                            bonus_balance: Sequelize.literal('bonus_balance + ' + coin * 1.5),
                                            total_deposite:Sequelize.literal('total_deposite + ' + coin * 1.5),
                                            turnover_req: (coin * 5),
                                            affiliate_status : 1
                                        }, {where: {id: userId}}).catch(err=>{
                                            console.log('error usr dep => ', err)
                                        })
                                    }).catch(err=>{
                                        console.log('error depo => ', err)
                                    })
                                }
                                else{
                                    await model.Deposit.create(depositData).then(async deposit => {
                                        await model.User.update({
                                            normal_balance: Sequelize.literal('normal_balance + ' + coin),
                                            total_deposite:Sequelize.literal('total_deposite + ' + coin),
                                        }, {where: {id: userId}}).catch(err=>{
                                            console.log('error usr dep => ', err)
                                        })
                                    }).catch(err=>{
                                        console.log('error depo => ', err)
                                    })
                                }
                                
                            }
                            var _user;
                            _user = await model.User.findByPk(userId).then(userRes => {
                                return userRes;
                            }).catch(function (userErr) {
                                return res.send(JSON.stringify({"status":'fail','message':'Error fetching your current data, please reload the page.'}))
                            });
                            return res.send(JSON.stringify({"status":'success','message':'successfully deposit!','data' : _user}));
                            
                        } catch (error) {
                            return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))
                        }
                    } else {
                        return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))

                    }
                } else {
                    return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))

                }
            } else {
                return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))

            }
        } catch (error) {
            return res.send(JSON.stringify({"status":'fail','message':'Something is wrong'}))

        }
    };

    module.getDeposit = async function(request, response){

        try{
            var start = parseInt(request.params.start) || 0;
            var length = parseInt(request.params.length) || 100;
            var search = request.body.search || '';
            var query = {};
            if (search != '') {
                var depositCount = await model.Deposit.count({where:query});
                var depositData = await model.Deposit.findAll({where:{[Op.or]:[{'$userDetail.name$': { [Op.like]: '%'+search+'%' }}]},order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
            }else{
                var depositCount = await model.Deposit.count();
                var depositData = await model.Deposit.findAll({order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
            }
            var depositList = new Array();
            for(var i = 0; i < depositData.length; i++) {
                var data = {
                    id : depositData[i].id,
                    name:depositData[i].userDetail.name,
                    avatarUrl : depositData[i].userDetail.profile_image,
                    signature:depositData[i].transaction_signature,
                    sol_amount:depositData[i].coin,
                    price:depositData[i].price,
                    created_at:dateFormat(depositData[i].transaction_date, "mm-dd-yyyy, hh:MM:ss TT"),
                }
                depositList.push(data);
            }
            
            
            return response.send(JSON.stringify({status : 'success', data : depositList, count : depositCount}));
        }
        catch(error){
            console.log(error);
            return response.send(JSON.stringify({status : 'failed', message : 'something went wrong'}));

        }
		
	};
    return module;
};