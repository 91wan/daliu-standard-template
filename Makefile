# ═══════════════════════════════════════════════════
#  {{PROJECT_NAME}} — 统一构建入口
#
#  发版流程：
#    make release VERSION=v1.0.0  → 一键提交+打 Tag+推送，触发 GitHub Actions Release
# ═══════════════════════════════════════════════════

PROJECT   := {{PROJECT_NAME}}

.PHONY: all build run install clean version version-bump release

all: build

## build: 构建项目
build:
	@echo "🔨 构建 $(PROJECT)..."
	@echo "⚠️  请根据项目类型实现此目标（swift build / npm run build / go build）"

## run: 构建并运行
run: build
	@echo "🚀 运行..."

## install: 安装到系统
install: build
	@echo "📦 安装..."

## clean: 清理构建产物
clean:
	@echo "🗑  清理..."

## version: 显示当前版本
version:
	@grep -m1 "version" README.md | head -1

## version-bump VERSION=v1.x.x: 更新 README 版本号
version-bump:
ifndef VERSION
	$(error ❌ 用法: make version-bump VERSION=v1.0.0)
endif
	@sed -i '' "s/version-[0-9a-z._-]*/version-$(VERSION)/" README.md 2>/dev/null || \
	 sed -i  "s/version-[0-9a-z._-]*/version-$(VERSION)/" README.md
	@echo "✅ README 已更新版本 → $(VERSION)"

## release VERSION=v1.x.x: 一键发版暴君指令 — 提交+打 Tag+推送，触发 GitHub Actions Release
release:
ifndef VERSION
	$(error 🚨 致命错误: 必须指定版本号。用法: make release VERSION=v1.0.0)
endif
	@echo "🚀 启动发版序列，目标版本: $(VERSION)..."
	@git add -A
	@git commit -m "chore(release): bump version to $(VERSION)" || echo "工作区干净，直接打 Tag"
	@git tag $(VERSION)
	@git push origin main $(VERSION)
	@echo "✅ 指令下达完毕。GitHub Actions 已接管云端 Release 流程。"
