var Op = Sequelize.Op;

module.exports = function(model,config){	
	var module = {};


	module.getUsers = async function(request, response){

		try{
			
			var start = parseInt(request.params.start) || 0;
			var length = parseInt(request.params.length) || 25;
			var search = request.body.search || '';
			var query = {};
			if (search != '') {
				query = { [Op.or]:[
					{'name':{[Op.like]:'%'+search+'%'}},
					{'email_id':{[Op.like]:'%'+search+'%'}}
				],'is_deleted':'0'};
			} else {
			  query = {"is_deleted":"0"};
			}
			
			var usersCount = await model.User.count({where:query});
			var users = await model.User.findAll({where:query,order:[['id','DESC']], offset: start, limit: length, raw: true});
		  
			return response.send(JSON.stringify({status : 'success', message : '', data : users, count : usersCount}));
		}
		catch(error){
			return response.send(JSON.stringify({status : 'failed', message : 'something went wrong'}))
		}
		
	}
	
	module.update = async function(request, response){
		
		try{
			var userId = request.body.id;
			var userData = await model.User.findByPk(userId);
			console.log("user", userData, userId);
			if(userData != null){

				let updateData= {};
				if(request.body.name)
					updateData.name = request.body.name;
				if(request.body.kickback_percent)
					updateData.kickback_percent = parseFloat(request.body.kickback_percent);
				if(request.body.referral)
					updateData.referral_code = request.body.referral;
				if(request.body.type)
					updateData.type = request.body.type;
				if(request.body.email_id)
					updateData.email_id = request.body.email_id;
				
				await userData.update(updateData);
				var usersCount = await model.User.count({where:{"is_deleted":"0"}});
				
				var users = await model.User.findAll({where:{"is_deleted":"0"},order:[['id','DESC']], offset: 0, limit: 25, raw: true});
				console.log("udateData", usersCount);
				response.send(JSON.stringify({status : 'success', data : users, count : usersCount}))
			
			}else{
				response.send(JSON.stringify({status : 'failed', message : 'User not found'}))
			}
		}catch(err){
			response.send(JSON.stringify({status : 'failed', message : 'something went wrong'}))
		}
	};

	module.delete = async function(request, response){
		
		try{
			var userId = request.params.id;
			var userData = await model.User.findByPk(userId);
			var data = {
				"status":"success",
				"message":"successfully Delete User",
				"socketId":userData.socket_id,
			}
			io.to(userData.socket_id).emit("forceLogout",data);
			await model.User.update({"is_deleted":"1"},{where:{id: userId}});
			var usersCount = await model.User.count({where:{type:"user","is_deleted":"0"}});
			var users = await model.User.findAll({where:query,order:[['id','DESC']], offset: 0, limit: 25, raw: true});
			response.send(JSON.stringify({status : 'success', data : users, count : usersCount}))
		}catch(err){
			response.send(JSON.stringify({status : 'failed', message : 'something went wrong'}))
			
		}
		
	}

	module.checkCommunity = async function(req, res){
		try{

			var userId = req.body.userId;
			var communityId = req.body.communityId;
			var userDetail = await model.User.findOne({where : {id : userId}});
			if(userDetail){
				await userDetail.update({community_id : communityId});
				return res.send(JSON.stringify({status : 'success', data : userDetail}));
			}
			else{
				return res.send(JSON.stringify({status : 'failed', message : 'user not found'}));
			}
		}
		catch(error){
			return res.send(JSON.stringify({status : 'failed', messsage : 'something went wrong'}));
		}
		
	}
	
	return module;
}

	

	
	module.edit = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userDetail = await model.User.findByPk(userId);
				if(userDetail != null){
					response.render('backend/user/edit', {
						title: 'Edit User',
						error: request.flash("error"),
						success: request.flash("success"),
						vErrors: request.flash("vErrors"),
						auth: request.session,
						config: config,
						user:userDetail,
						alias:'user'
					});
				}else{
					request.flash('error',"User detail not available.");
					return response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User detail not available.");
				return response.redirect('/backend/user');
			}			
		}else{
			request.flash('error',"User detail not available.");
			return response.redirect('/backend/user');
		}		
	};

	


	module.ban = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){

					var banData = {
					        status : '0',
					        role : 'user'
			      		};
					var ban_user = await userData.update(banData);

					var data = {
						"status":"success",
						"message":"successfully Delete User",
						"socketId":userData.socket_id,
					}
				    io.to(userData.socket_id).emit("forceLogout",data);

					request.flash('success',"User Banned successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available for Ban.");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User not Banned.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User not Banned.");
			response.redirect('/backend/user');
		}
	};

	module.unban = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){

					var banData = {
				        status : 1,
				        role : 'user'
			      	};
					var ban_user = await userData.update(banData);
					request.flash('success',"User Unanned successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available for Unban.");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User not Unanned.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User not Unbanned.");
			response.redirect('/backend/user');
		}
	};

	module.moderator = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){
					var moderatorData = {
					        moderator_type : 'moderator'
			      		};
					var ban_user = await userData.update(moderatorData);
					request.flash('success',"User moderator successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User not moderator.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User not moderator.");
			response.redirect('/backend/user');
		}
	};

	module.notmoderator = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){
					var moderatorData = {
					        moderator_type : 'user'
			      		};
					var ban_user = await userData.update(moderatorData);
					request.flash('success',"User not moderator successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available.");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User not moderator.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User not moderator.");
			response.redirect('/backend/user');
		}
	}

	module.banchat = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){
					var banData = {
					        user_ban_unban_chat : '1'
			      		};
					var ban_user = await userData.update(banData);
					await model.Chat.update({"is_deleted":"1"},{where:{user_id:userId}});	//Delete all chat of banned from chat user
					

					request.flash('success',"User Chat Banned successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available for Chat Ban.");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User Chat not Banned.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User Chat not Banned.");
			response.redirect('/backend/user');
		}
	};

	module.unbanchat = async function(request, response){
		var userId = request.params.id;
		if(userId != "" && userId != 0){
			try{
				var userData = await model.User.findByPk(userId);
				if(userData != null){

					var unbanData = {
						        user_ban_unban_chat : '0',
					      	};
					var ban_user = await userData.update(unbanData);
					request.flash('success',"User Chat Unbanned successfully.");
					response.redirect('/backend/user');
				}else{
					request.flash('error',"User details not available for Chat Unban.");
					response.redirect('/backend/user');
				}
			}catch(err){
				request.flash('error',"User Chat not Unbanned.");
				response.redirect('/backend/user');
			}
		}else{
			request.flash('error',"User Chat not Unbanned.");
			response.redirect('/backend/user');
		}
	}

	

function randomNumber(length) {
    var chars = '0123456789';
    var result = '';
    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
    return result;
}
