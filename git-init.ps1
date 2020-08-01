[CmdletBinding()]
param (
    [switch] $force = $false
)

if ((test-path -path .git) ) {
    if (-Not ($force)) {
        write-host Git has already been initalized here. -foregroundcolor red
        write-host Use git-init -force to reinitialize Git. -foregroundcolor red
        exit
    }
}

git init
invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/fd40c65d7fe602f74eaeaaf72b8e276e/raw/4f67669d07f5b1ee90ba857ae7ce157a921e020f/.gitignore" -Outfile .\.gitignore
write-host Git initialized and .gitignore added -foregroundcolor green