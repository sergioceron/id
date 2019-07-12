# Developer documentation

## Notes

This work was done by [everis](https://everis.com/) and was donated to LACChain Consortium.

## Introduction

This is the developer documentation for LACChain ID. Here, you will find all the resources you need to use LACChain ID on your app or website.

LACChain ID is a trust framework, i.e. a set of protocols that enable people and organizations to convey trust between one another.

It has the particularity of enabling self-sovereign identity. This means that nobody (no everis, not any government, etc.) may control, block, censure, delete or spoof users' identity, restrict what users may do with their identity, or access information that users didn't agree to share.

LACChain ID achieves that by using a decentralised trust repository (a blockchain) for identities, for credential proofs, consent, etc. The blockchain itself only stores proofs of data integrity. Any litteral information is kept off-chain, so LACChain ID may be used on any private or public Ethereum network.

## Protocol stack

### Identifiers
LACChain ID uses the standard DID protocol for identifiers, and defines a ["gid" DID method](spec/did-method-gid.md), complemented by [smart contracts](spec/eip-proxy-id-contracts.md).

### Credentials and proofs

Besides identifiers, the point of an identity is to have credentials associated to it. A credential answers the question *"Who are you?"* and contains one or more key-value claims (e.g. birth date, name, qualifications, citizenships, etc.) about an entity called subject, issued by another entity called issuer. The Verifiable Credentials Working Group at the W3C is defining a standard that LACChain ID follows.

A Verifiable Credential (VC) contains a proof, which is what makes the credential verifiable. The VC specification doesn't enforce a specific proof algorithm but describes the articulation between a credential and a specific proof method. Implementers are free to come up with their own proof method or to follow someone else's.

We're preparing an ERC (Ethereum Request for Comments) draft called [Content Attestation Registry](spec/eip-content-attestation-registry.md) that describes a way for any entity to attest arbitrary content on a smart contract. There is a corresponding [proof type](spec/attestation-registry-proof-type.md) that enables to use that attestation registry inside a Verifiable Credential.

Verifiable Presentations also need to be verifiable because the recipient must be able to assume that a legitimate credential holder is consenting to share that presentation with them. The mechanism is exactly the same as for Verifiable Credentials, i.e. a "proof" attribute in the VerifiablePresentation object.

### Single Sign-On

For single sign-on purposes, LACChain ID describes a way for identity owners (a.k.a. subjects) to authenticate on websites and mobile apps. We propose using OAuth 2.0, only in a self-sovereign fashion. The trick for self-sovereign OAuth 2.0 is to use as Authorization Server the identity owner's own device, as opposed to a fixed AS in traditional services. When receiving the token, the Relying Party is able to verify dynamically that the token's issuer is indeed an acceptable Authorization Server for that identity using the blockchain. See [Self-Sovereign Single Sign-on based on OAuth 2.0](SSO.md) for details.

### Proof of Existence

As a side use case, we're proposing an ERC for a generic [Proof of Existence](spec/eip-proof-of-existence.md) smart contract interface.
