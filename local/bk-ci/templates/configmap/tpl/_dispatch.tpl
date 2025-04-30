{{- define "bkci.dispatch.yaml" -}}
bcs:
  apiUrl: {{ .Values.config.bkCiBcsHost | quote }}
  enable: {{ .Values.config.bkCiBcsEnable | quote }}
  entrypoint: /tools/bcs_init.sh
  resources:
    builder:
      cpu: {{ .Values.config.bkCiBcsCpu | quote }}
      disk: 100
      memory: {{ .Values.config.bkCiBcsMemory | quote }}
    job:
      cpu: {{ .Values.config.bkCiBcsCpu | quote }}
      disk: 100
      memory: {{ .Values.config.bkCiBcsMemory | quote }}
  sleepEntrypoint: /tools/sleep.sh
  token: {{ .Values.config.bkCiBcsToken | quote }}
dispatch:
  agentLessImageName: {{ .Values.config.bkCiAgentlessImageName | quote }}
  agentLessRegistryPassword: {{ .Values.config.bkCiAgentlessImageRegistryPassword | quote }}
  agentLessRegistryUrl: {{ .Values.config.bkCiAgentlessImageRegistryUrl | quote }}
  agentLessRegistryUserName: {{ .Values.config.bkCiAgentlessImageRegistryUser | quote }}
  defaultDockerRoutingType: {{ .Values.config.bkCiDockerRoutingType | quote }}
  dockerFile: {{ .Values.config.bkCiHome }}/agent-package/jar/worker-agent.jar
  jobQuota:
    enable: {{ .Values.config.bkCiDockerJobQuotaEnable | quote }}
    systemAlertReceiver: null
  scripts: {{ .Values.config.bkCiHome }}/agent-package/script
  workerFile: {{ .Values.config.bkCiHome }}/agent-package/jar/worker-agent.jar
gateway:
  url: {{ if empty .Values.config.bkCiPrivateUrl }}{{ .Release.Name }}-bk-ci-gateway{{ else }}{{ .Values.config.bkCiPrivateUrl }}{{ end }}
kubernetes:
  apiUrl: {{ .Values.config.bkCiKubernetesHost | quote }}
  enable: {{ .Values.config.bkCiKubernetesEnable | quote }}
  entrypoint: /data/devops/config/init.sh
  gateway:
    webConsoleProxy: {{ .Values.config.bkCiKubernetesWebconsoleProxy | quote }}
  privateBuilderTaint: {{ .Values.config.bkCiKubernetesBuilderTaint | quote }}
  resources:
    builder:
      cpu: {{ .Values.config.bkCiKubernetesCpu | quote }}
      disk: 100
      memory: {{ .Values.config.bkCiKubernetesMemory | quote }}
    job:
      cpu: {{ .Values.config.bkCiKubernetesCpu | quote }}
      disk: 100
      memory: {{ .Values.config.bkCiKubernetesMemory | quote }}
  sleepEntrypoint: /data/devops/config/sleep.sh
  token: {{ .Values.config.bkCiKubernetesToken | quote }}
registry:
  host: {{ .Values.config.bkCiDockerRegistryUrl | quote }}
  password: {{ .Values.config.bkCiDockerRegistryPassword | quote }}
  userName: {{ .Values.config.bkCiDockerRegistryUser | quote }}
server:
  port: {{ .Values.config.bkCiDispatchApiPort | quote }}
spring:
  datasource:
    dispatch:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_dispatch?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
    dispatchKubernetes:
      password: {{ include "bkci.mysqlPassword" . }}
      url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_dispatch_kubernetes?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
      username: {{ include "bkci.mysqlUsername" . }}
thirdagent:
  workerErrorTemplate: {{ .Values.config.bkCiDispatchThirdAgentWorkerErrorTemplate | quote }}
{{ end }}