// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import {Script} from "forge-std/Script.sol";
import {RevenueDistribution} from "../src/RevenueDistribution.sol";

contract DeployRevenueDistribution is Script {
    // Stakeholders and Community Members
    address payable[] communityAddresses;
    address payable[] stakeHoldersAddresses;
    address payable operatingCostAddress =
        payable(address(0x70997970C51812dc3A010C7d01b50e0d17dc79C8));

    function run() external {
        stakeHoldersAddresses.push(payable(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266));
        
        communityAddresses.push(payable(0x3C44CdDdB6a900fa2b585dd299e03d12FA4293BC));
        communityAddresses.push(payable(0x90F79bf6EB2c4f870365E785982E1f101E93b906));
        communityAddresses.push(payable(0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65));

        vm.startBroadcast();

        RevenueDistribution revenue = new RevenueDistribution(
            communityAddresses,
            stakeHoldersAddresses,
            operatingCostAddress
        );

        vm.stopBroadcast();
    }
}
