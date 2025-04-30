{{- define "bkci.project.yaml" -}}
auth:
  project:
    approval: false
bk_login:
  bk_app_code: {{ .Values.config.bkCiAppCode | quote }}
  bk_app_secret: {{ .Values.config.bkCiAppToken | quote }}
  getAllUser: get_all_users/
  getUser: get_user/
  path: {{ .Values.config.bkPaasPrivateUrl }}/api/c/compapi/v2/bk_login/
leaf:
  name: leaf
  segment:
    allocStrategyDaoBeanName: jooqIDAllocDaoImpl
    enable: true
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_project?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
server:
  port: {{ .Values.config.bkCiProjectApiPort | quote }}
sharding:
  database:
    assign:
      fusibleSwitch: false
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_project?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
system:
  router: {{ .Values.config.bkCiProjectRouterTag | quote }}
tag:
  prod: {{ .Release.Namespace }}
{{ end }}