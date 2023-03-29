import { useContext } from 'react';
import { useEffect } from 'react';
import { useState } from 'react'
import {MyInfoContext} from '../../provider/auth';
import {Navigate} from 'react-router-dom';
import { NotificationModal } from '../../component/NotificationModal'


export const Deposit = () => {
  const authData = useContext(MyInfoContext);
  const [redirect, setRedirect] = useState(false);
  const [amount , setAmount] = useState(0);

  // Nitification State
  const [buttonLoading, setButtonLoading] = useState(false)
  const [isNotificationLoading, setIsNotificationLoading] = useState(false)
  const [notificationTitle, setNotificationTitle] = useState(
    "Please dont close this window."
  )
  const [notificationDesc, setNotificationDesc] = useState(
    "After wallet approval, your transaction will be finished shortly…"
  )
  const [notificationCanClose, setNotificationCanClose] =
    useState<boolean>(false)
  const [modalTimer, setModalTimer] = useState<number>(0)

  const closeAndResetModal = () => {
    setButtonLoading(false)
    setNotificationTitle(
      "Please dont close this window."
    )
    setNotificationDesc(
      "After wallet approval, your transaction will be finished shortly…"
    )
    setModalTimer(5)
  }

  //
  useEffect(()=>{
    if(authData.myInfo == null)
      setRedirect(true);
    else
      authData.getDepositData();
  },[authData.myInfo])

  const checkNumber = (value : string) => {
    const reg = /^-?\d*(\.\d*)?$/;
    if ((!isNaN(Number(value)) && reg.test(value)) || value === '' || value === '-') {
      return true;
    }
    return false;
  }

  const handleDeposit = ()=>{
    setButtonLoading(true)
    authData.connectAndSend(amount, callBack);
  }

  const callBack = (success: any, message: string) => {
    if(success == true) setNotificationTitle("Success!")
    else setNotificationTitle("Failed!")
    setNotificationDesc(message)
    setNotificationCanClose(true)
    setModalTimer(5)
    setTimeout(() => {
      closeAndResetModal()
      setNotificationCanClose(false)
    }, 5000)
  }
 
  return (
    <>
    {
      redirect?
      <Navigate to='/'/>
      :
      <div className="card  procrash-bg-border">
        <div className="card-header">
          <h4 className="text-white prox-b f-s-18 mb-0">Deposit {authData.depositData?.total_balance}</h4>
        </div>
        <div className="card-body">
          <div className="deposit-top">
            <div className="row">
              <div className="col-md-4">
                <div className="form-group">
                  <input type="number" className="form-control" step="0.05" min="0.05" 
                    placeholder="Enter SOL to deposit" id="deposit_coin"
                    value={amount}
                    onChange = {e=>{
                      if(checkNumber(e.target.value))
                        setAmount(Number(e.target.value));
                    }}/>
                  <div className="help-block"></div>
                  <span className="check_message text-danger"></span>
                </div>
              </div>
              <div className="col-md-1">
              </div>
              <div className="col-md-2">
                <button onClick={handleDeposit} className="btn perple-btn btn-block prox-s-b f-s-16 pt-2 pb-2 coin_deposit_btn" id="coinDepositBtn" >Deposit</button>
              </div>
              <div className="col-md-5 pt-2">
              </div>
            </div>
          </div>

          <div className="row">
            <div className="col-md-12 pt-2 pb-0">
              <div className="table-responsive">
                <table className="table bet_history_table" id="depositHistoryTable">
                  <tr className="tb-header">
                    <th className="text-center prox-b f-s-16">Transaction Signature</th>
                    <th className="text-center prox-b f-s-16">SOL</th>
                    <th className="text-center prox-b f-s-16">Date</th>
                  </tr>
                  
                    {authData.depositData?.historyList.map((item : any, key : number)=>(
                      <tr key = {key}>
                        <td>{item.transaction_signature}</td>
                        <td>{item.coin}</td>
                        <td>{item.transaction_date}</td>
                      </tr>
                    ))}
                  
                </table>
              </div>
            </div>
          </div>
        </div>
        <NotificationModal
          isShow={buttonLoading}
          isToast={false}
          title={notificationTitle}
          description={notificationDesc}
          timer={modalTimer}
          onBackDropClick={() => {
            if (notificationCanClose) {
              closeAndResetModal()
            }
          }}
        ></NotificationModal>
      </div>
    }
    </>
  );
};
