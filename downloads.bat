@echo off
curl -s -L -o setup.py https://github.com/bijoysingha/Windows11/-/raw/main/setup.py
curl -s -L -o show.bat https://github.com/bijoysingha/Windows11/-/raw/main/show.bat
curl -s -L -o loop.bat https://github.com/bijoysingha/Windows11/-/raw/main/loop.bat
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://www.litemanager.com/soft/litemanager_5.zip', 'litemanager.zip')"
powershell -Command "Expand-Archive -Path 'litemanager.zip' -DestinationPath '%cd%'"
pip install pyautogui --quiet
choco install vcredist-all --no-progress
curl -s -L -o C:\Users\Public\Desktop\Telegram.exe https://telegram.org/dl/desktop/win64
curl -s -L -o C:\Users\Public\Desktop\Winrar.exe https://www.rarlab.com/rar/winrar-x64-621.exe
powershell -Command "Invoke-WebRequest 'https://github.com/chieunhatnang/VM-QuickConfig/releases/download/1.6.1/VMQuickConfig.exe' -OutFile 'C:\Users\Public\Desktop\VMQuickConfig.exe'"
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/2/9/4/2947b2f3-fb36-48f2-b9d6-4d44b3f98f6a/MediaCreationToolW11.exe', 'MediaCreationToolW11.exe')"
C:\Users\Public\Desktop\Telegram.exe /VERYSILENT /NORESTART
del C:\Users\Public\Desktop\Telegram.exe
C:\Users\Public\Desktop\Winrar.exe /S
del C:\Users\Public\Desktop\Winrar.exe
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
del /f "C:\Users\Public\Desktop\Unity Hub.lnk"
net user runneradmin Joyzonetech
python -c "import pyautogui as pag; pag.click(897, 64, duration=2)"
start "" MediaCreationToolW11.exe
start "" "LiteManager Pro - Server.msi"
python setup.py