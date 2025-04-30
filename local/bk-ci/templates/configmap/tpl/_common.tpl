{{- define "bkci.common.yaml" -}}
alert:
  users: ''
audit:
  enabled: {{ .Values.config.bkCiAuditEnabled | quote }}
auth:
  accessToken:
    enabled: {{ .Values.config.bkCiApiTokenEnabled | quote }}
    expirationTime: {{ .Values.config.bkCiApiTokenExpiredMillisecond | quote }}
    secret: {{ .Values.config.bkCiApiTokenSecret | quote }}
  apigwUrl: {{ .Values.config.bkCiIamApigwUrl | quote }}
  appCode: {{ .Values.config.bkCiAppCode | quote }}
  appSecret: {{ .Values.config.bkCiAppToken | quote }}
  bkloginUrl: {{ .Values.config.bkPaasPrivateUrl }}/login/api/v2
  envName: prod
  gateway:
    devopsToken: {{ .Values.config.bkCiDevopsToken | quote }}
  grantType: rization_code
  iamCallBackUser: {{ .Values.config.bkCiIamCallbackUser | quote }}
  iamSystem: {{ .Values.config.bkCiIamSystemId | quote }}
  idProvider: {{ .Values.config.bkCiAuthProvider | quote }}
  migrateToken: {{ .Values.config.bkCiIamMigrateToken | quote }}
  principalType: user
  token: {{ .Values.config.bkCiAppToken | quote }}
  url: {{ .Values.config.bkIamPrivateUrl | quote }}
  webHost: {{ .Values.config.bkCiIamWebUrl | quote }}
bk:
  paas:
    host: {{ .Values.config.bkPaasPrivateUrl | quote }}
bkci:
  defaultLocale: {{ .Values.config.bkCiDefaultLocale | quote }}
  security:
    enable: false
    private-key: {{ .Values.config.bkCiJwtRsaPrivateKey | quote }}
    public-key: {{ .Values.config.bkCiJwtRsaPublicKey | quote }}
  supportLanguages: {{ .Values.config.bkCiSupportLanguages | quote }}
bkrepo:
  bkrepoApiUrl: {{ .Values.config.bkHttpSchema }}://{{ .Values.config.bkRepoHost }}/api/generic
  staticPassword: {{ .Values.config.bkRepoPassword | quote }}
  staticRepoPrefixUrl: {{ .Values.config.bkHttpSchema }}://{{ .Values.config.bkRepoHost }}/generic/{0}/{1}
  staticUserName: {{ .Values.config.bkRepoUsername | quote }}
certificate:
  server: {{ .Values.config.bkLicensePrivateUrl }}/certificate
cluster:
  tag: {{ .Values.config.bkCiClusterTag | quote }}
codecc:
  gray:
    projectId: {{ .Values.config.bkCodeccPrivateProjectId | quote }}
  host: {{ .Values.config.bkCodeccPrivateUrl | quote }}
codeccGateway:
  gateway: {{ .Values.config.bkCodeccPrivateUrl | quote }}
  gatewayWeb: {{ .Values.config.bkCodeccPrivateUrl | quote }}
codeoa:
  api-key: {{ .Values.config.bkCiCodeoaApiKey | quote }}
  api-url: {{ .Values.config.bkCiCodeoaApiUrl | quote }}
  git-url: {{ .Values.config.bkCiCodeoaGitUrl | quote }}
devopsGateway:
  api: {{ .Values.config.bkCiPublicUrl | quote }}
  build: {{ .Values.config.bkCiPublicUrl | quote }}
  devnet: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  devnetProxy: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  fileDevnetGateway: {{ if empty .Values.config.bkRepoPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkRepoPrivateUrl }}{{ end }}
  fileIdcGateway: {{ if empty .Values.config.bkRepoPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkRepoPrivateUrl }}{{ end }}
  host: {{ .Values.config.bkCiPublicUrl | quote }}
  idc: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  idcProxy: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  oss: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  ossProxy: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
  outer: {{ .Values.config.bkCiPublicUrl | quote }}
  outerApi: {{ .Values.config.bkCiPublicUrl | quote }}
  whiteProxy: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
