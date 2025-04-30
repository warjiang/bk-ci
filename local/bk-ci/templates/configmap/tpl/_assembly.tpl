{{- define "bkci.assembly.yaml" -}}
aes:
  aesKey: J%k^yO{?vt}3tXpG
  aesMock: '******'
api:
  gateway:
    auth: false
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
  realm: local
bk_login:
  bk_app_code: {{ .Values.config.bkCiAppCode | quote }}
  bk_app_secret: {{ .Values.config.bkCiAppToken | quote }}
  getAllUser: get_all_users/
  getUser: get_user/
  path: {{ .Values.config.bkPaasPrivateUrl }}/api/c/compapi/v2/bk_login/
build:
  atomMonitorData:
    report:
      maxMonitorDataSize: 1677216
      switch: false
  data:
    clear:
      codeccDayRange: -14
      codeccMaxKeepNum: 14
      maxEveryProjectHandleNum: 5
      maxKeepNum: 10000
      monthRange: -1
      otherMaxKeepNum: 500
      otherMonthRange: -1
      switch: false
cert:
  aes-key: gHi(xG9Af)jEvCx&
credential:
  aes-key: G/I%yP{?ST}2TXPg
  mixer: '******'
dispatch:
  dockerFile: {{ .Values.config.bkCiHome }}/agent-package/jar/worker-agent.jar
  jobQuota:
    enable: false
    systemAlertReceiver: null
  scripts: {{ .Values.config.bkCiHome }}/agent-package/script
  workerFile: {{ .Values.config.bkCiHome }}/agent-package/jar/worker-agent.jar
dockerCli:
  apiVersion: 1.23
  clearLocalImageCron: 0 0 2 * * ?
  cpuPeriod: 50000
  cpuQuota: 50000
  dockerAgentPath: {{ .Values.config.bkCiHome }}/agent-package/worker-agent.jar
  dockerConfig: /root/.docker
  dockerHost: unix:///var/run/docker.sock
  downloadAgentCron: 0 0 3 * * ?
  downloadDockerAgentUrl: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}/ms/dispatch/gw/build/docker.jar
  hostPathApps: {{ .Values.config.bkCiDataDir }}/docker/apps/
  hostPathCcache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/ccache/
  hostPathCodecc: /data/devops/codecc
  hostPathGolangCache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/go_cache/
  hostPathGradleCache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/gradle_caches
  hostPathHosts: /etc/hosts
  hostPathInit: {{ .Values.config.bkCiHome }}/agent-package/script/init.sh
  hostPathLinkDir: /tmp/bkci
  hostPathLogs: {{ .Values.config.bkCiLogsDir }}/docker
  hostPathMavenRepo: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/maven_repo
  hostPathNpmCache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/npm_cache
  hostPathNpmPrefix: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/npm_prefix
  hostPathNpmRc: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/.npmrc
  hostPathProjectShare: {{ .Values.config.bkCiDataDir }}/docker/share/project
  hostPathSbt2Cache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/sbt_cache/
  hostPathSbtCache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/.ivy2/
  hostPathSleep: {{ .Values.config.bkCiHome }}/agent-package/script/sleep.sh
  hostPathWorkspace: {{ .Values.config.bkCiDataDir }}/docker/workspace
  hostPathYarnCache: {{ .Values.config.bkCiDataDir }}/docker/thirdparty/yarn_cache/
  landunEnv: prod
  localImageCacheDays: 7
  memoryLimitBytes: 2147483648
  registryPassword: {{ .Values.config.bkCiDockerRegistryPassword | quote }}
  registryUrl: {{ .Values.config.bkCiDockerRegistryUrl | quote }}
  registryUsername: {{ .Values.config.bkCiDockerRegistryUser | quote }}
  shareProjectCodeWhiteList: null
  volumeApps: /data/devops/apps/
  volumeCcache: /root/.ccache
  volumeCodecc: /data/devops/codecc/
  volumeGolangCache: /root/go/pkg/mod
  volumeGradleCache: /root/.gradle/caches
  volumeInit: /data/init.sh
  volumeLogs: /data/devops/logs
  volumeMavenRepo: /root/.m2/repository
  volumeNpmCache: /root/Downloads/npm/cache
  volumeNpmPrefix: /root/Downloads/npm/prefix
  volumeNpmRc: /root/.npmrc
  volumeProjectShare: /data/devops/share
  volumeSbt2Cache: /root/.cache
  volumeSbtCache: /root/.ivy2
  volumeSleep: /data/devops/sleep.sh
  volumeWorkspace: /data/devops/workspace
  volumeYarnCache: /usr/local/share/.cache/
dockerhost:
  mode: docker_no_build
environment:
  agent-package: {{ .Values.config.bkCiHome }}/agent-package
  agentCollectorOn: {{ .Values.config.bkCiEnvironmentAgentCollectorOn | quote }}
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
leaf:
  name: leaf
  segment:
    allocStrategyDaoBeanName: jooqIDAllocDaoImpl
    enable: true
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_project?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
log:
  elasticsearch:
    cluster: {{ .Values.config.bkCiEsClusterName | quote }}
    ip: {{ include "bkci.elasticsearchHost" . }}
    name: DEVOPS
    password: {{ include "bkci.elasticsearchPassword" . }}
    port: {{ include "bkci.elasticsearchPort" . | quote }}
    username: {{ include "bkci.elasticsearchUsername" . }}
  lucene:
    dataDirectory: {{ .Values.config.bkCiLuceneDataDir | quote }}
    indexMaxSize: {{ .Values.config.bkCiLuceneIndexMaxSize | quote }}
  storage:
    closeInDay: {{ .Values.config.bkCiLogColdDay | quote }}
    deleteInDay: {{ .Values.config.bkCiLogDeleteDay | quote }}
    type: {{ .Values.config.bkCiLogStorageType | quote }}
