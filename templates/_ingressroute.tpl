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

{{/*
PathPrefix for access rule
*/}}
{{- define "jet-helm-chart.rulePathPrefixs" -}}
{{- $rulePathPrefixs := list -}}
{{- $pathPrefixs := list -}}
{{- $pathPrefixs = append $pathPrefixs "/api/v1" -}}
{{- $pathPrefixs = append $pathPrefixs "/api/v1/explorer" -}}
{{- $pathPrefixs = append $pathPrefixs "/api/v1/graphql.sdl" -}}
{{- $orOperator := " || " -}}
{{- $componentSubpath := default "/" .componentPrefix -}}
{{- $jetSubpath := default "/" .jetPrefix -}}
{{- range $pathPrefix := $pathPrefixs -}}
  {{- $path := (printf "/%s/%s/%s" $jetSubpath $componentSubpath $pathPrefix | clean) -}}
  {{- $rulePathPrefixs = append $rulePathPrefixs (printf "PathPrefix(`%s`)" $path) -}}
{{- end -}}
{{- printf "(%s)" (join $orOperator $rulePathPrefixs) -}}
{{- end -}}

{{/*
Middlewares for web ingress-routes
*/}}
{{- define "jet-helm-chart.webMiddlewares" -}}
{{- $webMiddlewares := list }}
{{- if .Values.ingressroute.subpath }}
{{- $webMiddlewares = append $webMiddlewares "strip-prefix" }}
{{- end }}
{{- if .Values.ingressroute.middlewares.corsSettings }}
{{- $webMiddlewares = append $webMiddlewares "cors" }}
{{- end }}
{{- $webMiddlewares = append $webMiddlewares "compress" }}
{{- if .Values.certificate }}
{{- $webMiddlewares = append $webMiddlewares "redirect-to-https" }}
{{- end }}
{{- range $middleware := $webMiddlewares }}
- name: {{ include "jet-helm-chart.fullname" $ }}-{{ $middleware }}
{{- end }}
{{- end }}

{{/*
Middlewares for websecure ingress-routes
*/}}
{{- define "jet-helm-chart.websecureMiddlewares" -}}
{{- $websecureMiddlewares := list }}
{{- if .Values.ingressroute.subpath }}
{{- $websecureMiddlewares = append $websecureMiddlewares "strip-prefix" }}
{{- end }}
{{- if .Values.ingressroute.middlewares.corsSettings }}
{{- $websecureMiddlewares = append $websecureMiddlewares "cors" }}
{{- end }}
{{- $websecureMiddlewares = append $websecureMiddlewares "compress" }}
{{- range $middleware := $websecureMiddlewares }}
- name: {{ include "jet-helm-chart.fullname" $ }}-{{ $middleware }}
{{- end }}
{{- end }}
