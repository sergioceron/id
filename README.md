LACChain ID is the techno-legal framework that the LACChain Alliance will provide to the LACChain community. This framework will define the different areas that make up the digital identity of a person, an entity or an object, and will propose open source standards, legal considerations and best practices. 

This repository contains the developer documentation for LACChain ID. Here, you will find all the resources you need to use LACChain ID on your app or website. That is a set of protocols made available to enable people and organizations to convey trust between one another on the internet thorugh self-sovereign identity. This means that nobody may control, block, censure, delete or spoof users' identity, restrict what users may do with their identity, or access information that users do not wish to share.

LACChain ID achieves that by using a decentralised trust repository (a blockchain) for identities, for credential proofs, consent, etc. The blockchain itself only stores proofs of data integrity through cryptography. Any personal information is kept off-chain, so LACChain ID may be used on any private or public Ethereum network.

# Protocol stack

## Identifiers

A DID is “a new type of identifier that enables verifiable and decentralized digital identity. A DID identifies any subject (e.g., a person, organization, thing, data model, abstract entity, etc.) that the controller of the DID decides it identifies”. A DID is a URI that associates a DID subject with a DID document allowing trustable interactions associated with that subject, as it contains information about the authentication methods to prove ownership of that DID, endpoints, and other attributes.

LACChain uses his own DID method for identifiers, and defines a [LACChain DID method](https://github.com/lacchain/did-method), which is a fully on-chain DID method based on the ERC-1056 standard. The “lac” DID method allows to maintain a fully on-chain management of DIDs, using smart contracts to store the DIDs and the information associated to them

## Verifiable Credentials

A verifiable credential is a digital file that contains one or more key-value claims (e.g., birth date, name, qualifications, gender, citizenships, etc.) about an entity (the subject), issued by another entity (the issuer), and is verifiable by any entity (the verifier). 

We are building and maintaining a public library of VCs that is aimed to incorporate VCs designed for and used in real use cases across Latin America and the Caribbean in areas such as education, health, energy, public administration services, and land registry, among others. This library is in the domain https://www.lacchain.net/credentials/library/{type}/{hash}/{version} and the VCs are also stored in the LACChain Github  and in the LACChain IPFS nodes.
Verifiable Presentations also need to be verifiable because the recipient must be able to assume that a legitimate credential holder is consenting to share that presentation with them. The mechanism is exactly the same as for Verifiable Credentials, i.e. a "proof" attribute in the VerifiablePresentation object.

### Verification Process
The LACChain ID Stack comes with the LACChain Verification Process  that  is  presented  in  this  section,  which allows any verifier entity to accomplish diligent electronic verifications of digital credentials presented to them by holders.

The process of verification consists in six steps:

1. Verification of the digital wallet as an electronic service used by the subject
2. Verification of the validity of the credential
3. Verification of the status of the credential
4. Verification of the issuer
5. Verification of the presenter
6. Verification of the claims
   
At LACChain we have proposed that the entire verification process described above be carried out in an on-chain way, that is, using smart contracts based on [EIP-712](https://eips.ethereum.org/EIPS/eip-712) and [EIP-1812](https://eips.ethereum.org/EIPS/eip-1812) for credential signatures and on-chain claims verification respectively.
One of the proofs of concept has been developed for the issuance of [LACChain Academy academic credentials](https://github.com/lacchain/academy-vc).

### Exchange Protocol
Currently there are not many solutions for the exchange of credentials, some proposals consist of exchange protocols over the internet (see [DIDComm](https://identity.foundation/didcomm-messaging/spec/)). At LACChain we have developed an ad-hoc solution for the exchange of Verifiable Credentials, exposing a REST API as an SMTP mail service.

The [LACChain Mailbox](https://github.com/lacchain/id-mailbox) is a secure and private system for the exchange of messages, VCs, and VPs. It is a controlled by a centralized service that allows entities identified using DIDs to send and receive messages that are stored encrypted in a secure database.

## Authentication Protocols

In order to access a digital service, the holder presents a credential from their digital wallet to the service provider. In LACChain we use an authentication method based on OpenID Connect proposed by KayTrust called [DIDConnect](https://developer.kaytrust.id/Specs/DIDConnect/). This mechanism makes use of Decentralized Identifiers (DIDs) to perform the authentication. DID Connect introduces the usage of DID and Verifiable Credentials (VCs), which is a decentralized mechanism that allows the client to verify the identity of the user.
The proposed authentication flows, together with the diageamas, are described in the [LACChain Development Portal](https://dev.lacchain.net/en/working-groups/ssi/authentication).
