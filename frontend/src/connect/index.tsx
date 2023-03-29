import React, { FC } from 'react';
import { MultiCButton } from '../custom/MultiCButton';

// Default styles that can be overridden by your app
require('@solana/wallet-adapter-react-ui/styles.css');

export const Wallet: FC = ({children}) => {
    return (
        <MultiCButton>
            {children}
        </MultiCButton>
    );
};