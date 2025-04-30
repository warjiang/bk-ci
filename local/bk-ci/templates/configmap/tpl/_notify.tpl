{{- define "bkci.notify.yaml" -}}
notify:
  emailChannel: {{ .Values.config.bkCiNotifyEmailSendChannel | quote }}
  tencentCloud:
    emailRegion: {{ .Values.config.bkCiNotifyTencentCloudEmailRegion | quote }}
    secretId: {{ .Values.config.bkCiNotifyTencentCloudSecretId | quote }}
    secretKey: {{ .Values.config.bkCiNotifyTencentCloudSecretKey | quote }}
  weworkChannel: {{ .Values.config.bkCiNotifyWeworkSendChannel | quote }}
server:
  port: {{ .Values.config.bkCiNotifyApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_notify?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
wework:
  agentId: null
  apiUrl: {{ .Values.config.bkCiNotifyWeworkApiUrl | quote }}
  corpId: null
  corpSecret: null
  domain: true
  duplicateCheckInterval: null
  enableDuplicateCheck: null
  enableIdTrans: null
  safe: null
  tempDirectory: null
{{ end }}