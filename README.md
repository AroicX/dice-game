# 🚩 Challenge 3: 🎲 Dice Game

![readme-3](https://github.com/scaffold-eth/se-2-challenges/assets/55535804/45050937-3873-444f-831e-a7cbfd3c2897)

> 🎰 Randomness is tricky on a public deterministic blockchain. The block hash is an easy to use, but very weak form of randomness. This challenge will give you an example of a contract using block hash to create random numbers. This randomness is exploitable. Other, stronger forms of randomness include commit/reveal schemes, oracles, or VRF from Chainlink.

> 👍 One day soon, randomness will be built into the Ethereum protocol!

> 💬 Dice Game is a contract that allows users to roll the dice to try and win the prize. If players roll either a 0, 1, 2, 3, 4 or 5 they will win the current prize amount. The initial prize is 10% of the contract's balance, which starts out at .05 Eth.

> 🧤 Every time a player rolls the dice, they are required to send .002 Eth. 40 percent of this value is added to the current prize amount while the other 60 percent stays in the contract to fund future prizes. Once a prize is won, the new prize amount is set to 10% of the total balance of the DiceGame contract.


[Challenge Link](https://speedrunethereum.com/challenge/dice-game)
[Live URL](https://dice-game-chi-olive.vercel.app/)
[Contract Address](https://sepolia.etherscan.io/address/0xdf22dC8Caf7132C2b0A56b95FE3Ffd0A39b30257)