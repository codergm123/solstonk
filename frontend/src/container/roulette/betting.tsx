import { useContext, useEffect, useRef, useState } from 'react';
import {MyInfoContext} from '../../provider/auth';
import {SocketContext} from '../../provider/socket';
import { Store } from 'react-notifications-component';
import { FaCoins } from 'react-icons/fa'
import {SERVER_URL} from '../../constant/env';
import avatarDefault from '../../assets/img/profile-main.png'
require('./index.css')

type template = {
}
export const Betting = ({} : template) => {
  const [bet_amount, setBetAmount] = useState<any>(0.00)
  const [white_items, setWhiteItems] = useState<any>([])
  const [purple_items, setPurpleItems] = useState<any>([])
  const [yellow_items, setYellowItems] = useState<any>([])
  const whiteDiv = useRef<null | any>(null)
  const yellowDiv = useRef<null | any>(null)
  const purpleDiv = useRef<null | any>(null)
  const [init, setInit] = useState(false);

  const authData = useContext(MyInfoContext);
  const socketData = useContext(SocketContext);

  useEffect(() => {
    whiteDiv.current.scrollTop = whiteDiv.current.scrollHeight
    yellowDiv.current.scrollTop = yellowDiv.current.scrollHeight
    purpleDiv.current.scrollTop = purpleDiv.current.scrollHeight
  }, [white_items, yellow_items, purple_items])
  // useEffect(()=>{
  //   if(initData){
  //     setBetAmount(0.00);
  //     setWhiteItems([]);
  //     setPurpleItems([]);
  //     setYellowItems([]);
  //     setInitData(false);
  //   }
  // },[initData])

  useEffect(() => {
    if(socketData.mySocket != null){
      socketData.mySocket.on("gameStart", (data : any) => {
        setWhiteItems([]);
        setPurpleItems([]);
        setYellowItems([]);
      });

      socketData.mySocket.on("rouletteJoinedByUser", (data : any)=>{
        addItems(data.selected_color, data.name, parseFloat(data.bet_amount), data.profile_image)
        
      })
    }
    
  }, [socketData]);
  const addItems = (type: string, name: string, amount: number, avatar: string) => {
      console.log("jfjdjafdsjlfsd", white_items, purple_items, yellow_items);
      if(type === 'danger') setPurpleItems((prev : any) => {
        return [{name: name, amount: amount, avatar: avatar}, ...prev]
      })

      if(type === 'grey') setWhiteItems((prev: any) => {
        return [{name: name, amount: amount, avatar: avatar}, ...prev]
      })
      if(type === 'green') setYellowItems((prev: any) => {
        return [{name: name, amount: amount, avatar: avatar}, ...prev]
      })
      setBetAmount(0.0)
    
  }

  function Main(props:{items:[{name: string, amount: number, avatar: string}]}): JSX.Element {
    return <>
    <div style={{padding : '8px', backgroundColor: 'rgba(22, 5, 60, 0.8)', display : 'flex', justifyContent : 'space-between'}}>
      <span>{`${props.items.length} Bets Total`}</span>
      <span><FaCoins className='gold-coin'/>{props.items.reduce((a : number, b : any) => a + b.amount, 0).toFixed(2)}</span>
    </div>
    {props.items.map((item, index) =>(
      <div style={{ paddingTop : '12px', paddingLeft : '12px', paddingRight : '12px', backgroundColor: 'rgba(22, 5, 60, 0.4)', display : 'flex', justifyContent : 'space-between'}}  key={index}>
        <div style={{display: 'flex'}}>
          <i className='wallet-adapter-button-icon'><img style={{borderRadius : '50px'}} src={`${SERVER_URL}frontend/upload/user/${item.avatar}` || avatarDefault} /></i>
          <span style={{color : authData.myInfo != null ? authData.getCheckedCommunity(authData.myInfo.community_id) || 'white' : "white"}}>{item.name}</span>
        </div>
        <span className="red_ttl_bet">{item.amount}</span> 
      </div>
    ))}</>
  }
  const onBet = (amount: number) => {
    if(amount === 0.05) setBetAmount((bet_amount + 0.05).toFixed(2) * 1 > 15 ? 15 : (bet_amount + 0.05).toFixed(2) * 1)
    if(amount === 0.1) setBetAmount((bet_amount + 0.1).toFixed(2) * 1 > 15 ? 15 : (bet_amount + 0.1).toFixed(2) * 1)
    if(amount === 0.25) setBetAmount((bet_amount + 0.25).toFixed(2) * 1 > 15 ? 15 : (bet_amount + 0.25).toFixed(2) * 1)
    if(amount === 2) setBetAmount(bet_amount * 2 > 15 ? 15 : bet_amount * 2)
    if(amount === 0.5) setBetAmount(bet_amount / 2)
    if(amount === 0) setBetAmount(0)
    if(amount === 15) setBetAmount(15)
  }

  const handleBetButton = async (type: string, amount: number) => {
    if(authData.myInfo == null)
      Store.addNotification({
        title: "User not found",
        message: "Please login first",
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
    else{
      const total_balance = parseFloat(authData.myInfo.normal_balance) + parseFloat(authData.myInfo.bonus_balance)
      if(total_balance < amount)
        Store.addNotification({
          title: "Insufficient Balance",
          message: `Amount should not be greater than ${total_balance}` ,
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
      else{
        if(type == 'danger' && white_items.length > 0)
        {
          Store.addNotification({
            title: "Error",
            message: `Not allowed to bet` ,
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
          return
        }

        if(type == 'grey' && purple_items.length > 0)
        {
          Store.addNotification({
            title: "Error",
            message: `Not allowed to bet` ,
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
          return
        }

        if(socketData.mySocket != null){
          socketData.mySocket.emit('bettingStart',{
            userID : authData.myInfo.id,
            bet_amount: bet_amount,
            type: type
          }, async function(response : any){
            if(response.status == 'success'){
              Store.addNotification({
                title: "Success",
                message: response.message,
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
            }else{
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
              
              // addItems(type, authData.myInfo.name, amount);
          });
        }
        
      }
        
    }
  }
  return (
    <>
      <div className="xs-p-lr-0 hidden-xs">
        <div className="bet_amount">
          <div className="form-inline bet_searchbox " style={{backgroundColor: 'rgba(22, 5, 60, 0.8)'}}>
            <div className="input-group bet-text-box">
              <div className="input-group">
                <input type="number" className="form-control"	value={bet_amount} step="0.05" min="0" max="15" onChange={(e) => setBetAmount(Number(e.target.value))}/>
              </div>
            </div>
            <div className="btn-inline all_countbtn">
              <button className="btn bet-button" onClick={() => onBet(0.05)}>+0.05</button>
              <button className="btn bet-button" onClick={() => onBet(0.1)}>+0.1</button>
              <button className="btn bet-button" onClick={() => onBet(0.25)}>+0.25</button>
              <button className="btn bet-button" onClick={() => onBet(2)}>2x</button>
              <button className="btn bet-button" onClick={() => onBet(0.5)}>1/2</button>
              <button className="btn bet-button" onClick={() => setBetAmount(authData.setting.max_bet)}>STONK MODE</button>
              <button className="btn bet-button" onClick={() => onBet(0)}>Clear</button>
            </div>
          </div>
        </div>
      </div>
      <div className="row three_tbl">
        <div className="col-md-4 col-sm-4 divDisable red-winner">
          <div className="panel winbox">
            <div className="box-body">
              <div className="">
                <button type="button" className="btn pink_bg_btn btn-play danger_bg_btn" onClick={() => {
                    handleBetButton("grey", bet_amount)
                  }} >Win 2X</button>
                <div className="winboxplayer_title plred" id="grey">Player({white_items.length})</div>
                <div className="dark-winner" style={{color : 'white'}}>
                  <div ref={whiteDiv}>
                    <Main items={white_items}/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="col-md-4 col-sm-4 divDisable green-winner">
          <div className="panel winbox">
            <div className="box-body">
              <div className="">
                <button type="button" className="btn pink_bg_btn green_bg_btn btn-play"  
                onClick={() => handleBetButton("green", bet_amount)} >Win 14X</button>
                <div className="winboxplayer_title plgreen" id="green">Player({yellow_items.length})</div>
                <div className="green-winner" style={{color : 'white'}}>
                  <div  ref={yellowDiv}>
                    <Main items={yellow_items}/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="col-md-4 col-sm-4 divDisable grey-winner">
          <div className="panel winbox">
            <div className="box-body">
              <div className="">
                <button type="button"
                 className="btn pink_bg_btn black_bg_btn btn-play" 
                 onClick={() => handleBetButton("danger", bet_amount)} >Win 2X</button>
                <div className="winboxplayer_title plgrey" id="danger">Player({purple_items.length})</div>
                <div className="danger-winner" style={{color : 'white'}}>
                  <div  ref={purpleDiv}>
                    <Main items={purple_items}/>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};