{{- define "bkci.metrics.yaml" -}}
metrics:
  defaultLimitNum: 10
  devopsUrl: {{ .Values.config.bkCiPublicUrl | quote }}
  maxThreadHandleProjectNum: 10
  queryCountMax: 100000
  queryDaysMax: 180
  streamUrl: {{ .Values.config.bkCiStreamUrl | quote }}
server:
  port: {{ .Values.config.bkCiMetricsApiPort | quote }}
sharding:
  databaseShardingStrategy:
    algorithmClassName: com.tencent.devops.metrics.sharding.BkMetricsDatabaseShardingAlgorithm
    shardingField: PROJECT_ID
  routing:
    cacheSize: 100000
spring:
  datasource:
    dataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_metrics?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    tableRuleConfigs:
    - databaseShardingStrategy: SHARDING
      index: 0
      name: T_PIPELINE_OVERVIEW_DATA
    - databaseShardingStrategy: SHARDING
      index: 1
      name: T_PIPELINE_STAGE_OVERVIEW_DATA
    - databaseShardingStrategy: SHARDING
      index: 2
      name: T_PIPELINE_FAIL_SUMMARY_DATA
    - databaseShardingStrategy: SHARDING
      index: 3
      name: T_PIPELINE_FAIL_DETAIL_DATA
    - databaseShardingStrategy: SHARDING
      index: 4
      name: T_ATOM_OVERVIEW_DATA
    - databaseShardingStrategy: SHARDING
      index: 5
      name: T_ATOM_FAIL_SUMMARY_DATA
    - databaseShardingStrategy: SHARDING
      index: 6
      name: T_ATOM_FAIL_DETAIL_DATA
    - databaseShardingStrategy: SHARDING
      index: 7
      name: T_PROJECT_THIRD_PLATFORM_DATA
    - databaseShardingStrategy: SHARDING
      index: 8
      name: T_PROJECT_PIPELINE_LABEL_INFO
    - databaseShardingStrategy: SHARDING
      index: 9
      name: T_ATOM_DISPLAY_CONFIG
    - broadcastFlag: true
      index: 10
      name: T_ERROR_TYPE_DICT
    - broadcastFlag: true
      index: 11
      name: T_ERROR_CODE_INFO
    - broadcastFlag: true
      index: 12
      name: T_ATOM_INDEX_STATISTICS_DAILY
    - broadcastFlag: true
      index: 13
      name: T_ATOM_MONITOR_DATA_DAILY
    - broadcastFlag: true
      index: 14
      name: T_PROJECT_ATOM
{{ end }}