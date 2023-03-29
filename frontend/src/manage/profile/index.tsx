import { useContext, useEffect, useRef, useState } from 'react';
import {Navigate} from 'react-router-dom';
import { NFTCommunities } from './nft-communities';
import img from '../../assets/img/profile-main.png'
import {MyInfoContext} from '../../provider/auth';
import {SERVER_URL} from '../../constant/env';

export const Profile = () => {
  const authData = useContext(MyInfoContext);
  const [name, setName] = useState<string>();
  const [file, setFile] = useState<any>();
  const [fileSource, setFileSource] = useState<any>();

  const [redirect, setRedirect] = useState(false);
  const onSubmit = ()=>{
    authData.updateProfile(name , fileSource);
    
  }
  const handlechange = (event : any)=>{
    if(event.target.files.length>0){
      const file = URL.createObjectURL(event.target.files[0]);
      setFile(file);
      console.log('files', event.target.files[0])
      setFileSource(event.target.files[0]);
    }
  }
  useEffect(()=>{
    if(authData.myInfo == null)
      setRedirect(true);
    else
      setName(authData.myInfo.name);
  },[authData.myInfo])
  return (
    <>{
      redirect?
      <Navigate to='/'/>
      :
      <div className="card  procrash-bg-border">
        <div className="card-header">
          <h4 className="text-white prox-b f-s-18 mb-0">Profile</h4>
        </div>
        <div className="card-body row">
          <div className='col-sm-6 profile-body'>
            <div className="profile-img-div">
              <img style={{borderRadius : '70px'}} className="profile-img" src={`${SERVER_URL}frontend/upload/user/${authData.myInfo?.profile_image}` ||  img}  alt="profile"/>
            </div>
            <div className="form-group">
              <span >Name</span>
              <input type="text" name="name" id="name" className="form-control" placeholder="James Gibbs" value={name} onChange={e=>setName(e.target.value)}/>
            </div>
            <div className="form-group">
              <input 
                type="file" 
                id="file" 
                placeholder="Profile Picture" 
                name="myfiles" 
                accept="image/png, image/jpeg" 
                onChange={handlechange} />
            </div>
            <div className='btn-class'>
              <button onClick={onSubmit} type="submit" className="btn prox-s-b f-s-16 pt-2 pb-2 profile-submit">Submit</button>
            </div>
          </div>
          <div className='col-sm-6 nft-communities-div'>
            <NFTCommunities />
          </div>
        </div>
      </div>
    }
      
    </>
  );
};
