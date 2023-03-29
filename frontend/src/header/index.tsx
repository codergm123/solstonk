import { useContext, useState } from 'react';
import { Wallet } from '../connect'
import logo from '../assets/img/header_logo.png'
import avatar from '../assets/img/profile-main.png'
import { useWallet } from '@solana/wallet-adapter-react';
import { Link } from 'react-router-dom';
import {MyInfoContext} from '../provider/auth';
import {SERVER_URL} from '../constant/env';
require('./index.css')

export const Header = () => {
  const wallet = useWallet();
  const authData = useContext(MyInfoContext);
  return (
    <>
      <header className="App-header">
        <Link to='/'>
          <img src={logo} className="App-header-logo"/>
        </Link>
        <div className='utility-buttons'>
          <Link to='/manage/withdraw'>
            <div className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'>Withdraw</div>
          </Link>
          <Link to='/manage/deposit'>
            <div className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'>Deposit</div>
          </Link>
          <Wallet>
            <div className='wallet-container wallet-adapter-button wallet-adapter-button-trigger'>
              { !wallet.connected ? "wallet connection" :
                authData.myInfo == null ? "login" :
                <>
                  <i className='wallet-adapter-button-icon'><img style={{borderRadius : '50px'}} src={`${SERVER_URL}frontend/upload/user/${authData.myInfo?.profile_image}` ||  avatar} /></i>
                  <div className='wallet-container-loggedIn'>
                    <p className='wallet-container-username' style={{color : authData.getCheckedCommunity(authData.myInfo.community_id) || 'white'}}>{authData.myInfo.name}</p>
                    <p className='wallet-container-balance'>{`${(parseFloat(authData.myInfo.normal_balance) + parseFloat(authData.myInfo.bonus_balance)).toFixed(4)} SOL`}</p>
                  </div>
                </> 
              }
            </div>
          </Wallet>
        </div>
      </header>
    </>
  );
};