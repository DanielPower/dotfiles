#!/bin/python
import os
from subprocess import call


ignored = [
	'.git',
	'install.py'
]


def listFiles(path):
	files = []
	for file in os.listdir(path):
		# Skip files in the ignored list
		if (path + '/' + file)[len(cwd)+1:] in ignored:
			continue
		# Add files to our list
		if os.path.isfile(path+'/'+file):
			files.append(path+'/'+file)
		# Recursively check directories
		elif os.path.isdir(path+'/'+file):
			files = files + listFiles(path+'/'+file)
	return files


cwd = os.getcwd()
for file in listFiles(cwd):
	print(file)
	homepath = os.environ['HOME'] + '/' + file[len(cwd)+1:]
	print('    Removing existing file (if it exists)')
	call(['rm', homepath])
	print('    Creating symlink')
	call(['ln', '-s', file, homepath])
