# Marge Bot Helm Chart Changes

## Overview
Added External Secrets support and extraEnv configuration to the Marge Bot Helm chart.

## Changes Made

### [values.yaml](file:///Users/zsozso/Documents/homelab/marge-bot/values.yaml)

1. **ExternalSecret Configuration** (disabled by default)
   - Added `secret.externalSecret.enabled: false`
   - Commented example for Vault backend (`vault-backend` ClusterSecretStore)
   - Data mapping for `gitlab-url`, `ssh-key`, `auth-token`

2. **extraEnv Support**
   - New `extraEnv: []` option for custom environment variables
   - Enables defining env vars from secrets/configmaps

---

### [deployment.yaml](file:///Users/zsozso/Documents/homelab/marge-bot/templates/deployment.yaml)

- Added `extraEnv` rendering in container spec after built-in env vars

---

## Usage Examples

### Enable ExternalSecret
```yaml
secret:
  externalSecret:
    enabled: true
    refreshInterval: "1h"
    secretStoreRef:
      name: vault-backend
      kind: ClusterSecretStore
    data:
      - secretKey: gitlab-url
        remoteRef:
          key: marge-bot
          property: gitlab-url
```

### Add custom env var from secret
```yaml
extraEnv:
  - name: MARGE_SSH_KEY
    valueFrom:
      secretKeyRef:
        name: marge-bot-secret
        key: ssh-key
```

### Set priority class and enable probes
```yaml
priorityClassName: "high-priority"

livenessProbe:
  enabled: true
  exec:
    command:
      - pidof
      - python

readinessProbe:
  enabled: true
  exec:
    command:
      - pidof
      - python
```

