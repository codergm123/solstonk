import { FaCoins, FaUsers } from 'react-icons/fa'
import { BsCashStack } from 'react-icons/bs'
import { GiMineWagon } from 'react-icons/gi';
import { useContext, useEffect } from 'react';
import {MyInfoContext} from '../../provider/auth';
require('./index.css')

export const Information = () => {
  const authData = useContext(MyInfoContext);
  useEffect(()=>{
    authData.setForceUpdate(true);
  },[])
  return (
    <div className='info-div'>
      <div className='info-card'>
        <p className='info-title'>Total earnings</p>
        <FaCoins className='gold-coin'/> {`${(Number(authData.totalInfo?.totalEarning || 0)).toFixed(4)} SOL`}
      </div>
      <div className='info-card'>
        <p className='info-title'>Total visitors</p>
        <FaUsers className='gold-coin'/> {`${authData.totalInfo?.totalVisitors || 0}`}
      </div>
      <div className='info-card'>
        <p className='info-title'>Total depositors</p>
        <BsCashStack className='gold-coin'/> {`${authData.totalInfo?.totaldepositors || 0}`}
      </div>
      <div className='info-card'>
        <p className='info-title'>Total wagered by depositors</p>
        <GiMineWagon className='gold-coin'/> {`${authData.totalInfo?.totalBetByDepositors || 0} SOL`}
      </div>
    </div>
  );
};