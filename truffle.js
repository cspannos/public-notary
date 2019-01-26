
// Local networks
module.exports = {
    networks: {
      development: {
        host: "127.0.01",
        port: "8545",
        network_id: "*"
      }
    }
};


// var mnemonic = "snake obey clarify benefit gather powder tank feel twenty faint fan sample";

// Ropsten test network
// module.exports = {
//  networks: {
//    ropsten: {
//      provider: function() {
//        return new HDWalletProvider(mnemonic, "https://ropsten.infura.io/v3/4ae967b635bd409297de4b0fe9656ed2")
//      },
//      network_id: 3
//    }
//  }
// };
