{{- define "bkci.misc.yaml" -}}
build:
  data:
    clear:
      clearChannelCodes: BS,PREBUILD,CI,CODECC
      codeccDayRange: -14
      codeccMaxKeepNum: 14
      maxEveryProjectHandleNum: 5
      maxKeepNum: 10000
      maxThreadHandleProjectNum: 5
      monthRange: -1
      otherMaxKeepNum: 500
      otherMonthRange: -1
      switch: {{ .Values.config.bkCiBuildDataClearSwitch | quote }}
gpt:
  gateway: {{ .Values.config.bkCiGptGateway | quote }}
  headers: {{ .Values.config.bkCiGptHeaders | quote }}
image:
  dockerCli:
    apiVersion: 1.23
    dockerConfig: /root/.docker
    dockerHost: unix:///var/run/docker.sock
    imagePrefix: {{ .Values.config.bkCiDockerImagePrefix | quote }}
    registryPassword: {{ .Values.config.bkCiDockerRegistryPassword | quote }}
    registryUrl: {{ .Values.config.bkCiDockerRegistryUrl | quote }}
    registryUsername: {{ .Values.config.bkCiDockerRegistryUser | quote }}
influxdb:
  password: {{ include "bkci.influxdbPassword" . }}
  server: http://{{ include "bkci.influxdbHost" . }}:{{ include "bkci.influxdbPort" . }}
  userName: {{ include "bkci.influxdbUsername" . }}
plugin:
  codecc:
    covFile: build_dev.py
    path: {{ .Values.config.bkCodeccDataDir }}/tools
    toolFile: build_tool_dev.py
server:
  port: {{ .Values.config.bkCiMiscApiPort | quote }}
sharding:
  archiveFlag: Y
  databaseShardingStrategy:
    algorithmClassName: com.tencent.devops.misc.sharding.BkProcessDatabaseShardingAlgorithm
    archiveAlgorithmClassName: com.tencent.devops.misc.sharding.BkProcessArchiveDatabaseShardingAlgorithm
    shardingField: PROJECT_ID
  defaultFlag: N
  tableShardingStrategy:
    archiveAlgorithmClassName: com.tencent.devops.misc.sharding.BkProcessArchiveTableShardingAlgorithm
    shardingField: PROJECT_ID
spring:
  datasource:
    archiveDataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_archive_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    artifactory:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_artifactory?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    dataSourceConfigs:
    - index: 0
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    dispatch:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_dispatch?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    environment:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_environment?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    image:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_image?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    misc:
      pkgRegex: \.(process|project|repository|dispatch|plugin|quality|artifactory|environment|image|gpt)
    plugin:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_plugin?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    project:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_project?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    quality:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_quality?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    repository:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_repository?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
{{ end }}