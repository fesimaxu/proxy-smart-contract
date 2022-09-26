//SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "./Proxiable.sol";

contract ImplementationA is Proxiable {

    address public owner;
    uint public count;
    bool public initalized = false;

    function initialize() public {
        require(owner == address(0), "Already initalized");
        require(!initalized, "Already initalized");
        owner = msg.sender;
        initalized = true;
    }
    function encode() public pure returns(bytes memory ){
        return abi.encodeWithSignature("initialize()");
    }

    function increment() public {
        count++;
    }

    function updateCode(address newCode) onlyOwner public {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner is allowed to perform this action");
        _;
    }
}