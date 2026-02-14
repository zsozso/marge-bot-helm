# Changelog

## [1.3.5] - 2026-02-14

### Added
- Added support for custom CA certificates via `customCaCert` value.
- Added support for existing custom CA certificates via `existingCustomCaCert` value.
- Made `MARGE_SSH_KEY_FILE` and `MARGE_AUTH_TOKEN_FILE` paths configurable via `margeSshKeyFile` and `margeAuthTokenFile` values.
- `MARGE_SSH_KEY_FILE` and `MARGE_AUTH_TOKEN_FILE` environment variables are now conditionally set only when `extraVolumes` and `extraVolumeMounts` are defined.
- Added validation logic to prevent activation of `margeSshKeyFile`, `margeAuthTokenFile`, `customCaCert`, or `existingCustomCaCert` when `extraVolumes` are not defined.
- Defaults for `margeSshKeyFile` and `margeAuthTokenFile` are now empty to prevent accidental activation.

## [1.3.4] - 2026-02-08

### Fixed
- Fixed the correlation between externalSecret and existingSecret and sshKeys/authToken settings. The order of precedence is now: existingSecret > externalSecret > default values.
