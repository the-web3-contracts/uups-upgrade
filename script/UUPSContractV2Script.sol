// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import { Upgrades } from "@openzeppelin-foundry-upgrades/Upgrades.sol";

import "../src/UUPSContractV2.sol";


contract UUPSContractV2Script is Script {
    address public proxy = 0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e;

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
