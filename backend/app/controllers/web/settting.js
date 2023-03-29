var Op = Sequelize.Op;
var sequelize = require('../../../config/database')(Sequelize);

module.exports = function(model, config){	
	var module = {};
	module.view = async function(req, res){
		try{
			var setting = await model.Setting.findByPk('1');
			var totalCommunities = await model.Community.findAll();
	
			return res.send(JSON.stringify({"status":'success','message':'', data : {
				// rouletteData: rouletteData,
				setting,
				totalCommunities
			}}));

		}catch(error){
			console.log('error', error);
			return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Reload page'}))

		}
	};
	module.removeCommunity = async function(req, res){
		try{
			let CommunityID = req.params.pid;
			await model.Community.destroy({
				where : {id : CommunityID}
			});
			var totalCommunities = await model.Community.findAll();
			return res.send(JSON.stringify({status : 'success', message : '', data : {
				totalCommunities
			}}));
		}
		catch(error){
			console.log("error", error);
			return res.send(JSON.stringify({status : 'failed', message : 'try again'}));

		}
	}
	module.addCommunity = async function(req, res){
		try{
			if(!req.body.name)
				return res.send(JSON.stringify({status : 'failed', message : 'NFT name missed'}));
			if(!req.body.mint_key)
				return res.send(JSON.stringify({status : 'failed', message : 'NFT mint_key missed'}));
			if(!req.body.color)
				return res.send(JSON.stringify({status : 'failed', message : 'Commumity color missed'}));
			let name = req.body.name;
			let mint_key = req.body.mint_key;
			let color = req.body.color;

			await model.Community.create({
				name : name,
				mint_key : mint_key,
				color : color
			})
			var totalCommunities = await model.Community.findAll();
			return res.send(JSON.stringify({status : 'success', message : '', data : {
				totalCommunities
			}}));
		}
		catch(error){
			return res.send(JSON.stringify({status : 'failed', message : 'try again'}));
		}
	}

	module.updateCommunity = async function (req, res){
		try{
			let communityID = req.body.id;
			let community = await model.Community.findByPk(communityID);
			if(community){
				let updateData = {}
				if(req.body.name)
					updateData.name = req.body.name
				if(req.body.mint_key)
					updateData.mint_key = req.body.mint_key
				if(req.body.color)
					updateData.color = req.body.color
				await community.update(updateData);
				var totalCommunities = await model.Community.findAll();
				
				res.send({status : 'success', data : totalCommunities})
			}
			else
				res.send(JSON.stringify({status : 'failed', message : 'setting not found'}))
		}catch(error){
			res.send(JSON.stringify({status : 'failed', message : 'something went wrong'}))
		}
	}

	module.updateSetting = async function (req, res){
		try{
			let setting = await model.Setting.findByPk('1');
			if(setting){
				let updateData = {}
				if(req.body.chips)
					updateData.chips = req.body.chips
				if(req.body.max_bet)
					updateData.max_bet = req.body.max_bet
				if(req.body.min_bet)
					updateData.min_bet = req.body.min_bet
				if(req.body.deposit_admin_commission)
					updateData.deposit_admin_commission = req.body.deposit_admin_commission
				if(req.body.roulette_admin_commission)
					updateData.roulette_admin_commission = req.body.roulette_admin_commission
				if(req.body.ternandcond)
					updateData.ternandcond = req.body.ternandcond
				await setting.update(updateData);
				res.send({status : 'success', data : setting})
			}
			else
				res.send(JSON.stringify({status : 'failed', message : 'setting not found'}))
		}catch(error){
			res.send(JSON.stringify({status : 'failed', message : 'something went wrong'}))
		}
	}

	return module;
}