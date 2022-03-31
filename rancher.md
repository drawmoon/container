# Rancher

- [配置私有镜像注册中心](#配置私有镜像注册中心)

## 配置私有镜像注册中心

在 Rancher 容器中 `/etc/rancher/k3s/` 目录下创建 `registries.yaml` 文件，例如：

```yaml
mirrors:
  "192.168.10.229":
    endpoint:
      - "http://192.168.10.229"
```

### 配置认证信息

```yaml
...
configs:
  "192.168.10.229":
  auth:
    username: admin
    password: 123456
```

使用 TLS

```yaml
...
configs:
  "192.168.10.229":
  auth:
    username: admin
    password: 123456
  tls:
    cert_file: /cert_file
    key_file: /key_file
    ca_file: /ca_file
```