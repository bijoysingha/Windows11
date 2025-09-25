@echo off
:: Disable echoing commands for cleaner output
@echo off

:: --- Download helper scripts if still needed (optional) ---
:: curl -s -L -o setup.py https://gitlab.com/joyzone/lite_manager_win/-/raw/main/setup.py
:: curl -s -L -o loop.bat https://gitlab.com/joyzone/lite_manager_win/-/raw/main/loop.bat

:: --- Download Windows 11 Media Creation Tool ---
powershell -Command "(New-Object Net.WebClient).DownloadFile('https://download.microsoft.com/download/2/9/4/2947b2f3-fb36-48f2-b9d6-4d44b3f98f6a/MediaCreationToolW11.exe', 'MediaCreationToolW11.exe')"

:: --- Install AnyDesk instead of LiteManager ---
powershell -Command "Invoke-WebRequest 'https://download.anydesk.com/AnyDesk.exe' -OutFile 'AnyDesk.exe'"
start /wait "" AnyDesk.exe --install "C:\Program Files (x86)\AnyDesk" --silent
del AnyDesk.exe

:: --- Install VNC (TightVNC as example) ---
powershell -Command "Invoke-WebRequest 'https://www.tightvnc.com/download/2.8.81/tightvnc-2.8.81-gpl-setup-64bit.msi' -OutFile 'tightvnc.msi'"
msiexec /i tightvnc.msi /qn /norestart
del tightvnc.msi

:: --- Install Visual C++ Redistributables (using Chocolatey if available) ---
choco install vcredist-all -y --no-progress

:: --- Create runneradmin user ---
net user runneradmin Joyzonetech /add
net localgroup administrators runneradmin /add

:: --- Clean up desktop clutter (optional) ---
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk"
del /f "C:\Users\Public\Desktop\Unity Hub.lnk"

:: --- Launch Windows 11 installer preparation ---
start "" MediaCreationToolW11.exe