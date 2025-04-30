{{- define "bkci.artifactory.yaml" -}}
artifactory:
  archiveLocalBasePath: {{ .Values.config.bkCiDataDir }}/artifactory
  fileTask:
    file:
      expireTimeMinutes: 720
    record:
      clear:
        enable: false
        expireTimeDays: 7
    savedir: {{ .Values.config.bkCiDataDir }}/artifactory-filetask/
  realm: {{ .Values.config.bkCiArtifactoryRealm | quote }}
bkrepo:
  dockerRegistry: {{ .Values.config.bkRepoDockerRegistry | quote }}
server:
  port: {{ .Values.config.bkCiArtifactoryApiPort | quote }}
  undertow:
    buffer-size: 10MB
    max-http-post-size: 5120MB
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_artifactory?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
{{ end }}