module.exports = function(model,config){	
	var module = {};
	module.view = async function(req, res){
		try{
			if(req.params.userID){
				var userId = req.params.userID;
				var userDetail = await model.User.findByPk(userId).then(userRes=>{
					return userRes;
				});
				if(!userDetail){
					return res.send(JSON.stringify({"status":'fail','message':'User not found!'}))
				} else if(userDetail.is_login == 0){
					return res.send(JSON.stringify({"status":'fail','message':'Please login first!'}))	
				}  else {
						var referralUsers = await model.User.findAll({where : {affiliate : userDetail.referral_code}});
						var referralDepositors = await model.User.findAll({where : {affiliate : userDetail.referral_code, affiliate_status: 1}});
						var totalBetByDepositors = 0;
						
						for(let i=0; i< referralDepositors.length; i++){
							totalBetByDepositors += parseFloat(referralDepositors[i].total_game_deposite);
						}
						console.log("referral User", totalBetByDepositors);
					return res.send(JSON.stringify({"status":'success','message':'','data' : userDetail, 'referralInfo' : {
						totalEarning : userDetail.kickback_balance,
						totalVisitors : referralUsers.length,
						totaldepositors : referralDepositors.length,
						totalBetByDepositors : totalBetByDepositors,
					}}));
				}
			}else{
				return res.send(JSON.stringify({"status":'fail','message':'UserID not found!'}))
			}	
		}catch(error){
			return res.send(JSON.stringify({"status":'fail','message':'Something went wrong!'}))

		}
	}
	module.save = async function(req, res){
		try{
			

			if(req.body != null){
				if(req.body.userID){
					var userId = req.body.userID;
					var userDetail = await model.User.findByPk(userId).then(userRes=>{
						return userRes;
					});
					if(!userDetail){
						return res.send(JSON.stringify({"status":'fail','message':'User not found!'}))
					} else if(userDetail.is_login == 0){
						return res.send(JSON.stringify({"status":'fail','message':'Please login first!'}))	
					}  else {
						var updateData = {}
						if(req.body.name){
							updateData.name = req.body.name
						}
						
					
						if(req.files){
							const myFile = req.files.file;
							var tempNum = helper.randomNumber(6);
							image_name = tempNum + ".jpg";
							
							myFile.mv('./public/frontend/upload/user/'+image_name, async function (uploadErr) {});
							console.log("test");
							updateData.profile_image = image_name	
						}
						await userDetail.update(updateData);
						await userDetail.reload();
						return res.send(JSON.stringify({"status":'success','message':'UserInfo successfully updated!','data' : userDetail}));
					}
				}else{
					return res.send(JSON.stringify({"status":'fail','message':'User not found!'}))
				}				
			}else{
				return res.send(JSON.stringify({"status":'fail','message':'User not found!'}))
			}
		}catch(error){
			return res.send(JSON.stringify({"status":'fail','message':'Something went wrong!'}))

		}
	};

	return module;
}