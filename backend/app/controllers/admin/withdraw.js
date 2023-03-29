// var dateformat = require('dateformat');
// import dateFormat, { masks } from "dateformat";
var dateFormat = require('moment');

const web3 = require("@solana/web3.js")
const bs58 = require("bs58")
var Op = Sequelize.Op;

module.exports = function(model,config){	
	var module = {};

	module.view = function(request, response){
		response.render('backend/withdraw/list', {
			title: 'Withdraw List',
			error: request.flash("error"),
			success: request.flash("success"),
			vErrors: request.flash("vErrors"),
			auth: request.session,
			config: config,
			alias:'withdraw',
			subAlias:'list',
		});
	};

	module.getWithdraw = async function(request, response){

		var start = parseInt(request.query.start);
	    var length = parseInt(request.query.length);
	    var search = request.query.search.value;
	    var query = {};

	    if (search != '') {
		    var withdrawCount = await model.Withdraw.count({where:query});
		    var withdrawData = await model.Withdraw.findAll({where:{[Op.or]:[{'$userDetail.name$': { [Op.like]: '%'+search+'%' }}]},order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
	    }else{
	    	var withdrawCount = await model.Withdraw.count();
		    var withdrawData = await model.Withdraw.findAll({order:[['id','DESC']], offset: start, limit: length, include: [{model: model.User, as: 'userDetail'}]});
	    }
	    //console.log("Spam Users: ", users);
	    var withdrawList = new Array();
	    for(var i = 0; i < withdrawData.length; i++) {
	    	var action = ''
				if(withdrawData[i].status == "Pending")
				action = `<a href="/backend/withdraw/approve/${withdrawData[i].id}"
			class="btn btn-success btn-sm" id="approveTransBtn" >Approve</a>

			<a style="margin-left:5px;" href="/backend/withdraw/reject/${withdrawData[i].id}" onClick="return confirm(\'Are you sure to reject this withdrawal request?\')" class="btn btn-danger btn-sm" title="Reject withdraw">Reject</a>
			`;
			var data = {
	    		user_name:withdrawData[i].userDetail.name,
	    		transaction_id:withdrawData[i].transaction_signature,
	    		coin:withdrawData[i].coin,
	    		SOL:withdrawData[i].price,
	    		status:withdrawData[i].status,
	    		transaction_date:dateFormat(withdrawData[i].transaction_date, "mm-dd-yyyy, hh:MM:ss TT"),
	    		editDel:action,
	    	}
	    	withdrawList.push(data);
	    }
	    
	    var obj = {
	      	'draw': request.query.draw,
	      	'recordsTotal': withdrawCount,
	      	'recordsFiltered': withdrawCount,
	      	'data': withdrawList
	    };
	    
	    return response.send(JSON.stringify(obj));
	};

	module.delete = async function(request, response){
		var depositId = request.params.id;
		if(depositId != "" && depositId != 0){
			try{
				var gameData = await model.Withdraw.findByPk(depositId);
				if(gameData != null){
					gameData.destroy();
					request.flash('success',"Withdraw delete successfully.");
					response.redirect('/backend/withdraw');
				}else{
					request.flash('error',"Withdraw not delete.");
					response.redirect('/backend/withdraw');
				}
			}catch(err){
				console.log("delete error: ", err);
				request.flash('error',"Withdraw not delete.");
				response.redirect('/backend/withdraw');
			}
		}else{
			request.flash('error',"Withdraw not delete.");
			response.redirect('/backend/withdraw');
		}
	};
	module.approve = async function(request, response){
		var depositId = request.params.id;
		if(depositId != "" && depositId != 0){
			try{
				var gameData = await model.Withdraw.findByPk(depositId);
				if(gameData != null){
					var houseWallet = await model.HouseWallet.findAll()
					const connection = new web3.Connection(web3.clusterApiUrl(config.walletClusterApiUrl))
					let transaction = new web3.Transaction()
					const HouseW = web3.Keypair.fromSecretKey(bs58.decode(houseWallet[0].password))
					transaction.add(web3.SystemProgram.transfer(
						{
							fromPubkey: HouseW.publicKey,
							toPubkey: new web3.PublicKey(gameData.userWalletAddress),
							lamports: web3.LAMPORTS_PER_SOL * gameData.coin
						}
					))

					var signature = await web3.sendAndConfirmTransaction( connection, transaction, [HouseW] )
					if(signature){
						let transactionStatus = await connection.confirmTransaction(signature).then(
							async (data) => {
								let transData = {
										price: gameData.coin,
										transaction_signature: signature,
										transaction_block: data.context.slot,
										status: "Approved",
									};
								await gameData.update(transData).then( () => {
									request.flash('success',"Withdraw approve successfully.")
									response.redirect('/backend/withdraw')										
								})
								}
						)
					}

				}else{
					request.flash('error',"Withdraw not approved.");
					response.redirect('/backend/withdraw');
				}
			}catch(err){
				console.log("approve error: ", err);
				request.flash('error',"Withdraw not approved.");
				response.redirect('/backend/withdraw');
			}
		}else{
			request.flash('error',"Withdraw not approved.");
			response.redirect('/backend/withdraw');
		}
	};
	module.reject = async function(request, response){
		try {
      let transId = request.params.id;

      let transDetails = await model.Withdraw.findByPk(transId).then(
        (transRes) => transRes
      );

      if (transDetails) {
        try {
          let transData = {
            status: "Rejected",
          };

          await transDetails.update(transData).then(async (trans) => {
            await model.User.update(
              {
                total_withdraw: Sequelize.literal(
                  "total_withdraw - " + trans.coin
                ),
                main_balance: Sequelize.literal(
                  "main_balance + " + trans.coin
                ),
              },
              { where: { id: trans.user_id } }
            );
          });

          var _user;
          //Get main balance after update
          _user = await model.User.findByPk(transDetails.user_id)
            .then((userRes) => {
              return userRes;
            })
            .catch(function (userErr) {
              request.flash(
                "error",
                "Error fetching your current data, please reload the page."
              );
            });
          io.to(_user.socket_id).emit("withdrawCurrentBalance", {
            balance: _user.main_balance,
            userId: transDetails.user_id,
          });

          request.flash("success", "Withdraw request rejected.");
          response.redirect("/backend/withdraw");
        } catch (error) {
          console.log("er-> ", error);
          request.flash("error", "Error updating transaction.");
          response.redirect("/backend/withdraw");
        }
      } else {
        console.log("Withdrawal details not found");
        request.flash("error", "Withdrawal details not found.");
        response.redirect("/backend/withdraw");
      }
    } catch (err) {
      console.log("error->", err);
      request.flash("error", "Something went wrong please try later.");
      response.redirect("/backend/withdraw");
    }
	};
	return module;
}