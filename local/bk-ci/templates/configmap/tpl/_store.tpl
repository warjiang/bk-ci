{{- define "bkci.store.yaml" -}}
aes:
  aesKey: J%k^yO{?vt}3tXpG
  aesMock: '******'
logo:
  allowUploadLogoHeight: 200
  allowUploadLogoTypes: jpg,png
  allowUploadLogoWidth: 200
  maxUploadLogoSize: 2097152
server:
  port: {{ .Values.config.bkCiStoreApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_artifactory?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
statistics:
  timeSpanMonth: -3
store:
  artifactoryServiceUrlPrefix: {{ .Values.config.bkCiPublicUrl }}/ms/artifactory/api
  atomDetailBaseUrl: /console/store/atomStore/detail/atom/
  baseImageDocsLink: /console/store/atomStore/detail/image/
  buildResultBaseUrl: {{ .Values.config.bkCiPublicUrl }}/console/pipeline
  commentNotifyAdmin: admin
  defaultAtomErrorCodeLength: 6
  defaultAtomErrorCodePrefix: '8'
  defaultImageRDType: SELF_DEVELOPED
  defaultImageRepoName: paas/bkdevops/docker-builder2.2
  defaultImageRepoUrl: {{ .Values.config.bkCiDockerRegistryUrl | quote }}
  defaultImageSourceType: bkdevops
  defaultImageTag: v1
  defaultStaticFileFormat: jpg,png,svg,gif,jpeg
  defaultTicketId: null
  defaultTicketProject: null
  ideAtomDetailBaseUrl: /console/store/atomStore/detail/ide/
  imageAdminUsers: admin
  imageAgentTypes: DOCKER
  imageApproveSwitch: close
  imageDetailBaseUrl: /console/store/atomStore/detail/image/
  imageExecuteNullNotifyTplCode: IMAGE_EXECUTE_NULL_NOTIFY_TPL
  innerPipeline:
    project: demo
    user: admin
  profileUrlPrefix: {{ .Values.config.bkCiStoreUserAvatarsUrl | quote }}
  serviceDetailBaseUrl: /console/store/atomStore/detail/service/
  templateApproveSwitch: close
  templateDetailBaseUrl: /console/store/atomStore/detail/template/
{{ end }}