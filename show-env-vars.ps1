# Show environment variables

[CmdletBinding()]
param (
    [string]$startingChar = '',
    [switch] $eq = $false
)


$vars = get-childItem Env:
$noResults = $true
foreach ($var in $vars) {
    if ($startingChar -eq '') {
        write-host $var.name = $var.value
    }
    else {
        if ($eq) {
            if ($var.name.ToLower() -eq $startingChar) {
                $noResults = $false
                write-host $var.name = $var.value
                return $var.value
            }
        }
        else {
            # if ($var.name.substring(0,1).ToLower() -eq $startingChar) {
            if ($var.name.ToLower().startswith($startingChar)) {
                $noResults = $false
                write-host $var.name = $var.value
            }
        }
    }
}

if ($noResults) {
    write-host No results found -foregroundcolor red
}
