import React, { useState, useEffect } from 'react';
import socketIOClient from "socket.io-client";
import {SERVER_URL} from '../constant/env';


const SocketContextTemplate = {
    mySocket : null,
    users : null,
    setUsers : ()=>{}
}
type SocketInterface = {
    mySocket : any;
    users : any;
    setUsers : Function
}
const SocketContext = React.createContext<SocketInterface>(SocketContextTemplate);


function SocketProvider({children}:{children:any}) {

    const [mySocket, setMySocket] = useState<any>(null);
    const [users, setUsers] = useState(0);

    useEffect(()=>{
        const socket = socketIOClient(SERVER_URL);
        setMySocket(socket);
    },[SERVER_URL])
    
    return(
            <SocketContext.Provider value={{
                mySocket,
                setUsers,
                users
            }}>
              {children}
            </SocketContext.Provider>
  
      )
  }
  
  export {SocketContext};
  export default SocketProvider;
  