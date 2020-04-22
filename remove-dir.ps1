# if ($args.length -eq 0) {
#     write-host 'remove-dir <directory-name>'
#     exit
# }

# directory = $args[0]

Param(
    [parameter(Mandatory=$true)]
    $directory
)

if (-Not (test-path -path $directory)) {
    write-host Error: [$($directory)] directory does not exist. -ForegroundColor red
    exit
}

try {
    # remove-item fully deletes an item. It does not send
    # deleted items to the recycle bin.
    # Maybe later add a flag to fully delete
    remove-item -path $directory -recurse -force -ErrorAction Stop

    # Remove item to recycle bin.
    # $item = get-item -path directory
    # $shell = New-Object -ComObject 'Shell.Application'
    # $shell.NameSpace(0).ParseName($item.FullName).InvokeVerb('delete')
}
catch {
    write-host $_.Exception.Message  -ForegroundColor yellow
    exit
}

write-host Directory [$($directory)] removed. -ForegroundColor green