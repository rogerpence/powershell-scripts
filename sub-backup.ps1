param (
    [string] $target_drive
)

write-host Backup up to drive $target_drive

$cmd = [string]::format('robocopy c:\Users\thumb {0}\backup\thumb-backup\thumb-root /r:5 /w:15 /xd node_modules __pycache__ AppData /xf NTUSER.DAT* ntuser.ini /mt:64 /mir /log+:c:\Users\thumb\backup-log.txt /tee' , $target_drive)
write-host $cmd
$sb = [scriptblock]::create($cmd)
$sb.invoke()
