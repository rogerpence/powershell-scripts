#
# Set path to desired parent path of the Django 
# project you want to create. The <project-name> 
# is also used to create the project folder. 
# 
# django-startproject <project-name> 

$target = $args[0]                            # Capture target folder name.
mkdir $target  
cd $target                                    # Change to target folder.

virtualenv .                                  # Start python virtual environment.

scripts\activate                              # Activate python virtual environment.

pip install django                            # Install django locally.

django-admin startproject core                # Start a new project named root.

rename-item core root                         # Rename project root to `root` 

cd root                                       # Change to `root` folder (Django project folder)
  
code .                                        # Open Code over the project.

start-process firefox http://localhost:5000   # Start firefox 

start-sleep -seconds 5                        # Give server a chance to spin up.

python manage.py runserver 5000               # Start Django server.

  

