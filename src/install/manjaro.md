# Manjaro

## 使用 Pacman 安装

```bash
sudo pacman -S docker
```

确认 Docker 服务启动正常

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

## 配置 Docker 服务

建立 Docker 用户组

```bash
sudo groupadd docker
```

将当前用户加入 Docker 组

```bash
sudo usermod -aG docker $USER
```