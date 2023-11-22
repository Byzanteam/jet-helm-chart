{/*
Build secret keys
*/}
{{- define "jet-helm-chart.secretKeys" -}}
{{- $keys := list }}
{{- $keys = append $keys "credential-secret" }}
{{- $keys = append $keys "jet-jwt-private-key" }}
{{- $keys = append $keys "secret-key-base" }}
{{- $keys = append $keys "trace-aware-database-url" }}
{{- $keys = append $keys "project-man-database-url" }}
{{- $keys = append $keys "dynamic-database-url" }}
{{- range $key := $keys }}
- name: {{ $key | quote | replace "-" "_" | upper }}
  valueFrom:
    secretKeyRef:
      name: {{ $.Values.existingSecret.name }}
      key: {{ $key | quote }}
{{- end }}
{{- end }}

