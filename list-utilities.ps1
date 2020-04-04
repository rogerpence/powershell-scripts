# get-childitem -path c:\users\thumb\documents\utilities\*.ps1 -name  | sort-object

get-childitem -path c:\users\thumb\documents\utilities\*.ps1 | Foreach-Object {$_.BaseName}  | sort-object
write-host