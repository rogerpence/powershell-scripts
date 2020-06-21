# Define shortcuts
$shortcuts = @{ 'rs' = 'runserver'}

# If one argument provided and argument is a shorcut key:
if ($args.length -eq 1) {
    $cmd = $shortcuts[$args[0]]
    if ($cmd.length -gt 0) {
        $args[0] = $cmd
    }
}

# If starting Django server, delete dev log.
if ($args[0] -eq 'runserver') {
    if (Test-Path -Path 'debug.log') {
        remove-item 'debug.log'
    }
}

# if (-Not (test-path -path 'manage.py')) {
#     set-location project
# }

# write-host Running python project\manage.py $args -foregroundcolor blue -backgroundcolor white
# python project\manage.py $args
write-host Running python manage.py $args -foregroundcolor blue -backgroundcolor white
python manage.py $args