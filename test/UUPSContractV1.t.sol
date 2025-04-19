// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {UUPSContractV1} from "../src/UUPSContractV1.sol";

contract UUPSContractV1Test is Test {
    UUPSContractV1 public uUPSContractV1;

    function setUp() public {
        uUPSContractV1 = new UUPSContractV1();
    }
}
