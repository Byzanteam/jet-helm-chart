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
| https://charts.bitnami.com/bitnami | projectmandb(postgresql) | 12.5.7 |
| https://charts.bitnami.com/bitnami | dynamicdb(postgresql) | 12.5.7 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| fullnameOverride | string | `""` |  |
| nameOverride | string | `""` |  |
| global.existingSecret.name | string | `jet-env-secret` |  |
| global.existingSecret.keys[0] | string | `"credential_secret"` |  |
| global.existingSecret.keys[1] | string | `"jet_jwt_private_key"` |  |
| global.existingSecret.keys[2] | string | `"secret_key_base"` |  |
| global.existingSecret.keys[3] | string | `"trace_aware_database_url"` |  |
| global.existingSecret.keys[4] | string | `"project_man_database_url"` |  |
| global.dynamicdb.database | string | `dynamic_prod` |  |
| image.registry | string | `"registry.cn-hangzhou.aliyuncs.com"` | 镜像仓库地址  |
| image.existImageSecrets | string | `""` | 已存在的镜像拉取凭证 secret |
| projectMan.image.pullPolicy | string | `"IfNotPresent"` | 镜像拉取策略  |
| projectMan.image.repository | string | `"jet/project_man"` |  |
| projectMan.image.tag | string | `"latest"` |  |
| projectMan.env.RELEASE_COOKIE | string | `"cookie"` |  |
| projectMan.env.RELEASE_NODE | string | `"sname"` |  |
| projectMan.env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| projectMan.env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| projectMan.env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据库对外时的端口 |
| projectMan.env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库的主机名 |
| projectMan.env.DYNAMIC_REPO_DATABASE | string | `"{{ .Values.global.dynamicdb.database }}"` | 项目数据库名 |
| projectMan.replicaCount | int | `1` |  |
| projectMan.resources | object | `{}` |  |
| projectMan.nodeSelector | object | `{}` |  |
| projectMan.tolerations | list | `[]` |  |
| projectMan.affinity | object | `{}` |  |
| projectMan.service.name | string | `"project-man"` |  |
| projectMan.service.port | int | `50051` |  |
| projectMan.service.type | string | `"ClusterIP"` |  |
| breeze.image.pullPolicy | string | `"IfNotPresent"` |  |
| breeze.image.repository | string | `"jet/breeze"` |  |
| breeze.image.tag | string | `"latest"` |  |
| breeze.service.name | string | `"breeze"` |  |
| breeze.service.port | int | `50052` |  |
| breeze.service.type | string | `"ClusterIP"` |  |
| breeze.replicaCount | int | `1` |  |
| breeze.resources | object | `{}` |  |
| breeze.nodeSelector | object | `{}` |  |
| breeze.tolerations | list | `[]` |  |
| breeze.affinity | object | `{}` |  |
| breeze.env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| breeze.env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| breeze.env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据库对外时的端口 |
| breeze.env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库的主机名 |
| breeze.env.DYNAMIC_REPO_DATABASE | string | `"{{ .Values.global.dynamicdb.database }}"` | 项目数据库名 |
| traceAware.image.pullPolicy | string | `"IfNotPresent"` |  |
| traceAware.image.repository | string | `"jet/trace_aware"` |  |
| traceAware.image.tag | string | `"latest"` |  |
| traceAware.env.DYNAMIC_REPO_EXPOSED_HOSTNAME | string | `"dynamic_prod"` | 项目数据库对外时的主机名 |
| traceAware.env.DYNAMIC_REPO_USERNAME | string | `"postgres"` | 项目数据库用户名 |
| traceAware.env.DYNAMIC_REPO_EXPOSED_PORT | string | `"5432"` | 项目数据库对外时的端口 |
| traceAware.env.DYNAMIC_REPO_HOSTNAME | string | `"dynamic-postgresql"` | 项目数据库的主机名 |
| traceAware.env.DYNAMIC_REPO_DATABASE | string | `"{{ .Values.global.dynamicdb.database }}"` | 项目数据库名 |
| traceAware.replicaCount | int | `1` |  |
| traceAware.resources | object | `{}` |  |
| traceAware.nodeSelector | object | `{}` |  |
| traceAware.tolerations | list | `[]` |  |
| traceAware.affinity | object | `{}` |  |
| traceAware.service.name | string | `"trace-aware"` |  |
| traceAware.service.port | int | `80` |  |
| traceAware.service.type | string | `"ClusterIP"` |  |
| hosts | list | `[]` | jet 的访问地址 |
| certificate | object | `{}` | tls 证书 |
| ingressroute.subpath | string | `""` | jet 子路径 |
| ingressroute.middlewares.corsSettings | object | `{}` | 跨域配置 |
| backup | object | `{}` | 数据库备份设置 |
| projectmandb.enabled | bool | `false` | 是否部署 projectmandb 数据库 |
| projectmandb.primary.extendedConfiguration | string | `""` | 扩展 PostgreSQL 主配置（附加到主配置或默认配置） |
| projectmandb.primary.initdb.scripts | string | `{}` | initdb 脚本字典 |
| projectmandb.primary.persistence.enabled | bool | `false` | 使用PVC启用PostgreSQL主数据持久化 |
| projectmandb.primary.pgHbaConfiguration | string | `""` | PostgreSQL 主客户端身份验证配置 |
| projectmandb.shmVolume.sizeLimit | string | `"5Gi"` | 设置此项以启用 shm tmpfs 的大小限制 |
| dynamicdb.enabled | bool | `false` | 是否部署 dynamicdb 数据库 |
| dynamicdb.primary.extendedConfiguration | string | `""` | 扩展 PostgreSQL 主配置（附加到主配置或默认配置） |
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
image:  
  # 使用已存在的仓库凭证
  existImageSecrets: ""
