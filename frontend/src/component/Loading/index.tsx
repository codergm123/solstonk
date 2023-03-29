import React, { CSSProperties, FC, MouseEvent, ReactElement } from 'react';
import LoadingSpin from "react-loading-spin";
import logo from '../../assets/img/favicon.png'
export interface LoadingProps {
}

const Loading: FC<LoadingProps> = (props) => {

    return (
        <div style={{backgroundColor : '#160538', height : '100vh', width : '100vw', display : 'flex', justifyContent : 'center', alignItems : 'center'}}>
            
            <div style={{position : 'relative'}}>
                <LoadingSpin
                    width="5px"
                    animationDirection="clock"
                    animationTimingFunction="ease-in-out"
                    size="100px"
                    primaryColor="#512da8"
                    secondaryColor="#fff"
                />
                <img style={{position : 'absolute', top : '14px', left : '14px', width : '72px', height : '72px'}} src={logo} className="App-header-logo"/>
            </div>
        </div>
    );
};

export default  Loading