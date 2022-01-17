# 镜像加速

## Linux

修改 `/etc/docker/daemon.json` 文件，在 `registry-mirrors` 中加入镜像市场：

```bash
{
  "registry-mirrors": [
    "http://f1361db2.m.daocloud.io"
  ]
}
```

重启 Docker 服务

```bash
sudo systemctl daemon-reload
sudo systemctl restart docker
```

执行 `info` 指令可以检查配置是否生效：

```bash
docker info
```

在输出中找到 `Registry`：

```bash
Server:
  Registry: http://f1361db2.m.daocloud.io
```