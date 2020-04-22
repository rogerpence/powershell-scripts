robocopy c:\Users\thumb\documents               g:\backup\thumb-backup\documents /s /xd node_modules __pycache__ /mt:48
robocopy c:\Users\thumb                         g:\backup\thumb-backup\thumb-root /r:5 /w:15 /xf NTUSER.DAT* ntuser.ini /mt: 48
robocopy c:\Users\thumb\.ssh                    g:\backup\thumb-backup\thumb-root\.ssh /r:5 /w:15 /xf NTUSER.DAT* ntuser.ini /mt: 48