module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "5777"  // or use "*" to access available
    }
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
}
