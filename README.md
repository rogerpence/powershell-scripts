## rp Utility Commands

This mostly a collection of Powershell command with a few other miscellaneous commands.

* aa.ps1

    Go back one directory

* change-to-main.ps1

    Change a GitHub repo to main (instead of master)

* create-django-project.ps1

    Create a Django project <directory>

* create-python-project.ps1

    Create a Python project <directory>

* dj.ps1

    Django shortcut to run `python manage.py $args`

    `dj <manage.py args>`

    Example:

    `dl runserver -port:5500`

* get-gitignore.ps1

    Get my .gitignore file

* get-http-file.ps1

    A start at downloading a specified file

* git-clone-branch.ps1

    Hmmm. Investigate this

* go.ps1

    Go to defined destinations

* install-tailwind.ps1

    Install Tailwind (uses purgecss)

* lsa.ps1

    Show directory contents by date

* lsaw.ps1

    Like `lsa` but wide view

* node-no-warnings.ps1

    Set Node var for no Node warnings

* pgsql.bat

    Run PostgreSQL command line

* pip-freeze.ps1

    run `pip freeze`

* pytree.ps1

    pytree [-f] <directory>

    Show directory tree. This launches the `tree.py` Python script.

* remove-directory.ps1

    Remove a directory

* show-env-vars.ps1

    Show environment variables

    `show-env-vars` [var] [-eq]

    Examples:
    * Show all variables: `show-env-vars`
    * Show variables that start with `no`: `show-env-vars no`
    * Show the variable named 'NODE_ENV': `show-env-vars node_env`

    The `var` value is not case-sensitive.

* show-path.ps1

    Show path environment variable

* show-recording-area

    Show video recording area

* take.ps1

    Create a directory and change to it

* touch.exe

    Create a file
