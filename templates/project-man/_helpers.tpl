{{/*
Return the jet image name
*/}}
{{- define "jet-helm-chart.projectManImage" }}
{{- $registryName := .Values.image.registry -}}
{{- $repositoryName := .Values.projectMan.image.repository -}}
{{- $tag := .Values.projectMan.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

{{/*
project man labels
*/}}
{{- define "jet-helm-chart.projectManLabels" -}}
helm.sh/chart: {{ include "jet-helm-chart.chart" . }}
{{ include "jet-helm-chart.projectManSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for project man
*/}}
{{- define "jet-helm-chart.projectManSelectorLabels" -}}
{{ include "jet-helm-chart.selectorLabels" . }}
app.kubernetes.io/application: project-man
{{- end }}

{/*
Build secret keys
*/}
{{- define "jet-helm-chart.secretKeys" -}}
{{- $keys := list }}
{{- $keys = append $keys "credential-secret" }}
{{- $keys = append $keys "jet-jwt-private-key" }}
{{- $keys = append $keys "secret-key-base" }}
{{- $keys = append $keys "project-man-database-url" }}
{{- $keys = append $keys "dynamic-database-url" }}
{{- range $key := $keys }}
- name: {{ $key | quote | replace "-" "_" | upper }}
  valueFrom:
    secretKeyRef:
      name: {{ $.Values.existingJetSecret.name }}
      key: {{ $key | quote }}
{{- end }}
{{- end }}

