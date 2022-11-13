/* global artifacts:false, it:false, contract:false, assert:false */

const StateswapAtomicizer = artifacts.require('StateswapAtomicizer')

contract('StateswapAtomicizer', () => {
  it('should be deployed', async () => {
    return await StateswapAtomicizer.deployed()
  })
})
