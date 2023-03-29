var flag = true;
module.exports = function(model, io, client){
	var config = require('../../config/constants.js');
	var roulette = require('./roulette')(model,config);

	updateRouletteUser();
	if(flag == true){
		flag = false;
		rouletteCheckStart();
	}

	function updateRouletteUser(){
		roulette.updateRouletteUser({},function(response){});
	}

	function rouletteCheckStart(){
		setInterval(function(){
			roulette.checkStart(function (response){
				if(response.status == 'gameStart')
					io.emit('gameStart', response)
				if(response.status == 'gameCheck')
					io.emit('gameCheck', response)
			})
		}
			,
			20000
		)
		
	}
	function gameStartCountDown(){
		io.emit("rouletteClearBetPlayer",{});
		roulette.gameCount(function(response){
			if(response.status == "success"){
				io.emit('rouletteStartCountDown',response);
			}
			if(response.status == "start"){
				rouletteGameLogic();
			}
			if(response.status == "restart"){
				flag = false;
				gameStartCountDown();
			}
		});
	}
	client.on('bettingStart', function(data, callback){
		roulette.bettingStart(data, function(response){
			callback(response);
		});
	});
	//END : Roulette game betting start
	function rouletteGameLogic(){
		roulette.rouletteLogic(function(response){
			if(response.status=="success"){
				flag = false;
				gameStartCountDown();				 
			}
		});
	}
}	