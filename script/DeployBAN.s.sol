// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BaniaToken} from "../src/BaniaToken.sol";

contract DeployBAN is Script {
    uint256 immutable i_init;

    constructor(uint256 init) {
        i_init = init;
    }

    function run() external returns (BaniaToken) {
        vm.startBroadcast();
        BaniaToken ban = new BaniaToken("Bania Token", "BAN", i_init);
        vm.stopBroadcast();
        return ban;
    }
}
