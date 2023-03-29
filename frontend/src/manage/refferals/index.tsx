import { useContext } from 'react';
import { useState } from 'react'
import {MyInfoContext} from '../../provider/auth';


export const Refferals = () => {
  const authData = useContext(MyInfoContext);
  return (
    <>
      <div className="card  procrash-bg-border">
        <div className="card-header">
          <h4 className="text-white prox-b f-s-18 mb-0">SolStonks Referral system</h4>
          <p className='text-comment prox-b f-s-18 mb-0'>Get passive income for yourself or your project by spreading the word about SolStonks. </p>
        </div>
        <div className='card-body' style={{ color : 'white', paddingTop : '32px', display : 'flex', justifyContent : "center",}}>
          <div style={{width : '33%'}}>
            <p style={{fontSize : '32px', color : 'gold'}}>Step 1 </p>
            <span>Tell your frens<br/>Everyone that signs up using your referral code gets a 50% bonus on their first deposit. </span>
          </div>

          <div style={{width : '33%'}}>
            <p style={{fontSize : '32px', color : 'gold'}}>Step2 </p>
            <span>Gamble and watch your Solana stack<br/>You receive 1% of all bets placed by everyone that signed up using your referral code. </span>
          </div>

          <div style={{width : '33%'}}>
            <p style={{fontSize : '32px', color : 'gold'}}>Step3</p>
            <p>Take out your passive income without any limits.</p>
          </div>

        </div>
      </div>
      <div className='card  procrash-bg-border' style={{marginTop : '24px'}}>
        <div className="card-body row">
          <div className='col-sm-6 profile-body'>
          
            <div className="form-group">
              <span >Referral code</span>
              <input type="text" name="referral_code" disabled id="referral_code" className="form-control" placeholder="James Gibbs" value={authData.myInfo?.referral_code || ''}/>
            </div>
            <div className="form-group">
              <span >Total earning with referral</span>
              <input type="text" name="kickback_balance" disabled id="kickback_balance" className="form-control" placeholder="James Gibbs" value={authData.myInfo?.kickback_balance || '0.00'}/>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};
