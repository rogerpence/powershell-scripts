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
        $noResults = $false
        write-host $var.name = $var.value
    }
    else {
        if ($eq) {
            if ($var.name.ToLower() -eq $startingChar.ToLower()) {
                $noResults = $false
                write-host $var.name = $var.value
                return $var.value
            }
        }
        else {
            if ($var.name.ToLower().startswith($startingChar.ToLower())) {
                $noResults = $false
                write-host $var.name = $var.value
            }
        }
    }
}

if ($noResults) {
    write-host No results found -foregroundcolor red
}
