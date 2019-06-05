pragma solidity ^0.4.24;

contract AttestationRegistry {
  event Attested(address indexed attester, bytes32 indexed hash);

  // attester => hash => timestamp
  mapping (address => mapping (bytes32 => uint)) public attestations;

  function attest(bytes32 hash) public {
    emit Attested(msg.sender, hash);
    attestations[msg.sender][hash] = now;
  }
}