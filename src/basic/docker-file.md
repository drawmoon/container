# Dockerfile

- [使用 Dockerfile 构建镜像](#使用-dockerfile-构建镜像)
- [Dockerfile 多阶段构建](#dockerfile-多阶段构建)
- [构建 ASP.NET Core 应用镜像](#构建-aspnet-core-应用镜像)

## 使用 Dockerfile 构建镜像

创建 `Dockerfile` 文件

```docker
FROM node
WORKDIR /app
COPY . .
RUN npm install \
  && npm run build
ENTRYPOINT ["node", "dist/main"]
```

- `FROM`: 指定基础镜像
- `WORKDIR`: 指定工作目录
- `COPY`: 复制文件
- `ADD`: 更高级的复制命令，支持 URL
- `ARG`: 定义构建镜像时使用的变量
- `ENV`: 设置环境变量，示例：`ENV k1=v1 k2=v2`
- `RUN`: 构建镜像时运行的命令
- `EXPOSE`: 指定暴露的端口
- `USER`: 指定执行后续命令的用户和用户组
- `CMD`: 容器启动时执行的命令
- `ENTRYPOINT`: 类似 CMD，与 CMD 不同的是不会被 `docker run` 中的命令给覆盖，如果想要覆盖必须配合 `--entrypoint` 参数

> 如果同时设置了 `ENTRYPOINT` 和 `CMD`，当两个参数的值都是数组时，会拼接成一个命令，否则执行 `ENTRYPOINT` 中的命令

配置忽略拷贝的目录或文件，在 `Dockerfile` 相同的目录位置，创建名称为 `.dockerignore` 的文件

```conf
.git
node_modules
```

执行构建

```bash
docker build -t myapp .
```

`.` 表示 Dockerfile 所在的位置

`-f` 可以指定 Dockerfile 文件

```bash
docker build -t myapp -f Dockerfile.custom .
```

## Dockerfile 多阶段构建

为何要使用多阶段构建？

- 减少重复劳动
- 保护源代码
- 降低镜像体积

```docker
FROM node AS build
WORKDIR /source
COPY . .
RUN npm install \
    && npm run build

FROM node
WORKDIR /app
COPY --from=build /source/dist .
COPY --from=build /source/node_modules node_modules
ENTRYPOINT [ "node", "main" ]
```

## 构建 ASP.NET Core 应用镜像

`dotnet/sdk` 镜像用于生成应用\
`dotnet/aspnet` 镜像包含 ASP.NET Core 运行时，用于运行应用

```docker
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /source
COPY . .
RUN dotnet restore \
  && dotnet publish -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS prod
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT [ "dotnet", "WebApplication.dll" ]
```