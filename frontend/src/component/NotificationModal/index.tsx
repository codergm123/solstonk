import LoadingSpin from 'react-loading-spin'
import { useEffect, useState, useRef } from "react";
import { useInterval } from "./useInterval";
interface NotificationModalProps {
  isShow?: boolean;
  isToast?: boolean;
  title: string;
  description: string;
  timer?: number;
  onBackDropClick?: (e: React.MouseEvent<HTMLDivElement, MouseEvent>) => void;
}
export const NotificationModal = ({
  isShow,
  isToast,
  title,
  description,
  timer,
  onBackDropClick,
}: NotificationModalProps) => {
  const [timeLeft, setTimeLeft] = useState<number>(0);
  const [isRunning, setIsRunning] = useState(true);

  useInterval(
    () => {
      setTimeLeft(timeLeft - 1);
    },
    isRunning ? 1000 : null
  );

  useEffect(() => {
    if (timer) {
      setTimeLeft(timer);
      if (timer >= 5) setIsRunning(true);
    }
  }, [timer]);

  return isShow || isToast ? (
    <div
      className={
        isToast
          ? "h-auto w-auto"
          : "z-50 fixed flex inset-0 bg-black bg-opacity-90 overflow-y-auto h-full w-full pl-10 pr-10"
      }
      onClick={(e) => onBackDropClick && onBackDropClick(e)}
    >
      <div className="modal-back" >
        <div className="modal-custom">
          <div className="modal-header">
            <div className="modal-title" style={{fontSize: "20px!important"}}>
              {title}
              <p
                style={{ color: "#AAAAAA" }}
                className={`font-gray ${isToast ? "text-xs" : "text-sm"} mt-4 mb-4`}
              >
                {description}
              </p>
            </div>
            {!isToast && (
              <div className="w-auto ml-auto relative" style={{marginLeft: "4px", position: "relative"}}>
                <LoadingSpin
                    width="2px"
                    animationDirection="clock"
                    animationTimingFunction="ease-in-out"
                    size="32px"
                    primaryColor="#512da8"
                    secondaryColor="#fff"
                />
                <span
                  className="absolute top-0 right-0 m-6 text-xs text-center flex items-center justify-center"
                  style={{ width: "40px", height: "40px", marginLeft: "12px", marginTop: "-46px"}}
                >
                  {timeLeft && timeLeft > 0 ? `${timeLeft}` : ``}
                </span>
              </div>
            )}
          </div>
          <div>
            <div
              className="h-1 w-full"
              style={{
                background:
                  "transparent linear-gradient(270deg, #CF35EC 0%, #2EE9A8 100%) 0% 0% no-repeat padding-box",
              }}
            />
            <p className={`m-2 ${isToast ? "text-sm" : "text-md"}`}>
              Please join us on{" "}
              <a style={{ color: "#4FBBEB" }} href='https://discord.com/invite/DN4uz99SSp' target="_blank" rel="noreferrer">
                Discord
              </a>{" "}
              &{" "}
              <a style={{ color: "#4FBBEB" }} href='https://twitter.com/Solstonks_' target="_blank" rel="noreferrer">
                Twitter
              </a>{" "}
              for community updates and promotions
            </p>
          </div>
        </div>
      </div>
    </div>
  ) : null;
};
