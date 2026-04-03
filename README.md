# {{PROJECT_NAME}}

> version-0.1.0

## 简介

TODO: 项目描述

## 安装

```bash
make install
```

## 构建

```bash
make build   # 构建
make run     # 构建并运行
make clean   # 清理
```

## 发版

```bash
make version-bump VERSION=v1.0.0
git add README.md && git commit -m "chore: bump to v1.0.0"
git push origin main
git tag v1.0.0 && git push origin v1.0.0
```

## License

MIT
