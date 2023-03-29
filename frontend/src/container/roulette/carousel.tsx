import {useCallback, useContext} from 'react';
import {MyInfoContext} from '../../provider/auth';
import {SocketContext} from '../../provider/socket';
import Yellow from '../../assets/img/yellow.png'
import White from '../../assets/img/white.png'
import Pink from '../../assets/img/pink.png'
import { useEffect, useState } from 'react'

import $ from 'jquery'
require("./carousel.css")
type template = {
  startRolling : Function;
  setHistory : Function;
  setHistoryStats : Function;
}
export const Carousels = ( {startRolling, setHistory, setHistoryStats} : template
) => {

  const authData = useContext(MyInfoContext);
  const socketData = useContext(SocketContext);
  const [items, setItems] = useState<any[]>([
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
    ["dark-gradiant", "0"],
    ["danger-gradiant", "1"],
    ["dark-gradiant", "2"],
    ["danger-gradiant", "3"],
    ["dark-gradiant", "4"],
    ["danger-gradiant", "5"],
    ["dark-gradiant", "6"],
    ["danger-gradiant", "7"],
    ["dark-gradiant", "8"],
    ["success-gradiant", "9"],
    ["danger-gradiant", "10"],
    ["dark-gradiant", "11"],
    ["danger-gradiant", "12"],
    ["dark-gradiant", "13"],
    ["danger-gradiant", "14"],
  ])

  const initPosition = ()=>{
    var startPoint = $("#aCanvas").width() || 1400;
    startPoint = startPoint/2;
    $("#casesCarusel").css('marginLeft', -7125 + startPoint - 50);
  }

  useEffect(() => {
    initPosition();
    
    if(socketData.mySocket != null){
     
      socketData.mySocket.on("gameStart", (data : any) => {
        $(".load-game").fadeIn('fast');
        startRolling(()=>{ StartRoulette(data.rand)});
        $("#rouletteNo").text( 'No: ' +data.No );
       ;
      });
      socketData.mySocket.on("gameCheck", (data : any) => {
        
        setTimeout( ()=>{CheckRoulette()}, 3000);
        if(data.winColor == 9)
          $('.green-winner').css({'color' : '#00ff00'});
        else 
          if(data.winColor == 0 || data.winColor == 2  || data.winColor == 4  || data.winColor == 6  || data.winColor == 8  || data.winColor == 11 || data.winColor == 13)
            $('.dark-winner').css({'color' : '#00ff00'});
          else
            $('.danger-winner').css({'color' : '#00ff00'});
          authData.setForceUpdate(true);
      });
    }
    
    return ()=>{
      if(socketData.mySocket)
        socketData.mySocket.off();
    }
  }, [socketData]);

  
  const StartRoulette = (rand : number) => {
    var move: number, backTo : number = 0;
    // if(rand % 2)
    //   move = -7125 + (rand * 95) 
    // else move = -7125 - (rand * 95)
    move = -7125 - (rand * 95);
    backTo = Math.floor(rand / 15) * 95 * 15 ;
    var startPoint = $("#aCanvas").width() || 1400;
    startPoint = startPoint/2;
    $(".load-game").fadeOut('fast');
    $("#casesCarusel").animate({
      marginLeft: move + startPoint - 50
    }, {
      start: function () {
        $(".three_tbl").css({
          "opacity": "0.4",
          "pointer-events": "none"
        })
      },
      complete: function() {
        
      },
      duration: 2000,
    })
  }
  const CheckRoulette = ()=>{
    $('.green-winner').css({'color' : '#ffffff'});
    $('.dark-winner').css({'color' : '#ffffff'});
    $('.danger-winner').css({'color' : '#ffffff'});
    $(".three_tbl").removeAttr('style')
    $(".load-game").fadeIn('fast');
    $('#minutes').text('10');
    initPosition();
  }

  function Main(): JSX.Element {
    return <>
        
    
    {items.map((item, index) =>(
      <div key={index} className={`itm`} style={{height: "85px", width: "85px"}}>
        <img src={ item[0] === "success-gradiant" ? Yellow : item[0] === "dark-gradiant" ? White : Pink} style={{height: "45px !important", width: "35px !important"}}/>
      </div>
    ))}
    
    
    </>
  }
  return (
    <>
      <div id="aCanvas">
        <div id="casesCarusel" className="slider-jack">
          <Main />
        </div>
      </div>
    </>
  )
}