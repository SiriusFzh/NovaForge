@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ════════════════════════════════════
echo  NovaForge — LaTeX 编译脚本
echo ════════════════════════════════════

rem 自动定位到 latex/ 目录（支持从项目根或 scripts/ 下运行）
set SCRIPT_DIR=%~dp0
set PARENT_DIR=%SCRIPT_DIR%..
set TEX_DIR=%PARENT_DIR%\latex

if exist "%TEX_DIR%\template.tex" (
    cd /d "%TEX_DIR%"
) else if exist "latex\template.tex" (
    cd latex
) else if exist "template.tex" (
    rem 已在 latex/ 目录中
) else (
    echo [错误] 未找到 template.tex
    echo 请在项目根目录、scripts\ 或 latex\ 下运行此脚本
    pause
    exit /b 1
)

echo [1/3] 第一次编译（生成目录）...
xelatex -interaction=nonstopmode template.tex >nul

echo [2/3] 第二次编译（解析引用）...
xelatex -interaction=nonstopmode template.tex >nul

echo [3/3] 清理临时文件...
del *.aux *.log *.out *.toc *.fdb_latexmk *.fls *.xdv *.synctex.gz 2>nul

echo.
echo ✅ 编译完成！
echo 📄 输出文件：%CD%\template.pdf
pause
