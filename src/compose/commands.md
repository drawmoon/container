# Compose 命令

- [启动项目](#启动项目)
- [停止项目](#停止项目)
- [列出项目所有的服务](#列出项目所有的服务)
- [查看服务的日志](#查看服务的日志)
- [进入到服务中](#进入到服务中)
- [启动服务](#启动服务)
- [重新启动服务](#重新启动服务)
- [停止正在运行的服务](#停止正在运行的服务)
- [暂停服务](#暂停服务)
- [恢复服务](#恢复服务)
- [删除服务](#删除服务)
- [构建项目](#构建项目)

## 启动项目

自动构建镜像、创建网络、创建并启动服务：

```bash
docker-compose up
```

后台运行：

```bash
docker-compose up -d
```

指定 DockerCompose 配置文件：

```bash
docker-compose -f docker-compose.production.yml up
```

指定服务：

```bash
docker-compose up nginx
```

重新构建：

```bash
docker-compose up --build
```

## 停止项目

停止并删除网络、服务。

```bash
docker-compose down
```

## 列出项目所有的服务

```bash
docker-compose ps
```

## 查看服务的日志

```bash
docker-compose logs nginx
```

`-f` 监听服务的输出

```bash
docker-compose logs nginx -f
```

## 进入到服务中

```bash
docker-compose exec nginx bash
```

## 启动服务

```bash
docker-compose start nginx
```

## 重新启动服务

```bash
docker-compose restart nginx
```

## 停止正在运行的服务

```bash
docker-compose stop nginx
```

## 暂停服务

```bash
docker-compose pause nginx
```

## 恢复服务

```bash
docker-compose unpause nginx
```

## 删除服务

```bash
docker-compose rm nginx
```

## 构建项目

```bash
docker-compose build
```

指定服务

```bash
docker-compose build nginx
```

`--no-cache` 不使用缓存

```bash
docker-compose build --no-cache
```