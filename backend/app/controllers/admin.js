module.exports = function (model) {
	var module = {};
	const config = require('../../config/constants.js');
	module.login = require('./admin/login')(model,config);
	module.dashboard = require('./admin/dashboard')(model,config);
	module.user = require('./admin/user')(model,config);
	module.cms = require('./admin/cms')(model,config);
	module.roulette = require('./admin/roulette')(model,config);
	module.setting = require('./admin/setting')(model,config);
	module.deposit = require('./admin/deposit')(model,config);
	module.withdraw = require('./admin/withdraw')(model,config);
	module.houseWallet = require('./admin/houseWallet')(model, config);
	
	return module;
}
