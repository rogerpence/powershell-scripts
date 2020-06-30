if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}



Mount-vhd -path "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx"
Mount-vhd -path "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx"


$User = Read-Host -Prompt 'Input the user name'