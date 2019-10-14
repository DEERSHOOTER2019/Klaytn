.PHONY: abi

#install  solc@0.5.6
#brew install https://raw.githubusercontent.com/ethereum/homebrew-ethereum/1ecf6c60875740133ee51f6167aef9a4f05986e7/solidity.rb
#
#brew tap caver-java
#brew install caver-java
#

abi:
	solc --bin --abi Shooter.sol -o abi/ --overwrite --optimize
	# caver-java solidity generate -b abi/Shooter.bin -a abi/Shooter.abi -o java -p com.bifanr.klaytn.service.smartcode
	# abigen --bin=abi/Shooter.bin --abi=abi/Store.abi --pkg=shooter --out=shooter/shooter.go