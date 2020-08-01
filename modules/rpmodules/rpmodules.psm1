function take {
    Param(
        [parameter(Mandatory=$true)]
        $directory
    )

    if (-Not (test-path -path $directory)) {
        new-item -path . -name $directory -itemtype "directory" | out-null
        set-location $directory
        write-host 'Current directory:' $pwd -foregroundcolor green
        exit
    }
    else {
        write-host Error: [$($directory)] directory already exists. -ForegroundColor red
        exit
    }
}