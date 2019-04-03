# everisID DID Method

## Abstract

This document describes the DID method used by the digital identity solution developped by everis, <strong>everisID</strong>.

This specification conforms to the requirements specified in the <a href="https://w3c-ccg.github.io/did-spec/">DID draft specification</a> currently published by the W3C Credentials Community Group.

## Status of this Document
This specification is an unofficial draft. It is provided as a reference for people and organisations who wish to implement software meant to interact with everisID existing components, or who wish to follow the same guidelines for their own software even if no interaction with everisID components is planned at first.

## Introduction

everisID seeks to facilitate internet-wide, self-sovereign identity. On that basis, identifiers must be both assigned and resolved in a decentralised way.

In everisID, each identity is represented by an Ethereum smart contract called "Proxy contract", deployed on any Ethereum network. Through a forwarding mechanism, that contract represents the identity owner in all transactions on that network. Specificities about how the Proxy contract works are outside the scope of this document.

## DIDs

### DID format

The DID specification defines the following format for DIDs:

```
did:<scheme>:<scheme-specific-identifier>
```

### DID Method Name

The scheme that shall identify this DID method is: `ev`.

### Method-Specific Identifier


The method-specific identifier is composed of an optional Ethereum network identifier with a `:` separator, followed by an MNID.

  everisid-did = "did:ev:" mnid
  everisid-mnid  = 40*HEXDIG

The `mnid` is a string that is compliant with the [Multi-Network ID format](TODO). It refers to the Multi-Network identifier of the identity's Proxy contract. An MNID is an encoding of an (address, networkID) pair, so it's possible to compute a DID from an address and networkID pair, and vice versa. Assuming networkIDs are unique and well known, a DID thus allows to discover the specific Proxy contract behind a given DID, and reciprocally.

### Example

Example `ev` DID:

 * `did:ev:2uzPtwJmXbBqMmP9DkR7dE3FcLmgYejdJ42`

## DID Document

### Example

TODO

## CRUD Operation Definitions

### Create (Register)

In order to create an `ev` DID, a smart contract compliant with everis specification must be deployed on Ethereum. The DID is formed after the network identifier + the contract address combined as an MNID.

### Read (Resolve)

To construct a valid DID document from an `ev` DID, the following steps are performed:

1. Determine the Ethereum network identifier and address from the MNID.
2. TODO: To be determined.

### Update

TODO. The DID Document may be updated by one authorised owner transacting with the contract.

### Delete (Revoke) 

Revoking the DID can be supported by executing a `selfdestruct()` operation that is part of the smart contract. This will remove the smart contract's storage and code
from the Ethereum state, effectively marking the DID as revoked.

TODO: Implement.

## Security Considerations

TODO

## Privacy Considerations

TODO

## Performance Considerations

In Ethereum, looking up a raw public key from a native 20-byte address is a complex and resource-intensive process. The DID community may want to consider
allowing hashed public keys in the DID documents instead of (or in addition to) the raw public keys. It seems this would make certain DID methods such as
`ev` much simpler to implement, while at the same time not really limiting the spirit and potential use cases of DIDs.
