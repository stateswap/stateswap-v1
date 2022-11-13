/* global artifacts:false, it:false, contract:false, assert:false */

const StateswapAtomicizer = artifacts.require('StateswapAtomicizer')
const StateswapVerifier = artifacts.require('StateswapVerifier')

contract('StateswapVerifier', () => {
  it('is deployed', async () => {
    return await StateswapVerifier.deployed();
  })

  it('has the correct atomicizer address', async () => {
    let [atomicizerInstance, verifierInstance] = await Promise.all([StateswapAtomicizer.deployed(), StateswapVerifier.deployed()])
    assert.equal(await verifierInstance.atomicizer(), atomicizerInstance.address, 'incorrect atomicizer address')
  })
})
