# Marge-bot Helm Chart

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/marge-bot-helm)](https://artifacthub.io/packages/search?repo=marge-bot-helm)

Marge-bot is a merge-bot for GitLab. This repository contains the Helm chart for deploying Marge-bot on Kubernetes.

With this chart, you can configure marge-bot command line arguments and/or a config file.
See the [values.yaml](charts/marge-bot/values.yaml) for examples.

Marge-bot version listed in the [Chart.yaml](charts/marge-bot/Chart.yaml)

----

> This chart is a fork of [wiremind-helm-charts/marge-bot](https://github.com/wiremind/wiremind-helm-charts/tree/main/charts/marge-bot)
using [hiboxsystems/marge-bot](https://github.com/hiboxsystems/marge-bot)

## Features

- **External Secrets**: Integration with `external-secrets` operator for secure credential management (e.g., Vault).
- **extraEnv**: Support for custom environment variables from Secrets or ConfigMaps.
- **Probes**: Configurable Liveness and Readiness probes.
- **Priority Class**: Support for `priorityClassName`.

## Configuration

```yaml
# custom-values.yaml

# optional config file
config: |-
  branch-regexp: .*
  batch: false
  impersonate-approvers: true
  project-regexp: .*

  # allowing any of these makes MRs with "squash commits" unmergeable by marge-bot
  add-part-of: false
  add-reviewers: false
  add-tested: false

secret:
  gitlabUrl: "https://gitlab.example.org"
  sshKey: "..." # base64 encoded private key
  authToken: "..."
```

### External Secrets Example (Vault)

```yaml
secret:
  externalSecret:
    enabled: true
    secretStoreRef:
      name: vault-backend
      kind: ClusterSecretStore
    data:
      - secretKey: gitlab-url
        remoteRef:
          key: marge-bot
          property: gitlab-url
```

## Installing the Marge-bot Helm Chart

```bash
# Add the repository (if published) or install from local
$ helm install <RELEASE_NAME> ./charts/marge-bot -f custom-values.yaml
```
