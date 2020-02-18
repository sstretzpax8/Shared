rem Uninstall DMA which also removes DP items
rem If DP was installed as Admin then you need to run this as Administrator
rem If DP was installed by email or as the User then no need

rem kill service
taskkill /F /im BitTitanDMAService.exe

rem uninstall the installer service
sc delete "BitTitanDMA"

rem remove startup
del /F "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\BitTitan Device Management Agent.lnk"
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "BitTitan Device Management Agent" /f
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v "BitTitanExecutor" /f

rem delete the scheduled task
schtasks /F /Delete /TN "BitTitan Device Management Updates"
schtasks /F /Delete /TN "BitTitan Device Management Execution"

rem kill executor process
taskkill /F /im BitTitanDMAExecutor.exe

rem kill modules
taskkill /F /im BitTitanDMAOutlookConfiguratorApplication.exe
taskkill /F /im BitTitanDMASoftwareHealthCheck.exe
taskkill /F /im BitTitanDMAMachineHealthCheck.exe
taskkill /F /im BitTitanDMAConnectivityHealthCheck.exe
taskkill /F /im BitTitanDMAOutlookConfigurator.exe


rem kill updater process
taskkill /F /im BitTitanDMAUpdater.exe

rem remove log files
rmdir /S /Q "%appdata%\..\Local\BitTitan"
rmdir /S /Q "%ProgramFiles(x86)%\BitTitan"

rem Delete BitTitan Software key
reg delete "HKEY_CURRENT_USER\SOFTWARE\BitTitan" /f


pause