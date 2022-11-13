module.exports = {
  port: 8545,
  copyPackages: ['openzeppelin-solidity'],
  skipFiles: [
    'verifiers/',
    'lib/ArrayUtils.sol',
    'TestERC20.sol',
    'TestERC721.sol',
    'TestAuthenticatedProxy.sol',
    'StateswapAtomicizer.sol'
  ],
  compileCommand: '../node_modules/.bin/truffle compile',
  testCommand: '../node_modules/.bin/truffle test --network coverage'
}
