pragma solidity ^0.5.0;

contract Notary {
    string ipfsHash;

    // Grabs the name of the resources based on address
    mapping (address => string) ipfsInbox;

    // Events
    event ipfsSent(string _ipfsHash, address _address);
    event inboxResponse(string response);
    event returnipfsHash(string ipfsEth);

    // Modifiers
    modifier notFull (string memory _string) {bytes memory stringTest = bytes(_string); require (stringTest.length == 0); _;}

    constructor() public {

    }

    // Send IPFS hash for storage on Ethereum blockchain.
    function setHash(string memory x) public {
      ipfsHash = x;
    }

    // Get the IPFS hash from Ethereum blockchain
    function getHash(string memory ipfsEth) public returns (string memory x) {
      emit returnipfsHash(ipfsEth);
      return ipfsHash;
    }

    function sendIPFS(address _address, string memory _ipfsHash)
        notFull(ipfsInbox[_address])
        public
    {
       ipfsInbox[_address] = _ipfsHash;
       emit ipfsSent(_ipfsHash, _address);
    }

    function checkInbox()
        public
    {
        string memory ipfs_hash = ipfsInbox[msg.sender];
        if(bytes(ipfs_hash).length == 0) {
            emit inboxResponse("Empty Inbox");
        } else {
            ipfsInbox[msg.sender] = "";
            emit inboxResponse(ipfs_hash);
        }
    }
}
