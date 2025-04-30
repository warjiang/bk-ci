{{- define "bkci.openapi.yaml" -}}
api:
  gateway:
    auth: false
openapi:
  verify:
    project: false
server:
  port: {{ .Values.config.bkCiOpenapiApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_openapi?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
{{ end }}