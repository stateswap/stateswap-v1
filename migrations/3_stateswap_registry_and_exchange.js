/* global artifacts:false */

const StateswapRegistry = artifacts.require('./StateswapRegistry.sol')
const StateswapExchange = artifacts.require('./StateswapExchange.sol')
const { setConfig } = require('./config.js')

const chainIds = {
  development: 50,
  coverage: 50,
  goerli: 5,
  mumbai: 80001,
  main: 1
}

const personalSignPrefixes = {
  default: "\x19Ethereum Signed Message:\n",
  klaytn: "\x19Klaytn Signed Message:\n",
  baobab: "\x19Klaytn Signed Message:\n"
}

module.exports = async (deployer, network) => {
  const personalSignPrefix = personalSignPrefixes[network] || personalSignPrefixes['default']
  await deployer.deploy(StateswapRegistry)
  await deployer.deploy(StateswapExchange, chainIds[network], [StateswapRegistry.address], Buffer.from(personalSignPrefix, 'binary'))
  if (network !== 'development') {
    setConfig('deployed.' + network + '.StateswapRegistry', StateswapRegistry.address)
    setConfig('deployed.' + network + '.StateswapExchange', StateswapExchange.address)
  }
  const registry = await StateswapRegistry.deployed()
  await registry.grantInitialAuthentication(StateswapExchange.address)
}
