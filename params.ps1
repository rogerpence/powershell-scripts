param (
    [parameter(mandatory=$true,
               helpmessage="Project and folder name.")
    ]
    [string]projectname,
)

if ($flag1) {
    write-host "Flag1 used"
}
if ($flag2) {
    write-host "Flag2 used"
}

write-host ($int1 + $int2)


