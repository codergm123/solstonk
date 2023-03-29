import React, {FC, useContext, useState } from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import Modal from '../Modal';
import {Button} from '../Button';
import {MyInfoContext} from '../../provider/auth';

interface ModalInterface{
    title:string;
    visible:boolean;
    close:() => void;
}
const SignUpModal : FC<ModalInterface> = (props:ModalInterface)=>{
    const authData = useContext(MyInfoContext);
    const { publicKey, wallet, disconnect } = useWallet();
    const [referralCode, setRefferalCode] = useState('');

    return (
        <Modal extend={false} close={props.close} title={'SolStonks Referral system'} visible={props.visible} >
            <div style={{marginTop : '8px'}}>
                <p className='text-comment'>Get passive income for yourself or your project by spreading the word about SolStonks. </p>
                
                <div style={{fontSize : '16px'}}><p style={{color : 'gold'}}>Step 1</p>Tell your frens. <br/>Everyone that signs up using your referral code gets a 50% bonus on their first deposit.</div>
                <div style={{fontSize : '16px'}}><p style={{color : 'gold'}}>Step 2</p>Gamble and watch your Solana stack. <br/>You receive 1% of all bets placed by everyone that signed up using your referral code.</div>
                <div style={{fontSize : '16px'}}><p style={{color : 'gold'}}>Step 3</p>Tell your frens. Take out your passive income without any limits.</div>
            
            </div>
            <div style={{marginTop : '16px'}}> 
                <input onChange = {e=>setRefferalCode(e.target.value)} value={referralCode} type="text" name="referral_code" id="referral_code" className="form-control" placeholder="type referral code" />
            </div>
            <div style={{marginTop : '16px', display : 'flex', justifyContent : 'space-around'}}>
                <button onClick={()=>{
                    if(publicKey)
                        authData.signup(referralCode, publicKey?.toBase58());
                }} className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'> Sign Up</button>
                <button onClick={props.close} className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'> Cancel</button>
                
            </div>
        </Modal>
        
    )
}

export default SignUpModal;