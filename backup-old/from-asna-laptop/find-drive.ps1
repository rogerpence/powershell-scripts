function Find-Drive {
    param( [string]$drive_id_to_find)

    $array = Get-PSDrive -psprovider FileSystem
    
    foreach ($A in $array)
    {
        if ($A.tostring().trim() -eq 'py') {
            continue
        }
        $idFilePath = $A.name + ":" + '\rp-drive-id.txt'
        if (Test-Path ($idFilePath) ) {
            $driveid = get-content $idFilePath
            if ($driveid -eq $drive_id_to_find) {
                $result = $a.name + ':'
                return $result
            }
        }
    }

    return 'not-found'
}


# $source_drive = Find-drive $source_drive_id
# $target_drive = Find-drive $target_drive_id

# if ($target_drive.length -gt 0 ) {
#     write-host $target_drive_id found
# }
# else {
#     write-host $target_drive_id not found
# }

# if ($source_drive.length -gt 0) {
#     write-host $source_drive_id found    
# }    
# else {
#     write-host $source_drive_id not found
# }

# if ( ($source_drive.length -eq 0) -or ($target_drive.length -eq 0) ) {
#     exit
# }

# $result = [System.Tuple]::Create($source_drive, $target_drive) 

# write-host $result 



