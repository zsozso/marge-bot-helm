# Changelog

## [1.3.4] - 2026-02-08

### Fixed
- Fixed the correlation between externalSecret and existingSecret and sshKeys/authToken settings. The order of precedence is now: existingSecret > externalSecret > default values.
