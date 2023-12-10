/*

  << Exchange >>

*/

pragma solidity 0.7.5;

import "./ExchangeCore.sol";

/**
 * @title Exchange
 * @author Stateswap Protocol Developers
 */
contract Exchange is ExchangeCore {

    /* external ABI-encodable method wrappers. */

    function hashOrder_(address registry, address maker, address verifierTarget, bytes4 verifierSelector, bytes calldata verifierExtradata, uint maximumFill, uint listingTime, uint expirationTime, uint salt)
        external
        pure
        returns (bytes32 hash)
    {
        return hashOrder(Order(registry, maker, verifierTarget, verifierSelector, verifierExtradata, maximumFill, listingTime, expirationTime, salt));
    }

    function hashToSign_(bytes32 orderHash)
        external
        view
        returns (bytes32 hash)
    {
        return hashToSign(orderHash);
    }

    function validateOrderParameters_(address registry, address maker, address verifierTarget, bytes4 verifierSelector, bytes calldata verifierExtradata, uint maximumFill, uint listingTime, uint expirationTime, uint salt)
        external
        view
        returns (bool)
    {
        Order memory order = Order(registry, maker, verifierTarget, verifierSelector, verifierExtradata, maximumFill, listingTime, expirationTime, salt);
        return validateOrderParameters(order, hashOrder(order));
    }

    function validateOrderAuthorization_(bytes32 hash, address maker, bytes calldata signature)
        external
        view
        returns (bool)
    {
        return validateOrderAuthorization(hash, maker, signature);
    }

    function approveOrderHash_(bytes32 hash)
        external
    {
        return approveOrderHash(hash);
    }

    function approveOrder_(address registry, address maker, address verifierTarget, bytes4 verifierSelector, bytes calldata verifierExtradata, uint maximumFill, uint listingTime, uint expirationTime, uint salt, bool orderbookInclusionDesired)
        external
    {
        return approveOrder(Order(registry, maker, verifierTarget, verifierSelector, verifierExtradata, maximumFill, listingTime, expirationTime, salt), orderbookInclusionDesired);
    }

    function setOrderFill_(bytes32 hash, uint fill)
        external
    {
        return setOrderFill(hash, fill);
    }

    function stateswap_(uint[16] memory uints, bytes4[2] memory verifierSelectors,
        bytes memory firstExtradata, bytes memory firstEffectfulCalldata, bytes memory secondExtradata, bytes memory secondEffectfulCalldata,
        uint8[2] memory howToCalls, bytes32 metadata, bytes memory signatures)
        public
        payable
    {
        return stateswap(
            Order(address(uints[0]), address(uints[1]), address(uints[2]), verifierSelectors[0], firstExtradata, uints[3], uints[4], uints[5], uints[6]),
            EffectfulCall(address(uints[7]), AuthenticatedProxy.HowToCall(howToCalls[0]), firstEffectfulCalldata),
            Order(address(uints[8]), address(uints[9]), address(uints[10]), verifierSelectors[1], secondExtradata, uints[11], uints[12], uints[13], uints[14]),
            EffectfulCall(address(uints[15]), AuthenticatedProxy.HowToCall(howToCalls[1]), secondEffectfulCalldata),
            signatures,
            metadata
        );
    }

}
