"""
Credit: the function executeScriptFromFile came from GitHub user
awesome5team : https://github.com/awesome5team/General-Resources-Box/blob/master/sources/import-sql-file-to-mysql-via-python.py
The original code is written for python 2. Therefore, it cannot be 
directly imported into this file. A minor modification is done.
"""

import csv
import configparser
import mysql.connector

# Read configuration from file.
config = configparser.ConfigParser()
config.read('config.ini')

db = mysql.connector.connect(**config['mysql.connector'])
cursor = db.cursor()

def read_csv(csv_name):
	try:
		with open(csv_name, 'r') as file:
			songs = csv.reader(file)
			header = next(songs)
			data = {}
			for h in header:
				data[h] = []
			for row in songs:
				for head, value in zip(header, row):
					data[head].append(value)
		return data
	except FileNotFoundError:
		print('Error, file not found.')

def executeScriptsFromFile(filename):
	# Open and read the file as a single buffer
	fd = open(filename, 'r')
	sqlFile = fd.read()
	fd.close()

	# all SQL commands (split on ';')
	sqlCommands = sqlFile.split(';')
	
	# Execute every command from the input file
	for command in sqlCommands:
		# This will skip and report errors
		# For example, if the tables do not yet exist, this will skip over
		# the DROP TABLE commands
		try:
			if command.rstrip() != '':
				cursor.execute(command)
		except ValueError as msg:
			print("Command skipped: " + msg)

executeScriptsFromFile('./music_reviewer.sql')
db.commit()

album_list = read_csv('albumlist.csv')



