{{- define "containerPort" }}
{{- default .Values.port .Values.containerPort }}
{{- end }}

{{- define "probe" }}
{{- if .cfg }}
{{ .type }}Probe:
  {{- if .cfg.command }}
  exec:
    command:
    {{- range .cfg.command }}
    - {{.}}
    {{- end }}
  {{- else }}
  {{- if .cfg.isTcp }}
  tcpSocket:
  {{- else if .cfg.httpGet }}
  httpGet:
    path: {{ .cfg.httpGet.path }}
  {{- end }}
    port: {{ include "containerPort" .ctx }}
  {{- end }}
  {{- if .cfg.initialDelaySeconds }}
  initialDelaySeconds: {{ .cfg.initialDelaySeconds }}
  {{- end }}
  {{- if .cfg.timeoutSeconds }}
  timeoutSeconds: {{ .cfg.timeoutSeconds }}
  {{- end }}
  {{- if .cfg.periodSeconds }}
  periodSeconds: {{ .cfg.periodSeconds }}
  {{- end }}
  {{- if .cfg.successThreshold }}
  successThreshold: {{ .cfg.successThreshold }}
  {{- end }}
  {{- if .cfg.failureThreshold }}
  failureThreshold: {{ .cfg.failureThreshold }}
  {{- end }}
{{- end }}
{{- end }}
