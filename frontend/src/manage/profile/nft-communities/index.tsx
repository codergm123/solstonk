import { useConnection, useWallet } from '@solana/wallet-adapter-react';
import { Store } from 'react-notifications-component';
import { BsCheckCircleFill } from 'react-icons/bs'
import {
  PublicKey
} from "@solana/web3.js"

import {
  TOKEN_PROGRAM_ID,
} from "@solana/spl-token"

import { programs } from '@metaplex/js'
import ContentLoader from "react-content-loader"
import { useContext, useEffect, useState } from 'react';
import axios from 'axios';
import {MyInfoContext} from '../../../provider/auth';
const { metadata: { Metadata } } = programs

const TOKEN_METADATA_PROGRAM_ID = new PublicKey("metaqbxxUerdq28cj1RbAWkYQm3ybzjb6a8bt518x1s")
const CANDY_MACHINE_PROGRAM = new PublicKey("cndy3Z4yapfJBmL3ShUp5exZKqR3z33thTzeNMm2gRZ");

require('./index.css')

export const NFTCommunities = () => {
  const wallet = useWallet() 
  const connection = useConnection().connection
  const [is_found, setIsFound] = useState<boolean>(false)
  const [communities, setCommunities] = useState<any>([])
  const authData = useContext(MyInfoContext);
  const getCandyMachineCreator = async (
    candyMachine: PublicKey,
  ) => {
    return await PublicKey.findProgramAddress(
      [Buffer.from('candy_machine'), candyMachine.toBuffer()],
      CANDY_MACHINE_PROGRAM,
    );
  };

  useEffect(() => {
    setIsFound(false)
    if(!is_found && wallet.connected && authData.community) {
      
      const gets = async() => {
        let new_communities: any = []
        for(let i = 0 ; i < authData.community.length ; i++){
    
          let test_candy_machine_1 = new PublicKey(authData.community[i].mint_key)
          let data1 = await getNFTsForOwner(test_candy_machine_1)
          if(data1 !== undefined )
          new_communities = [...new_communities, {...data1, mint_key : authData.community[i].mint_key, color: authData.community[i].color}]
        }
  
        setCommunities([...new_communities])
        setIsFound(true)
      }
      gets()
    } else {
      Store.addNotification({
        title: "Error",
        message: "Please connect your wallet.",
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        }
      });
    }
  }, [wallet.connected])
  const getNFTsForOwner = async (
    candy_machine: PublicKey
  ) => {
    if(wallet.connected) {
      const [candyMachineCreator, creatorBump] = await getCandyMachineCreator(
        candy_machine
      );
      const allTokens: any = []
      const tokenAccounts = await connection.getParsedTokenAccountsByOwner(wallet.publicKey!, {
        programId: TOKEN_PROGRAM_ID
      })

      for(var index= 0; index < tokenAccounts.value.length; index ++) {
        try{
          const tokenAccount = tokenAccounts.value[index]
          const tokenAmount = tokenAccount.account.data.parsed.info.tokenAmount

          if(tokenAmount.amount == "1" && tokenAmount.decimals == "0") {
            let nftMint = new PublicKey(tokenAccount.account.data.parsed.info.mint)
            let [pda] = await PublicKey.findProgramAddress([
              Buffer.from('metadata'),
              TOKEN_METADATA_PROGRAM_ID.toBuffer(),
              nftMint.toBuffer()
            ], TOKEN_METADATA_PROGRAM_ID)

            const accountInfo: any = await connection.getParsedAccountInfo(pda)
            let metadata: any = new Metadata(wallet.publicKey!.toString(), accountInfo.value)
            if(metadata.data.data.creators[0].address == candyMachineCreator.toBase58() ) {
              const { data }: any = await axios.get(metadata.data.data.uri)
              return data
            }
          }
        }catch(e) {
          // Store.addNotification({
          //   title: "Error",
          //   message: "Something went to wrong to detect your nfts.",
          //   type: "warning",
          //   insert: "top",
          //   container: "top-right",
          //   animationIn: ["animate__animated", "animate__fadeIn"],
          //   animationOut: ["animate__animated", "animate__fadeOut"],
          //   dismiss: {
          //     duration: 1500,
          //     onScreen: true,
          //     pauseOnHover: true,
          //   }
          // });
        }
      }
    } else {
      Store.addNotification({
        title: "Error",
        message: "Please connect your wallet.",
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        }
      });
    }
  }

  function Main(): JSX.Element {
    return <>{communities.map((item: any, index: number) =>(
      <ItemNFT item = {item} key = {index} />
    ))}</>
  }

  const ItemNFT = ({item} : {item : any})=> {
    return(
      <>
        <div className="col-sm-4 nft-container">
        <div className='nft-images' onClick={() => {
          if(authData.myInfo.community_id == item.mint_key)
            authData.checkCommunity(null);
          else
            authData.checkCommunity(item.mint_key);
        }}>
          {authData.myInfo.community_id == item.mint_key && <BsCheckCircleFill className='check-images'/>}
          <img src={item.image} className='nft-communities-image' style={{border :`3px solid ${item.color || 'white'}` }}/>
        </div>
      </div>
      </>
    )
  }
  return (
    <>
      <h1 style={{color: "white"}}>NFT Communities</h1>
      <div className='row'>
        {
          !is_found ? 
          <>
            <div className='col-sm-4 nft-container'>
          
              <ContentLoader className='nft-images' speed={2} backgroundColor="rgba(22, 5, 60, 0.4)" foregroundColor="#160538" width={"100%"}>
                <rect x="0" rx="2" ry="2" width="100%" height="100%"/>
              </ContentLoader>
            </div>
            <div className='col-sm-4 nft-container'>
              <ContentLoader className='nft-images' speed={2} backgroundColor="rgba(22, 5, 60, 0.4)" foregroundColor="#160538" width={"100%"}>
                <rect x="0" rx="2" ry="2" width="100%" height="100%" />
              </ContentLoader>
            </div>
            <div className='col-sm-4 nft-container'>
              <ContentLoader className='nft-images' speed={2} backgroundColor="rgba(22, 5, 60, 0.4)" foregroundColor="#160538" width={"100%"}>
                <rect x="0" rx="2" ry="2" width="100%"  height="100%" />
              </ContentLoader>
            </div>
          </>
          : communities.length > 0 ?<>
            <Main />
          </> : <>
            <h5 style={{color: "white"}}>You don't have any nfts that we are supported.</h5>
          </>
        }
        
      </div>
      
    </>
    
  )
  
};