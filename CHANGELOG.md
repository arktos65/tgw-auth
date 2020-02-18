# TGW OAuth2 Provider Change Log

This log documents all the changes to the TGW OAuth2 provider by version.

## v0.3 (18-Feb-2020)

- Bug fixes and updated seeder for development environment.
- Cleaned up code based on Rubocop warnings.
- Updated dependent gems to latest versions.
- As RFC6749#section-3.3, scope param need to be provided at authorization request in case server doesn't defined default_scope --> Change column attribute: scopes of oauth_access_grants (table that saving authorization_code) MUST NOT be null.
- Allow users to be mapped to specific OAuth applications.

## v0.2 (02-Apr-2019)

- User registration and authentication using Devise.
- Doorkeeper OAuth2 support.
- Accepts `password` grant type for fetching access tokens.
- Administrator login support as a separate model.
- OAuth application management.

## v0.1 (27-Mar-2019)

- Added Docker support for local development environment.
- Basic service health monitoring.
