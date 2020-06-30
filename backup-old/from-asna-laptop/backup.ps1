if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

function perform-backup {
    param( [string]$vhdx,
           [string]$sourceDeviceId,
           [string]$backupDeviceId)

    $vhdAttached = get-vhd $vhdx | select -expandproperty attached
    if (-not ($vhdAttached)) {
        write-host Backing up files from $vhdx   -foregroundcolor green -backgroundcolor  white
        Mount-vhd -path $vhdx
        start-sleep -seconds 5
        ./launch-backup $sourceDeviceId $backupDeviceId
        Dismount-VHD –Path $vhdx
    }
    else {
        write-host Could not attach to $vhdx  -foregroundcolor white -backgroundcolor  red
    }
}

# Backup VMs as mounted drives.
perform-backup  "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx"    win10-git     seagate-4tb-little
perform-backup  "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx"  win10rp-1809  seagate-4tb-little
perform-backup  "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx"    win10-git     seagate-4tb-desktop
perform-backup  "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx"  win10rp-1809  seagate-4tb-desktop

./launch-backup asna-laptop seagate-4tb-little
./launch-backup asna-laptop seagate-4tb-desktop 

stop-computer