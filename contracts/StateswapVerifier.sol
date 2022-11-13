/*

  << Stateswap Verifier >>

*/

pragma solidity 0.7.5;

import "./verifiers/VerifierERC20.sol";
import "./verifiers/VerifierERC721.sol";
import "./verifiers/VerifierERC1155.sol";
import "./verifiers/VerifierUtil.sol";

/**
 * @title StateswapVerifier
 * @author Stateswap Protocol Developers
 */
contract StateswapVerifier is VerifierERC20, VerifierERC721, VerifierERC1155, VerifierUtil {

    string public constant name = "Stateswap Verifier";

    constructor (address atomicizerAddress)
        public
    {
        atomicizer = atomicizerAddress;
    }

    function test () 
        public
        pure
    {
    }

}
