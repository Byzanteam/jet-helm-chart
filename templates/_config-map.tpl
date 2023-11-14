{{/*
Build the breeze grpc address
*/}}
{{- define "jet-helm-chart.breezeAddress" -}}
{{- (printf "%s-breeze:%s" (include "jet-helm-chart.fullname" .) (.Values.breeze.service.port | toString)) -}}
{{- end }}

{{/*
Build the jet api endpoint
*/}}
{{- define "jet-helm-chart.jetApiEndpoint" -}}
{{- (printf "http://%s-project-man/api/plugin" (include "jet-helm-chart.fullname" .))}}
{{- end }}
