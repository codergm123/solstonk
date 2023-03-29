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
const Terms : FC<ModalInterface> = (props:ModalInterface)=>{

    
    return (
        <Modal extend = {true} close={props.close} title={'TERM OF SERVICE'} visible={props.visible} >
            <div style={{marginTop : '16px'}}>
                <p>Hey there! Thanks for using SolStonks. We're glad to see that some people are reading this.</p>

                <p>People often perceive gambling sites as rather suspicious, and we like to think that SolStonks stands out clearly from the crowd.</p>

                <p>We understand that you, the player, want to make sure that the site you use is legit when you gamble.</p>
                <p>If you're reading this, that's great. When using gambling sites, we strongly recommend you do your research before trusting anybody.</p>
                <p>We genuinely want you to be comfortable when using SolStonks. Whether you're gambling with pennies or if you have millions in your balance, we want you to know that you're in good hands.</p>
                <p>For this reason, we want to be as transparent as possible.</p>
                <p>Being fair towards our customers is incredibly important to us, and we want to show the world how fair we really are.</p>
                <p>Most importantly, we want to ensure that the rules of SolStonks are fair and just and that we communicate them transparently. We're not the type of project that would take advantage of you with legal loopholes or hide unfair clauses in the small print.</p>
                <p>These Terms are a binding agreement between you (we will use the word 'you' to refer to you as the person accessing SolStonks site(s)) ("Service") and SolStonks (we will refer to ourselves in these Terms as "SolStonks," "us" or "we").</p>
                <p>When you use our Services, now or in the future, you agree to the latest Terms of Service.</p>
                <p>If you violate any of these terms, we may close your account. That's a broad statement, and it means you will need to put a lot of trust in us. We do our best to deserve that trust by being as transparent as possible.</p>
                <h5 style={{color : 'gold'}}>ACCOUNT SECURITY</h5>
                <p>You are responsible for ensuring that your account is secure. We will not be liable for any losses or damages from your failure to comply with this security obligation. We highly recommend that you do not share your wallet with anyone.</p>
                <p>SolStonks accounts are not intended to be shared. If somebody else logs into your account, we will not be liable for any damages or losses.</p>
                <h5 style={{color : 'gold'}}>BETTING</h5>
                <p>All bets are final. If you lose your funds by betting, we will not give you a refund.</p>
                <p>Although we do our best to prevent it, there will be technical issues sometimes. Every once in a while, specific withdrawing methods may be temporarily disabled. Even if you are temporarily unable to withdraw, we will not be liable for any lost bets. If you feel that you cannot control the temptation to bet, we highly recommend using requesting a ban from support.</p>
                <h5 style={{color : 'gold'}}>BETTING</h5>
                <p>By default, we are not liable for providing refunds for any deposits. However, if you still have the coins in your balance, there is a good possibility of getting a refund.</p>
                <p>When depositing or withdrawing with cryptocurrencies, you are responsible for ensuring that the transactions are done with the correct currency and the right address. If you make a mistake, we will not be liable for it.</p>
                <p>SolStonks doesn't generate any profit from fees in the deposit and withdrawal process. However, there may be fees by 3rd-party payment processors. The players will have to cover these fees.</p>
                <p>We will do our best to make the deposit and withdrawal system intuitive and easy to use. We will do our best to safeguard you from making any mistakes or accidents that could cause monetary losses. However, mistakes can happen and will happen. We will not be liable for your mistakes.</p>
                <h5 style={{color : 'gold'}}>WHO CAN USE SOLSTONKS</h5>
                <p>You must be over the age of 18 and over the legal age to gamble with cryptocurrency in your area of jurisdiction.</p>
                <p>Although we do our best to prevent it, there will be technical issues sometimes. Every once in a while, specific withdrawing methods may be temporarily disabled. Even if you are temporarily unable to withdraw, we will not be liable for any lost bets. If you feel that you cannot control the temptation to bet, we highly recommend using requesting a ban from support.</p>
                <h5 style={{color : 'gold'}}>CONNECTION ISSUES</h5>
                <p>Sometimes, connection issues and lag will happen.</p>
                <p>You may want to place a bet, but the bet doesn't get processed in time. This could happen due to connection issues on your end or due to problems with our servers. You may miss out on a winning bet because of a server issue, but on the other hand, this may also rescue you from a losing bet.</p>
                <p>While this can be frustrating, we cannot hold the liability of compensating for any lost bets. We will do our best to prevent such outages, and we will investigate any complaints on a case-by-case basis. However, we cannot promise compensation in this scenario. The reason for this is simple: if we were to offer compensation for 'missed' wins, users could exploit that widely, and the expenses could be wildly high for us -- the ones who lost due to the lag would ask for a refund, but those who benefited from the lag would practically be gambling risk-free.</p>
                <h5 style={{color : 'gold'}}>MISCLICKS</h5>
                <p>Similar to the above, we cannot refund you for misclicks or accidental bets. Again, the reasoning is simple: we cannot know if it was a genuine misclick or not, and if you were to win the bet, you wouldn't be refunding us either. In summary, we cannot offer risk-free gambling where you have a chance to win but no chance of losing.</p>
                <h5 style={{color : 'gold'}}>BONUS</h5>
                <p>By using an affiliate code you can get up to 50% extra Solana to play with on your first deposit. Note that this is not instantly withdrawable, since it would drain our house wallet instantly by people using bots. You can play as normal with your bonus deposit, but in order to withdraw, it must be wagered 5 times. This keeps the odds the same and does not give an unfair advantage that can be exploited by neither the user or the house. </p>
	

            </div>
        </Modal>
        
    )
}

export default Terms;