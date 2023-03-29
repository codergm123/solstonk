import { useContext, useEffect, useState } from 'react'
import {MyInfoContext} from '../provider/auth';
import { ChatBox } from './chatbox'
import { Roulette } from './roulette'
import { ReactNotifications } from 'react-notifications-component'
import 'react-notifications-component/dist/theme.css'
require('./index.css')



export const Container = () => {
  const authData = useContext(MyInfoContext);
  return (
        <div className="d-flex">
          <ReactNotifications />
          <div className="sidebar">
            <ChatBox />
          </div>
          <Roulette />
        </div>
    
    
  );
};