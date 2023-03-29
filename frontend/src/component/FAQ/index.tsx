import React, {FC, useContext, useState } from 'react';
import { useWallet } from '@solana/wallet-adapter-react';
import Modal from '../Modal';
import {Button} from '../Button';
import { Store } from 'react-notifications-component';
import './index.css';
interface ModalInterface{
    title:string;
    visible:boolean;
    close:() => void;
}
const FAQ : FC<ModalInterface> = (props:ModalInterface)=>{

    
    return (
        <Modal extend = {true} close={props.close} title={'FAQ'} visible={props.visible} >
            <div style={{marginTop : '16px'}}>
            <div className="accordion" id="accordionExample">
                    <div className="">
                        <div className="" id="headingOne">
                            <h5>
                                <div className="faq" data-toggle="collapse" data-target="#collapseOne">What is SolStonks? <i className="fa fa-caret-down" aria-hidden="true"></i></div>									
                            </h5>
                        </div>
                        <div id="collapseOne" className="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                            <div className="faq_content">
                                <p>Solstonks NFT is a project founded by a team of former employees at a major CSGO casino gambling site. We have been interested in tech all our lives and when we saw that casinos started to pick up traction within the NFT scene we saw an opportunity to bring our knowledge to the space.</p>
                                <p>Very few of the current Solana casinos provide the experience we know players are looking for, and we are looking to fill that gap. We will be starting with roulette, since we know it's one of the most popular games, but we are already working on more games.</p>
                                <p>Each game on our website will have it's own NFT collectionalong with it, and the revenue that is generated through the game will be distributed to the holders of the NFTs in that collection. This will allow us to create a really strong community within the solana ecosystem which will help us grow the casino and its playerbase over time.</p>

                            </div>
                        </div>
                    </div>
                    <div className="">
                        <div className="" id="headingTwo">
                            <h5>
                                <div className="faq" data-toggle="collapse" data-target="#collapseTwo">What do the colors mean? <i className="fa fa-caret-down" aria-hidden="true"></i></div>
                            </h5>
                        </div>
                        <div id="collapseTwo" className="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                            <div className="faq_content">
                                <p>Purple gives you 2x the money back,  if you bet on it and it lands on it as well. </p>
                                <p>White gives you 2x the money back, if you bet on it and it lands on it as well. </p>
                                <p>and orange gives you 14x the betted money, if it lands on orange.  </p>

                            </div>
                        </div>
                    </div>
                    <div className="">
                        <div className="" id="headingThree">
                            <h5>
                                <div className="faq" data-toggle="collapse" data-target="#collapseThree">What odds do i have? <i className="fa fa-caret-down" aria-hidden="true"></i></div>                     
                            </h5>
                        </div>
                        <div id="collapseThree" className="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                            <div className="faq_content">
                                    <p>There are 15 chances in total.</p>
                                    <p>7/15 chance that it lands on WHITE</p>
                                    <p>7/15 chance that it lands on PURPLE</p>
                                    <p>1/15 chance that it lands on ORANGE</p>
                                    <p>They are all randomised so it could theoretically land on any color several times in a row. In the long run these are the odds that the game has. </p>

                            </div>
                        </div>
                    </div>
            </div>

            </div>
        </Modal>
        
    )
}

export default FAQ;