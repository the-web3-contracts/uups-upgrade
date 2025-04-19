// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "forge-std/Script.sol";
import "../src/UUPSContractV1.sol";


contract UUPSContractV1Script is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address deployerAddress = vm.addr(deployerPrivateKey);
        console.log("Deploying contracts with the account:", deployerAddress);

        vm.startBroadcast(deployerPrivateKey);

        UUPSContractV1 implementation = new UUPSContractV1();

        console.log("UUPSContractV1 address:", address(implementation));

        bytes memory data = abi.encodeCall(implementation.initialize, deployerAddress);

        ERC1967Proxy proxy = new ERC1967Proxy(address(implementation), data);

        vm.stopBroadcast();

        console.log("UUPS Proxy Address:", address(proxy));
    }
}
