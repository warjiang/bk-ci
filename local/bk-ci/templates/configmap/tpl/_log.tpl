{{- define "bkci.log.yaml" -}}
log:
  elasticsearch:
    cluster: {{ .Values.config.bkCiEsClusterName | quote }}
    https: {{ .Values.config.bkCiEsHttps | quote }}
    ip: {{ include "bkci.elasticsearchHost" . }}
    name: DEVOPS
    password: {{ include "bkci.elasticsearchPassword" . }}
    port: {{ include "bkci.elasticsearchPort" . | quote }}
    username: {{ include "bkci.elasticsearchUsername" . }}
  lucene:
    dataDirectory: {{ .Values.config.bkCiLuceneDataDir | quote }}
    indexMaxSize: {{ .Values.config.bkCiLuceneIndexMaxSize | quote }}
  storage:
    coldInDay: {{ .Values.config.bkCiLogColdDay | quote }}
    deleteInDay: {{ .Values.config.bkCiLogDeleteDay | quote }}
    type: {{ .Values.config.bkCiLogStorageType | quote }}
server:
  port: {{ .Values.config.bkCiLogApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_log?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
{{ end }}