import { useEffect, useState } from 'react';
import { ReactNotifications } from 'react-notifications-component'
import 'react-notifications-component/dist/theme.css'
import { Link } from 'react-router-dom';
import { Deposit } from './deposit';
import { Profile } from './profile';
import { Refferals } from './refferals';
import { Information } from './user-infomation';
import { Withdraw } from './withdraw';
require('./index.css')

export const ManageContainer = ({id} : {id : string}) => {

  const [index, setIndex] = useState('');

  useEffect(()=>{
    setIndex(id)
  },[id])
  return (
    <div className="d-flex">
      <ReactNotifications />
      <div className="col-md-12 pl-0 pr-0 content-main-view">
        <section className="convert_speces">
          <div className="col-md-12">
            <div className="row">
              <div className="col-md-2 col-sm-3 nav-list-menu">
                <div className="nav flex-column nav-pills v-tabs-menu" id="v-pills-tab" role="tablist"
                  aria-orientation="vertical">
                  <Link to='/manage'><div className={`nav-link ${ index == '' ? 'active' : ''}`} >Profile</div></Link>
                  <Link to='/manage/referral'><div className={`nav-link ${ index == 'referral' ? 'active' : ''}`} >Refferals</div></Link>
                  <Link to='/manage/deposit'><div className={`nav-link ${ index == 'deposit' ? 'active' : ''}`} >Deposit</div></Link>
                  <Link to='/manage/withdraw'><div className={`nav-link ${ index == 'withdraw' ? 'active' : ''}`} >Withdraw</div></Link>               
                </div>
                  <Information />
              </div>
              <div className="col-md-10 col-sm-9">
                <div className="tab-content v-tabs" id="v-pills-tabContent">        
                  <div className={`tab-pane fade ${index == '' ?'show active' : '' }`}>
                    <Profile />
                  </div>
                  <div className={`tab-pane fade ${index == 'referral' ?'show active' : '' }`} >
                    <Refferals />
                  </div>
                  <div className={`tab-pane fade ${index == 'deposit' ?'show active' : '' }`}>
                    <Deposit />
                  </div>
                  <div className={`tab-pane fade ${index == 'withdraw' ?'show active' : '' }`}>
                    <Withdraw />
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
    </div>
  );
};