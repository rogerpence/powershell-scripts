[CmdletBinding()]
param (
    [switch] $nocode = $false,
    [switch] $noserver = $false
)




# Start a Python virtual environment, Visual Studio Code,
# and Django's dev server.

# Usage:
# start-env without any command line args starts a Python virtual
# environment, Visual Studio Code and, it it's present in a
# child directory, launches Django's 'manage.py' with 'runserver'.
# Python's 'manage.py.'

# args:
#     -nocode = Do not start Visual Studio Code.
#     -noserver = Do not start the Django server.

if (test-path env\scripts\activate) {
    env\scripts\activate
}
else {
    write-host There isn''t a virtual environment to start at 'env\scripts\activate'. -foregroundcolor red
    exit
}

# If the -nocode arg is absent, launch VS Code.
if (-not $nocode) {
    code .
}

# If there isn't a project\manage.py here
# there isn't a server to start. Bail out.
if (-not (test-path project\manage.py)) {
    exit
}
# If the -noserver arg is absent, start Django's
# dev server.
if (-not $noserver) {
    start-process firefox http://localhost:8000   # Start firefox
    start-sleep 2
    write-host You might need to refresh your browser  -foregroundcolor green -backgroundcolor white
    python project\manage.py runserver
}
