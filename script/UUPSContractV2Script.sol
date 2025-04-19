// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import { Upgrades } from "@openzeppelin-foundry-upgrades/Upgrades.sol";

import "../src/UUPSContractV2.sol";


contract UUPSContractV2Script is Script {
    address public proxy = 0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);

        console.log("Deploying Address:", deployerAddress);

        vm.startBroadcast(deployerPrivateKey);

        Upgrades.upgradeProxy(address(proxy), "UUPSContractV2.sol:UUPSContractV2", "", deployerAddress);

        (bool successful,) = address(proxy).call(abi.encodeWithSelector(UUPSContractV2.incrementValue.selector));

        console.log("incrementValue success:", successful);

        vm.stopBroadcast();
    }
}
