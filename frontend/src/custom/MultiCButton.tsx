import { useWallet } from '@solana/wallet-adapter-react';
import React, { FC, useCallback, useContext, useEffect, useMemo, useRef, useState } from 'react';
import { useWalletModal, WalletIcon } from '@solana/wallet-adapter-react-ui';
import { Button, ButtonProps } from '../component/Button';
import { CButton } from './CButton';
import { WModalButton } from './WModalButton'
import { RiUserSettingsLine, RiLogoutBoxRLine } from 'react-icons/ri'
import { Link } from 'react-router-dom';
import SignUpModal from '../component/SignUpModal';
import {MyInfoContext} from '../provider/auth';

export const MultiCButton: FC<ButtonProps> = ({ children, ...props }) => {
    const { publicKey, wallet, disconnect } = useWallet();
    const { setVisible } = useWalletModal();
    const [copied, setCopied] = useState(false);
    const [active, setActive] = useState(false);
    const ref = useRef<HTMLUListElement>(null);

    const authData = useContext(MyInfoContext);
    const [signUpModalShow, setSignUpModalShow] = useState(false);

    const base58 = useMemo(() => publicKey?.toBase58(), [publicKey]);
    const content = useMemo(() => {
        if (children) return children;
        if (!wallet || !base58) return null;
        return base58.slice(0, 4) + '..' + base58.slice(-4);
    }, [children, wallet, base58]);

    const copyAddress = useCallback(async () => {
        if (base58) {
            await navigator.clipboard.writeText(base58);
            setCopied(true);
            setTimeout(() => setCopied(false), 400);
        }
    }, [base58]);

    const openDropdown = useCallback(() => {setActive(true);}, [setActive]);

    const closeDropdown = useCallback(() => setActive(false), [setActive]);

    const openModal = useCallback(() => {
        setVisible(true);
        closeDropdown();
    }, [setVisible, closeDropdown]);

    useEffect(() => {
        const listener = (event: MouseEvent | TouchEvent) => {
            const node = ref.current;

            // Do nothing if clicking dropdown or its descendants
            if (!node || node.contains(event.target as Node)) return;

            closeDropdown();
        };

        document.addEventListener('mousedown', listener);
        document.addEventListener('touchstart', listener);

        return () => {
            document.removeEventListener('mousedown', listener);
            document.removeEventListener('touchstart', listener);
        };
    }, [ref, closeDropdown]);

    if (!wallet) return <WModalButton {...props}>{children}</WModalButton>;
    if (authData.myInfo == null) return (
        <>
            <Button onClick={async() =>{
                if(base58){
                    let result = await authData.login(base58);
                    if(!result)
                        setSignUpModalShow(true)
                
                    }
                }  
            } >{children}</Button>
            <SignUpModal  visible={signUpModalShow} close={()=>setSignUpModalShow(false)} title='Welcome to Solstonks!'  />
        </>
    )
    return (
        <div className="wallet-adapter-dropdown">
            <Button
                aria-expanded={active}
                className="wallet-adapter-button-trigger"
                style={{ pointerEvents: active ? 'none' : 'auto', ...props.style }}
                onClick={openDropdown}
                startIcon={<WalletIcon wallet={wallet} />}
                {...props}
            >
                {content}
            </Button>
            <ul
                aria-label="dropdown-list"
                className={`wallet-adapter-dropdown-list ${active && 'wallet-adapter-dropdown-list-active'}`}
                ref={ref}
                role="menu"
            >
                <li className="wallet-adapter-dropdown-list-item" role="menuitem">
                   <Link to="/manage">
                       <RiUserSettingsLine /> &nbsp; Manage
                   </Link>
                </li>
                <li onClick={()=>{
                    authData.logout();
                    disconnect();
                    }} className="wallet-adapter-dropdown-list-item" role="menuitem">
                   <RiLogoutBoxRLine /> &nbsp; Log out
                </li>
            </ul>
        </div>
    );
};