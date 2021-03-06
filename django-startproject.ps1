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
# how how it names Django folders.
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
write-host Creating a new Django project
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host You many need to refresh your browser after the Django server starts -ForegroundColor black -BackgroundColor yellow
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host

$target = $args[0]                            # Capture target folder name.
#new-item $target -itemtype directory         # Create target folder.
#set-location -path $target                   # Move to that folder.

mkdir $target
set-location -path $target                    # Move to that folder.

python -m venv env                            # Create the Python virtual environment
env\scripts\activate                          # Activate python virtual environment.

                                              # Upgrade utilities.
env\scripts\python -m pip install --upgrade pip setuptools wheel

pip install django                            # Install django locally.
pip install psycopg2                          # Install posgresql driver locally.

pip freeze > requirements.text

django-admin startproject core                # Start a new project named core.

rename-item core root                         # Rename project root to `root`

set-location -path root
npm init -y

echo env > .gitignore
echo __pycache__/ >> .gitignore
git init

code .                                        # Open Code over the project.

start-process firefox http://localhost:5000   # Start firefox

write-host
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host You many need to refresh your browser after the Django server starts -ForegroundColor black -BackgroundColor yellow
write-host -------------------------------------------------------------------- -ForegroundColor black -BackgroundColor yellow
write-host

python manage.py runserver 5000               # Start Django server.




# write-host $pwd -ForegroundColor white -BackgroundColor red
