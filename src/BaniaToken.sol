// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "lib/openzepplin-contracts/contracts/token/ERC20/ERC20.sol";

contract BaniaToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("Bania Token", "BAN") {
        _mint(msg.sender, _initialSupply ** decimals());
    }
}
