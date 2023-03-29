import React, { useState, useEffect } from "react";
import axios from "axios";
import { SERVER_URL, walletClusterApiUrl } from "../constant/env";
import {
  SystemProgram,
  Keypair,
  TransactionInstruction,
  Connection,
  clusterApiUrl,
  PublicKey,
  LAMPORTS_PER_SOL,
  sendAndConfirmTransaction,
  AccountInfo,
  Transaction,
} from "@solana/web3.js";
import { Store } from "react-notifications-component";
import {
  ASSOCIATED_TOKEN_PROGRAM_ID,
  TOKEN_PROGRAM_ID,
  Token,
} from "@solana/spl-token";

const MyInfoContextTemplate = {
  myInfo: null,
  refresh: false,
  loading: true,
  error: false,
  signup: async (referral: string, walletAddress: string) => {
    return false;
  },
  login: async (walletAddress: string) => {
    return false;
  },
  logout: async () => {},
  updateProfile: async (name: string, pic: any) => {
    return false;
  },
  getDepositData: async () => {
    return false;
  },
  getWithdrawData: async () => {
    return false;
  },
  getMyInfo: async () => {
    return false;
  },
  setForceUpdate: () => {},
  getCheckedCommunity: () => {},
  depositData: null,
  withdrawData: null,
  setting: null,
  totalInfo: null,
  community: null,
  checkCommunity: async (communityId: string) => {},
  connectAndSend: async (amount: number) => {},
  withdraw: async (amount: number) => {},
  bettingStart: async (type: string, amount: number) => {
    return false;
  },
  getSettingData: async () => {},
};
type MyInfoInterface = {
  myInfo: any;
  refresh: boolean;
  loading: boolean;
  error: boolean;
  signup: Function;
  login: Function;
  logout: Function;
  updateProfile: Function;
  getDepositData: Function;
  getWithdrawData: Function;
  getMyInfo: Function;
  setForceUpdate: Function;
  getCheckedCommunity: Function;
  depositData: any;
  withdrawData: any;
  setting: any;
  totalInfo: any;
  community: any;
  checkCommunity: Function;
  connectAndSend: Function;
  withdraw: Function;
  bettingStart: Function;
  getSettingData: Function;
};
const MyInfoContext = React.createContext<MyInfoInterface>(
  MyInfoContextTemplate
);

