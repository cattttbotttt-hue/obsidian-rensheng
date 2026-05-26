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

### Android 手機／平板

Obsidian **官方冇將 Git 列為 Android 正式方案**；手機上 **Obsidian Git 插件亦唔穩定**（好多人中伏）。  
若你堅持用同一個 GitHub 倉庫 `obsidian-rensheng`，社群最常用下面兩條路：

#### 方案 A：Termux + Git（免費，較可靠）

**要點**：用 Termux 做 `git pull` / `git push`；筆記檔案放喺手機儲存空間俾 Obsidian 開，**唔好只靠插件自動 sync**。

1. **安裝 Termux（一定要 F-Droid，唔好用 Play Store 舊版）**  
   - 安裝 [F-Droid](https://f-droid.org/)  
   - 喺 F-Droid 搜 **Termux**、**Termux:Widget**（可選，做桌面一鍵同步）

2. **Termux 入面裝 Git**  
   ```bash
   pkg update && pkg upgrade -y
   pkg install git openssh -y
   termux-setup-storage
   ```
   （會問儲存權限，要允許。）

3. **Clone 你嘅倉庫（建議用 HTTPS + 個人權杖 PAT）**  
   - GitHub：**Settings → Developer settings → Personal access tokens** → 建立 token（勾 **repo**）  
   - Termux 執行（路徑可自訂）：  
   ```bash
   cd ~/storage/shared
   git clone https://github.com/cattttbotttt-hue/obsidian-rensheng.git
   ```
   第一次會問 GitHub 帳密：**Username** 填 `cattttbotttt-hue`，**Password** 填 **token**（唔係登入密碼）。

4. **Obsidian 開同一個資料夾**  
   - Obsidian → **打開資料夾作為倉庫**  
   - 揀 `内部存儲/obsidian-rensheng`（實際路徑視乎你 clone 位置）

5. **每次改完筆記前後，喺 Termux 手動同步**（習慣養成）  
   ```bash
   cd ~/storage/shared/obsidian-rensheng
   git pull
   git add .
   git commit -m "phone backup"
   git push
   ```
   可用 **Termux:Widget** 把上面幾行做成桌面捷徑，一撳就 sync。

6. **進階（大倉庫／常出錯才需要）**  
   有人會用 `--separate-git-dir` 把 `.git` 放喺 Termux 私有目錄，避免 Android 檔案系統搞亂 Git。新手可先唔用，出問題再查「Obsidian Termux separate-git-dir」。

**手機上建議**：關閉或唔依賴 **Obsidian Git 插件** 自動 push（同電腦插件會搶住改，易 conflict）。

#### 方案 B：第三方 App「Obsidian Git Sync」

- 開源 App：[obsidian-git-android](https://github.com/tsanva/obsidian-git-android)  
- 用 **PAT** 連 GitHub，可設定定時 sync，唔使打命令。  
- 屬於社群工具，非 Obsidian 官方；安裝前請自己睇 README 同權限說明。

#### 若 Android 只想「簡單同步」、唔堅持 GitHub

可考慮 **Syncthing-Fork**（手機同電腦點對點）、**Remotely Save** 插件（雲端）等；路線同你而家 **GitHub + Git** 唔同，要另設一套。

## 注意

- Git **唔係即時**同步，係「改完 → commit → push / pull」。插件會幫你定時做。  
- 兩邊同時改同一篇文可能 conflict，開頭盡量喺一部機改完 push，另一部先 pull。  
- `.obsidian/workspace.json` 已排除同步，避免視窗佈局互相覆蓋。
