var Op = Sequelize.Op;
var sequelize = require('../../../config/database')(Sequelize);

module.exports = function(model, config){	
	var module = {};
	module.view = async function(req, res){
		try{
	
			var totalUser = await model.User.findAll(
				{where:
				{type:'user',is_deleted:'0'},
				attributes: [
					[Sequelize.fn('sum', Sequelize.col('total_game_deposite')), 'total_game_deposite'],
					[Sequelize.fn('sum', Sequelize.col('total_win_amount')), 'total_win_amount'],
					[Sequelize.fn('sum', Sequelize.col('kickback_balance')), 'kickback_balance'],
					[Sequelize.fn('COUNT', 0), 'count']
				],
				group:['type'],
				raw:true
			})
			var totalDepositors = await model.User.findAll(
				{where:{
					type : 'user', is_deleted: '0', total_deposite: '>0'},
				attributes: [
						[Sequelize.fn('COUNT', 0), 'count']
				],
				group:['type'],
				raw:true})
			console.log('totalUser -->', totalUser);
			console.log('totalDepositors -->', totalDepositors);
			var setting = await model.Setting.findByPk('1');
	
			return res.send(JSON.stringify({"status":'success','message':'', data : {
				// rouletteData: rouletteData,
				setting : setting,
				totalUserInfo : totalUser[0],
				totalDepositors : totalDepositors[0]}}))

		}catch(error){
			return res.send(JSON.stringify({"status":'fail','message':'Something went wrong! Reload page'}))

		}
	};

	module.provablyfairroulette = async function(req, res){
		try{
			let rouletteData = await model.Roulette.findAll({limit:20,order:[['id','DESC']],raw: true});
			if(rouletteData.length){
				for(let i=0;i<5;i++){
					rouletteData[i].hash_salt = ''; 
				}

				return res.send({status : 'success', data : rouletteData})
			}
			else
				return res.send({status : 'failed', message : 'rouletteData not found'})
			
		}catch(error){
			return res.send({status : 'failed', message : 'something went wrong'})
		}
	};

	module.rouletteHistory = async function (req, res) {
		try{
			var lastest = await model.Roulette.findAll();
			var dangerCounts = lastest.filter(item=>item.game_stopped_on == 'danger').length;
			var greenCounts = lastest.filter(item=>item.game_stopped_on == 'green').length;
			var blackCounts = lastest.filter(item=>item.game_stopped_on == 'black').length;
			return res.send(JSON.stringify({"status":'success','message':'', data : {
				dangerCounts,
				greenCounts,
				blackCounts
			}}))

		}
		catch(error){

		}
		
		
	}

	module.bettingStart = async function (req, res) {
		try {
			var userId = req.body.userID;
			var betAmount = req.body.bet_amount
			var btn_clicks = req.body.type;
			if (userId < 0) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please log in to Play' }));
			
			}
			if (betAmount == "") {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please enter bet amount' }));
			
			}
			if (isNaN(betAmount)) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please enter valid bet amount' }));
			
			}

			if (betAmount <= 0) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please enter valid bet amount' }));
			
			}
			var settingDetail = await model.Setting.findOne().then(settingRes => {
				return settingRes;
			});

			console.log("betAmount", parseFloat(betAmount), parseFloat(settingDetail.min_bet))
			if (parseFloat(betAmount) < parseFloat(settingDetail.min_bet)) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please enter minimum bet amount ' + settingDetail.min_bet, }));
			
			}
			
			var userDetail = await model.User.findOne({ where: { "id": userId }, raw: true },);
			if (!userDetail) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "User not found", }));
			
			}
			if (userDetail.status == 0) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "You have been banned. Please contact to admin.", }));
			
			}
			if (userDetail.is_login == 0) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "User data not found. Please log in to Play.", }));
			
			}
			if (userDetail.is_deleted == '1') {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "Your account deleted from admin side. please contact to admin.", }));
			
			}
			var rouletteDetail = await model.Roulette.findOne({ attributes: ['id'], where: { game_status: 'pending' } });
			if (!rouletteDetail) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "Roulette game already started", }));
			
			}
			if (parseFloat(parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance)) < parseFloat(betAmount)) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': "Insufficient balance to play game " + config.roulettePerRoundBet + " bets per round", }));
			
			}
			if (parseFloat(betAmount) + parseFloat(rouletteDetail.bet_amount) > parseFloat(settingDetail.max_bet)) {
				return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Please enter Valid amount. Amount should not be greater than ' + settingDetail.max_bet, }));
			
			}


			var rouletteId = rouletteDetail.id;
			var perRoundUserBetLimit = await model.RouletteHistory.sum('bet_amount', { where: { roulette_id: rouletteId, user_id: userDetail.id } })
			console.log(perRoundUserBetLimit)
			var roulette_data = perRoundUserBetLimit;
			// if (parseFloat(roulette_data) + parseFloat(betAmount) > config.roulettePerRoundBet) {
			// 	return res.send(JSON.stringify({ 'status': 'fail', 'message': "You can place only " + config.roulettePerRoundBet + " bets per round", }));
			
			// }
			await model.Roulette.update({ bet_amount: Sequelize.literal('bet_amount + ' + betAmount) }, { where: { id: rouletteId } });
			/////////////////////////affiliate system//////////////////////////
			let normal = userDetail.normal_balance;
			let bonus = userDetail.bonus_balance;

			let bet_normal = 0, bet_bonus = 0;
			if(bonus >= betAmount)
				bet_bonus = betAmount;
			else{
				bet_bonus = bonus;
				bet_normal = betAmount - bet_bonus;
			}
			await model.User.update({ 
				normal_balance: Sequelize.literal('normal_balance - ' + bet_normal), 
				bonus_balance: Sequelize.literal('bonus_balance - ' + bet_bonus),
				total_game_deposite: Sequelize.literal('total_game_deposite + ' + betAmount)}, { where: { id: userDetail.id } });

			////kickback//////
			console.log("kickback", parseFloat(betAmount) * parseFloat(userDetail.kickback_percent) / 100);
			let kickBackUser = await model.User.findOne({where: { "referral_code": userDetail.affiliate }});
			kickBackUser.update({ 
				kickback_balance: Sequelize.literal('kickback_balance + ' + parseFloat(betAmount) * parseFloat(kickBackUser.kickback_percent) / 100),
				normal_balance: Sequelize.literal('normal_balance + ' + parseFloat(betAmount) * parseFloat(kickBackUser.kickback_percent) / 100)});
			//////////////////
			// let userBalance = parseFloat(userDetail.normal_balance) + parseFloat(userDetail.bonus_balance) - parseFloat(betAmount)
			// io.emit("rouletteBalanceAfterBet", { main_balance: parseFloat(userBalance).toFixed(2), user_id: userDetail.jwt_login_token });
			///////////////////////////////////////////////////////////////////////
			let wonMultiplier = 0;
			if (btn_clicks == 'danger') {
				wonMultiplier = config.WonDangerMultiplier;
			} else if (btn_clicks == 'grey') {
				wonMultiplier = config.WonGreyMultiplier;
			} else if (btn_clicks == "green") {
				wonMultiplier = config.WonGreenMultiplier;
			}
			if (btn_clicks == 'grey') {
				btn_click = 'black';
			} else {
				btn_click = btn_clicks
			}
			await model.User.update({	nonce: userDetail.nonce + 1	},{ where: { id: userDetail.id } });
			var rouletteData = {
				'bet_amount': betAmount,
				'bonus_bet_amount' : bet_bonus,
				'selected_color': btn_click,
				'roulette_id': rouletteId,
				'user_id': userDetail.id,
				'winning_amount': betAmount * wonMultiplier,
				'client_seed': userDetail.client_seed,
				'server_seed': userDetail.server_seed,
				'nonce': userDetail.nonce + 1
			}
			await model.RouletteHistory.create(rouletteData, { raw: true });
			// let joinedUser = await sequelize.query("SELECT rh.id as history_id,um.id as user_id,um.name,um.profile_image,rh.selected_color,rh.bet_amount FROM user_masters um JOIN roulette_histories rh ON um.id=rh.user_id WHERE rh.roulette_id=" + rouletteId, { type: sequelize.QueryTypes.SELECT });
			// io.emit("rouletteJoinedByUser", joinedUser);
			userDetail = await model.User.findOne({ where: { "id": userId }, raw: true },);
			return res.send(JSON.stringify({ 'status': 'success', 'message': 'Bet placed successfully', 'data' : userDetail }));
		} catch (error) {
			console.log("eror", error);
			return res.send(JSON.stringify({ 'status': 'fail', 'message': 'Game not available', }));
		}
	};
	return module;
}