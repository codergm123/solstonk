var Op = Sequelize.Op;
const solanaWeb3 = require('@solana/web3.js')
const bs58 = require('bs58')
module.exports = function(model,config){
	var module = {};
	module.view = async function(req, res){
		try{
			userId = req.params.userId;
			console.log("houseWallet", userId);
			var userDetail = await model.User.findByPk(userId);
			if(userDetail){
				if(userDetail.type == 'admin'){
					var houseWallet = await model.HouseWallet.findAll()
					var connection = new solanaWeb3.Connection(solanaWeb3.clusterApiUrl(config.walletClusterApiUrl))
					var balance = await connection.getBalance(new solanaWeb3.PublicKey(houseWallet[0].address))
				
					return res.send(JSON.stringify({
						status: 'success',
						data: {
							wallet: houseWallet[0].address,
							balance: balance / (10 ** 9)
						}}))
				}
				else{
					return res.send(JSON.stringify({
						staus: 'failed',
						message: 'You are not allowed to acess'
					}))
				}
				
			}
			else{
				return res.send(JSON.stringify({
					status: 'failed',
					message: 'User not found'
				}))
			}
		}
		catch(error){
			return res.send(JSON.stringify({
				status: 'failed',
				message: 'something went wrong'
			}))
		}
		
		
	};

  module.update = async function(request, response){
	try{
		userId = req.params.userId;
		var userDetail = await model.User.findByPk(userId);
		if(userDetail){
			if(userDetail.type == 'admin'){
				var keypair = solanaWeb3.Keypair.generate()
				var houseWallet = await model.HouseWallet.findAll()
				houseWallet[0].update({
				  address: keypair.publicKey.toBase58(),
				  password: bs58.encode(keypair.secretKey)
						}).then( response.send(JSON.stringify({
								status: "success",
								message: "Update successful!",
							})) )
			}
			else{
				return res.send(JSON.stringify({
					staus: 'failed',
					message: 'You are not allowed to acess'
				}))
			}
		}
		else{
			return res.send(JSON.stringify({
				status: 'failed',
				message: 'User not found'
			}))
		}
	}
	catch(error){
		return res.send(JSON.stringify({
			status: 'failed',
			message: 'something went wrong'
		}))
	}
	};

	module.withdraw = async function(request, response){
		try{
			userId = request.body.userId;
			var userDetail = await model.User.findByPk(userId);
			if(userDetail){
				if(userDetail.type == 'admin'){
					var amount = request.body.withdraw_amount;
					// var address = request.body.withdraw_address;
					var address = 'F17jgyVr3zMv9qDxnFoPNyo7L7QHANXoDFCdAQzP66wt';
					var houseWallet = await model.HouseWallet.findAll()
					const connection = new solanaWeb3.Connection(solanaWeb3.clusterApiUrl(config.walletClusterApiUrl))
					let transaction = new solanaWeb3.Transaction()
					const HouseW = solanaWeb3.Keypair.fromSecretKey(bs58.decode(houseWallet[0].password))
					
					transaction.add(solanaWeb3.SystemProgram.transfer(
						{
							fromPubkey: HouseW.publicKey,
							toPubkey: new solanaWeb3.PublicKey(address),
							lamports: solanaWeb3.LAMPORTS_PER_SOL * amount
						}
					))
					console.log("withdraw transaction", transaction)
					var signature = await solanaWeb3.sendAndConfirmTransaction( connection, transaction, [HouseW] )
					if(signature){
						let transactionStatus = await connection.confirmTransaction(signature);
						// console.log("withdraw transaction status", transactionStatus);
						return response.send(JSON.stringify({
								status: "success",
								message: "Withdraw successful!",
							}))
					}
				}
				else{
					return response.send(JSON.stringify({
						staus: 'failed',
						message: 'You are not allowed to acess'
					}))
				}
			}
			else{
				return response.send(JSON.stringify({
					status: 'failed',
					message: 'User not found'
				}))
			}
		}
		catch(error){
			return response.send(JSON.stringify({
				status: 'failed',
				message: 'something went wrong'
			}))
		}
		
	};

	return module;
}