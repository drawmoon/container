# 操作容器

- [查看容器](#查看容器)
- [创建容器](#创建容器)
- [停止容器](#停止容器)
- [删除和清理容器](#删除和清理容器)
- [查看容器运行日志](#查看容器运行日志)
- [进入容器](#进入容器)
- [导出容器](#导出容器)
- [将容器保存为新的镜像](#将容器保存为新的镜像)
- [拷贝容器中的文件](#拷贝容器中的文件)
- [更新容器的配置](#更新容器的配置)

## 查看容器

### 列出所有容器

```bash
docker ps
```

`-a` 包含终止的容器 \
`-q` 仅输出 ID 信息

### 查看容器详情

```bash
docker container inspect some-nginx
```

### 查看容器内进程

指令效果与 Linux 下 `top` 命令类似，包括 PID 等信息

```bash
docker top some-nginx
```

### 查看统计信息

通过 `stats` 指令可查看容器的 CPU、内存、存储、网络等情况的统计信息

```bash
docker stats some-nginx
```

## 创建容器

### 新建容器

```bash
docker create nginx
```

`-p` 指定端口映射，映射一个端口到内部容器开放的网络端口，例如：`-p 3000:3000` \
`--name` 指定容器的名称，例如：`--name some-nginx` \
`-d` 标记容器为后台运行 \
`-e` 指定环境变量，例如：`-e ENV=xxx` \
`-it` 以交互模式运行容器，例如：`-it nginx bash`
`--entrypoint` 镜像指定了 `ENTRYPOINT` 时，覆盖入口命令，例如：`-it --entrypoint bash nginx` \
`-v` 挂载主机上的文件卷到容器内，例如：`-v /conf/nginx.conf:/etc/nginx/nginx.conf` \
`--restart` 指定容器退出时的重新启动策略，分别为：`no`、`always` 和 `on-failure`，例如：`--restart=always`

> Windows 下挂载文件卷：`-v //D/nginx.conf:/etc/nginx/nginx.conf`

### 启动容器

```bash
docker start some-nginx
```

### 新建并启动容器

```bash
docker run nginx
```

> `run` 命令实际上是执行了 `create` 和 `start` 命令， 在执行 `run` 命令时，同样也可以使用 `create` 的子命令。

### 重新启动容器

```bash
docker restart some-nginx
```

## 停止容器

### 暂停容器

```bash
docker pause some-nginx
```

### 终止容器

```bash
docker stop some-nginx
```

## 删除和清理容器

### 删除容器

```bash
docker rm some-nginx
```

`-f` 强制删除 \
`-l` 删除容器的连接，但不会删除容器 \
`-v` 删除容器挂载的数据卷

### 清理容器

```bash
docker container prune
```

## 查看容器运行日志

```bash
docker logs some-nginx
```

`-f` 监听容器的输出

## 进入容器

### attach 指令

```bash
docker attach some-nginx
```

`--detach-keys` 指定退出 `attach` 的快捷键，默认是 `Ctrl p Ctrl q`

### exec 指令

`exec` 是比 `attach` 更方便的指令，可以在不影响容器内的应用情况下，打开一个新的交互界面

```bash
docker exec -it some-nginx bash
```

`-d` 在容器中后台执行命令 \
`-e` 指定环境变量 \
`-it` 以交互模式进入容器 \
`-u` 设置执行命令的用户 \
`--privileged` 分配最高权限，例如：`--privileged=true` \
`--detach-keys` 指定退出 `exec` 的快捷键

## 导出容器

导出后的本地文件，再次通过 `import` 导入为新的镜像，相比 `save`，`export` 指令只会导出当时容器的状态，不包含元数据和历史记录信息

```bash
docker export -o nginx.tar some-nginx
```

使用 `>` 导出容器

```bash
docker export some-nginx > nginx.tar
```

## 将容器保存为新的镜像

```bash
docker commit some-nginx drawmoon/nginx
```

`-m` 可以指定信息，例如：`-m "Commit Message"`

## 拷贝容器中的文件

```bash
docker cp some-nginx:/app/myapp .
```

## 更新容器的配置

```bash
docker update --restart=always some-nginx
```