const market = artifacts.require("hashmarket.sol");

module.exports = function(deployer) {
  deployer.deploy(market);
};