endpoints:
  metrics:
    filter:
      enabled: false
esb:
  code: {{ .Values.config.bkCiAppCode | quote }}
  secret: {{ .Values.config.bkCiAppToken | quote }}
net:
  proxy:
    enable: false
    hosts: .*google.*
    server:
      host: 127.0.0.1
      port: 8080
      type: HTTP
process:
  archivePipelineStoreDays: 735
  clearBaseBuildData: true
  deletedPipelineStoreDays: 30
s3:
  accessKey: {{ .Values.config.bkCiS3AccessKey | quote }}
  bucketName: {{ .Values.config.bkCiS3BucketName | quote }}
  endpointUrl: {{ .Values.config.bkCiS3EndpointUrl | quote }}
  secretKey: {{ .Values.config.bkCiS3SecretKey | quote }}
server:
  shutdown: graceful
  undertow:
    accesslog:
      dir: ${service.log.dir}
      enabled: true
      pattern: '%h %I "%{i,X-DEVOPS-UID}" [%{time,yyyyMMddHHmmss.S}] "%r" %s %D %b
        "%{i,Referer}" "%{i,User-Agent}"'
    worker-threads: 100
service-suffix: -{{ .Release.Namespace }}
sharding:
  migration:
    maxProjectCount: 5
    processDbMicroServices: process,engine,misc,lambda
    sourceDbDataDeleteFlag: false
    timeout: 2
  routing:
    cacheSize: 100000
  tableShardingStrategy:
    defaultShardingNum: 1
sm4:
  enabled: {{ .Values.config.bkCiSm4Enabled | quote }}
  key: {{ .Values.config.bkCiSm4Key | quote }}
