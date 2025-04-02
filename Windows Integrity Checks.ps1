$TaskName = "PostRebootSystemCheck"
$ScriptPath = "$PSScriptRoot\chkdsk_dism_sfc.ps1"

# Run Check Disk
Write-Output "Running CHKDSK on C: drive..."
$chkdskResult = chkdsk C: /f /r /x 2>&1

# Check if CHKDSK requires a reboot
if ($chkdskResult -match "volume is in use by another process" -or $chkdskResult -match "CHKDSK cannot run because the volume is in use") {
    Write-Output "CHKDSK requires a reboot. Scheduling restart and re-run of this script."

    # Register a Scheduled Task to run the script after reboot
    $Action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-ExecutionPolicy Bypass -File `"$ScriptPath`""
    $Trigger = New-ScheduledTaskTrigger -AtStartup
    Register-ScheduledTask -TaskName $TaskName -Action $Action -Trigger $Trigger -RunLevel Highest -Force

    # Restart the computer
    shutdown /r /f /t 0
    exit
}

# Continue with DISM and SFC commands after reboot
Write-Output "Running DISM and SFC commands..."
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow

# Remove the scheduled task if it exists
Unregister-ScheduledTask -TaskName $TaskName -Confirm:$false
Write-Output "System check completed."
