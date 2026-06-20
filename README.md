# 股市資訊系統 (Stock Information System)

這是一個基於 Python 與 Streamlit 開發的輕量級、互動式股市分析工具。提供即時報價、多天期報酬率排行、互動式 K 線圖，並結合網路爬蟲進行新聞情緒聲量分析與 Discord 價格警報推播。

## 核心功能

- **個人化監控清單**：支援台股（需加 `.TW` 或 `.TWO`）、美股及大盤指數（如 `^TWII`），並會自動記憶您的監控標的。
- **多欄位排行分析**：自動計算並排序監控清單內標的的「當日」、「近 7 日」與「近 30 日」累積報酬率。
- **互動式股價走勢圖**：內建 Plotly 繪製的 K 線圖（紅漲綠跌）與累積報酬率面積圖，支援滑鼠懸停查看詳細數據與圖表縮放。
- **新聞輿情與聲量分析**：自動爬取 Google Finance 新聞，並透過內建財經字典進行標題情緒分析（正向、中立、負向），繪製聲量風向球。
- **支援 Discord 警報**：可針對個別股票設定「突破」或「跌破」目標價，當價格達標時，系統會自動透過 Discord Webhook 傳送警報至您的手機。

## 檔案結構

- `app.py`：Streamlit 儀表板主程式。
- `requirements.txt`：Python 依賴套件清單。
- `start.bat`：Windows 專用的一鍵自動安裝與啟動腳本。
- `README.md`：專案說明文件。

## 快速啟動 (Windows 專用)

本專案提供了一鍵啟動腳本，無需手動輸入繁瑣的指令即可自動配置環境並執行網頁。

### 系統需求
請確保您的電腦已安裝 **Python (3.8 或以上版本)**，並且在安裝時有勾選 **"Add Python to PATH"**。

### 執行步驟
1. 進入本專案的資料夾。
2. 雙擊執行 `start.bat`。
3. 程式會自動執行以下動作（初次執行約需 1~3 分鐘）：
   - 檢查 Python 環境。
   - 建立專屬的虛擬環境 (`venv` 資料夾)。
   - 讀取 `requirements.txt` 並安裝所有必備套件。
   - 啟動 Streamlit 伺服器並自動於瀏覽器開啟儀表板。
4. 日後若要再次使用，只需再次雙擊 `start.bat`，程式會秒速啟動。

## 手動安裝與執行 (適用於 Mac / Linux / Windows)

若您不是使用 Windows，或無法執行 `.bat` 腳本，請透過終端機 (Terminal) 手動輸入以下指令：

**1. 建立並啟動虛擬環境**
```bash
# 建立虛擬環境
python -m venv venv

# 啟動虛擬環境 (Mac / Linux)
source venv/bin/activate

# 啟動虛擬環境 (Windows Command Prompt)
venv\Scripts\activate
```

**2. 安裝依賴套件**
```bash
pip install -r requirements.txt
```

**3. 啟動儀表板**
```bash
streamlit run app.py
```

## 如何設定 Discord 價格警報？
本專案無須架設複雜的伺服器或機器人，只要透過 Discord 內建的 Webhook 功能即可接收通知。設定只需 1 分鐘：

**1.建立專屬頻道：在您的 Discord 伺服器中建立一個新的文字頻道（例如命名為「股市警報區」）**。

**2.取得 Webhook 網址：將滑鼠移至該頻道名稱，點擊右側的 ⚙️ (編輯頻道) > 左側選單的「整合」>「建立 Webhook」。**

**3.複製網址：點擊剛剛建立的 Webhook 機器人，按下「複製 Webhook 網址」。**

**4.貼上並啟動：回到股市監測儀表板網頁，在左側邊欄的「Discord Webhook URL」輸入框中貼上該網址。**

**5.設定目標價：在左側選單選擇想監控的股票，設定「突破」或「跌破」價格並點擊儲存。當網頁刷新且價格達標時，您的 Discord 就會立刻收到推播通知！**

## 專案使用套件 (Dependencies)
本專案使用以下開源 Python 套件進行開發，可透過 requirements.txt 一鍵安裝：

- `streamlit`：用於快速構建具備互動性、現代感 UI 的網頁儀表板。

- `yfinance`：核心金融數據源，負責抓取 Yahoo Finance 的歷史股價、現價與成交量資料。

- `pandas`：進行數據清洗、報酬率計算與表格資料處理。

- `requests`：負責發送網路請求（包含抓取 Google 新聞 RSS 與發送 Discord Webhook 通知）。

- `beautifulsoup4` & lxml：負責解析 Google 新聞的 XML 格式與擷取 Google Finance 網頁的股票中文名稱。

- `plotly`：用於繪製高質感、具備互動性（支援縮放、懸停顯示數據）的 K 線圖與累積報酬率面積圖。