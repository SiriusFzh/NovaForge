#!/bin/bash
# NovaForge — LaTeX 编译脚本 (macOS/Linux)
# 可在项目根目录、scripts/ 或 latex/ 下运行

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PARENT_DIR="$(dirname "$SCRIPT_DIR")"

if [ -f "$PARENT_DIR/latex/template.tex" ]; then
    cd "$PARENT_DIR/latex"
elif [ -f "./latex/template.tex" ]; then
    cd latex
elif [ ! -f "template.tex" ]; then
    echo "[错误] 未找到 template.tex"
    echo "请在项目根目录、scripts/ 或 latex/ 下运行此脚本"
    exit 1
fi

echo "[1/3] 第一次编译（生成目录）..."
xelatex -interaction=nonstopmode template.tex >/dev/null

echo "[2/3] 第二次编译（解析引用）..."
xelatex -interaction=nonstopmode template.tex >/dev/null

echo "[3/3] 清理临时文件..."
rm -f *.aux *.log *.out *.toc *.bbl *.blg *.fdb_latexmk *.fls *.xdv *.synctex.gz

echo ""
echo "✅ 编译完成！"
echo "📄 输出文件: $(pwd)/template.pdf"
