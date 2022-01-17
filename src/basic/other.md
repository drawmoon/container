# 其他命令

- [查看磁盘使用情况](#查看磁盘使用情况)
- [清理磁盘](#清理磁盘)
- [清理镜像](#清理镜像)
- [清理构建缓存](#清理构建缓存)

## 查看磁盘使用情况

```bash
docker system df
```

## 清理磁盘

删除关闭的容器、无用的数据卷、网络和构建缓存

```bash
docker system prune
```

## 清理镜像

```bash
docker image prune
```

`-a` 清理没有在使用的镜像

```bash
docker image prune -a
```

## 清理构建缓存

```bash
docker builder prune
```