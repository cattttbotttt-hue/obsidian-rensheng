# Obsidian 多裝置同步（GitHub + Git）

你的筆記庫路徑：`/home/wwwwy/telegram-bridge/人生`

GitHub 帳號：`cattttbotttt-hue`

遠端倉庫（私人）：https://github.com/cattttbotttt-hue/obsidian-rensheng

本機已完成：SSH 金鑰、首次 push、Obsidian Git 插件安裝。

## 第一步：在 Obsidian 啟用插件（本機做一次）

1. 打開 Obsidian → **設定** → **第三方插件**  
2. 關閉「限制模式」  
3. 確認 **Git** 插件已啟用（已預先安裝）  
4. 插件會約每 **10 分鐘** 自動 commit、pull、push（可在設定 → Git 裡改）

## 第二步：其他裝置怎麼做？

### 電腦（Windows / Mac / Linux）

```bash
git clone git@github.com:cattttbotttt-hue/obsidian-rensheng.git ~/Obsidian/人生
```

然後在 Obsidian：**打開本地倉庫** → 選剛 clone 的資料夾。  
同樣安裝 **Obsidian Git** 插件並啟用。

### iPhone / iPad

用 **Working Copy**（App Store）clone 同一個 repo，再連到 Obsidian。  
（Obsidian 官方說明有寫呢條路徑。）

## 注意

- Git **唔係即時**同步，係「改完 → commit → push / pull」。插件會幫你定時做。  
- 兩邊同時改同一篇文可能 conflict，開頭盡量喺一部機改完 push，另一部先 pull。  
- `.obsidian/workspace.json` 已排除同步，避免視窗佈局互相覆蓋。