```

> [创建镜像拉取凭证说明](https://kubernetes.io/docs/concepts/configuration/secret/#docker-config-secrets)

### 3. 设置 secret 参数

手动创建 secret 资源存储环境变量信息
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: jet-env-secret
  namespace: # 与 jet 应用同一个 namespace
type: Opaque
data:
  credential_secret: Z0JnTjZGNDE4M0xYS0ZiaUU1OUsvenErVnVYMW0zeDJjZjFscnkrVEVkZmxFM2k0SWpVWUdPYk9sbXlLbTJPcA==
  jet_jwt_private_key: LS0tLS1CRUdJTiBQUklWQVRFIEtFWS0tLS0tCklJQ2RnSUJBREFOQmdrcWhraUc5dzBCQVFFRkFBU0NBbUF3Z2dKY0FnRUFBb0dCQU1EeHJ2dCt3aG9iVGZ6eAoxd1NHZmZwTk1mT0ExRUNlT3J3MHRDUzRCRUJLVTZqVXBac1dQUDFDcHlPNGpLQzQvVWJrZkd2eXo1R2MzK0cKbWFndGNjQW9yanZHNGhtZ05iU0ZOYkQ4OUJxVUQ2a0E3UzF3S0hLQ0szQ0xyZnp1SGR1NHlSbVhjT3E4Z2llCllDaGR6cXlrMjRjRnc2YndjbGEwYSszb0VGM0FnTUJBQUVDZ1lBeHBmOUE5LzA2ZW93MjZvWnZTcmtqOGY2Qwo2QXUyRlFGSUxNZXVLeXZzM3pObjNsQSsrQm41a1kwd3creHI3eTQ5Yjg0VWVRYXdrWTJLbS8rdUp3Tmh0aUMKRk9LemFOSnZBTDVmSnlQTUQvQ2JFZCtTWFVMMjd2b1FFaGtISTduamQrTVFxTHJpQWl2NDM5Sno4VkNaUTZHCjdIUmpPdVBkUjd4WFU2ckFRSkJBT0ZZUGdwaUxBZDY1cSs4aEx4OG5tUm03UmFKdFBOdWVHSW9ZaU85TURwYQp4TERRU01FbnlTeHQyUEgwRXBiUThyUWdmTE9EaEQ2b05PZ1NtMCtYZ1VDUVFEYk1SSXlsMDg4empTalhkTEQKKzlIUTJOWDVEalNpeWlxVHYxMzBLeVJQbW1NRzVyWnRMempzcGh6MU0yK1dXR2VKMDA0ZGduS2RSNVJEZFlMCjc1TEFrQnQ1SEtjN2JNN0VweGRKem8wRVRITkZNU2FNUjJsZVVJTDNGVy95QXMwNmcrMS9ySk5PWHZDa1VnMQpNT3kvejdZTVVhdCtmNnlHUWRGTE80ZXlFTmhBa0VBdDc4RUxVcndqdDJoL00xYk1NV1lxZG5RL3MzLzRHZnQKQTlOcGxKVlI1RFZkREZ6OTBydkNjWWV6UU00MG5nbFFDcGNMcGV0RDM1c3dxL2hub01TendKQVlpQ25UeUVWCjVxTnZaNkZKWkNlK2l4TWo4L0ZXVlBFNlFLcHpBMFl3VndUeVB1MnRzSDFMRXowVW1zTUozV0dvZENtUDB2YgpHSWZyL2l5WHMxbDRnPT0KLS0tLUVORCBQUklWQVRFIEtFWS0tLS0tCg==
  secret_key_base: U2w3eW0va0RteEw3bWNaemtZN1MvekxFUDlZYmtwNGFxVG5FL0JvSFFmc0dBd25LcVFhS2Z5eldQczRwQWViVQ==
  trace_aware_database_url: ZWN0bzovL3Bvc3RncmVzOmZhOTllMjRlNDkyYWY4ODU2ZjAxQGpldC1wb3N0Z3Jlc3FsL3RyYWNlX2F3YXJlX3Byb2Q=
  project_man_database_url: ZWN0bzovL3Bvc3RncmVzOmZhOTllMjRlNDkyYWY4ODU2ZjAxQGpldC1wb3N0Z3Jlc3FsL3Byb2plY3RfbWFuX3Byb2Q=
  project-man-password: ZmE5OWUyNGU0OTJhZjg4NTZmMDE=
  dynamicdb-password: N2YxMDI0N2VmMjg4MzY1YWNmOWI=
```
> 参数解释如下：
> ```yaml
> # 用于加密应用数据库密码的密钥（`openssl rand -base64 48`）
> credential_secret: ""
> # 项目数据库密码
> dynamicdb-password: ""
> # Jet 用于签名 JWT 的 RSA 私钥
> jet_jwt_private_key: ""
> # Phoenix 用于生成会话密码的密钥
> secret_key_base: ""
> # Trace Aware 数据库连接地址,格式：ecto://USER:PASS@HOST/DATABASE
> trace_aware_database_url: ""
> # Jet 数据库连接地址,格式：ecto://USER:PASS@HOST/DATABASE
> project_man_database_url: ""
> ```
> :warning: 使用 base64 编码后填入 secret 资源文件对应 key 中

