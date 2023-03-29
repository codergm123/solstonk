module.exports = function(model) {
    var module = {};

    module.login = async function(req, res, next){
        if (req.body.userID) {
            var userDetail = await model.User.findByPk(req.body.userID);
            userDetail.main_balance = parseFloat(userDetail.main_balance);
            req.session.user = userDetail;
            var settingDetail = await model.Setting.findByPk(1);
            res.locals.adminSetChips = settingDetail.dataValues.chips;
            next();
        } else {
            return res.send(JSON.stringify({"status":'error','message':'Please login first'}));
        }
    }
    
    module.isLogin = async function(req, res, next){        
        if (req.session.user) {
            var userDetail = await model.User.findByPk(req.session.user.id);
            userDetail.main_balance = parseFloat(userDetail.main_balance);
            req.session.user = userDetail;
            var settingDetail = await model.Setting.findByPk(1);
            res.locals.adminSetChips = settingDetail.dataValues.chips;
			return res.send(JSON.stringify({"status":'error','message':'You have already login.'}));

        } else {
      	next();
        }
    }; 
    
    module.loginVal = async function(req, res, next){        
        if (req.body.walletId) {
            req.flash('error',"wallet address is missed");
            res.redirect('/');            
        } else {
      	next();
        }
    }; 

    return module;
}    