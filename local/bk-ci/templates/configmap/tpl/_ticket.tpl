{{- define "bkci.ticket.yaml" -}}
cert:
  aes-key: gHi(xG9Af)jEvCx&
credential:
  aes-key: G/I%yP{?ST}2TXPg
  mixer: '******'
server:
  port: {{ .Values.config.bkCiTicketApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_ticket?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
{{ end }}