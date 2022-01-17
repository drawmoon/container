# 使用镜像

- [查看镜像](#查看镜像)
- [搜索镜像](#搜索镜像)
- [拉取镜像](#拉取镜像)
- [删除和清理镜像](#删除和清理镜像)
- [保存和载入镜像](#保存和载入镜像)
- [导入镜像](#导入镜像)
- [标记镜像](#标记镜像)
- [登录镜像注册中心](#登录镜像注册中心)
- [推送镜像](#推送镜像)

## 查看镜像

### 列出本地镜像

```bash
docker images
```

`-a` 列出所有镜像 \
`-f` 过滤镜像，例如：`-f name=nginx` \
`-q` 仅输出 ID 信息

> 更多命令可以通过 `man docker-images` 查看

### 查看详细信息

```bash
docker inspect nginx
```

### 查看历史记录

```bash
docker history nginx
```

## 搜索镜像

```bash
docker search nginx
```

`-f` 过滤镜像，例如：`-f stars=10` \
`--limit` 限制输出结果个数

## 拉取镜像

```bash
docker pull nginx
```

拉取指定标签的镜像：

```bash
docker pull nginx:stable-alpine
```

## 删除和清理镜像

### 删除镜像

```bash
docker rmi nginx
```

`-f` 强制删除镜像

### 清理镜像

`prune` 可以清理临时镜像和没有被使用过的镜像

```bash
docker image prune
```

`-a` 删除所有无用的镜像 \
`-filter` 过滤镜像 \
`-f` 强制删除镜像

## 保存和载入镜像

### 保存镜像

```bash
docker save -o nginx.tar nginx
```

使用 `>` 保存镜像

```bash
docker save nginx > nginx.tar
```

保存镜像时压缩包的体积

```bash
docker save nginx | gzip > nginx.tar
```

### 载入镜像

```bash
docker load -i nginx.tar
```

使用 `<` 载入镜像

```bash
docker load < nginx.tar
```

## 导入镜像

```bash
docker import nginx.tar nginx
```

## 标记镜像

```bash
docker tag nginx nginx:custom
```

## 登录镜像注册中心

```bash
docker login
```

登录到指定镜像注册中心：

```bash
docker login http://192.168.10.229
```

`-u` 指定账号 \
`-p` 指定密码

```bash
docker login http://192.168.10.229 -u admin -p 123456
```

## 推送镜像

```bash
docker push drawmoon/nginx
```