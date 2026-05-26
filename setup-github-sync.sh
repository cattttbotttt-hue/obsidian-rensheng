#!/bin/bash
set -euo pipefail

VAULT="/home/wwwwy/telegram-bridge/人生"
REPO="obsidian-rensheng"
GITHUB_USER="cattttbotttt-hue"
REMOTE="git@github.com:${GITHUB_USER}/${REPO}.git"

cd "$VAULT"

if ! ssh -o BatchMode=yes -o ConnectTimeout=8 -T git@github.com 2>&1 | grep -qi 'successfully authenticated'; then
  echo "❌ 尚未連上 GitHub SSH。請先完成 OBSIDIAN-GIT-同步說明.md 第一步（加入 SSH 公鑰）。"
  exit 1
fi

if [ ! -d .git ]; then
  git init -b main
  git config user.name "cattttbotttt-hue"
  git config user.email "cattttbotttt-hue@users.noreply.github.com"
fi

if ! git remote get-url origin >/dev/null 2>&1; then
  git remote add origin "$REMOTE"
fi

if ! git ls-remote "$REMOTE" >/dev/null 2>&1; then
  echo "遠端倉庫尚不存在。請到 https://github.com/new 建立私人倉庫：${REPO}"
  exit 1
fi

git add -A
if git diff --cached --quiet; then
  echo "沒有新變更可提交。"
else
  git commit -m "Initial Obsidian vault backup"
fi

git push -u origin main
echo "✅ 已推送到 ${REMOTE}"
