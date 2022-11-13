/*

  << Stateswap Proxy Registry >>

*/

pragma solidity 0.7.5;

import "./registry/ProxyRegistry.sol";
import "./registry/AuthenticatedProxy.sol";

/**
 * @title StateswapRegistry
 * @author Stateswap Protocol Developers
 */
contract StateswapRegistry is ProxyRegistry {

    string public constant name = "Stateswap Protocol Proxy Registry";

    /* Whether the initial auth address has been set. */
    bool public initialAddressSet = false;

    constructor ()
        public
    {   
        AuthenticatedProxy impl = new AuthenticatedProxy();
        impl.initialize(address(this), this);
        impl.setRevoke(true);
        delegateProxyImplementation = address(impl);
    }   

    /** 
     * Grant authentication to the initial Exchange protocol contract
     *
     * @dev No delay, can only be called once - after that the standard registry process with a delay must be used
     * @param authAddress Address of the contract to grant authentication
     */
    function grantInitialAuthentication (address authAddress)
        onlyOwner
        public
    {   
        require(!initialAddressSet, "Stateswap Protocol Proxy Registry initial address already set");
        initialAddressSet = true;
        contracts[authAddress] = true;
    }   

}
