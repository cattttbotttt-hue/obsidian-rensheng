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

if ! /home/wwwwy/.local/bin/gh repo view "${GITHUB_USER}/${REPO}" >/dev/null 2>&1; then
  echo "正在 GitHub 建立私人倉庫 ${REPO} ..."
  /home/wwwwy/.local/bin/gh repo create "$REPO" --private --source=. --remote=origin --description "Obsidian vault sync" || {
    echo "gh 未登入時，請手動到 https://github.com/new 建立私人倉庫：${REPO}"
    echo "建立後再執行本腳本一次。"
    exit 1
  }
fi

git add -A
if git diff --cached --quiet; then
  echo "沒有新變更可提交。"
else
  git commit -m "Initial Obsidian vault backup"
fi

git push -u origin main
echo "✅ 已推送到 ${REMOTE}"
