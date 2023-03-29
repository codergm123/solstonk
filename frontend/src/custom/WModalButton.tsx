import React, { FC, MouseEvent, useCallback } from 'react';
import { Button, ButtonProps } from '../component/Button';
import { useWalletModal } from '@solana/wallet-adapter-react-ui';

export const WModalButton: FC<ButtonProps> = ({ children = 'CONNECT', onClick, ...props }) => {
    const { visible, setVisible } = useWalletModal();

    const handleClick = useCallback(
        (event: MouseEvent<HTMLDivElement>) => {
            if (!event.defaultPrevented) setVisible(!visible);
        },
        [onClick, setVisible, visible]
    );

    return (
        <Button className="wallet-adapter-button-trigger" onClick={handleClick} {...props}>
            {children}
        </Button>
    );
};