### 4. 设置环境变量

```yaml
# 设置项目数据库的数据库名
global:
  dynamicdb:
    database: dynamic_prod

projectMan:
  env:
    RELEASE_NODE: sname
    RELEASE_COOKIE: cookie
    # 项目数据库对外时的主机名
    DYNAMIC_REPO_EXPOSED_HOSTNAME: dynamic_prod
    # 项目数据库用户名
    DYNAMIC_REPO_USERNAME: postgres
    # 项目数据库端口
    DYNAMIC_REPO_EXPOSED_PORT: "5432"
    # 项目数据库的主机名
    DYNAMIC_REPO_HOSTNAME: dynamic-postgresql

breeze:
  env:
    # 项目数据库对外时的主机名
    DYNAMIC_REPO_EXPOSED_HOSTNAME: dynamic_prod
    # 项目数据库用户名
    DYNAMIC_REPO_USERNAME: postgres
    # 项目数据库端口
    DYNAMIC_REPO_EXPOSED_PORT: "5432"
    # 项目数据库的主机名
    DYNAMIC_REPO_HOSTNAME: dynamic-postgresql
traceAware:
  env:
    # 项目数据库对外时的主机名
    DYNAMIC_REPO_EXPOSED_HOSTNAME: dynamic_prod
    # 项目数据库用户名
    DYNAMIC_REPO_USERNAME: postgres
    # 项目数据库端口
    DYNAMIC_REPO_EXPOSED_PORT: "5432"
    # 项目数据库的主机名
    DYNAMIC_REPO_HOSTNAME: dynamic-postgresql
```

### 5. 设置访问的 `hosts`

```yaml
hosts:
  - example.jet.com
  - 10.0.0.1
```

### 6. 设置 TLS 证书

```yaml
certificate:
  # 使用证书挑战
  certResolver: jet
  
  # 使用已有证书 secret 资源
  tlsSecretName: ""
```

> TLS 证书设置其中一个参数即可

## Misc

### 1. 数据库依赖配置

- 启用数据库前手动添加数据库依赖的 secrets

  ```yaml
  apiVersion: v1
  kind: Secret
  metadata:
    name: jet-env-secret
    namespace: # 与 jet 应用同一个 namespace
  type: Opaque
  data:
    project-man-password: ZmE5OWUyNGU0OTJhZjg4NTZmMDE=
  ```
  
  > :warning: 使用 base64 编码密码后设置给对应的 `project-man-password`  变量
  
- 设置数据库启用与数据持久化

  ```yaml
  projectmandb:
    enabled: true
    persistence:
       enabled: true
       existingClaim: # 创建好的 PVC 名称
  dynamicdb:
    enabled: true
    persistence:
       enabled: true
       existingClaim: # 创建好的 PVC 名称
  ```

> :warning:[数据库详细配置](https://github.com/bitnami/charts/tree/main/bitnami/postgresql#parameters)

### 2. 应用跨域设置

```yaml
ingressroute:
  middlewares:
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
ingressroute:
  subpath: /jet
```
