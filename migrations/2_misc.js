/* global artifacts:false */

const StateswapAtomicizer = artifacts.require('./StateswapAtomicizer.sol')
const StateswapVerifier = artifacts.require('./StateswapVerifier.sol')
const VerifierMarket = artifacts.require('./VerifierMarket.sol')
const TestERC20 = artifacts.require('./TestERC20.sol')
const TestERC721 = artifacts.require('./TestERC721.sol')
const TestERC1271 = artifacts.require('./TestERC1271.sol')
const TestSmartContractWallet = artifacts.require('./TestSmartContractWallet.sol')
const TestAuthenticatedProxy = artifacts.require('./TestAuthenticatedProxy.sol')

const { setConfig } = require('./config.js')

module.exports = async (deployer, network) => {
  await deployer.deploy(StateswapAtomicizer)
  await deployer.deploy(StateswapVerifier, StateswapAtomicizer.address)
  await deployer.deploy(VerifierMarket)

  if (network !== 'development') {
    setConfig('deployed.' + network + '.StateswapAtomicizer', StateswapAtomicizer.address)
    setConfig('deployed.' + network + '.StateswapVerifier', StateswapVerifier.address)
    setConfig('deployed.' + network + '.VerifierMarket', VerifierMarket.address)
  }

  if (network !== 'coverage' && network !== 'development')
    return

  await deployer.deploy(TestERC20)
  await deployer.deploy(TestERC721)
  await deployer.deploy(TestAuthenticatedProxy)
  await deployer.deploy(TestERC1271)
  await deployer.deploy(TestSmartContractWallet)

  if (network !== 'development') {
    setConfig('deployed.' + network + '.TestERC20', TestERC20.address)
    setConfig('deployed.' + network + '.TestERC721', TestERC721.address)
    setConfig('deployed.' + network + '.TestAuthenticatedProxy', TestAuthenticatedProxy.address)
    setConfig('deployed.' + network + '.TestERC1271', TestERC1271.address)
    setConfig('deployed.' + network + '.TestSmartContractWallet', TestSmartContractWallet.address)
  }
}

