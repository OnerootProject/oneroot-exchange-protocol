pragma solidity >=0.5.16;

import './modules/ERC2917Impl.sol';

contract Dgas is ERC2917Impl("DGAS Token ", "DGAS", 18, 20 * (10 ** 18)) {
	address public miner;
	constructor() public {
        miner = msg.sender;
    }

    function changeMiner(address _new) external {
		require(msg.sender == owner || msg.sender == miner, 'Dgas: FORBIDDEN');
        miner = _new;
    }

	function mintTo(address _to, uint _amount) external {
		require(msg.sender == miner, 'Dgas: FORBIDDEN');
	    balanceOf[_to] = balanceOf[_to].add(_amount);
        totalSupply = totalSupply.add(_amount);
		emit Transfer(address(0), _to, _amount);
	}
}
