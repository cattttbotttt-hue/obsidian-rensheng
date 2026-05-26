# Obsidian 多裝置同步（GitHub + Git）

你的筆記庫路徑：`/home/wwwwy/telegram-bridge/人生`

GitHub 帳號：`cattttbotttt-hue`

## 第一步：把 SSH 公鑰加到 GitHub（只需做一次）

1. 打開：https://github.com/settings/ssh/new  
2. **Title** 隨便填，例如 `obsidian-linux`  
3. **Key** 貼下面整行（你的公鑰）：

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBPGfKkqlMm/nomRuQ4tib29wFmHL+TZEbDrkxuGQbNo obsidian-sync@wwwwy-MINI-PRO-AHP
```

4. 按 **Add SSH key**

## 第二步：在本機建立 GitHub 遠端倉庫並推送

在終端機執行（SSH 加好之後）：

```bash
cd "/home/wwwwy/telegram-bridge/人生"
./setup-github-sync.sh
```

## 第三步：在 Obsidian 啟用插件

1. 打開 Obsidian → **設定** → **第三方插件**  
2. 關閉「限制模式」  
3. 確認 **Git** 插件已啟用（已預先安裝）  
4. 插件會約每 **10 分鐘** 自動 commit、pull、push（可在設定裡改）

## 其他裝置怎麼做？

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
