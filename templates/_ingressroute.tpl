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
{{- define "jet-helm-chart.buildPath" }}
{{- $subpath := default "/" .prefix -}}
{{- printf "/%s/%s" $subpath .path | clean -}}
{{- end }}


