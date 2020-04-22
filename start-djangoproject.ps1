[CmdletBinding()]
param (
    [parameter(mandatory=$true,
               helpmessage="Project and folder name.")
    ]
    [string]$projectname
)

if (Test-Path $projectname) {
    write-host "$projectname directory already exists." -backgroundcolor red -foregroundcolor white
    exit
}
write-host $projectname