param (
    [string] $source_drive,
    [string] $source_drive_id,
    [string] $target_drive,
    [string] $target_drive_id
)

write-host $source_drive
write-host $source_drive_id
write-host $target_drive
write-host $target_drive_id

write-host Backup up to drive $target_drive

# Exclude VHDX files
$cmd = [string]::format('robocopy {0}\users\roger\documents {1}\backup\{2}\documents /xd node_modules __pycache__ dat /xf *.g2m *.vhdx *.gbp *.pst /mt:64 /mir /log+:c:\users\roger\{2}.log /tee', $source_drive, $target_drive, $source_drive_id)

write-host $cmd
$sb = [scriptblock]::create($cmd)
$sb.invoke()



