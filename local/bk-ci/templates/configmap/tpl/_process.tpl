{{- define "bkci.process.yaml" -}}
api:
  project:
    permission:
      switch: true
build:
  atomMonitorData:
    report:
      maxMonitorDataSize: 1677216
      switch: true
pipeline:
  atom:
    maxRelQueryNum: 2000
    maxRelQueryRangeTime: 30
  build:
    retry:
      limitDays: -1
  editPath: console/pipeline/{0}/{1}/edit
  setting:
    common:
      maxModelSize: 16777215
      maxPipelineDescSize: 255
      maxPipelineNameSize: 255
      maxStageNum: 20
      stage:
        job:
          maxTaskNum: 50
          task:
            inputComponent:
              codeEditor:
                size: 16384
              default:
                size: 1024
              input:
                size: 1024
              multiple:
                member: selector,select-input,devops-select,atom-checkbox-list,staff-input,company-staff-input,parameter,dynamic-parameter
                size: 4000
              textarea:
                size: 16384
            maxInputNum: 100
            maxOutputNum: 100
            outputComponent:
              default:
                size: 4000
        maxJobNum: 20
  version:
    max_keep_num: 50
    spec_channel_max_keep_num: 2
    spec_channels: AM,CODECC,GCLOUD,GIT,GONGFENGSCAN,CODECC_EE
queueConcurrency:
  buildFinish: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  buildStart: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  container: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  stage: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  task: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
scm:
  external:
    tGit:
      enableHookSecret: false
      hookSecret: null
  svn:
    enabled: true
    interval: 60
server:
  port: {{ .Values.config.bkCiProcessApiPort | quote }}
sharding:
  archiveFlag: Y
  databaseShardingStrategy:
    algorithmClassName: com.tencent.devops.process.sharding.BkProcessDatabaseShardingAlgorithm
    archiveAlgorithmClassName: com.tencent.devops.process.sharding.BkProcessArchiveDatabaseShardingAlgorithm
    shardingField: PROJECT_ID
  tableShardingStrategy:
    archiveAlgorithmClassName: com.tencent.devops.process.sharding.BkProcessArchiveTableShardingAlgorithm
    shardingField: PROJECT_ID
spring:
  datasource:
    archiveDataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_archive_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    dataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
stream:
  scmType: {{ .Values.config.bkCiStreamScmType | quote }}
template:
  instanceListUrl: {{ .Values.config.bkCiPublicUrl }}/console/store/pipeline/{0}/template/{0}/instance
  maxErrorReasonLength: 200
  maxSaveVersionNum: 300
  maxSaveVersionRecordNum: 2
  maxSyncInstanceNum: 10
  maxUpdateInstanceNum: 100
{{ end }}