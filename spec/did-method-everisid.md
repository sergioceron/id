did:ev method
=================
everis Digital Identity <<did@everis.com>>

## Introduction

TODO

## DID Method Name

The namestring that shall identify this DID method is: `ev`

A DID that uses this method MUST begin with the following prefix: `did:ev:`. Per the DID specification, this string MUST be in lowercase. The remainder of the DID, after the prefix, is specified below.

## Method Specific Identifier

The method specific identifier is composed of an optional Ethereum network identifier with a `:` separator, followed by a Hex-encoded Ethereum ERC725 smart contract address (without a `0x` prefix).

	everisid-did = "did:ev:" everisid-mnid
	everisid-mnid  = 40*HEXDIG

The `everis-mnid` is a string that is compliant with the [Multi-Network ID format](TODO).

### Example

Example `ev` DID:

 * `did:ev:TODO`

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