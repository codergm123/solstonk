import { useWallet } from '@solana/wallet-adapter-react';
import React, { FC, MouseEventHandler, useCallback, useMemo } from 'react';
import { Button, ButtonProps } from '../component/Button';
import { WalletIcon } from '@solana/wallet-adapter-react-ui';

export const CButton: FC<ButtonProps> = ({ children, disabled, onClick, callback, ...props }) => {
    const { wallet, connect, connecting, connected, publicKey } = useWallet();

    const handleClick: MouseEventHandler<HTMLDivElement> = useCallback(
        (event) => {
            if (onClick) onClick(event);
            // eslint-disable-next-line @typescript-eslint/no-empty-function
            if (!event.defaultPrevented) connect().then(()=>{
                if(callback)
                    callback();
            })
        },
        [onClick, connect]
    );

    const content = useMemo(() => {
        if (children) return children;
        if (connecting) return 'Connecting ...';
        if (connected) return 'Connected';
        if (wallet) return 'Connect';
        return 'Connect Wallet';
    }, [children, connecting, connected, wallet]);

    return (
        <Button
            className="wallet-adapter-button-trigger"
            disabled={disabled || !wallet || connecting || connected}
            startIcon={wallet ? <WalletIcon wallet={wallet} /> : undefined}
            onClick={handleClick}
            {...props}
        >
            {content}
        </Button>
    );
};