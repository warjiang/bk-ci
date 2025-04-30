{{- define "bkci.stream.yaml" -}}
badge:
  serverUrl: {{ .Values.config.bkCiBadgeServerUrl | quote }}
container:
  defaultImage: bkci/ci:ubuntu
cron:
  clear:
    maxEveryProjectHandleNum: 15
    maxKeepNum: 10000
    maxThreadHandleProjectNum: 5
gateway:
  reportPrefix: {{ .Values.config.bkCiStreamReportPrefix | quote }}
  url: {{ .Values.config.bkCiHost | quote }}
git:
  gitUrl: {{ .Values.config.bkCiStreamGitUrl | quote }}
github:
  orgWhite: {{ .Values.config.bkCiGithubOrgwhite | quote }}
  redirectUrl: {{ .Values.config.bkCiStreamUrl }}/auth/api/external/third/login?code=%s&userId=%s&type=%s
  signSecret: {{ .Values.config.bkCiRepositoryGithubSignSecret | quote }}
server:
  port: {{ .Values.config.bkCiStreamApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_stream?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
stream:
  marketRun:
    atomCode: run
    atomVersion: 1.*
    enable: true
  scmType: {{ .Values.config.bkCiStreamScmType | quote }}
  url: {{ .Values.config.bkCiStreamUrl | quote }}
{{ end }}