import React, {FC, useContext, useState } from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import Modal from '../Modal';
import {Button} from '../Button';
import { Store } from 'react-notifications-component';

interface ModalInterface{
    title:string;
    visible:boolean;
    close:() => void;
}
const HowToPlay  = (props:ModalInterface)=>{

    
    return (
        <Modal  close={props.close} title={'How to Play'} visible={props.visible} extend={false}>
            <div style={{marginTop : '16px'}}>
                <p>First off you need to connect with a wallet that supports solana. </p>
                <p>We would recommend to use Phantom Wallet https://phantom.app/
    Once you got Phantom wallet installed follow these steps: </p>
        <ul style={{color: 'white'}}>
                    <li><span style={{color : 'gold'}}>Step 1</span><strong>―</strong>Connect by pressing "login" and accept the requests from phantom.</li>
                    <li><span style={{color : 'gold'}}>Step 2</span><strong>―</strong>To deposit solana press on "deposit" and type in the desired amount. </li>
                    <li><span style={{color : 'gold'}}>Step 3</span><strong>―</strong>Bet on a color of your choice and try your luck!</li>
                    <li><span style={{color : 'gold'}}>Step 4</span><strong>―</strong>Withdraw your winnings by pressing on "withdraw" and typing in the amount you wish to withdraw. </li>
                </ul>
                <br/>
                <p>Lets get these Stonks!</p>
                <br/>
            </div>
        </Modal>
        
    )
}

export default HowToPlay;