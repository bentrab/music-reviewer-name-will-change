

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

albumlist = read_csv('albumlist.csv')

datalist = []
for i in range(len(albumlist['Number'])):
	data = (albumlist['Artist'][i], albumlist['Album'][i], albumlist['Genre'][i],)
	datalist.append(data)

for data in datalist:
	#print('Artist: ' + data[0] + ", Album: " + data[1] + ", Genre: " + data[2])
	cursor.execute('''INSERT INTO album (album_artist, album_name, album_genre) VALUES(\'{artist}\', \'{album}\', \'{genre}\')'''.format(artist = data[0], album = data[1], genre = data[2]))
db.commit()
