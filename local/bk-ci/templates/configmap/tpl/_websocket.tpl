{{- define "bkci.websocket.yaml" -}}
server:
  port: {{ .Values.config.bkCiWebsocketApiPort | quote }}
{{ end }}