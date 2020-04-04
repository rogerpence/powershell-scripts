#
#
# Change directory: (sorta like a supercharged Zshell ..)
# ==    Go back one directory
# == n  Go back n directories
# == 0  Return to previous directory
#
#

if ($args.length -eq 0) {
    push-location
    cd ..
    exit
}

if ($args[0] -eq 0) {
    pop-location
    exit
}

push-location
$times = $args[0]
for ($i=0; $i -lt $times; $i++) {
    cd ..
}