# Marge-bot Helm Chart
Marge-bot is a merge-bot for GitLab

With this chart, you can configure marge-bot command line arguments and/or a config file.
See the [values.yaml](values.yaml) for examples.

Marge-bot version listed in the [Chart.yaml](Chart.yaml)

----

> This chart is a fork of [wiremind-helm-charts/mage-bot](https://github.com/wiremind/wiremind-helm-charts/tree/main/charts/marge-bot)
using [hiboxsystems/marge-bot](https://github.com/hiboxsystems/marge-bot)


## Configuration

```yaml
# custom-values.yaml

# optional config file
# The contents will be loaded using the --config-file option described here: https://github.com/hiboxsystems/marge-bot#configuring
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
  # ssh private key must already be in base64 format, use this command on
  # yours: base64 -w0 <my_private_key>
  sshKey: "..."
  authToken: "..."
```

## Installing the Marge-bot Helm Chart

```bash
$ helm install <RELEASE_NAME> netpositive/marge-bot -f custom-values.yaml
```
