# TGW OAuth2 Provider Change Log

This log documents all the changes to the TGW OAuth2 provider by version.

## v0.3.1 (04-Nov-2020)

- Updated Ruby language support from 2.5.4 to 2.6.6.
- Pinned Bundler version to 1.17.3 in Docker configuration files.

## v0.3 (20-Feb-2020)

### Features
<ul>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-7'>AUTH-7</a>] -         As a developer, I want to have a CI pipeline to automatically test auth client code when committing to Github
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-8'>AUTH-8</a>] -         As a developer, I want to automatically build a Docker image when merging a pull request to the master branch on Github
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-9'>AUTH-9</a>] -         As a developer, I want to be able to add environment variables to my development and test builds of the service
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-10'>AUTH-10</a>] -         As an administrator, I want to see a menu with options to manage the OAuth provider
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-11'>AUTH-11</a>] -         As a developer, I want to be able to assign owners of applications so developers can register their own applications
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-14'>AUTH-14</a>] -         As a developer, I want to be able to build and release STAGE and RELEASE Docker images of the OAuth service
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-15'>AUTH-15</a>] -         As a developer, I want virtual machines set up to host my stage Kubernetes environment
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-16'>AUTH-16</a>] -         As a developer, I want a Helm chart to deploy the TGW Auth service to my Kubernetes cluster
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-17'>AUTH-17</a>] -         As a developer, I would like to have a Kubernetes cluster for staging applications
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-18'>AUTH-18</a>] -         As a developer, I want to be able to monitor my local Kubernetes cluster
</li>
</ul>

### Bugs Fixed

<ul>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-12'>AUTH-12</a>] -         NameError in Oauth::ApplicationsController#index
</li>
<li>[<a href='https://tgwconsulting.atlassian.net/browse/AUTH-13'>AUTH-13</a>] -         NoMethodError in Oauth::ApplicationsController#edit
</li>
</ul>

## v0.2 (02-Apr-2019)

- User registration and authentication using Devise.
- Doorkeeper OAuth2 support.
- Accepts `password` grant type for fetching access tokens.
- Administrator login support as a separate model.
- OAuth application management.

## v0.1 (27-Mar-2019)

- Added Docker support for local development environment.
- Basic service health monitoring.
