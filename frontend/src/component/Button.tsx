import React, { CSSProperties, FC, MouseEvent, ReactElement } from 'react';

export interface ButtonProps {
    className?: string;
    disabled?: boolean;
    endIcon?: ReactElement;
    onClick?: (e: MouseEvent<HTMLDivElement>) => void;
    startIcon?: ReactElement;
    style?: CSSProperties;
    tabIndex?: number;
    callback?:()=>{}
}

export const Button: FC<ButtonProps> = (props) => {
    // const justifyContent = props.endIcon || props.startIcon ? 'space-between' : 'center';

    return (
        <div
            // className={`wallet-adapter-button ${props.className || ''}`}
            // disabled={props.disabled}
            // style={{ justifyContent, ...props.style }}
            className="cursor-pointer"
            onClick={props.onClick}
            tabIndex={props.tabIndex || 0}
        >
            {/* {props.startIcon && <i className="wallet-adapter-button-start-icon">{props.startIcon}</i>} */}
            {props.children}
            {/* {props.endIcon && <i className="wallet-adapter-button-end-icon">{props.endIcon}</i>} */}
        </div>
    );
};