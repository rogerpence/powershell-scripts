# Lifted, with only minor modifications, from Doug Dahms' work on StackOverflow.
# https://stackoverflow.com/questions/9727673/list-directory-tree-structure-in-python

# The major modification I made was to allow excluded directories.

from os import listdir, sep
from os.path import abspath, basename, isdir
from sys import argv
import sys, os

LEFT_EL = '└── '
LEFT_TEE = '├── '
PIPE = '│'

#LEFT_EL = '|__'
#LEFT_TEE = '|-- '
#PIPE = '|'

# Do not show nested directories for directories listed here.
# Any folder that ends with any of these values is omitted.
excluded_dirs = [r'\node_modules', r'\.git', r'\site-packages', r'\env',]

def is_dir_included(dir):
    for excluded_dir in excluded_dirs:
        if dir.endswith(excluded_dir):
            return False
    return True

def tree(dir, padding, print_files=False, isLast=False, isFirst=False, dir_symbol=''):
    print(dir_symbol)
    if isFirst:
        print(padding[:-1] + dir)
    else:
        if isLast:
            print(padding[:-1] + LEFT_EL +  dir_symbol + basename(abspath(dir)))
        else:
            print(padding[:-1] + LEFT_TEE +  dir_symbol + basename(abspath(dir)))
    files = []
    if print_files:
        files = listdir(dir)
    else:
        files = [x for x in listdir(dir) if isdir(dir + sep + x)]
    if not isFirst:
        padding = padding + '   '
    files = sorted(files, key=lambda s: s.lower())
    count = 0
    last = len(files) - 1
    for i, file in enumerate(files):
        count += 1
        path = dir + sep + file
        isLast = i == last

        if isdir(file):
            is_dir = dir_symbol
        else:
            is_dir = ''

        #if isdir(path) and path not in excluded_dirs:
        if isdir(path) and is_dir_included(path):
            if count == len(files):
                if isFirst:
                    tree(path, padding, print_files, isLast, False, dir_symbol)
                else:
                    tree(path, padding + ' ', print_files, isLast, False, dir_symbol)
            else:
                tree(path, padding + PIPE, print_files, isLast, False, dir_symbol)
        else:
            if isLast:
                print(padding + LEFT_EL + is_dir + file)
            else:
                print(padding + LEFT_TEE + is_dir + file)

def usage():
    return '''Usage: %s [-f]
Print tree structure of path specified.
Options:
-f      Print files as well as directories
PATH    Path to process''' % basename(argv[0])

def main():
    dir_symbol = u'\u2630'

    if len(argv) == 1:
        print(usage())
    elif len(argv) == 2:
        # print just directories
        path = argv[1]
        if isdir(path):
            tree(path, '', False, False, True)
        else:
            print('ERROR: \'' + path + '\' is not a directory')
    elif len(argv) == 3 and argv[1] == '-f':
        dir_symbol = u'\u2630'
        # print directories and files
        path = argv[2]
        if isdir(path):
            tree(path, '', True, False, True, dir_symbol)
        else:
            print('ERROR: \'' + path + '\' is not a directory')
    else:
        print(usage())

if __name__ == '__main__':
    main()
