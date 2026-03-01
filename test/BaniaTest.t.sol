// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {DeployBAN} from "../script/DeployBAN.s.sol";
import {BaniaToken} from "../src/BaniaToken.sol";

contract BANtest is Test {
    DeployBAN deployer;
    BaniaToken ban;

    uint256 constant INITIAL_SUPPLY = 10000*1e18;

    address ALICE = makeAddr("alice");
    address BOB   = makeAddr("bob");
    address owner = address(msg.sender);


    function setUp() external {
        deployer = new DeployBAN(INITIAL_SUPPLY);
        ban = deployer.run();
    }

    function testTokenName() external view {
        assertEq(ban.name(), "Bania Token");
    }

    function testTokenSymbol() external view {
        assertEq(ban.symbol(), "BAN");
    }

    function test_InitialSupplyMintedToDeployerAndTransfer() external {
        uint256 amount = 25e18;
        vm.startPrank(owner);
        ban.transfer(ALICE,50e18);
        ban.transfer(BOB,50e18);
        vm.stopPrank();
        vm.prank(ALICE);
        ban.transfer(BOB,amount);
        assertEq(ban.balanceOf(BOB),75e18);
        assertEq(ban.balanceOf(ALICE), 25e18);
    }

    
}
