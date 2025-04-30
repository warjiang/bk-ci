{{- define "bkci.auth.yaml" -}}
aes:
  auth: {{ .Values.config.bkCiAuthAesAuthKey | quote }}
codecc:
  openapi:
    token: {{ .Values.config.bkCiCodeccOpenapiToken | quote }}
itsm:
  callback:
    create:
      url: {{ .Values.config.bkCiPublicUrl }}/ms/auth/api/external/auth/itsm/create_callback
    update:
      url: {{ .Values.config.bkCiPublicUrl }}/ms/auth/api/external/auth/itsm/update_callback
  url: {{ .Values.config.bkCiItsmApigwUrl | quote }}
login:
  third:
    domain: {{ .Values.config.bkCiLoginThirdCookieDomain | quote }}
    url: {{ .Values.config.bkCiLoginThirdCallbackUrl | quote }}
monitor:
  iamSystem: {{ .Values.config.bkCiMonitorIamSystem | quote }}
  register: {{ .Values.config.bkCiMonitorRegister | quote }}
  url: {{ .Values.config.bkCiMonitorUrl | quote }}
server:
  port: {{ .Values.config.bkCiAuthApiPort | quote }}
sharding:
  databaseShardingStrategy:
    algorithmClassName: com.tencent.devops.auth.sharding.BkAuthDatabaseShardingAlgorithm
    shardingField: PROJECT_CODE
  routing:
    cacheSize: 100000
spring:
  datasource:
    dataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_auth?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
{{ end }}