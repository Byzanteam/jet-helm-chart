{{/*
Return the jet image name
*/}}
{{- define "jet-helm-chart.projectMan-image" }}
{{- $registryName := .Values.registry -}}
{{- $repositoryName := .Values.projectMan.image.repository -}}
{{- $tag := .Values.projectMan.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

{{/*
project man labels
*/}}
{{- define "jet-helm-chart.projectMan-labels" -}}
helm.sh/chart: {{ include "jet-helm-chart.chart" . }}
{{ include "jet-helm-chart.projectMan-selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for project man
*/}}
{{- define "jet-helm-chart.projectMan-selectorLabels" -}}
{{ include "jet-helm-chart.selectorLabels" . }}
app.kubernetes.io/application: projectMan
{{- end }}
