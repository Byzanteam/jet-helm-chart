# jet-helm-chart

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A jet helm chart

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| YangKe | <yangke@jet.work> |  |

## Source Code

* <https://github.com/Byzanteam/jet-helm-chart>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | jetdb(postgresql) | 12.5.7 |
| https://charts.bitnami.com/bitnami | dynamicdb(postgresql) | 12.5.7 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| nameOverride | string | `""` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| nodeSelector | object | `{}` |  |
| tolerations | list | `[]` |  |
| affinity | object | `{}` |  |
| projectMan.image.pullPolicy | string | `"IfNotPresent"` |  |
| projectMan.image.repository | string | `"jet/project_man"` |  |
| projectMan.image.tag | string | `"latest"` |  |
| projectMan.service.name | string | `"project-man"` |  |
| projectMan.service.port | int | `50051` |  |
| projectMan.service.type | string | `"ClusterIP"` |  |
| breeze.image.pullPolicy | string | `"IfNotPresent"` |  |
| breeze.image.repository | string | `"jet/breeze"` |  |
| breeze.image.tag | string | `"latest"` |  |
| breeze.service.name | string | `"breeze"` |  |
| breeze.service.port | int | `50052` |  |
| breeze.service.type | string | `"ClusterIP"` |  |
| traceAware.image.pullPolicy | string | `"IfNotPresent"` |  |
| traceAware.image.repository | string | `"jet/trace_aware"` |  |
| traceAware.image.tag | string | `"latest"` |  |
| traceAware.service.name | string | `"trace-aware"` |  |
| traceAware.service.port | int | `80` |  |
| traceAware.service.type | string | `"ClusterIP"` |  |
| registry | string | `"registry.cn-hangzhou.aliyuncs.com"` |  |
| imagePullSecret.existImageSecrets | string | `""` |  |
| imagePullSecret.imageCredentials | object | `{}` |  |
| env.BREEZE_GRPC_ADDRESS | string | `"breeze:50052"` | Breeze 服务地址（`<host>:<port>`） |
| env.CREDENTIAL_SECRET | string | `""` | 用于加密应用数据库密码的密钥（`openssl rand -base64 48`） |
| env.DYNAMIC_REPO_DATABASE | string | `"dynamic_prod"` | 项目数据库名称 |
| env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据对外时的端口号 |
| env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库主机名 |
| env.DYNAMIC_REPO_PASSWORD | string | `"changeit"` | 项目数据库密码 |
| env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| env.JET_API_ENDPOINT | string | `"http://jet-project-man/api/plugin"` | Jet 为插件提供的服务地址 (`<schema>://<host>:<port>/api/plugin`) |
| env.JET_JWT_PRIVATE_KEY | string | `""` | Jet 用于签名 JWT 的 RSA 私钥 |
| env.PROJECT_MAN_DATABASE_URL | string | `"ecto://postgres:changeit@jet-postgresql/project_man_prod"` | Jet 数据库连接地址（格式：`ecto://USER:PASS@HOST/DATABASE`，[参考](https://hexdocs.pm/ecto/3.9.4/Ecto.Repo.html#module-urls)） |
| env.PROJECT_MAN_GRPC_SERVER_PORT | string | `"50051"` | GRPC 服务监听的端口号 |
| env.RELEASE_COOKIE | string | `"cookie"` |  |
| env.RELEASE_NODE | string | `"sname"` |  |
| env.SECRET_KEY_BASE | string | `""` | Phoenix 用于生成会话密码的密钥 |
| env.TRACE_AWARE_DATABASE_URL | string | `"ecto://postgres:changeit@jet-postgresql/trace_aware_prod"` | Trace Aware 数据库连接地址（格式：`ecto://USER:PASS@HOST/DATABASE`，[参考](https://hexdocs.pm/ecto/3.9.4/Ecto.Repo.html#module-urls)） |
| env.TRACE_AWARE_GRPC_SERVER_PORT | string | `"80"` | Trace Aware GRPC 服务监听的端口号 |
| jetHosts | list | `[]` | jet 的访问地址 |
| jetTLS | object | `{}` | tls 证书 |
| middlewares.corsSettings | object | `{}` | 跨域配置 |
| middlewares.jetSubpath | string | `""` | jet 子路径 |
| backup | object | `{}` | 数据库备份设置 |
| jetdb.auth.postgresPassword | string | `"changeit"` | postgres 用户密码设置 |
| jetdb.enabled | bool | `false` | 是否部署 jetdb 数据库 |
| jetdb.primary.extendedConfiguration | string | `""` | 扩展 PostgreSQL 主配置（附加到主配置或默认配置） |
| jetdb.primary.initdb.password | string | `"changeit"` | 指定 PostgreSQL 密码以执行 initdb 脚本 |
| jetdb.primary.initdb.scripts | string | `{}` | initdb 脚本字典 |
| jetdb.primary.persistence.enabled | bool | `false` | 使用PVC启用PostgreSQL主数据持久化 |
| jetdb.primary.pgHbaConfiguration | string | `""` | PostgreSQL 主客户端身份验证配置 |
| jetdb.shmVolume.sizeLimit | string | `"5Gi"` | 设置此项以启用 shm tmpfs 的大小限制 |
| dynamicdb.auth.postgresPassword | string | `"changeit"` | postgres 用户密码设置 |
| dynamicdb.enabled | bool | `false` | 是否部署 dynamicdb 数据库 |
| dynamicdb.primary.extendedConfiguration | string | `""` | 扩展 PostgreSQL 主配置（附加到主配置或默认配置） |
| dynamicdb.primary.initdb.password | string | `"changeit"` | 指定 PostgreSQL 密码以执行 initdb 脚本 |
| dynamicdb.primary.initdb.scripts | string | `{}` | 指定 PostgreSQL 密码以执行 initdb 脚本 |
| dynamicdb.primary.persistence.enabled | bool | `false` | 使用PVC启用PostgreSQL主数据持久化 |
| dynamicdb.primary.pgHbaConfiguration | string | `""` | PostgreSQL 主客户端身份验证配置 |
| dynamicdb.shmVolume.sizeLimit | string | `"5Gi"` | 设置此项以启用 shm tmpfs 的大小限制 |


----------------------------------------------
