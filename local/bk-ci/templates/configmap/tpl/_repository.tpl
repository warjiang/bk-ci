{{- define "bkci.repository.yaml" -}}
aes:
  git: {{ .Values.config.bkCiRepositoryAesGit | quote }}
repository:
  git:
    devopsGroupName: {{ .Values.config.bkCiRepositoryGitPluginGroupName | quote }}
    devopsPrivateToken: {{ .Values.config.bkCiRepositoryGitPrivateToken | quote }}
scm:
  external:
    github:
      apiUrl: https://api.github.com
      appId: {{ .Values.config.bkCiRepositoryGithubAppid | quote }}
      appName: {{ .Values.config.bkCiRepositoryGithubAppname | quote }}
      appUrl: https://github.com/apps/{{ .Values.config.bkCiRepositoryGithubApp }}
      callbackUrl: {{ .Values.config.bkCiPublicUrl }}/{{ .Values.config.bkCiRepositoryGithubServer }}/api/external/github/oauth/callback
      clientId: {{ .Values.config.bkCiRepositoryGithubClientId | quote }}
      clientSecret: {{ .Values.config.bkCiRepositoryGithubClientSecret | quote }}
      privateKey: {{ .Values.config.bkCiRepositoryGithubPrivatekey | quote }}
      redirectUrl: {{ .Values.config.bkCiPublicUrl }}/console/codelib
      serverUrl: https://github.com
      signSecret: {{ .Values.config.bkCiRepositoryGithubSignSecret | quote }}
    gitlab:
      apiUrl: {{ .Values.config.bkCiRepositoryGitlabUrl }}/api/v4
      gitlabHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/gitlab/commit
    p4:
      p4HookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/p4/commit
    tGit:
      apiUrl: https://git.tencent.com/api/v3
      tGitHookUrl: {{ .Values.config.bkCiPublicUrl }}/ms/process/api/external/scm/codetgit/commit
  git:
    apiUrl: {{ .Values.config.bkCiRepositoryGitUrl }}/api/v3
    clientId: {{ .Values.config.bkCiRepositoryGitClientId | quote }}
    clientSecret: {{ .Values.config.bkCiRepositoryGitClientSecret | quote }}
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
  port: {{ .Values.config.bkCiRepositoryApiPort | quote }}
spring:
  datasource:
    password: {{ include "bkci.mysqlPassword" . }}
    url: jdbc:mysql://{{ include "bkci.mysqlAddr" . }}/devops_ci_repository?useSSL=false&autoReconnect=true&serverTimezone=GMT%2B8&useUnicode=true&characterEncoding=utf8&allowMultiQueries=true&sessionVariables=sql_mode=%27STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION%27
    username: {{ include "bkci.mysqlUsername" . }}
tapd:
  apiUrl: {{ .Values.config.bkCiRepositoryTapdApiUrl | quote }}
  callbackUrl: {{ .Values.config.bkCiPublicUrl }}/repository/api/external/repo/tapd/callback
  clientId: {{ .Values.config.bkCiRepositoryTapdClientId | quote }}
  clientSecret: {{ .Values.config.bkCiRepositoryTapdClientSecret | quote }}
  redirectUrl: {{ .Values.config.bkCiPublicUrl }}/console/
  serverUrl: {{ .Values.config.bkCiRepositoryTapdServerUrl | quote }}
{{ end }}