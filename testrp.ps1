Param(
    [parameter(Mandatory=$true)]
    $filename
)


write-host $filename
exit

if ($args.length -eq 0) {
    write-host no args
    exit
}

write-host $args.length