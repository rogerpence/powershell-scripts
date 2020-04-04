function check_endpoint($url) {
    $result = $false
    try {
        $request = [System.Net.WebRequest]::Create($url)
        $response = $request.GetResponse()
        $result = $true
    }
    catch {
    }
    finally {
        if ($response) {
            $response.close()
            remove-variable response
            remove-variable request
        }
    }
    return $result
}

if ($args.length -lt 2) {
    write-host git-clone-branch '$branch' '$repo'
    write-host repo is cloned into folder with same name as branch.
    write-host ''
    exit
}

$branch = $args[0]
$repo = $args[1]

if (-not ( check_endpoint $repo )) {
    write-host Error: [$($repo)] request failed. Please check url. -ForegroundColor red
    exit
}

if (test-path -path $branch) {
    write-host Error: [$($branch)] path exists. -ForegroundColor red
    exit
}
write-host Cloning repo into $branch folder.
git clone --single-branch --branch $($branch) $($repo) $($branch)