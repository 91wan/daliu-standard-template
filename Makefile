# ═══════════════════════════════════════════════════
#  {{PROJECT_NAME}} — 统一构建入口
#
#  发版流程：
#    make version-bump VERSION=v1.0.0  → 更新 README 版本号+日期
#    git add README.md && git commit && git push
#    git tag v1.0.0 && git push origin v1.0.0  → 触发 GitHub Release
# ═══════════════════════════════════════════════════

PROJECT   := {{PROJECT_NAME}}
TODAY     := $(shell date +%Y-%m-%d)

.PHONY: all build run install clean version version-bump

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

## version-bump VERSION=v1.x.x: 更新 README 版本号+日期
version-bump:
ifndef VERSION
	$(error ❌ 用法: make version-bump VERSION=v1.0.0)
endif
	@sed -i '' "s/version-[0-9a-z._-]*/version-$(VERSION)/" README.md 2>/dev/null || \
	 sed -i  "s/version-[0-9a-z._-]*/version-$(VERSION)/" README.md
	@echo "✅ README 已更新版本 → $(VERSION)"
