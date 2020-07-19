$target_directory = $args[0]

$base = 'c:\Users\thumb\Documents\'

function change_directory() {
    param($target)

    if (-not (test-path -path $($target) -pathtype container)) {
        write-host Error: Path $($target) does not exist
        exit
    }
    else {
        set-location $($target)
    }
}

switch($target_directory) {
    'backup' {
        set-location c:\users\thumb\documents\utilities\backup
        ls run-*.ps1
        exit
    }
    'articles' {
        change_directory($($base + 'articles'))
        exit
    }
    'utilities' {
        change_directory($($base + 'utilities'))
        exit
    }
    'programming' {
        change_directory($($base + 'programming'))
        exit
    }
    'client' {
        change_directory($($base + 'programming\client'))
        exit
    }
    'python' {
        change_directory($($base + 'programming\python'))
        exit
    }
    'vue' {
        change_directory($($base + 'programming\vue'))
        exit
    }
    'dotnet' {
        change_directory($($base + 'programming\dotnet'))
        exit
    }
}

write-host $($target_directory + ' not a valid target.')