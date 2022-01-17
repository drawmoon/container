# 使用

- [拉取镜像运行服务](#拉取镜像运行服务)
- [构建镜像运行服务](#构建镜像运行服务)

## 拉取镜像运行服务

编写 `docker-compose.yml` 文件：

```yml
version: "3"
services: 

  nginx:
    image: nginx
    ports:
      - "80:80"
    restart: always
```

运行 DockerCompose 项目：

```bash
docker-compose up
```

## 构建镜像运行服务

编写 `Dockerfile` 文件：

```docker
FROM node:14.18.1 AS build
WORKDIR /source
COPY . .
RUN yarn install \
    && npm run build

FROM node:14.18.1-alpine
WORKDIR /app
COPY --from=build /source/dist .
COPY --from=build /source/node_modules node_modules
ENTRYPOINT [ "node", "main" ]
```

编写 `docker-compose.yml` 文件：

```yml
version: "3"
services: 

  app:
    build: .
    ports:
      - "3000:3000"
    restart: always
```

运行 DockerCompose 项目：

```bash
docker-compose up --build
```