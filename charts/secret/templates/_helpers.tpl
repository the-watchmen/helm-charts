{{- define "name" -}}
{{- default .Release.Name .Values.name -}}
{{- end -}}

{{- define "namespace" -}}
{{- default .Release.Namespace .Values.namespace -}}
{{- end -}}
