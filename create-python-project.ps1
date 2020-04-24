[CmdletBinding()]
param (
    [parameter(mandatory=$true,
               helpmessage="Project and folder name.")
    ]
    [string]$projectname
)

if (Test-Path $projectname) {
    write-host "$projectname directory already exists." -backgroundcolor red -foregroundcolor white
    exit
}

write-host
write-host Creating a new Python project: $projectname
write-host "Installing Python and other stuff. This may take a minute or two.." -foregroundcolor green

                                                   # Create new folder.
new-item -path . -name $projectname -itemtype "directory" | out-null
set-location -path $projectname                    # Move to that folder.

python -m venv env                            # Create the Python virtual environment
env\scripts\activate                          # Activate python virtual environment.
                                             # Upgrade utilities.

env\scripts\python -m pip install --upgrade pip setuptools wheel

pip install psycopg2                          # Install posgresql driver locally.

pip freeze > requirements.txt

npm init -y | out-null

invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/fd40c65d7fe602f74eaeaaf72b8e276e/raw/4f67669d07f5b1ee90ba857ae7ce157a921e020f/.gitignore" -Outfile .\.gitignore

code .