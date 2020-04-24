[CmdletBinding()]
param (
    [parameter(position=0)]
    [switch] $nocode = $false
)

env\scripts\activate

if ($nocode) {
    exit
}

code .