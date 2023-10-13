{{/*
Return the jet image name
*/}}
{{- define "jet-helm-chart.traceAware-image" }}
{{- $registryName := .Values.registry -}}
{{- $repositoryName := .Values.traceAware.image.repository -}}
{{- $tag := .Values.traceAware.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

{{/*
traceAware labels
*/}}
{{- define "jet-helm-chart.traceAware-labels" -}}
helm.sh/chart: {{ include "jet-helm-chart.chart" . }}
{{ include "jet-helm-chart.traceAware-selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for traceAware
*/}}
{{- define "jet-helm-chart.traceAware-selectorLabels" -}}
{{ include "jet-helm-chart.selectorLabels" . }}
app.kubernetes.io/application: traceAware
{{- end }}
