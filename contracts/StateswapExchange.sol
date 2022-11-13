/*

  << Stateswap Exchange >>

*/

pragma solidity 0.7.5;

import "./exchange/Exchange.sol";

/**
 * @title StateswapExchange
 * @author Stateswap Protocol Developers
 */
contract StateswapExchange is Exchange {
    string public constant name = "Stateswap Exchange";

    string public constant version = "1.0";

    constructor(
        uint256 chainId,
        address[] memory registryAddrs,
        bytes memory customPersonalSignPrefix
    ) public {
        DOMAIN_SEPARATOR = hash(
            EIP712Domain({
                name: name,
                version: version,
                chainId: chainId,
                verifyingContract: address(this)
            })
        );
        for (uint256 ind = 0; ind < registryAddrs.length; ind++) {
            registries[registryAddrs[ind]] = true;
        }
        if (customPersonalSignPrefix.length > 0) {
            personalSignPrefix = customPersonalSignPrefix;
        }
    }
}
