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
		print((path + '/' + file)[len(cwd)+1:])
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
print(cwd)
for file in listFiles(cwd):
	homepath = os.environ['HOME'] + '/' + file[len(cwd)+1:]
	call(['rm', homepath])
	call(['ln', '-s', file, homepath])
