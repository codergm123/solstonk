import './App.css';
import { useMemo, useState, useEffect } from 'react';
import { ConnectionProvider, WalletProvider } from '@solana/wallet-adapter-react';
import { WalletAdapterNetwork } from '@solana/wallet-adapter-base';
import {
    LedgerWalletAdapter,
    PhantomWalletAdapter,
    SlopeWalletAdapter,
    SolflareWalletAdapter,
    SolletExtensionWalletAdapter,
    SolletWalletAdapter,
    TorusWalletAdapter,
} from '@solana/wallet-adapter-wallets';
import {
    WalletModalProvider
} from '@solana/wallet-adapter-react-ui';
import { clusterApiUrl } from '@solana/web3.js';
import { useParams} from "react-router-dom";

import { Header } from './header';
import { Container } from './container'
import { ManageContainer} from './manage'
import Footer from './footer'
import { BrowserRouter, Routes, Route } from 'react-router-dom'
import MyInfoProvider from './provider/auth';
import SocketProvider from './provider/socket';
import Loading from './component/Loading';
import { IMAGES, imageInferface } from "./constant/image"

function App() {
  return (
        <Container />
    
  );
}

function Manage() {
  const {id} = useParams();
  return(
      <ManageContainer id = {id || ''}/>
    
  )
}

function CombinedApp() {
  const [loading, setLoading] = useState(true);
  const network = WalletAdapterNetwork.Mainnet;
  const endpoint = useMemo(() => clusterApiUrl(network), [network]);
  const wallets = useMemo(
    () => [
      new PhantomWalletAdapter(),
      new SlopeWalletAdapter(),
      new SolflareWalletAdapter({ network }),
      new TorusWalletAdapter(),
      new LedgerWalletAdapter(),
      new SolletWalletAdapter({ network }),
      new SolletExtensionWalletAdapter({ network }),
    ],
    [network]
  );
  useEffect(() => {
    const loadImage = (image:imageInferface) => {
      return new Promise((resolve, reject) => {
        const loadImg = new Image();
        loadImg.src = image.url;
        console.log("url", image.url)
        loadImg.onload = () =>
          setTimeout(() => {
            resolve(image.url)
          }, 5000)

        loadImg.onerror = err => reject(err);
      })
    }

    Promise.all(IMAGES.map(image => loadImage(image)))
      .then(() => setLoading(false))
      .catch(err => console.log("Failed to load images", err))
  }, [])
  return (
    <>
    {
      loading?
        <Loading />
      :
        <ConnectionProvider endpoint={endpoint}>
          <WalletProvider wallets={wallets} autoConnect>
            <WalletModalProvider>
              <MyInfoProvider>
                <SocketProvider>
                  <BrowserRouter>
                    
                        <div className="App">
                          <Header />
                          
                            <Routes>
                              <Route path='/' element={<App />}/>
                              <Route path='/manage' element={<Manage />}>
                                <Route path='/manage/:id' element={<Manage />}/>
                              </Route>
                            </Routes>
                          
                          <Footer />
                        </div>
                    
                  </BrowserRouter>
                </SocketProvider>
              </MyInfoProvider>
            </WalletModalProvider> 
          </WalletProvider>
        </ConnectionProvider>
    }
    </>
    
    
  )
}

export default CombinedApp;
