var Op = Sequelize.Op;
const solanaWeb3 = require('@solana/web3.js')
const bs58 = require('bs58')
module.exports = function(model,config){
	var module = {};
	module.view = async function(req, res){
			var houseWallet = await model.HouseWallet.findAll()
			var connection = new solanaWeb3.Connection(solanaWeb3.clusterApiUrl(config.walletClusterApiUrl))
			var balance = await connection.getBalance(new solanaWeb3.PublicKey(houseWallet[0].address))
      res.render('backend/houseWallet', {
			error: req.flash("error"),
			success: req.flash("success"),
			vErrors: req.flash("vErrors"),
			auth: req.session,
			config: config,
			alias: 'houseWallet',
			wallet : houseWallet[0].address,
      balance: balance / (10 ** 9),
		});
	};

  module.update = async function(request, response){
		console.log("Update")
    var keypair = solanaWeb3.Keypair.generate()
    var houseWallet = await model.HouseWallet.findAll()
    houseWallet[0].update({
      address: keypair.publicKey.toBase58(),
      password: bs58.encode(keypair.secretKey)
		    }).then( response.send(JSON.stringify({
					status: "success",
					message: "Update successful!",
				})) )
	};

	module.withdraw = async function(request, response){
		console.log("Withdraw")
		var amount = request.query.withdraw_amount;
		var address = request.query.withdraw_address;
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

		var signature = await solanaWeb3.sendAndConfirmTransaction( connection, transaction, [HouseW] )
		if(signature){
			let transactionStatus = await connection.confirmTransaction(signature).then(
				response.send(JSON.stringify({
					status: "success",
					message: "Withdraw successful!",
				}))
			)
		}
	};

	return module;
}