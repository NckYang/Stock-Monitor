@echo off
chcp 65001 >nul
echo =======================================
echo   股市資訊系統 - 一鍵啟動程式
echo =======================================
echo.

:: 檢查是否有安裝 Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [錯誤] 找不到 Python！
    echo 請確認這台電腦已經安裝 Python，並且在安裝時有勾選 "Add Python to PATH"。
    pause
    exit /b
)

:: 檢查並建立虛擬環境
if not exist venv (
    echo [1/3] 正在建立專屬虛擬環境 (初次執行需要較長時間，請稍候)...
    python -m venv venv
)

:: 啟動虛擬環境並安裝套件
echo [2/3] 正在啟動環境並檢查必備套件...
call venv\Scripts\activate
python -m pip install --upgrade pip >nul 2>&1
pip install -r requirements.txt

:: 啟動 Streamlit
echo [3/3] 正在啟動股市監測儀表板...
streamlit run app.py

pause