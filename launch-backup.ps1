param (
    [string] $DriveIdToFind
)
# $drives = get-psdrive -psprovider FileSystem | Select -property Root  | Out-String
# write-host $drives

# $array = Compare-Object (Get-PSDrive -PSProvider filesystem) (gwmi win32_logicaldisk | ForEach-Object{ $_.DeviceID[0]} ) |
# Select-Object -ExpandProperty InputObject |
# Select-Object -ExpandProperty Name |
# ForEach-Object {
#     write-host "$($_):\"
# }

function Find-Drive {
    param( [string]$DriveIdToFind)
    $array = Get-PSDrive -psprovider FileSystem
    foreach ($A in $array)
    {
        if ($A.tostring().trim() -eq 'py') {
            continue
        }
        $idFilePath = $A.name + ":" + '\rp-drive-id.txt'
        if (Test-Path ($idFilePath) ) {
            $driveid = get-content $idFilePath
            # write-host A $DriveIdToFind
            # write-host B $driveid
            if ($driveid -eq $driveIdToFind) {
                # write-host gotcha
                $result = $a.name + ':'
                return $result
            }
        }
    }
}

# function Find-Drive {
#     param( [string]$DriveIdToFind)
#     $array = Get-PSDrive -psprovider FileSystem
#     foreach ($A in $array)
#     {
#         if ($A.tostring().trim() -eq 'py') {
#             continue
#         }
#         $idFilePath = $A.name + ":" + '\rp-drive-id'
#         if (Test-Path ($idFilePath) ) {
#             $idFile = $idFilePath + '\drive_id.txt'
#             # write-host $idFile
#             if (Test-Path ($idFile)) {
#                 $driveid = get-content $idFile
#                 # write-host A $DriveIdToFind
#                 # write-host B $driveid
#                 if ($driveid -eq $driveIdToFind) {
#                     # write-host gotcha
#                     $result = $a.name + ':'
#                     return $result
#                 }
#             }
#         }
#     }
# }


$target_drive = Find-drive $DriveIdToFind

if ($target_drive.length -gt 0) {
    $command = 'sub-backup ' + $target_drive
    invoke-expression $command
}
else {
    write-host $DriveIdToFind.trim() 'drive not found'
}
