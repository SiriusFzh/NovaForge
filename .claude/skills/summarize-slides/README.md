# Summarize Slides Skill

<div align="center">

## 课件.skill

---

> "哎哟 真复习不过来了我艹"
> 
> --考试周破防哥


<img src="assets/summarize-slides-readme.jpg" alt="考试周破防哥" width="220" />

---

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)
[![AgentSkills](https://img.shields.io/badge/AgentSkills-Standard-green)](https://agentskills.io)
[![Bilingual](https://img.shields.io/badge/README-%E4%B8%AD%E6%96%87%20%7C%20English-4c9a2a)](#中文)

[中文](#中文) | [English](#english)

---

</div>


## 中文

还在对着大学里动辄上百页、逻辑乱得像毛线团的课件欲哭无泪？别慌，你不是一个人在“渡劫”——现在的大学课件，仿佛统一解锁了“防自学”buff：重点藏在犄角旮旯，废话多的不知所云，明明一页能说清的知识点，偏要拆成十页凑篇幅，主打一个“让你逐页啃、熬秃头，就是不让你轻松get到核心”，对考前临时抱佛脚、想高效速成的同学，简直是折磨。

课件.skill 就是你的“考试破防周救星”——一款专为高效摆烂党（哦不，是高效学习者）打造的 agent skill，专治各种反人类课件。

它不搞虚头巴脑的泛泛总结，不跟你玩文字游戏，核心目标只有一个：把百页冗余课件，榨干所有水分，炼出最纯粹、最硬核的干货（一份10页以内的pdf总结）——说白了，就是假设你能揣着一张小抄进考场，你愿意一字不落抄下来的所有内容。考点、概念、公式、代表性例子、解题提示，全给你梳理得明明白白，还贴心附带页码引用，回查原课件不用再翻来翻去，让你花最少的时间，搞定最关键的复习内容，彻底告别“无效内卷”，躺平也能轻松拿捏考前复习

### 安装

复制给 OpenCode / Claude Code / 其他支持 skills 的 LLM agent：

```text
Fetch and follow instructions from:
https://raw.githubusercontent.com/Li-Baichuan-James/summarize-slides-skill/main/INSTALL.md
```

### 快速开始

1. 让 Agent 按 `INSTALL.md` 完成安装与环境检查：

```text
https://raw.githubusercontent.com/Li-Baichuan-James/summarize-slides-skill/main/INSTALL.md
```

2. 在会话中粘贴课件地址，直接描述需求即可，例如：

```text
把这个课件整理成考前复习资料，并生成pdf文件。
```

3. 也可以自然说明范围与风格，例如：

```text
只总结第 3 讲到第 5 讲，中文为主，保留英文术语，做成公式和概念速查表。
```

### 默认输入输出

- 默认输入为pdf格式的课件
- 默认交付物是整理好的 `.pdf` 文件
- 默认输出目录为源 PDF 同级的 `Summary - <pdf-stem>`
- 默认文风为中文主写，重要术语保留英文括注
- 默认内容应尽量带页码或紧凑页码范围，便于回查原课件

### 它适合做什么

- 课件复习资料
- 考点总结
- 公式 / 概念速查表
- 开卷考试用的 cheat sheet
- 带页码引用的课件 PDF 精简总结

### 与 `pdf` skill 的关系

- `summarize-slides` 必须与 `pdf` 配合使用
- `pdf` 负责 PDF 读取、提取、OCR 与页面内容确认等输入侧工作
- `summarize-slides` 负责全局通读、按讲次或主题分段、合并总结、覆盖性核查、写出 LaTeX，并在本地 LaTeX 环境可用时尝试编译最终 PDF
- 简单说：`pdf` 负责把课件读清楚，`summarize-slides` 负责把复习文档做完整

### 仓库内容

- `SKILL.md`：技能的权威说明，包含触发条件、工作流、边界与交付要求
- `INSTALL.md`：安装入口与环境检查说明
- `LICENSE`：本仓库当前发布版本附带的许可文件
- `README.md`：面向公开发布的中英双语介绍与使用说明

### 许可说明

本仓库的分发、复用与镜像以仓库内现有的 `LICENSE` 文件为准。

---

## English

`summarize-slides` is a skill for turning lecture PDFs, exported slide decks, and course handout PDFs into exam-oriented study materials. Its default outcome is a saved LaTeX source file and a compiled PDF, and that default compiled-PDF path depends on locally available `xelatex` rather than just falling back to an inline chat summary.

This repository is meant for users who want a publication-quality review artifact: key points, formulas, concepts, representative examples, and practical study guidance, with page references wherever the source quality allows.

### Installation

Tell your LLM agent:

```text
Fetch and follow instructions from:
https://raw.githubusercontent.com/Li-Baichuan-James/summarize-slides-skill/main/INSTALL.md
```

### Quick Start

1. Install and validate through `INSTALL.md`:

```text
https://raw.githubusercontent.com/Li-Baichuan-James/summarize-slides-skill/main/INSTALL.md
```

2. Then ask naturally for the output you want. For example:

```text
Summarize this lecture PDF into an exam-review cheat sheet and generate the files.
```

3. You can also specify scope and style directly. For example:

```text
Summarize only Lectures 3 to 5, keep Chinese as the main language, retain English terms, and focus on formulas and core concepts.
```

### Default Deliverables

- The default deliverables are `.tex` plus a compiled `.pdf`; the default compiled-PDF workflow depends on locally available and working `xelatex`
- If the required PDF output cannot be produced because `xelatex` is missing, that default workflow is blocked by the environment rather than successfully completed as `.tex`-only, unless the user explicitly opts out of PDF output
- Unless the user explicitly opts out of file creation, a chat-only summary is not the default successful outcome
- The default output folder is `Summary - <pdf-stem>` alongside the source PDF
- The default writing style is Chinese-first, with important technical terms preserved in English parentheses
- Summarized points should carry page citations or tight page ranges whenever extraction quality permits

### Intended Use

- Exam review sheets
- Key-point summaries for course slides
- Formula and concept cheat sheets
- Concise review PDFs generated from lecture materials
- Page-cited summaries of long lecture decks

### How It Works With the `pdf` Companion Skill

- `summarize-slides` is designed to be used together with `pdf`
- `pdf` handles PDF intake, extraction, OCR, and page-level source recovery
- `summarize-slides` governs the summarization workflow: global read, segmentation by lecture or topic, draft merge, coverage verification, LaTeX writing, and final PDF compilation when the local LaTeX environment is available
- In short: `pdf` helps the agent read the source correctly, and `summarize-slides` governs how the final study artifact is produced

### Repository Contents

- `SKILL.md`: canonical skill specification, workflow, boundaries, and required outputs
- `INSTALL.md`: installation entry point and environment validation guide
- `LICENSE`: license file included with the current published repository
- `README.md`: publication-facing bilingual overview and usage guide

### License Note

Distribution, reuse, and mirroring of this repository are governed by the `LICENSE` file included in the repository.
