#
# Launch FreeCommander in PowerShell
#  /c         Open existing instance if running
#  /l=[path]  Set [path] in left window
#  /t         Open path in new tab
#  /panel=L   Make left panel active
#
$lpath = pwd
start-process "C:\Program Files (x86)\FreeCommander XE\FreeCommander.exe" -argumentlist  "/c /l=$($lpath) /panel=L /t"

