import subprocess
import sys
cmd = "C:\\Users\\thumb\\Documents\\utilities\\backup\\backup.ps1"
p = subprocess.Popen(['powershell.exe', cmd], stdout=sys.stdout)

