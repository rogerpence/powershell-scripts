try 
{
Mount-vhd -path "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx"
}
catch {
    write-host failed
}

