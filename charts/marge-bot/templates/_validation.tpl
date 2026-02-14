{{/*
Validate that extraVolumes are defined if custom keys or certs are provided.
*/}}
{{- define "marge.validate" -}}
{{- if not .Values.extraVolumes -}}
  {{- if .Values.margeSshKeyFile -}}
    {{- fail "Validation Failed: margeSshKeyFile is defined but extraVolumes is empty. You must define extraVolumes to mount the SSH key." -}}
  {{- end -}}
  {{- if .Values.margeAuthTokenFile -}}
    {{- fail "Validation Failed: margeAuthTokenFile is defined but extraVolumes is empty. You must define extraVolumes to mount the auth token." -}}
  {{- end -}}
  {{- if .Values.customCaCert -}}
    {{- fail "Validation Failed: customCaCert is defined but extraVolumes is empty. You must define extraVolumes to mount the custom CA certificate." -}}
  {{- end -}}
  {{- if .Values.existingCustomCaCert -}}
    {{- fail "Validation Failed: existingCustomCaCert is defined but extraVolumes is empty. You must define extraVolumes to mount the existing custom CA certificate." -}}
  {{- end -}}
{{- end -}}
{{- if and .Values.customCaCert .Values.existingCustomCaCert -}}
  {{- fail "Validation Failed: You cannot define both customCaCert and existingCustomCaCert. Please choose one." -}}
{{- end -}}
{{- end -}}
