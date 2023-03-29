import HTP from '../container/modals/htp'
import { useState } from 'react'
import HowToPlay from '../component/HowtoPlay';
import Terms from '../component/Terms';
import FAQ from '../component/FAQ';
import Fairness from '../component/Fairness';
require('./index.css')

const Footer = () => {
  const [isOpen, setIsOpen] = useState<boolean>(false)
  const [HowToShow, setHowToShow] = useState<boolean>(false);
  const [TermShow, setTermShow] = useState<boolean>(false);
  const [FAQShow, setFAQShow] = useState<boolean>(false);
  const [FairShow, setFairShow] = useState<boolean>(false);
  return (
    <>
      {isOpen && <HTP setIsOpen={setIsOpen} />}
      <footer>
        <div className="container-fluid">
          <div className="row">
            <div className="footer_menu">
              <ul>
                <li><a href='#' onClick={() => setHowToShow(true)} >HOW TO PLAY</a></li>
                <li><a href='#' onClick={() => setTermShow(true)}>TERMS & CONDITIONS</a></li>
                <li><a href='https://discord.com/invite/3edCVt4s6M' target='_blank'>Discord</a></li>
                <li><a href='#' onClick={() => setFAQShow(true)}>FAQ</a></li>
                <li><a href='#' onClick={() => setFairShow(true)}>FAIRNESS</a></li>
              </ul>
            </div>
          </div>
        </div>
        
      </footer>
      <HowToPlay title='How to Play' visible ={HowToShow}  close = {()=>setHowToShow(false)}/>
      <Terms title='Terms & Service' visible ={TermShow}  close = {()=>setTermShow(false)} />
      <FAQ title='FAQ' visible ={FAQShow}  close = {()=>setFAQShow(false)}/>
      <Fairness title='Fairness' visible ={FairShow}  close = {()=>setFairShow(false)}/>
    
    </>
  );
};

export default Footer;