{{/*
Expand the name of the chart.
*/}}
{{- define "jet-helm-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "jet-helm-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jet-helm-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jet-helm-chart.labels" -}}
helm.sh/chart: {{ include "jet-helm-chart.chart" . }}
{{ include "jet-helm-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jet-helm-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jet-helm-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
docker registry auth credenttial
*/}}
{{- define "jet-helm-chart.imagePullSecret" }}
{{- with .Values.imagePullSecret.imageCredentials }}
{{- printf "{\"auths\":{\"%s\":{\"username\":\"%s\",\"password\":\"%s\",\"email\":\"%s\",\"auth\":\"%s\"}}}" $.Values.registry .username .password .email (printf "%s:%s" .username .password | b64enc) | b64enc }}
{{- end }}
{{- end }}

{{/*
Host for access rule
*/}}
{{- define "jet-helm-chart.ruleHosts" -}}
{{- $hosts := .Values.hosts }}
{{- $orOperator := " || " }}
{{- $ruleHosts := list }}
{{- range $_, $host := $hosts }}
  {{- $ruleHosts = append $ruleHosts (printf "Host(`%s`)" $host) }}
{{- end }}
{{- printf "(%s)" (join $orOperator $ruleHosts) }}
{{- end }}

{{/*
Build clean path.(//jet -> /jet)
*/}}
{{- define "jet-helm-chart.build-path" }}
{{- $subpath := default "/" .prefix -}}
{{- printf "/%s/%s" $subpath .path | clean -}}
{{- end }}

