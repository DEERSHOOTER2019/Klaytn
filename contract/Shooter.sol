pragma solidity ^0.5.6;
import "./Ownable.sol";
import "./SafeMath.sol";

contract Shooter is Ownable{
    // 1 KLAY
    uint256 public arrowPrice = 1000000000000000000;
    uint256 public batchArrowCount = 12;
    using SafeMath for uint256;
    event BuyArrow(address indexed user, uint256 arrowCount);

    constructor(uint256 _arrowPrice, uint256 _batchArrowCount) public{
        arrowPrice = _arrowPrice;
        batchArrowCount = _batchArrowCount;
    }
    // Set arrow price
    function setArrowPrice(uint256 _arrowPrice) external onlyOwner  {
        arrowPrice = _arrowPrice;
    }
    // Set batch arrow count
    function setBatchArrowCount(uint256 _batchArrowCount) external onlyOwner {
        batchArrowCount = _batchArrowCount;
    }

    function withdraw() external onlyOwner {
        address payable  _owner = owner();
        _owner.transfer(address(this).balance);
    }

    function buyArrow(uint256 _batchCount) external payable {
        uint256 targetArrowCount = _batchCount.mul(batchArrowCount);
        require(msg.value >= targetArrowCount.mul(arrowPrice), "Invalid message");
        emit BuyArrow(msg.sender, targetArrowCount);
    }
}