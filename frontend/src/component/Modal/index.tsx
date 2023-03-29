import React, {FC, useRef} from 'react';
import { RiCloseLine } from "react-icons/ri";
import useOnClickOutside from '../../helper/useClickOutside';
import './index.css'
interface Interface{
    title:string;
    visible:boolean;
    children?:React.ReactNode;
    close:() => void;
    extend?:boolean;
}
const Modal : FC<Interface> = (props:Interface)=>{
    const ref = useRef<any>();
    useOnClickOutside(ref,props.close)
    return (
        <>
        
        {props.visible && 
            <div className="modal-back" >
            <div className={props.extend == true ? 'modal-custom-extend' :'modal-custom'} ref={ref}>
                <div className="modal-header">
                    <div className='modal-title'>
                        {props.title}
                    </div>
                    <div>
                        <a onClick={props.close}><RiCloseLine style={{ marginBottom: "-3px" }} /></a>
                        
                    </div>
                </div>
                <div className='term-div' style={{overflowY : 'auto', height : '500px'}}>
                    {props.children}
                </div>
            </div>
        </div>
        }
        </>
        
    )
}

export default Modal;