spring:
  application:
    version: 4.0.0
  cloud:
    consul:
      discovery:
        instanceId: ${spring.application.name}-${server.port}-${spring.cloud.client.hostname}
        tags: {{ .Release.Namespace }}
      port: {{ .Values.config.bkCiConsulHttpPort | quote }}
    stream:
      binders:
        core-rabbit:
          environment:
            spring:
              rabbitmq:
                addresses: {{ include "bkci.rabbitmqAddr" . }}
                password: {{ include "bkci.rabbitmqPassword" . }}
                username: {{ include "bkci.rabbitmqUser" . }}
                virtual-host: {{ include "bkci.rabbitmqVhost" . }}
          type: rabbit
        extend-rabbit:
          environment:
            spring:
              rabbitmq:
                addresses: {{ include "bkci.rabbitmqAddr" . }}
                password: {{ include "bkci.rabbitmqPassword" . }}
                username: {{ include "bkci.rabbitmqUser" . }}
                virtual-host: {{ include "bkci.rabbitmqVhost" . }}
          type: rabbit
        pulsar:
          environment:
            spring:
              pulsar:
                namespace: {{ .Values.config.bkCiPulsarNamespace | quote }}
                serviceUrl: {{ .Values.config.bkCiPulsarUrl | quote }}
                tenant: {{ .Values.config.bkCiPulsarTenant | quote }}
                tokenAuthValue: {{ .Values.config.bkCiPulsarAuthToken | quote }}
          type: pulsar
      default-binder: {{ .Values.config.bkCiMqDefaultBinder | quote }}
  datasource:
    tableRuleConfigs:
    - databaseShardingStrategy: SHARDING
      index: 0
      name: T_AUDIT_RESOURCE
    - databaseShardingStrategy: SHARDING
      index: 1
      name: T_PIPELINE_BUILD_CONTAINER
    - databaseShardingStrategy: SHARDING
      index: 2
      name: T_PIPELINE_BUILD_DETAIL
    - databaseShardingStrategy: SHARDING
      index: 3
      name: T_PIPELINE_BUILD_HIS_DATA_CLEAR
    - databaseShardingStrategy: SHARDING
      index: 4
      name: T_PIPELINE_BUILD_HISTORY
    - databaseShardingStrategy: SHARDING
      index: 5
      name: T_PIPELINE_BUILD_STAGE
    - databaseShardingStrategy: SHARDING
      index: 6
      name: T_PIPELINE_BUILD_SUMMARY
    - databaseShardingStrategy: SHARDING
      index: 7
      name: T_PIPELINE_BUILD_TASK
    - databaseShardingStrategy: SHARDING
      index: 8
      name: T_PIPELINE_BUILD_VAR
    - databaseShardingStrategy: SHARDING
      index: 9
      name: T_PIPELINE_FAVOR
    - databaseShardingStrategy: SHARDING
      index: 10
      name: T_PIPELINE_GROUP
    - databaseShardingStrategy: SHARDING
      index: 11
      name: T_PIPELINE_INFO
    - databaseShardingStrategy: SHARDING
      index: 12
      name: T_PIPELINE_JOB_MUTEX_GROUP
    - databaseShardingStrategy: SHARDING
      index: 13
      name: T_PIPELINE_LABEL
    - databaseShardingStrategy: SHARDING
      index: 14
      name: T_PIPELINE_LABEL_PIPELINE
    - databaseShardingStrategy: SHARDING
      index: 15
      name: T_PIPELINE_MODEL_TASK
    - databaseShardingStrategy: SHARDING
      index: 16
      name: T_PIPELINE_PAUSE_VALUE
    - databaseShardingStrategy: SHARDING
      index: 17
      name: T_PIPELINE_RESOURCE
    - databaseShardingStrategy: SHARDING
      index: 18
      name: T_PIPELINE_RESOURCE_VERSION
    - databaseShardingStrategy: SHARDING
      index: 19
      name: T_PIPELINE_SETTING
    - databaseShardingStrategy: SHARDING
      index: 20
      name: T_PIPELINE_SETTING_VERSION
    - databaseShardingStrategy: SHARDING
      index: 21
      name: T_PIPELINE_VIEW
    - databaseShardingStrategy: SHARDING
      index: 22
      name: T_PIPELINE_VIEW_USER_LAST_VIEW
    - databaseShardingStrategy: SHARDING
      index: 23
      name: T_PIPELINE_VIEW_USER_SETTINGS
    - databaseShardingStrategy: SHARDING
      index: 25
      name: T_PIPELINE_WEBHOOK_QUEUE
    - databaseShardingStrategy: SHARDING
      index: 26
      name: T_PROJECT_PIPELINE_CALLBACK
    - databaseShardingStrategy: SHARDING
      index: 27
      name: T_PROJECT_PIPELINE_CALLBACK_HISTORY
    - databaseShardingStrategy: SHARDING
      index: 28
      name: T_REPORT
    - databaseShardingStrategy: SHARDING
      index: 29
      name: T_TEMPLATE
    - databaseShardingStrategy: SHARDING
      index: 30
      name: T_TEMPLATE_PIPELINE
    - databaseShardingStrategy: SHARDING
      index: 31
      name: T_PIPELINE_BUILD_TEMPLATE_ACROSS_INFO
    - broadcastFlag: true
      index: 33
      name: T_PIPELINE_RULE
    - broadcastFlag: true
      index: 34
      name: T_PIPELINE_STAGE_TAG
    - broadcastFlag: true
      index: 35
      name: T_PIPELINE_TIMER
    - broadcastFlag: true
      index: 36
      name: T_PIPELINE_REMOTE_AUTH
    - broadcastFlag: true
      index: 37
      name: T_PIPELINE_WEBHOOK
    - broadcastFlag: true
      index: 38
      name: T_TEMPLATE_INSTANCE_BASE
    - broadcastFlag: true
      index: 39
      name: T_TEMPLATE_INSTANCE_ITEM
    - broadcastFlag: true
      index: 40
      name: T_PIPELINE_GITCI_ATOM
    - broadcastFlag: true
      index: 41
      name: T_PIPELINE_WEBHOOK_REVISION
    - broadcastFlag: true
      index: 42
      name: T_PIPELINE_ATOM_REPLACE_BASE
    - broadcastFlag: true
      index: 43
      name: T_PIPELINE_ATOM_REPLACE_ITEM
    - broadcastFlag: true
      index: 44
      name: T_PIPELINE_ATOM_REPLACE_HISTORY
    - databaseShardingStrategy: SHARDING
      index: 45
      name: T_PIPELINE_WEBHOOK_BUILD_PARAMETER
    - databaseShardingStrategy: SHARDING
      index: 46
      name: T_PIPELINE_VIEW_GROUP
    - databaseShardingStrategy: SHARDING
      index: 47
      name: T_PIPELINE_VIEW_TOP
    - databaseShardingStrategy: SHARDING
      index: 48
      name: T_PIPELINE_RECENT_USE
    - databaseShardingStrategy: SHARDING
      index: 49
      name: T_PIPELINE_BUILD_RECORD_CONTAINER
    - databaseShardingStrategy: SHARDING
      index: 50
      name: T_PIPELINE_BUILD_RECORD_MODEL
    - databaseShardingStrategy: SHARDING
      index: 51
      name: T_PIPELINE_BUILD_RECORD_STAGE
    - databaseShardingStrategy: SHARDING
      index: 52
      name: T_PIPELINE_BUILD_RECORD_TASK
    - databaseShardingStrategy: SHARDING
      index: 53
      name: T_PIPELINE_TRIGGER_EVENT
    - databaseShardingStrategy: SHARDING
      index: 54
      name: T_PIPELINE_TRIGGER_DETAIL
    - databaseShardingStrategy: SHARDING
      index: 55
      name: T_PIPELINE_TRIGGER_REVIEW
    - databaseShardingStrategy: SHARDING
      index: 56
      name: T_PIPELINE_DATA_CLEAR
    - databaseShardingStrategy: SHARDING
      index: 57
      name: T_PIPELINE_OPERATION_LOG
    - databaseShardingStrategy: SHARDING
      index: 58
      name: T_PIPELINE_YAML_INFO
    - databaseShardingStrategy: SHARDING
      index: 59
      name: T_PIPELINE_YAML_VERSION
    - databaseShardingStrategy: SHARDING
      index: 60
      name: T_PIPELINE_YAML_SYNC
    - databaseShardingStrategy: SHARDING
      index: 61
      name: T_PIPELINE_YAML_BRANCH_FILE
    - databaseShardingStrategy: SHARDING
      index: 62
      name: T_PIPELINE_YAML_VIEW
    - databaseShardingStrategy: SHARDING
      index: 63
      name: T_PIPELINE_WEBHOOK_VERSION
    - databaseShardingStrategy: SHARDING
      index: 64
      name: T_PIPELINE_TIMER_BRANCH
    - databaseShardingStrategy: SHARDING
      index: 65
      name: T_PIPELINE_BUILD_HISTORY_DEBUG
    - databaseShardingStrategy: SHARDING
      index: 66
      name: T_PIPELINE_CALLBACK
    - databaseShardingStrategy: SHARDING
      index: 67
      name: T_PIPELINE_SUB_REF
  main:
    allow-bean-definition-overriding: true
  metrics:
    servo:
      enabled: false
  redis:
    database: {{ .Values.config.bkCiRedisDb | quote }}
    host: {{ if eq .Values.redis.enabled true }}{{ printf "%s.%s.%s" (include "bkci.redisHost" .) .Release.Namespace "svc.cluster.local" | quote}}{{ else }}{{ include "bkci.redisHost" . }}{{ end }}
    password: {{ include "bkci.redisPassword" . }}
    pool:
      max-active: 16
      max-wait: 2000
    port: {{ include "bkci.redisPort" . | quote }}
    ssl: {{ .Values.config.bkCiRedisSsl | quote }}
wechatWork:
  aesKey: {{ .Values.config.bkCiWechatworkAeskey | quote }}
  corpId: {{ .Values.config.bkCiWechatworkCorpid | quote }}
  secret: {{ .Values.config.bkCiWechatworkSecret | quote }}
  serviceId: {{ .Values.config.bkCiWechatworkServiceid | quote }}
  token: {{ .Values.config.bkCiWechatworkToken | quote }}
  url: {{ .Values.config.bkCiWechatworkUrl | quote }}
{{ end }}