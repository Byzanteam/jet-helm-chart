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
| breeze.env.BREEZE_GRPC_ADDRESS | string | `"breeze:50052"` | Breeze 服务地址（`<host>:<port>`） |
| breeze.env.DYNAMIC_REPO_DATABASE | string | `"dynamic_prod"` | 项目数据库名称 |
| breeze.env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| breeze.env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据对外时的端口号 |
| breeze.env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库主机名 |
| breeze.env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| breeze.env.JET_API_ENDPOINT | string | `"http://jet-project-man/api/plugin"` | Jet 为插件提供的服务地址 (`<schema>://<host>:<port>/api/plugin`) |
| breeze.env.PROJECT_MAN_GRPC_SERVER_PORT | string | `"50051"` | GRPC 服务监听的端口号 |
| breeze.env.RELEASE_COOKIE | string | `"cookie"` |  |
| breeze.env.RELEASE_NODE | string | `"sname"` |  |
| breeze.env.TRACE_AWARE_GRPC_SERVER_PORT | string | `"80"` | Trace Aware GRPC 服务监听的端口号 |
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
| env.DYNAMIC_REPO_DATABASE | string | `"dynamic_prod"` | 项目数据库名称 |
| env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据对外时的端口号 |
| env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库主机名 |
| env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| env.JET_API_ENDPOINT | string | `"http://jet-project-man/api/plugin"` | Jet 为插件提供的服务地址 (`<schema>://<host>:<port>/api/plugin`) |
| env.PROJECT_MAN_GRPC_SERVER_PORT | string | `"50051"` | GRPC 服务监听的端口号 |
| env.RELEASE_COOKIE | string | `"cookie"` |  |
| env.RELEASE_NODE | string | `"sname"` |  |
| env.TRACE_AWARE_GRPC_SERVER_PORT | string | `"80"` | Trace Aware GRPC 服务监听的端口号 |
| secret.credential_secret | string | `""` | 用于加密应用数据库密码的密钥（`openssl rand -base64 48`） |
| secret.dynamic_repo_password | string | `"changeit"` | 项目数据库密码 |
| secret.jet_jwt_private_key | string | `""` | Jet 用于签名 JWT 的 RSA 私钥 |
| secret.secret_key_base | string | `""` | Phoenix 用于生成会话密码的密钥 |
| secret.project_man_database_url | string | `"ecto://postgres:changeit@jet-postgresql/project_man_prod"` | Jet 数据库连接地址（格式：`ecto://USER:PASS@HOST/DATABASE`，[参考](https://hexdocs.pm/ecto/3.9.4/Ecto.Repo.html#module-urls)） |
| secret.trace_aware_database_url | string | `"ecto://postgres:changeit@jet-postgresql/trace_aware_prod"` | Trace Aware 数据库连接地址（格式：`ecto://USER:PASS@HOST/DATABASE`，[参考](https://hexdocs.pm/ecto/3.9.4/Ecto.Repo.html#module-urls)） |
| hosts | list | `[]` | jet 的访问地址 |
| jetTLS | object | `{}` | tls 证书 |
| subpath | string | `""` | jet 子路径 |
| middlewares.corsSettings | object | `{}` | 跨域配置 |
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

## Usage

### Prerequisites

- Helm v3 [installed](https://helm.sh/docs/using_helm/#installing-helm)
- Add `traefik` and `bitnami` repo
- Install `traefik`
- `helm dependency update`

### 使用前请编写 release.values.yaml 文件

### 1. 设置镜像相关信息

```yaml
projectMan:
  image:
    repository: jet/project_man
    pullPolicy: IfNotPresent
    tag: "latest"
breeze:
  image:
    repository: jet/breeze
    pullPolicy: IfNotPresent
    tag: "latest"
traceAware:
  image:
    repository: jet/trace_aware
    pullPolicy: IfNotPresent
    tag: "latest"
```

### 2. 设置拉取镜像凭证

```yaml
imageCredentials:
  # 设置仓库用户与密码
  username: deploy-man@skylark
  password: changeit
  
  # 使用已存在的仓库凭证
  existImageSecrets: ""
```

> 镜像拉取凭证使用已有凭证与新建凭证设置一个即可

### 3. 设置 secret 参数

```yaml
# 用于加密应用数据库密码的密钥（`openssl rand -base64 48`）
credential_secret: ""
# 项目数据库密码
dynamic_repo_password: ""
# Jet 用于签名 JWT 的 RSA 私钥
jet_jwt_private_key: ""
# Phoenix 用于生成会话密码的密钥
secret_key_base: ""
# Trace Aware 数据库连接地址,格式：ecto://USER:PASS@HOST/DATABASE
trace_aware_database_url: ""
# Jet 数据库连接地址,格式：ecto://USER:PASS@HOST/DATABASE
project_man_database_url: ""
```

### 4. 设置环境变量

```yaml
env:
  RELEASE_NODE: sname
  RELEASE_COOKIE: cookie
  # GRPC 服务监听的端口号
  PROJECT_MAN_GRPC_SERVER_PORT: "50051"
  # 项目数据库主机名
  DYNAMIC_REPO_HOSTNAME: dynamic-postgresql
  # 项目数据库用户名
  DYNAMIC_REPO_USERNAME: postgres
  # 项目数据库名称
  DYNAMIC_REPO_DATABASE: dynamic_prod
  # 项目数据库对外时的主机名
  DYNAMIC_REPO_EXPOSED_HOSTNAME: dynamic_prod
  # 项目数据对外时的端口号
  DYNAMIC_REPO_EXPOSED_PORT: "5432"
  # Breeze 服务地址（<host>:<port>）
  BREEZE_GRPC_ADDRESS: breeze:50052
  JET_API_ENDPOINT: http://jet/api/plugin
  # Trace Aware GRPC 服务监听的端口号
  TRACE_AWARE_GRPC_SERVER_PORT: "80"
# breeze 环境变量
breeze:
  env:
    ...
```

### 5. 设置访问的 `hosts`

```yaml
hosts:
  - example.jet.com
  - 10.0.0.1
```

### 6. 设置 TLS 证书

```yaml
jetTLS:
  # 使用证书挑战
  certResolver: jet
  
  # 使用已有证书 secret 资源
  tlsSecretName: ""
```

> TLS 证书设置其中一个参数即可

## Misc

### 1. 数据库依赖启用

```yaml
jetdb:
  enabled: true
dynamicdb:
  enabled: true
```

> ❗️[数据库详细配置](https://github.com/bitnami/charts/tree/main/bitnami/postgresql#parameters)

### 2. 应用跨域设置

```yaml
corsSettings:
  accessControlAllowHeaders:
    - '*'
  accessControlAllowMethods:
    - GET
    - OPTIONS
    - PUT
  accessControlAllowOriginList:
    - '*'
  accessControlMaxAge: "100"
```

### 3. 备份设置

```yaml
# 使用velero备份数据库
backup:
  # 设置数据库的自动备份。格式为“分、时、日、月、周”。
  veleroSchedule: "0 1 * * *"
  # 设置需要备份的名称空间。
  includeNamespaces:
    - production
    - database
    - ...
  # 指定需要备份的应用程序的标签。
  selector:
    app.kubernetes.io/instance: postgresql
  # [可选参数]指定备份的存储位置。
  storageLocation: backup
  # 设置备份的生存时间(ttl)。
  ttl: "720h0m0s"
```

### 4. backup operation guide
- 根据 `schedule` 创建备份
```bash
velero create backup $backup_name --from-schedule $schedule_name
```
- 列出备份
```bash
velero get backup
```
- 查看备份详情
```bash
velero describe backups $backup_name --details
```
> $backup_name和$schedule_name按实际填写

### 5. Subpath 支持
```yaml
subpath: /jet
```

### 6. 应用跨域设置

```yaml
middleware:
  corsSettings:
    accessControlAllowHeaders:
      - '*'
    accessControlAllowMethods:
      - GET
      - OPTIONS
      - PUT
    accessControlAllowOriginList:
      - '*'
    accessControlMaxAge: "100"
```
