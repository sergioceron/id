# Single Sign-On

## Introduction

This page explains how you can authenticate a user against their identity. This method is based on OpenID Connect (OIDC), which is itself based on [OAuth 2.0](https://tools.ietf.org/html/rfc6749).

OAuth 2.0 defines the following actors:

| OAuth 2.0 / OIDC actor       | everisID component
| ---------------------------- | -----------------------
| Resource Owner (RO)          | User's identity (DID)
| Authorization Server (AS)    | User's controlling device
| Client or Relying Party (RP) | Your website or app
| Resource Server (RS)         | Online location where a user's presentation is available


The following points are crucial for self-sovereign identity:
- **The Authorization Server is the user's own device** instead of a third party identity service (Facebook, Twitter, Google, etc.) as is the case in a centralised identity model.
- **Any entity is a valid client** as long as it is able to prove its identity. No third-party approves or reject clients.

In OIDC, the following flow is used:
1. You, as the client, request authentication from a user by presenting them a specific URL.
1. The user signs into their Authorization Server (e.g. everisID mobile app running on a trusted device).
2. The AS generates a token based on the scope defined in the request, then redirects the user agent to the `redirect_uri` contained in the request.
3. You, as the client, receive the token and validate it. If needed, you can use it to access protected resources from the Resource Server.

## Registering your client application

Before anything, you need to register your client. This is similar to registering your application with a proprietary OAuth provider, except that you do it yourself.

To register your application, all you need to do is:
- Create a DID for your application
- Provide enough information in your application's public profile for users to trust it:
  - **Name.** Any verified credential with a `name` attribute.
  - **Callback URL.** Any self-verified credential(s) with one or several `redirect_uri` attributes. This is necessary to prevent other applications from using your client ID and stealing your users' tokens.
  - **Logo (optional).** Any verified credential with an `image` attribute.

## Requesting authentication

An authentication request is an URL of the following form: `https://everis.id/share?client_id={DID}&redirect_uri={URI}&state={STATE}`

The following parameters are mandatory:
- `client_id`: The DID of your client application.
- `redirect_uri`: The callback URI the user should call after the AS generated the token. This URI will receive the token as a query parameter.
- `state`: An opaque string defined by you. That string will be provided as-is to the callback URI, as a query parameter also named `state`, allowing you to link the response to the original request.

## Verifying the user's identity

Your service running at `redirect_uri` mentioned above will receive a query with the following query parameters:
- `access_token`: a JSON Web Token (JWT) containing proof of the user's DID
- `state`: the original `state` presented in the authentication request

The JWT contained in the `access_token` parameter is comprised of the following fields:
- `sub`: The user's DID.
- `iss`: The EC public key of the user's device. The JWT is only valid if the device is authorised for that DID and if the JWT is correctly signed by that public key.
- `aud`: The requester's DID. The JWT is only valid if that value matches the value of `client_id` in the request.
- `iat`: The date the JWT was issued at. You should check the JWT is not too old, otherwise it might be insecure.
- `exp`: The date until which the JWT is valid. You should check that the JWT is not expired, otherwise it might be insecure.
- `userinfo`: The URL of the Resource Server where the user's Verifiable Presentation is available

## Accessing the user's protected resources

To access user's information, you must query the URL referenced as `userinfo` in the JWT, and provide the token as an `Authorization` header, as described in [OpenID Connect specification](https://openid.net/specs/openid-connect-core-1_0.html#UserInfoRequest).

The result of the userinfo request is a Verifiable Presentation as defined by the Verifiable Credentials specification. The presentation contains a `proof` attribute that allows you to verify the user's consent before using the presentation's content. See the [documentation for that proof type](https://gitlab.com/everis-blockchain/id/doc/blob/master/spec/attestation-registry-proof-type.md) to learn how to verify a proof.