logo:
  allowUploadLogoHeight: 200
  allowUploadLogoTypes: jpg,png,svg
  allowUploadLogoWidth: 200
  maxUploadLogoSize: 2097152
notify:
  weworkChannel: {{ .Values.config.bkCiNotifyWeworkSendChannel | quote }}
pipeline:
  atom:
    maxRelQueryNum: 2000
    maxRelQueryRangeTime: 30
  editPath: console/pipeline/{0}/{1}/edit
  setting:
    common:
      maxModelSize: 16777215
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
plugin:
  codecc:
    covFile: build_dev.py
    path: {{ .Values.config.bkCodeccDataDir }}/tools
    toolFile: build_tool_dev.py
queueConcurrency:
  buildFinish: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  buildStart: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  container: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  stage: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
  task: {{ .Values.config.bkCiProcessEventConcurrent | quote }}
repository:
  git:
    devopsGroupName: {{ .Values.config.bkCiRepositoryGitPluginGroupName | quote }}
    devopsPrivateToken: {{ .Values.config.bkCiRepositoryGitPrivateToken | quote }}
scm:
  external:
    github:
      appUrl: https://github.com/apps/{{ .Values.config.bkCiRepositoryGithubApp }}
      callbackUrl: {{ .Values.config.bkCiPublicUrl }}/external/api/external/github/oauth/callback
      clientId: {{ .Values.config.bkCiRepositoryGithubClientId | quote }}
      clientSecret: {{ .Values.config.bkCiRepositoryGithubClientSecret | quote }}
      redirectUrl: {{ .Values.config.bkCiPublicUrl }}/console/codelib
      signSecret: {{ .Values.config.bkCiRepositoryGithubSignSecret | quote }}
    gitlab:
      apiUrl: {{ .Values.config.bkCiRepositoryGitlabUrl }}/api/v4
      gitlabHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/gitlab/commit
    p4:
      p4HookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/p4/commit
    tGit:
      apiUrl: https://git.tencent.com/api/v3
      enableHookSecret: false
      hookSecret: null
      tGitHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/codetgit/commit
  git:
    apiUrl: {{ .Values.config.bkCiRepositoryGitUrl }}/api/v3
    clientId: clientId
    clientSecret: Secret
    gitHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/codegit/commit
    public:
      account: devops
      email: devops@devops.com
      secret: devops123
    redirectAtomMarketUrl: {{ .Values.config.bkCiPublicUrl }}/console/store/atomList
    redirectUrl: {{ .Values.config.bkCiPublicUrl }}/console/codelib
    url: {{ .Values.config.bkCiRepositoryGitUrl | quote }}
  svn:
    apiKey: {{ .Values.config.bkCiRepositorySvnApiKey | quote }}
    apiUrl: {{ .Values.config.bkCiRepositorySvnApiUrl | quote }}
    svnHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/codesvn/commit
    webhookApiUrl: {{ .Values.config.bkCiRepositorySvnWebhookUrl | quote }}
server:
  port: {{ .Values.config.bkCiAssemblyApiPort | quote }}
sharding:
  archiveFlag: Y
  databaseShardingStrategy:
    algorithmClassName: com.tencent.devops.process.sharding.BkProcessDatabaseShardingAlgorithm
    archiveAlgorithmClassName: com.tencent.devops.process.sharding.BkProcessArchiveDatabaseShardingAlgorithm
    shardingField: PROJECT_ID
  defaultFlag: N
  tableShardingStrategy:
    archiveAlgorithmClassName: com.tencent.devops.process.sharding.BkProcessArchiveTableShardingAlgorithm
    defaultShardingNum: 1
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
    misc:
      pkgRegex: \.(process|project|repository|dispatch|plugin|quality|artifactory|environment)
    password: {{ include "bkci.mysqlPassword" . }}
    plugin:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_plugin?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    process:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
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
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_process?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
statistics:
  timeSpanMonth: -3
store:
  artifactoryServiceUrlPrefix: {{ .Values.config.bkCiPublicUrl }}/ms/artifactory/api
  atom:
    defaultTimeout: 900
    maxRetryNum: 5
    maxTimeout: 10080
    minRetryNum: 1
    minTimeout: 1
  atomDetailBaseUrl: /console/store/atomStore/detail/atom/
  baseImageDocsLink: /console/store/atomStore/detail/image/
  buildResultBaseUrl: {{ .Values.config.bkCiPublicUrl }}/console/pipeline
  commentNotifyAdmin: admin
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
  imageApproveSwitch: close
  imageDetailBaseUrl: /console/store/atomStore/detail/image/
  imageExecuteNullNotifyTplCode: IMAGE_EXECUTE_NULL_NOTIFY_TPL
  profileUrlPrefix: {{ .Values.config.bkCiStoreUserAvatarsUrl | quote }}
  serviceDetailBaseUrl: /console/store/atomStore/detail/service/
  templateApproveSwitch: close
  templateDetailBaseUrl: /console/store/atomStore/detail/template/
template:
  instanceListUrl: {{ .Values.config.bkCiPublicUrl }}/console/store/pipeline/{0}/template/{0}/instance
thread:
  min: 8
wework:
  agentId: null
  apiUrl: {{ .Values.config.bkCiNotifyWeworkApiUrl | quote }}
  corpId: null
  corpSecret: null
  duplicateCheckInterval: null
  enableDuplicateCheck: null
  enableIdTrans: null
  safe: null
  tempDirectory: null
{{ end }}