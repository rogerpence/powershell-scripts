# find-drive.ps1 is sourced so that its Find-Drive function is available. 

. .\find-drive.ps1 

function Copy-VM {
    param( [string]$drive_id_to_find,
           [string]$source_folder,
           [string]$source_file )

    $target_drive = Find-Drive $drive_id_to_find
    
    if ($target_drive -ne 'not-found')  {        
        $target_drive =  $($target_drive) + '\'
        
        $target_file = $($target_drive) + $($source_file)      
        $source_file = $($source_folder) + $($source_file)

        write-host copying $source_file to $target_file on $drive_id_to_find

        remove-item  $target_file -erroraction ignore
        copy-item $source_file $target_file 
    }
    else {                
        write-host $drive_id_to_find not found      
        write-host Did not copy $source_file
    }        
}

#copy-vm seagate-4tb-little C:\Users\roger\Documents\ 336x180.png

Copy-VM seagate-4tb-little   C:\Hyper-V\RP-Win10Git\   RP-Win10Git.vhdx
Copy-VM seagate-4tb-little   C:\Hyper-V\Win10RP-1809\  Win10RP-1809.vhdx  

Copy-VM seagate-4tb-desktop  C:\Hyper-V\RP-Win10Git\   RP-Win10Git.vhdx
Copy-VM seagate-4tb-desktop  C:\Hyper-V\Win10RP-1809\  Win10RP-1809.vhdx  



# copy-item   "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "h:\"

# copy-item   "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx" "f:\"

# remove-item "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "f:\"
# copy-item   "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "f:\"



# $target_drive = Find-Drive 'seagate-4tb-little' 

# if ($target_drive -ne 'not-found')  {
#     write-host $target_drive
# }
# else {    
#     write-host drive not found 
# }

# $target_drive =  $($target_drive) + '\'

# if 


# remove-item "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx" "h:\"
# copy-item   "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx" "h:\"

# remove-item "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "h:\"
# copy-item   "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "h:\"

# remove-item "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx" "f:\"
# copy-item   "C:\Hyper-V\RP-Win10Git\RP-Win10Git.vhdx" "f:\"

# remove-item "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "f:\"
# copy-item   "C:\Hyper-V\Win10RP-1809\Win10RP-1809.vhdx" "f:\"