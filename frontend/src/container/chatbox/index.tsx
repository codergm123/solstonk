import avatar from '../../assets/img/profile-main.png'
import { useEffect, useRef, useState, useContext, useCallback } from 'react';
import { RiSendPlaneFill } from 'react-icons/ri'
import { Store } from 'react-notifications-component';
import {SocketContext} from '../../provider/socket';
import {MyInfoContext} from '../../provider/auth';
import {SERVER_URL} from '../../constant/env';
import ChatRuleModal from '../../component/ChatRuleModal';

require('./index.css')
export const ChatBox = () => {
	const socketData = useContext(SocketContext);
	const authData = useContext(MyInfoContext);
	const [message, setMessage] = useState<string>("")
  	const [messages, setMessages] = useState<any>([])
	const [ruleShow, setRuleShow] = useState(false);
	const chatList = useRef<any>();
	

	useEffect(()=>{
		
		getChatMessage();
		getOnlineUser();
	},[socketData])

	useEffect(()=>{
		chatList.current.scrollTo({ top: chatList.current.scrollHeight, behavior: 'smooth' });
	},[messages])
	function getOnlineUser (){
		if(socketData.mySocket != null){
			socketData.mySocket.on('count', async function(response : any){
				socketData.setUsers(response);
			});
			socketData.mySocket.on('appentNewMessageAllUser', function(response: any){
				console.log("new Chat message -->", response.lastMessage)
				setMessages((prev:[])=>{
					return([...prev, response.lastMessage])
				})
			})
		}
		
	}
	function getChatMessage(){
		if(socketData.mySocket != null){
			socketData.mySocket.emit('getMessages',async function(response : any){
				if(response.status == "success"){
					setMessages(response.data);
				}
			});

		}

	}

	function acceptRule() {
		if(authData.myInfo == null){
			Store.addNotification({
				title: "Error",
				message: 'Please log in to Play',
				type: "warning" ,
				insert: "top",
				container: "top-right",
				animationIn: ["animate__animated", "animate__fadeIn"],
				animationOut: ["animate__animated", "animate__fadeOut"],
				dismiss: {
				  duration: 1500,
				  onScreen: true,
				  pauseOnHover: true,
				}
			  });
		}
		var data = {
			userId: authData.myInfo.id,
			checkboxVelue: 1
		}

		socketData.mySocket.emit("chatRuleAccept", data, async function (response : any) {
			if (response.status == 'success') {
				Store.addNotification({
					title: "Success",
					message: 'Enjoy chatting with players now.',
					type: "success" ,
					insert: "top",
					container: "top-right",
					animationIn: ["animate__animated", "animate__fadeIn"],
					animationOut: ["animate__animated", "animate__fadeOut"],
					dismiss: {
					  duration: 1500,
					  onScreen: true,
					  pauseOnHover: true,
					}
				  });

				setRuleShow(false);
			}
			if (response.status == 'fail') {
				Store.addNotification({
					title: "Error",
					message: response.message || 'something is wrong',
					type: "warning" ,
					insert: "top",
					container: "top-right",
					animationIn: ["animate__animated", "animate__fadeIn"],
					animationOut: ["animate__animated", "animate__fadeOut"],
					dismiss: {
					  duration: 1500,
					  onScreen: true,
					  pauseOnHover: true,
					}
				  });
			}
		})
	}

	function chatMessageSave(){
		if(authData.myInfo != null){
			setMessage('');
			if(message != ""){
				var data = {'userId':authData.myInfo.id, 'message':message};
				socketData.mySocket.emit('chatMessageSave', data, function(response : any){
					if(response.popup == "show"){
						setRuleShow(true);
					}
					if(response.status == "success"){
						// getChatMessage()
					}else if(response.status == "fail"){
						Store.addNotification({
							title: "Error",
							message: response.message,
							type: "warning" ,
							insert: "top",
							container: "top-right",
							animationIn: ["animate__animated", "animate__fadeIn"],
							animationOut: ["animate__animated", "animate__fadeOut"],
							dismiss: {
							  duration: 1500,
							  onScreen: true,
							  pauseOnHover: true,
							}
						  });
					}
				});
			}else{
				Store.addNotification({
					title: "Error",
					message: 'Please enter message to start conversation',
					type: "warning" ,
					insert: "top",
					container: "top-right",
					animationIn: ["animate__animated", "animate__fadeIn"],
					animationOut: ["animate__animated", "animate__fadeOut"],
					dismiss: {
					  duration: 1500,
					  onScreen: true,
					  pauseOnHover: true,
					}
				  });
			}
		}else{
			Store.addNotification({
				title: "Error",
				message: 'Please log in to Play',
				type: "warning" ,
				insert: "top",
				container: "top-right",
				animationIn: ["animate__animated", "animate__fadeIn"],
				animationOut: ["animate__animated", "animate__fadeOut"],
				dismiss: {
				  duration: 1500,
				  onScreen: true,
				  pauseOnHover: true,
				}
			  });
		}    
	}

	
	const onMessage = (str: string) => {
		setMessage(str)
  }

	const onChanged = (str: any) => {
		if(str === "Enter") {
			chatMessageSave();
		}
	}


  function Main(props: {items : any}): JSX.Element {
	  const getCommunityColor = useCallback((mint_key : string)=>{
		return authData.getCheckedCommunity(mint_key)
	  },[authData.community])
    return <>{props.items.map((item : any, index : number) =>(
			<div key={index} className='chat_user_message list-unstyled' >
				<div className='chat_user_img'>
					<img src={SERVER_URL+'frontend/upload/user/' + item['userDetail.profile_image'] || avatar} alt="Devil" />
				</div>
				<div className="char_user_message">

				<div className="chat_user_name" style={{color:  getCommunityColor(item['userDetail.community_id'])|| 'white'}}>
					{item['userDetail.name']}
					<span className="cun-right" style={{float: "right"}}>
						<a href=""><i className="fa fa-times closeSignChange" style={{color:"#ffa31a"}}></i></a>
					</span>
				</div>
				<div className='chat_message'>{item.chat_message}</div>
				</div>
			</div>
    ))}</>
  }
  return (
    <div className="chat-box">
     		<div className="chatbar_title">
				<div className="user_status">
					<div className="chat_title">Chatbox</div>
					<div className="total_users">
						<span className="user_status_note"></span>
						<span className="active_user">{socketData.users}</span>
					</div>
				</div>
			</div>
			<div className="charbar_message_list" id="chatscroll" ref = {chatList}>
				<Main items={messages} />	
			</div>
			<div className="chatbar_message_box">
				<input type="text" className="form-control chat_message_div" placeholder="Type your message" value={message} onChange={e => onMessage(String(e.target.value))} onKeyDown={e => onChanged(e.key)}/>
				<button className="btn btn-send" onClick={(e) => chatMessageSave()}>
					<RiSendPlaneFill />
				</button>
			</div>

          <ChatRuleModal submit={acceptRule} close={()=>{setRuleShow(false)}} visible = {ruleShow} title='Chat Rules'></ChatRuleModal>
    </div>
  );
};