function MyInfoProvider({ children }: { children: any }) {
  const [setting, setSetting] = useState<any>(null);
  const [totalInfo, setTotalInfo] = useState<any>(null);
  const [myInfo, setMyInfo] = useState<any>(null);
  const [forceUpdate, setForceUpdate] = useState(false);
  const [refresh, setRefresh] = useState(false);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(false);
  const [depositData, setDepositData] = useState<any>(null);
  const [withdrawData, setWithdrawData] = useState<any>(null);
  const [community, setCommunity] = useState<any>(null);

  useEffect(() => {
    if (forceUpdate) {
      getMyInfo();
      setForceUpdate(false);
    }
  }, [forceUpdate]);
  useEffect(() => {
    init();
  }, []);

  const init = () => {
    getSettingData();
    getCommunityInfo();
  };
  const getCommunityInfo = async () => {
    await axios.get(SERVER_URL + "settingInfo").then((result) => {
      if (result.data.status == "success")
        setCommunity(result.data.data.totalCommunities);
    });
  };
  const getCheckedCommunity = (mint_key: string) => {
    if (community != null) {
      let checkedCommuntiy = community.filter(
        (item: any) => item.mint_key == mint_key
      );
      if (checkedCommuntiy.length > 0) return checkedCommuntiy[0].color;
      else return "white";
    }
    return "white";
  };
  const getMyInfo = async () => {
    if (myInfo == null) return false;

    let result = await axios.get(SERVER_URL + `myInfo/${myInfo.id}`);

    if (result.data.status) {
      setMyInfo(result.data.data);
      setTotalInfo(result.data.referralInfo);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };
  const getSettingData = async () => {
    let result = await axios.get(SERVER_URL);

    if (result.data.status) {
      setSetting(result.data.data.setting);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  const bettingStart = async (type: string, amount: number) => {
    let result = await axios.post(SERVER_URL + `roulette/bettingstart`, {
      userID: myInfo.id,
      bet_amount: amount,
      type: type,
    });
    if (result.data.status == "success") {
      Store.addNotification({
        title: result.data.status,
        message: result.data.message,
        type: "success",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        },
      });
      // setMyInfo(result.data.data);
    } else {
      Store.addNotification({
        title: result.data.status,
        message: result.data.message,
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        },
      });
    }

    return result.data.status == "success";
  };
  const signup = async (referral: string, walletAddress: string) => {
    let result = await axios.post(SERVER_URL + `signup/`, {
      referral_code: referral,
      walletId: walletAddress,
    });

    if (result.data.status) {
      setMyInfo(result.data.data);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  const logout = async () => {
    setMyInfo(null);
  };

  type CreateUserResponse = {
    status: string;
    data: any;
  };
  const login = async (walletAddress: string) => {
    let result = await axios.post<CreateUserResponse>(
      SERVER_URL + `login/`,
      {
        walletId: walletAddress,
      },
      {
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
        },
      }
    );

    if (result.data.status) {
      setMyInfo(result.data.data);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  const updateProfile = async (name: string, pic: any) => {
    const formData = new FormData();
    formData.append("file", pic);
    formData.append("userID", myInfo.id);
    formData.append("name", name);
    let result = await axios.post(SERVER_URL + `save/`, formData);

    if (result.data.status) {
      setMyInfo(result.data.data);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  const getDepositData = async () => {
    let result = await axios.get(SERVER_URL + `deposit/${myInfo.id}`);
    if (result.data.status) {
      setDepositData(result.data.data);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  const getWithdrawData = async () => {
    let result = await axios.get(SERVER_URL + `withdraw/${myInfo.id}`);
    if (result.data.status) {
      setWithdrawData(result.data.data);
    } else {
      setError(true);
    }
    return result.data.status == "success";
  };

  // On load of page check to see if there is a phantom window object if not then have popup
  window.addEventListener("load", validateAc);

  // Function to create button and on click
  function validateAc() {
    const isPhantomInstalled =
      (window as any).solana && (window as any).solana.isPhantom;

    if (isPhantomInstalled == true) {
    } else {
      window.alert("solana object not found! get a phantom wallet");
      (window as any).location = "https://www.phantom.app/";
    }
  }

  ////////////////////////////deposit//////////////////////////////////
  async function connectAndSend(amount: number, callback: any) {
    try {
      await (window as any).solana.connect();
      await sendSol(amount, callback);
    } catch (err) {
      console.log(err);
      callback(false, "Oops! Something went wrong.");
    }
  }

  async function getTokenWallet(wallet: PublicKey, mint: PublicKey) {
    return (
      await PublicKey.findProgramAddress(
        [wallet.toBuffer(), TOKEN_PROGRAM_ID.toBuffer(), mint.toBuffer()],
        ASSOCIATED_TOKEN_PROGRAM_ID
      )
    )[0];
  }

  async function sendSol(amount: number, callback: any) {
    const provider = (window as any).solana;
    const toAddr = depositData.adminWallet;
    const price = amount;
    let userWalletAddress = provider.publicKey.toString();
    let minDepAmt = setting.min_bet || 0.05;

    let transaction_block;
    let transaction_signature: string;

    if (price >= minDepAmt) {
      const connection = new Connection(
        clusterApiUrl(walletClusterApiUrl),
        "confirmed"
      );
      const toAccount = new PublicKey(toAddr);
      // Create transaction object
      let transaction = new Transaction().add(
        SystemProgram.transfer({
          fromPubkey: provider.publicKey,
          toPubkey: toAccount,
          lamports: LAMPORTS_PER_SOL * price,
        })
      );
      // Setting the variables for the transaction
      transaction.feePayer = await provider.publicKey;
      let blockhashObj = await connection.getRecentBlockhash();
      transaction.recentBlockhash = await blockhashObj.blockhash;

      // Request creator to sign the transaction (allow the transaction )
      let signed = await provider.signTransaction(transaction).then(
        (data: any) => {
          return data;
        },
        (reject: any) => {
          Store.addNotification({
            title: "Failed",
            message: "User declined transaction.",
            type: "warning",
            insert: "top",
            container: "top-right",
            animationIn: ["animate__animated", "animate__fadeIn"],
            animationOut: ["animate__animated", "animate__fadeOut"],
            dismiss: {
              duration: 1500,
              onScreen: true,
              pauseOnHover: true,
            },
          });
          callback(false, "You declined transaction.");
        }
      );
      let signature = await connection
        .sendRawTransaction(signed.serialize())
        .then(
          (data) => {
            transaction_signature = data;
            return data;
          },
          (reject) => {
            Store.addNotification({
              title: "Failed",
              message: "Insufficient balance in Phantom wallet.",
              type: "warning",
              insert: "top",
              container: "top-right",
              animationIn: ["animate__animated", "animate__fadeIn"],
              animationOut: ["animate__animated", "animate__fadeOut"],
              dismiss: {
                duration: 1500,
                onScreen: true,
                pauseOnHover: true,
              },
            });
            callback(false, "Insufficient balance in Phantom wallet.");
          }
        );
      if (signature) {
        await connection.confirmTransaction(signature).then(
          (data) => {
            transaction_block = data.context.slot;

            $.ajax({
              type: "POST",
              dataType: "json",
              url: SERVER_URL + "deposit/paymentsuccess",
              data: {
                userID: myInfo.id,
                transaction_block: transaction_block,
                transaction_signature: transaction_signature,
                coin: price,
                price: price,
                userWalletAddress: userWalletAddress,
              },
              success: function (response) {
                if (response.status == "success") {
                  Store.addNotification({
                    title: response.status,
                    message: response.message,
                    type: "success",
                    insert: "top",
                    container: "top-right",
                    animationIn: ["animate__animated", "animate__fadeIn"],
                    animationOut: ["animate__animated", "animate__fadeOut"],
                    dismiss: {
                      duration: 1500,
                      onScreen: true,
                      pauseOnHover: true,
                    },
                  });
                  callback(true, `You've successfully deposited ${price} SOL.`);
                  setMyInfo(response.data);
                } else {
                  Store.addNotification({
                    title: "Failed",
                    message: response.message,
                    type: "warning",
                    insert: "top",
                    container: "top-right",
                    animationIn: ["animate__animated", "animate__fadeIn"],
                    animationOut: ["animate__animated", "animate__fadeOut"],
                    dismiss: {
                      duration: 1500,
                      onScreen: true,
                      pauseOnHover: true,
                    },
                  });
                  callback(false, "Oops!, Something went wrong.");
                }
              },
            });
            return data;
          },
          (reject) => {
            Store.addNotification({
              title: "Failed",
              message: "Transaction confirmation failed.",
              type: "warning",
              insert: "top",
              container: "top-right",
              animationIn: ["animate__animated", "animate__fadeIn"],
              animationOut: ["animate__animated", "animate__fadeOut"],
              dismiss: {
                duration: 1500,
                onScreen: true,
                pauseOnHover: true,
              },
            });
            callback(false, "Transaction confirmation failed.");
          }
        );
      }
    } else {
      Store.addNotification({
        title: "Failed",
        message: `Minimum deposit amount is ${minDepAmt} solona`,
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        },
      });
      callback(false, `Minimum deposit amount is ${minDepAmt} solona`);
    }
  }

  //////////////////////////////////////////////////////////////////
  const withdraw = async (amount: number, callback: any) => {
    const provider = (window as any).solana;
    let minDepAmt = setting.min_bet || 0.05;

    var coin = amount;
    let userWalletPubKey = provider.publicKey.toString();

    if (coin > parseFloat(withdrawData.withdrawables)) {
      Store.addNotification({
        title: "Failed",
        message: `Withdraw amount is greater than your current balance`,
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        },
      });
      callback(false, "Withdraw amount is greater than your current balance");
    } else if (coin >= minDepAmt) {
      if (
        myInfo.id !== "" &&
        myInfo.id !== 0 &&
        myInfo.id !== null &&
        myInfo.id !== undefined
      ) {
        if (userWalletPubKey) {
          var date = new Date();
          const data = new TextEncoder().encode(
            `Solstonks Withdraw ${coin}, ${date}`
          );
          const signature = await (window as any).solana.signMessage(
            data,
            "utf8"
          );

          try {
            let userWalletAddress = provider.publicKey.toString();

            if (1) {
              const connection = new Connection(
                clusterApiUrl(walletClusterApiUrl),
                "confirmed"
              );
              // Create transaction object
              let transaction = new Transaction();

              // Setting the variables for the transaction
              transaction.feePayer = await provider.publicKey;
              let blockhashObj = await connection.getRecentBlockhash();
              transaction.recentBlockhash = blockhashObj.blockhash;

              // Request creator to sign the transaction (allow the transaction )
              let signed = await provider.signTransaction(transaction).then(
                (data: any) => {
                  return data;
                },
                (reject: any) => {}
              );
              let signature1 = await connection.sendRawTransaction(
                signed.serialize()
              );
              if (signature1) {
                await connection.confirmTransaction(signature1);
              }
            } else {
            }
          } catch (e) {}
          $.ajax({
            type: "POST",
            dataType: "json",
            url: SERVER_URL + "withdraw/sendPayment",
            data: {
              userID: myInfo.id,
              amount: coin,
              user_id: myInfo.id,
              userWalletPubKey: userWalletPubKey,
              date: date,
              signature: String.fromCharCode.apply(
                null,
                Array.from(new Uint8Array(signature.signature))
              ),
            },
            success: function (response) {
              if (response.status === "success") {
                Store.addNotification({
                  title: "success",
                  message: response.message,
                  type: "success",
                  insert: "top",
                  container: "top-right",
                  animationIn: ["animate__animated", "animate__fadeIn"],
                  animationOut: ["animate__animated", "animate__fadeOut"],
                  dismiss: {
                    duration: 1500,
                    onScreen: true,
                    pauseOnHover: true,
                  },
                });
                callback(true, response.message);
                setMyInfo(response.data);
              } else {
                Store.addNotification({
                  title: "Failed",
                  message: response.message,
                  type: "warning",
                  insert: "top",
                  container: "top-right",
                  animationIn: ["animate__animated", "animate__fadeIn"],
                  animationOut: ["animate__animated", "animate__fadeOut"],
                  dismiss: {
                    duration: 1500,
                    onScreen: true,
                    pauseOnHover: true,
                  },
                });
                callback(false, response.message);
              }
            },
          });
        } else {
          Store.addNotification({
            title: "Failed",
            message: "Wallet info not found",
            type: "warning",
            insert: "top",
            container: "top-right",
            animationIn: ["animate__animated", "animate__fadeIn"],
            animationOut: ["animate__animated", "animate__fadeOut"],
            dismiss: {
              duration: 1500,
              onScreen: true,
              pauseOnHover: true,
            },
          });
          callback(false, "Wallet info not found");
        }
      }
    } else {
      Store.addNotification({
        title: "Failed",
        message: `Minimum Withdraw amount is ${minDepAmt} SOL.`,
        type: "warning",
        insert: "top",
        container: "top-right",
        animationIn: ["animate__animated", "animate__fadeIn"],
        animationOut: ["animate__animated", "animate__fadeOut"],
        dismiss: {
          duration: 1500,
          onScreen: true,
          pauseOnHover: true,
        },
      });
      callback(false, `Minimum Withdraw amount is ${minDepAmt} SOL.`);
    }
  };

  const checkCommunity = async (communityId: string) => {
    if (myInfo == null) return false;
    let result = await axios.post(SERVER_URL + "users/checkcommunity", {
      userId: myInfo.id,
      communityId: communityId,
    });

    if (result.data.status == "success") {
      setMyInfo(result.data.data);
    }
    return result.data.status == "success";
  };
  return (
    <MyInfoContext.Provider
      value={{
        myInfo,
        refresh,
        loading,
        error,
        signup,
        login,
        logout,
        updateProfile,
        getDepositData,
        getWithdrawData,
        getMyInfo,
        depositData,
        withdrawData,
        setting,
        totalInfo,
        community,
        getCheckedCommunity,
        checkCommunity,
        setForceUpdate,
        connectAndSend,
        withdraw,
        bettingStart,
        getSettingData,
      }}
    >
      {children}
    </MyInfoContext.Provider>
  );
}

export { MyInfoContext };
export default MyInfoProvider;
