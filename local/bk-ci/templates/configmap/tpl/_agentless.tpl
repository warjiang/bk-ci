{{- define "bkci.agentless.yaml" -}}
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
server:
  port: {{ .Values.config.bkCiDockerhostApiPort | quote }}
spring:
  cloud:
    consul:
      discovery:
        enabled: false
        register: false
{{ end }}