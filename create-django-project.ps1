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
# write-host Creating Django projec at: $projectname

# Start a new Django project
# -----------------------------------
# django-startproject <project-name>
# -----------------------------------
#
# Creates a new Django project in a directory
# immediately under the current directory.
#
# This script installs the Python 'psycopg2'
# Postgresql driver. It's also opinionated
# in how how it names Django folders.
# The top-level folder is always 'root'
# and Django's bootstrap app is always 'core'.
#
# April 4, 2020
# Roger Pence
#
# TODO:
#   - check for target directory existance.
#   - improve argument passing
#

write-host
write-host Creating a new Django project: $projectname
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host You many need to refresh your browser after the Django server starts -ForegroundColor black -BackgroundColor yellow
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host
write-host "Installing Django and other stuff. This may take a minute or two.." -foregroundcolor green

#new-item $projectname -itemtype directory         # Create target folder.
#set-location -path $projectname                   # Move to that folder.

                                                   # Create new folder.
new-item -path . -name $projectname -itemtype "directory" | out-null
set-location -path $projectname              # Move to that folder.

python -m venv env                           # Create the Python virtual environment
env\scripts\activate                         #  Activate python virtual environment.
                                             # Upgrade utilities.


env\scripts\python -m pip install --upgrade pip setuptools wheel

pip install django                            # Install django locally.
pip install psycopg2                          # Install posgresql driver locally.

pip freeze > requirements.txt                 # Save Python dependencies.

django-admin startproject core                # Start a new project named core.

rename-item core project                      # Rename project outer 'core' folder to 'project'.

# Get .gitignore file.
invoke-webrequest -Uri "https://gist.githubusercontent.com/rogerpence/fd40c65d7fe602f74eaeaaf72b8e276e/raw/4f67669d07f5b1ee90ba857ae7ce157a921e020f/.gitignore" -Outfile .\.gitignore

git init                                      #  Initialize git

set-location project

npm init -y | out-null                        # Create package.json and customize it.
python C:\Users\thumb\Documents\utilities\customize-package-json.py

start-process firefox http://localhost:5000   # Start firefox

write-host
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host You many need to refresh your browser after the Django server starts -ForegroundColor black -BackgroundColor yellow
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host

code .                                        # Open Code over the project.

write-host "You may see an error that says: An established connection was aborted... " -foregroundcolor green
write-host "This is a known problem with Django's server. Refresh your dev browser when you see that message." -foregroundcolor green

python manage.py runserver 5000       # Start Django server.
