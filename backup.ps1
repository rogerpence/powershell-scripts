
$volume = 'TinyThumb'
# Get drive letter for TinyThumb volume.
$drive = (get-volume | where-object  {$_.FileSystemLabel -eq $volume}).DriveLetter.ToString().Trim()
if ( $drive.length -gt 0) {
    write-host $volume found on drive $drive - backing up now

    $cmd = [string]::format('robocopy c:\Users\thumb {0}:\backup\thumb-backup\thumb-root /r:5 /w:15 /xd node_modules __pycache__ AppData /xf NTUSER.DAT* ntuser.ini /mt:64 /mir /log+:c:\Users\thumb\backup-log.txt /tee' , $drive)
    $sb = [scriptblock]::create($cmd)
    $sb.invoke()

    write-host $cmd
}
else {
    write-host $volume not found.
}