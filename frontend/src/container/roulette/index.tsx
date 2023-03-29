import { useEffect, useMemo, useRef, useState, useContext } from 'react';
import LoadingSpin from "react-loading-spin";
import Center_Slider_bar from '../../assets/img/center_slidr_bor.png'
import { Betting } from './betting'
import { Carousels } from './carousel';
import {SocketContext} from '../../provider/socket';
require('./index.css')
let clock : any = null;
export const Roulette = () =>{
  
  const [countdown, setCountDown] = useState(10);
  const [history, setHistory] = useState<any>([]);
  const [historyStats, setHistoryStats] = useState<any>();
  const timerHTML = useRef<any>();
  const socketData = useContext(SocketContext);


  const startRolling = (callback : Function)=>{
    if(clock != null)
      clearInterval(clock);
    let count = countdown;
    let timer = setInterval(()=>{
      if(count <= 0){
        callback();
        clearInterval(timer);
      }
      else{
        count--;
        if(timerHTML.current != null)
          timerHTML.current.innerText = `${(count).toFixed(0)}`;
        else
          clearInterval(timer);
      }
    }, 1000)
    clock = timer;
  }
 
  useEffect(() => {
    if(socketData.mySocket != null){
      socketData.mySocket.on("gameCheck", (data : any) => {
        setHistory(data.lastest);
        setHistoryStats({
          'dangerCounts' : data.dangerCounts,
          'greenCounts' : data.greenCounts,
          'blackCounts' : data.blackCounts
        })
      });
    }

    return(function clean(){
      if(clock != null)
        clearInterval(clock);
    })
    
  }, [socketData]);

  return (
    <div className='row roulette-container'>
      <div className="col-lg-12 col-md-12 full-width">
        <div className="inner_content">
          <div className="inner-padding ovr-hide">
            <div className="roulette">
              <div className="row">
                <div className="col-lg-12">
                
                  <div className="inbox">
                  <p style={{color : 'white', zIndex : " 10", position: 'absolute', left : '26px', top: '4px'}} id='rouletteNo'>No:</p>

                    <div className="insidcas-case">

                      <div className="load-game">
                        <div className="countdown-wrapper">
                          <div className="countdown-timer">
                            <div className="roling_txt">Rolling</div>
                            
                            <div className="counter">
                              <div id="countdown">
                                <div ref={timerHTML} id="minutes" >
                                <LoadingSpin
                                    width="2px"
                                    animationDirection="clock"
                                    animationTimingFunction="ease-in-out"
                                    size="20px"
                                    primaryColor="#512da8"
                                    secondaryColor="#fff"
                                />
                                
                                </div> 
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div className="slider-back-jack">

                        <div id="scrollerContainer">

                          <div id="caruselLine">
                            <img src={Center_Slider_bar} alt="chat user"/>
                          </div>
                          <Carousels startRolling = {startRolling}  setHistory={setHistory} setHistoryStats={setHistoryStats}/>
                          
                          <div className="fade-left"></div>
                          <div className="fade-right"></div>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className="row">
                <div className="col-md-12 p-lr-0">
                  <div style={{display : 'flex', color : 'white', textAlign : 'center', marginTop : '32px'}}>
                    <div style={{width : '50%', }}>
                      PREVIOUS ROLLS
                    </div>
                    <div style={{width : '50%'}}>
                      LAST 100
                    </div>
                  </div>
                  <div className="history-batch-list" style={{margin : '0px', marginTop : '8px', display : 'flex', color : 'white', alignItems : 'center'}}>
                    <div style={{width : '50%'}}>
                      <ul className="list-inline list-unstyled ">
                        {history.map((item:any,idx:number)=>{
                            return (
                              <li key={idx} className={`badges ${item.game_stopped_on == 'danger'? 'pink-gradiant' : item.game_stopped_on == 'green'? 'yellow-gradiant' : 'white-gradiant'}`}></li> 
                            )
                        }).reverse()}
                      </ul>
                    </div>
                    <div style={{width : '50%'}}>
                      <ul className="list-inline-previous-100 list-unstyled ">
                        <li className="pink-gradiant-100"></li>
                        <li>{historyStats?.dangerCounts || 0}</li>
                        <li className="yellow-gradiant-100"></li>
                        <li>{historyStats?.greenCounts || 0}</li>
                        <li className="white-gradiant-100"></li>
                        <li>{historyStats?.blackCounts || 0}</li>

                      </ul>
                    </div>
                    
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <Betting />
        </div>
      </div>
    </div>
  );
};