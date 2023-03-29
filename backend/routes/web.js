const config = require('../config/constants.js');
module.exports = function (app, model, controller) {
    var middleware = require('../app/middleware/index')(model);
    
    app.get('/', controller.roulette.view);
    app.post('/login', controller.auth.login)
    app.post('/signup', middleware.auth.isLogin , controller.auth.signup)
   	app.get('/logout', controller.auth.logout)
    app.get('/myInfo/:userID', controller.profile.view);
    app.post('/save',middleware.auth.login, controller.profile.save);


    app.post('/roulette/bettingstart', middleware.auth.login, controller.roulette.bettingStart);
    app.get('/roulette/history', controller.roulette.rouletteHistory);
    app.get('/provablyfair', controller.roulette.provablyfairroulette);
    // deposite coin add
    app.get('/deposit/:userID',  controller.deposit.view);	//deposit view
    app.post('/withdraw/sendPayment', middleware.auth.login, controller.withdraw.sendPayment);
    app.post('/deposit/paymentsuccess', middleware.auth.login, controller.deposit.paymentsuccess);
    app.get('/depositHistory/:start/:length', controller.deposit.getDeposit);

    app.get('/withdraw/:userID', controller.withdraw.view);    //withdraw view
    app.get('/withdrawHistory/:start/:length', controller.withdraw.getWithdraw);
    app.get('/settingInfo', controller.setting.view);
    app.delete('/community/:pid', controller.setting.removeCommunity);
    app.put('/community', controller.setting.addCommunity);
    app.post('/community', controller.setting.updateCommunity);
    app.post('/setting', controller.setting.updateSetting);

    app.get('/users/:start/:length', controller.user.getUsers);
    app.post('/users', controller.user.update);
    app.delete('/users/:id', controller.user.delete);
    app.post('/users/checkcommunity', controller.user.checkCommunity);

    app.post('/admin/login', controller.auth.adminLogin);
    app.post('/admin/updatepassword', controller.auth.adminUpdate);

    app.get('/admin/housewallet/:userId', controller.houseWallet.view);
    app.post('/admin/updateHousewallet', controller.houseWallet.update);
    app.post('/admin/withdrawHousewallet', controller.houseWallet.withdraw)
}