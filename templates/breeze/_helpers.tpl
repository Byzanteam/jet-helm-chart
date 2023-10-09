{{/*
Return the breeze image name
*/}}
{{- define "jet-helm-chart.breeze-image" }}
{{- $registryName := .Values.imageCredentials.registry -}}
{{- $repositoryName := .Values.breeze.image.repository -}}
{{- $tag := .Values.breeze.image.tag | toString -}}
{{- printf "%s/%s:%s" $registryName $repositoryName $tag -}}
{{- end }}

