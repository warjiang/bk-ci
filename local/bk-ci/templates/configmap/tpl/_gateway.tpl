{{- define "bkci.gateway.yaml" -}}
BK_CI_DEVOPS_TOKEN: {{ .Values.config.bkCiDevopsToken | quote }}
BK_CI_LOGS_DIR: {{ .Values.config.bkCiLogsDir | quote }}
BK_CI_STREAM_HOST: {{ .Values.config.bkCiStreamHost | quote }}
BK_CI_AUTH_PROVIDER: {{ .Values.config.bkCiAuthProvider | quote }}
BK_CI_HTTP_PORT: {{ .Values.config.bkCiHttpPort | quote }}
BK_CI_FQDN: {{ .Values.config.bkCiFqdn | quote }}
BK_CI_HOST: {{ .Values.config.bkCiHost | quote }}
BK_CI_HTTPS_PORT: {{ .Values.config.bkCiHttpsPort | quote }}
BK_CI_GATEWAY_REGION_NAME: {{ .Values.config.bkCiGatewayRegionName | quote }}
BK_CI_ENV: {{ .Values.config.bkCiEnv | quote }}
BK_CI_DATA_DIR: {{ .Values.config.bkCiDataDir | quote }}
BK_CI_HOME: {{ .Values.config.bkCiHome | quote }}
BK_CODECC_HOME: {{ .Values.config.bkCodeccHome | quote }}
BK_HTTP_SCHEMA: {{ .Values.config.bkHttpSchema | quote }}
BK_PAAS_FQDN: {{ .Values.config.bkPaasFqdn | quote }}
BK_PAAS_HTTPS_PORT: {{ .Values.config.bkPaasHttpsPort | quote }}
BK_CI_PAAS_LOGIN_URL: {{ .Values.config.bkCiPaasLoginUrl | quote }}
BK_CI_GATEWAY_CORS_ALLOW_LIST: {{ .Values.config.bkCiGatewayCorsAllowList | quote }}
BK_CI_CONSUL_IP: {{ .Values.config.bkCiConsulIp | quote }}
BK_CI_CONSUL_DNS_PORT: {{ .Values.config.bkCiConsulDnsPort | quote }}
BK_CI_CONSUL_HTTP_PORT: {{ .Values.config.bkCiConsulHttpPort | quote }}
BK_CI_CONSUL_DOMAIN: {{ .Values.config.bkCiConsulDomain | quote }}
BK_CI_CONSUL_DISCOVERY_TAG: {{ .Release.Namespace }}
BK_CI_PAASCI_FQDN: {{ .Values.config.bkCiPaasciFqdn | quote }}
BK_CI_JOB_FQDN: {{ .Values.config.bkCiJobFqdn | quote }}
BK_CI_REDIS_HOST: {{ if eq .Values.redis.enabled true }}{{ printf "%s.%s.%s" (include "bkci.redisHost" .) .Release.Namespace "svc.cluster.local" | quote}}{{ else }}{{ include "bkci.redisHost" . }}{{ end }}
BK_CI_REDIS_PORT: {{ include "bkci.redisPort" . | quote }}
BK_CI_REDIS_PASSWORD: {{ include "bkci.redisPassword" . }}
BK_CI_REDIS_DB: {{ .Values.config.bkCiRedisDb | quote }}
BK_CI_REDIS_SSL: {{ .Values.config.bkCiRedisSsl | quote }}
BK_SSM_HOST: {{ .Values.config.bkSsmHost | quote }}
BK_CI_IAM_ENV: {{ .Values.config.bkCiIamEnv | quote }}
BK_SSM_PORT: {{ .Values.config.bkSsmPort | quote }}
BK_CI_GATEWAY_SSM_TOKEN_URL: {{ .Values.config.bkCiGatewaySsmTokenUrl | quote }}
BK_CI_APP_CODE: {{ .Values.config.bkCiAppCode | quote }}
BK_CI_APP_TOKEN: {{ .Values.config.bkCiAppToken | quote }}
BK_ESB_ENABLED: {{ .Values.config.bkEsbEnabled | quote }}
BK_ESB_HOST: {{ .Values.config.bkEsbHost | quote }}
BK_CI_JFROG_HTTP_PORT: {{ .Values.config.bkCiJfrogHttpPort | quote }}
BK_CI_DOCKER_PORT: {{ .Values.config.bkCiDockerPort | quote }}
BK_CI_JFROG_FQDN: {{ .Values.config.bkCiJfrogFqdn | quote }}
BK_CI_JFROG_USER: {{ .Values.config.bkCiJfrogUser | quote }}
BK_CI_JFROG_PASSWORD: {{ .Values.config.bkCiJfrogPassword | quote }}
BK_CI_ARTIFACTORY_REALM: {{ .Values.config.bkCiArtifactoryRealm | quote }}
BK_CI_INFLUXDB_HOST: {{ if eq .Values.influxdb.enabled true }}{{ printf "%s.%s.%s" (include "bkci.influxdbHost" .) .Release.Namespace "svc.cluster.local" | quote}}{{ else }}{{ include "bkci.influxdbHost" . }}{{ end }}
BK_CI_INFLUXDB_PORT: {{ include "bkci.influxdbPort" . | quote }}
BK_CI_INFLUXDB_DB: {{ .Values.config.bkCiInfluxdbDb | quote }}
BK_CI_INFLUXDB_USER: {{ include "bkci.influxdbUsername" . }}
BK_CI_INFLUXDB_PASSWORD: {{ include "bkci.influxdbPassword" . }}
BK_REPO_FQDN: {{ .Values.config.bkRepoFqdn | quote }}
BK_CI_BKREPO_AUTHORIZATION: {{ .Values.config.bkCiBkrepoAuthorization | quote }}
BK_REPO_GATEWAY_IP: {{ .Values.config.bkRepoGatewayIp | quote }}
BK_CI_GATEWAY_DNS_ADDR: {{ .Values.config.bkCiGatewayDnsAddr | quote }}
BK_CI_FRONTEND_INDEX: {{ .Values.config.bkCiFrontendIndex | quote }}
BK_CI_PUBLIC_PATH: {{ .Values.config.bkCiPublicPath | quote }}
BK_CODECC_PUBLIC_URL: {{ .Values.config.bkCodeccPublicUrl | quote }}
BK_CI_PUBLIC_URL: {{ .Values.config.bkCiPublicUrl | quote }}
BK_PAAS_PUBLIC_URL: {{ .Values.config.bkPaasPublicUrl | quote }}
BK_CI_DOCS_URL: {{ .Values.config.bkCiDocsUrl | quote }}
BK_CI_INIT_LOCALE: {{ .Values.config.bkCiInitLocale | quote }}
BK_CI_VERSION: {{ .Chart.AppVersion }}
BK_DOMAIN: {{ .Values.config.bkDomain | quote }}
BK_PAAS_PRIVATE_URL: {{ .Values.config.bkPaasPrivateUrl | quote }}
BK_SHARED_RES_URL: {{ .Values.config.bkSharedResUrl | quote }}
BK_CI_IAM_URL_PREFIX: {{ .Values.config.bkCiIamUrlPrefix | quote }}
BK_REPO_HOST: {{ .Values.config.bkRepoHost | quote }}
BK_CI_BADGE_URL: {{ .Values.config.bkCiBadgeUrl | quote }}
BK_REPO_PAAS_FQDN: {{ .Values.config.bkRepoPaasFqdn | quote }}
BK_REPO_PAAS_LOGIN_URL: {{ .Values.config.bkRepoPaasLoginUrl | quote }}
NAMESPACE: {{ .Release.Namespace }}
CHART_NAME: {{ include "bkci.names.fullname" . }}
{{ end }}