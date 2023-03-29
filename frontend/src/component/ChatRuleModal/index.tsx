import React, {FC, useContext, useState } from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import Modal from '../Modal';
import {Button} from '../Button';
import { Store } from 'react-notifications-component';

interface ModalInterface{
    title:string;
    visible:boolean;
    close:() => void;
    submit : Function;
}
const ChatRuleModal : FC<ModalInterface> = (props:ModalInterface)=>{

    const [ruleCheck, setRuleCheck] = useState(false);
    const onSubmint = () => {
        if(!ruleCheck){
            Store.addNotification({
                title: "Not accept Chart Rule?",
                message: "Read Chat Rule and accept it",
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
        props.submit();          
        
    }
    return (
        <Modal extend={false} close={props.close} title={'Chat Rule'} visible={props.visible} >
            <div style={{marginTop : '16px'}}>
                <p><span style={{color : 'gold'}}>1. No "begging"</span> - Asking for coins/ solana or posting your wallet address will get you muted</p>
                <p><span style={{color : 'gold'}}>2. No "advertising"</span> - ex: referral codes, buying/selling coins, etc.</p>
                <p><span style={{color : 'gold'}}>3. No "predictions"</span> - If you continuously share your "predictions" of the upcoming game results, you'll get muted</p>
                <p><span style={{color : 'gold'}}>4. No "passive begging"</span> - Indirectly asking for coins by offering "predictions" or by overly fanboying high level players will get you muted</p>
                <p><span style={{color : 'gold'}}>5. English only</span> - You can chat in English in the main room</p>

            </div>
            <div>
                <input type="checkbox"  name="rules"  onChange={e=>setRuleCheck(e.target.checked)} />
		        <label style={{marginLeft : '8px'}}>Please accept chat rules.</label>
            </div>
            <div style={{marginTop : '16px', display : 'flex', justifyContent : 'space-around'}}>
                <button onClick={onSubmint} className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'> Submit</button>
                <button onClick={props.close} className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'> Cancel</button>
                
            </div>
        </Modal>
        
    )
}

export default ChatRuleModal;