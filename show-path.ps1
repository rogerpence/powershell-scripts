# This is easier...
# $env:path -split ';'

# but this shows using my show-env-vars cmdlet.
(show-env-vars path -eq) -split ';'