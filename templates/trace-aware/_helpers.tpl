{{/*
Return the trace aware image name
*/}}
{{- define "jet-helm-chart.traceAwareImage" }}
{{- $registryName := .Values.registry -}}
{{- $repositoryName := .Values.traceAware.image.repository -}}
{{- $tag := .Values.traceAware.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

{{/*
traceAware labels
*/}}
{{- define "jet-helm-chart.traceAwareLabels" -}}
helm.sh/chart: {{ include "jet-helm-chart.chart" . }}
{{ include "jet-helm-chart.traceAwareSelectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for traceAware
*/}}
{{- define "jet-helm-chart.traceAwareSelectorLabels" -}}
{{ include "jet-helm-chart.selectorLabels" . }}
app.kubernetes.io/application: trace-aware
{{- end }}
