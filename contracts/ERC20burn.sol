// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Proxiable.sol";

contract unitedToken is Proxiable{

    uint public totalSupply;
    string public name = "unitedToken";
    string public symbol = "UNT";
    uint8 public decimals = 18;
    address public owner;
    bool public initalized = false;

    mapping(address => uint) public balanceOf;

    function initialize() public {
    require(owner == address(0), "Already initalized");
    require(!initalized, "Already initalized");
    owner = msg.sender;
    initalized = true;
    }
    
    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }


    function updateCode(address newCode) public onlyOwner {
        updateCodeAddress(newCode);
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "not owner");
        _;
    }
}
