pragma solidity 0.8.20; //Do not change the solidity version as it negatively impacts submission grading
// SPDX-License-Identifier: MIT

// import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Vendor is Ownable {
    // event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);

    YourToken public yourToken;

    uint256 public constant tokensPerEth = 100;

    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
    event SellTokens(address seller, uint256 amountOfTokens, uint256 amountOfETH);

    constructor(address tokenAddress) Ownable(msg.sender) {
        yourToken = YourToken(tokenAddress);
    }

    // ToDo: create a payable buyTokens() function:

    // ToDo: create a withdraw() function that lets the owner withdraw ETH

    // ToDo: create a sellTokens(uint256 _amount) function:

    function buyTokens() public payable {
        require(msg.value > 0, "Send ETH to buy some tokens");

        // Tính toán số Token khách hàng nhận được
        // amountToBuy = 1 * 10^18 * 100 = 100 Token (đơn vị wei)
        uint256 amountToBuy = msg.value * tokensPerEth;

        uint256 vendorBalance = yourToken.balanceOf(address(this));
        require(vendorBalance >= amountToBuy, "Vendor has not enough tokens");

        // Chuyển Token cho người mua
        bool sent = yourToken.transfer(msg.sender, amountToBuy);
        require(sent, "Failed to transfer token to user");

        emit BuyTokens(msg.sender, msg.value, amountToBuy);
    }

    function sellTokens(uint256 _amount) public {
        require(_amount > 0, "Specify an amount of token to sell");

        // Tính số ETH cần trả lại cho user
        uint256 amountOfETH = _amount / tokensPerEth;

        require(address(this).balance >= amountOfETH, "Vendor has not enough funds");

        // Lấy Token từ ví người dùng chuyển về ví Vendor
        bool sent = yourToken.transferFrom(msg.sender, address(this), _amount);
        require(sent, "Failed to transfer tokens from user to vendor");

        // Chuyển ETH trả lại cho người dùng
        (bool sentEth, ) = msg.sender.call{value: amountOfETH}("");
        require(sentEth, "Failed to send ETH to the user");

        emit SellTokens(msg.sender, _amount, amountOfETH);
    }

    function withdraw() public onlyOwner {
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }
}
