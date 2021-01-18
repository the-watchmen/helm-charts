{{- define "name" -}}
{{- default .Release.Name .Values.name -}}
{{- end -}}

{{- define "namespace" -}}
{{- default .Release.Namespace .Values.namespace -}}
{{- end -}}

{{- define "containerPort" -}}
{{- default .Values.port .Values.containerPort -}}
{{- end -}}

{{- define "containerPortAdd" -}}
{{- default .Values.portAdd .Values.containerPortAdd -}}
{{- end -}}
