// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading

import "hardhat/console.sol";
import "./ExampleExternalContract.sol";

contract Staker {
    ExampleExternalContract public exampleExternalContract;

    constructor(address exampleExternalContractAddress) {
        exampleExternalContract = ExampleExternalContract(
            exampleExternalContractAddress
        );
    }

    // Collect funds in a payable `stake()` function and track individual `balances` with a mapping:
    // (Make sure to add a `Stake(address,uint256)` event and emit it for the frontend `All Stakings` tab to display)

    // After some `deadline` allow anyone to call an `execute()` function
    // If the deadline has passed and the threshold is met, it should call `exampleExternalContract.complete{value: address(this).balance}()`

    // If the `threshold` was not met, allow everyone to call a `withdraw()` function to withdraw their balance

    // Add a `timeLeft()` view function that returns the time left before the deadline for the frontend

    // Add the `receive()` special function that receives eth and calls stake()

    mapping ( address => uint256 ) public balances;
    uint256 public constant threshold = 1 ether;

    uint256 public deadline = block.timestamp + 60 seconds;
    bool public openForWithdraw = false;

    event Stake(address indexed sender, uint256 amount);

    function stake() public payable {
        require(block.timestamp < deadline, "Deadline has passed");

        // Cập nhật số dư của người gửi
        balances[msg.sender] += msg.value;
        // Bắn sự kiện để giao diện cập nhật
        emit Stake(msg.sender, msg.value);
    }

    function execute() public {
        require(block.timestamp >= deadline, "Deadline has not passed yet");
        require(!openForWithdraw, "Already executed");

        if (address(this).balance >= threshold) {
            // Đủ tiềntiền --> Chuyển toàn bộ tiền sang ExampleExternalContract
            exampleExternalContract.complete{value: address(this).balance}();
        } else {
            // Không đủ tiền --> Bật cờ cho phép mọi người rút tiền về
            openForWithdraw = true;
        }
    }

    function withdraw() public {
        require(openForWithdraw, "Not open for withdraw");
        uint256 amount = balances[msg.sender];
        require(amount > 0, "You have no balance to withdraw");

        balances[msg.sender] = 0;

        // Chuyển tiền trả lại ví người dùng
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    function timeLeft() public view returns (uint256) {
        if (block.timestamp >= deadline) {
            return 0;
        } 
        return deadline - block.timestamp;
    }

    receive() external payable {
        stake();
    }
}
