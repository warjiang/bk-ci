{{- define "bkci.environment.yaml" -}}
environment:
  agent-package: {{ .Values.config.bkCiHome }}/agent-package
  agentCollectorOn: {{ .Values.config.bkCiEnvironmentAgentCollectorOn | quote }}
  certFilePath: {{ .Values.config.bkCiFqdnCert | quote }}
influxdb:
  password: {{ include "bkci.influxdbPassword" . }}
  server: http://{{ include "bkci.influxdbHost" . }}:{{ include "bkci.influxdbPort" . }}
  userName: {{ include "bkci.influxdbUsername" . }}
server:
  port: {{ .Values.config.bkCiEnvironmentApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_environment?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
{{ end }}