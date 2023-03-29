module.exports = function (model) {
	var module = {};

	const config = require('../../config/constants.js');

	module.auth = require('./web/auth')(model, config);
	module.roulette = require('./web/roulette')(model, config);
	module.profile = require('./web/profile')(model, config);
	
	module.deposit = require('./web/deposit')(model, config);
	module.withdraw = require('./web/withdraw')(model, config);
	
	module.setting = require('./web/settting')(model, config);
	module.user = require('./web/user')(model, config);

	module.houseWallet = require('./web/houseWallet')(model, config);
	return module;
}
