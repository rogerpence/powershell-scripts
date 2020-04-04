$file_selector = $args[0]

function get_file($url, $output) {
    invoke-webrequest -Uri "$($url)" -Outfile $($output)
}

function get_ignore_file($url) {
    get_file $url '.\.gitignore'
    write-host .gitignore added
}

$files = @{}
$files.add('pyignore', 'https://gist.githubusercontent.com/rogerpence/fd40c65d7fe602f74eaeaaf72b8e276e/raw/e257bc63602fc9161c1141a749fd5149218f1a87/.gitignore')
$files.add('roger', 'pence')

$target = $files['rogerx']
write-host $($target).length
exit

switch($file_selector) {
    'py-ignore' {
        get_ignore_file "https://gist.githubusercontent.com/rogerpence/fd40c65d7fe602f74eaeaaf72b8e276e/raw/e257bc63602fc9161c1141a749fd5149218f1a87/.gitignore"
        exit
    }
}

