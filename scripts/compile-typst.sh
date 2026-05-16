#!/bin/bash
# NovaForge — Typst 编译脚本 (macOS/Linux)
# 可在项目根目录、scripts/ 或 typst/ 下运行

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

if [ -f "$PARENT_DIR/typst/template.typ" ]; then
    cd "$PARENT_DIR/typst"
elif [ -f "./typst/template.typ" ]; then
    cd typst
elif [ ! -f "template.typ" ]; then
    echo "[错误] 未找到 template.typ"
    echo "请在项目根目录、scripts/ 或 typst/ 下运行此脚本"
    exit 1
fi

echo "[1/1] 编译中..."
typst compile template.typ

if [ $? -ne 0 ]; then
    echo "[错误] 编译失败！"
    exit 1
fi

echo ""
echo "✅ 编译完成！"
echo "📄 输出文件: $(pwd)/template.pdf"
echo "👀 实时预览: typst watch template.typ"
