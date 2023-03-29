import React from "react"
import { RiCloseLine } from "react-icons/ri";
require("./index.css")
const HTP = (props:{setIsOpen: any}) => {
  return (
  <>
    <div className="darkBG" onClick={() => props.setIsOpen(false)} />
      <div className="centered">
        <div className="modal">
          <div className="modalHeader">
            <h5 className="heading">Dialog</h5>
          </div>
          <button className="closeBtn" onClick={() => props.setIsOpen(false)}>
            <RiCloseLine style={{ marginBottom: "-3px" }} />
          </button>
          <div className="modalContent">
            Are you sure you want to delete the item?
          </div>
          <div className="modalActions">
            <div className="actionsContainer">
              <button className="deleteBtn" onClick={() => props.setIsOpen(false)}>
                Delete
              </button>
              <button
                className="cancelBtn"
                onClick={() => props.setIsOpen(false)}
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      </div>
  </>
  );
};

export default HTP;