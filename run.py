import os
import sys
import datetime
import configparser
<<<<<<< HEAD
import time   
#from flask_bcrypt import Bcrypt
=======
>>>>>>> 4b748404ca959ac378421a28ed18b7dfc6e4b44f
from flask import Flask, render_template, request, flash, session, redirect, url_for
import mysql.connector

# Read configuration from file.
config = configparser.ConfigParser()
config.read('config.ini')

# Set up application server.
app = Flask(__name__)
app.secret_key = "adbi327fds"

# Create a function for fetching data from the database.
def sql_query(sql):
    db = mysql.connector.connect(**config['mysql.connector'])
    cursor = db.cursor()
    cursor.execute(sql)
    result = cursor.fetchall()
    cursor.close()
    db.close()
    return result


def sql_execute(sql):
    db = mysql.connector.connect(**config['mysql.connector'])
    cursor = db.cursor()
    cursor.execute(*sql)
    db.commit()
    cursor.close()
    db.close()

# Goes to login on default
@app.route('/')
def basic_response():
	return redirect(url_for('login'))

# This route works for login
@app.route('/login', methods = ['GET', 'POST'])
def login():
	if 'user' in session:
		session.pop('user', session['user'])
		return redirect(url_for('home'))
		
	message = None
	
	if request.method == "POST":
		usern = request.form.get("username")
		passw = request.form.get("password")
		sql = "SELECT user.password FROM user WHERE user.username = '{usern}'".format(usern=usern)
		result = sql_query(sql)
		print(result, file=sys.stderr)
		password = result[0]
		
		if password[0] == passw:
			session['user'] = usern
			return redirect(url_for('home'))
		message = "Username or password is incorrect."
	return render_template("login.html", message=message)
   

# route for account registration
@app.route("/register", methods=["GET", "POST"])
def register():
	message = None
	if 'user' in session:
		return redirect(url_for('home'))
	if request.method == "POST":
		usern = request.form.get("username")
		x = 1
		if x:
			passw = request.form.get("password")
			sql = ("INSERT INTO user (username, password) VALUES (%s,%s)", (usern, passw))
            
			sql_execute(sql)
			session['user'] = usern
			return redirect(url_for('home'))
		else:
			flash('Username is already taken.')
			return redirect(url_for('register'))
	return render_template("registration.html", message=message)
	
	
# route for user's account
@app.route("/account", methods=['GET', 'POST'])
def account():
	if 'user' not in session:
		return redirect(url_for('login'))
	
	usern = session['user']
	if "edit-review" in request.form:
		review_id = int(request.form["edit-review"])
		session['review'] = review_id
		#session['review'] = review_id[0]
		return redirect(url_for('edit-review'))
	if "delete-review" in request.form:
		review_id = int(request.form["delete-review"])
		sql = "delete * from review where review.review_id={review_id}".format(review_id=review_id)
		sql_execute(sql)
	if "home" in request.form:
		return redirect(url_for('home'))
	sqlID = "select user.user_id from user where user.username = '{usern}'".format(usern=usern)
	result = sql_query(sqlID)
	user_id = result[0]
	template_data = {}
	sql = "select * from review, review_by where review_by.review_id=review.review_id and review_by.user_id={user_id}".format(user_id=user_id[0])
	reviews = sql_query(sql)
	template_data['reviews'] = reviews
	return render_template('account.html', template_data=template_data)

#route for logout
@app.route("/logout")
def logout():
    session.pop('user', session['user'])
    return redirect(url_for('login'))

# Home page after login	
@app.route('/home', methods=['GET', 'POST'])
def home():
	if 'user' not in session:
		return redirect(url_for('login'))
	
	usern = session['user']
	if request.method == "POST":
		if "search" in request.form:
			album = request.form['album']
			sql = "select album.album_id from album where album.album_name = '{album}'".format(album=album)
			result = sql_query(sql)
			album_id = result[0]
			if not album_id:
				flash('No results could be found for your search, please try again.')
				return redirect(url_for('home'))
			else:
				session['album'] = album_id[0]
				return redirect(url_for('album'))
		if "account" in request.form:
			return redirect(url_for('account'))
		if "logout" in request.form:
			session.pop('user', session['user'])
			return redirect(url_for('login'))
	return render_template('home.html')

	
# Page for album info and reviews
@app.route('/album', methods=['GET', 'POST'])
def album():
	if 'user' not in session:
		return redirect(url_for('login'))
	
	album_id = session['album']
	usern = session['user']
	if "createreview" in request.form:
		return redirect(url_for('createreview'))
	if "home" in request.form:
		session.pop('album', session['album'])
		return redirect(url_for('home'))
	sqlname = "select album.album_name from album where album.album_id = {album_id}".format(album_id=album_id)
	result_name = sql_query(sqlname)
	name = result_name[0]
	sqlart = "select album.album_artist from album where album.album_id = {album_id}".format(album_id=album_id)
	result_artist = sql_query(sqlart)
	artist = result_artist[0]
	sqlgen = "select album.album_genre from album where album.album_id = {album_id}".format(album_id=album_id)
	result_genre = sql_query(sqlgen)
	genre = result_genre[0]
	sqlrat = "select avg(review.review_score) from review, review_album, album where review.review_id = review_album.review_id and album.album_id = {album_id}".format(album_id=album_id)
	result_rating = sql_query(sqlrat)
	rating = result_rating[0]
	template_data = {}
	sqlrev = "select * from review, review_album, album where review.review_id = review_album.review_id and album.album_id = {album_id}".format(album_id=album_id)
	reviews = sql_query(sqlrev)
	template_data['reviews'] = reviews
	return render_template('album.html', name=name[0], artist=artist[0], genre=genre[0], rating=rating[0], template_data=template_data)

# Create review page
@app.route('/createreview', methods=["GET", "POST"])
def createreview():
	if 'user' not in session:
		return redirect(url_for('login'))
	album_id = session['album']
	if request.method == "POST":
		if "submit" in request.form:
			score = int(request.form['score'])
			comment = request.form['comment']
			if score > 0 and score < 101:
<<<<<<< HEAD
				#date = str(datetime.datetime.today()).split()[0]
				date = time.strftime('%Y-%m-%d %H:%M:%S')
				print(date, sys.stderr)
				sql = ("INSERT INTO review (review_text, review_score, review_date) VALUES (%s, %d, %s)",  (comment, score, "1111-11-11 11:11:11"))
=======
				date = int(datetime.datetime.now())
				sql = ("INSERT INTO review (review_text, review_score, review_date) VALUES (%s, %d, %s)",  (comment, score, date))
>>>>>>> 4b748404ca959ac378421a28ed18b7dfc6e4b44f
				sql_execute(sql)
				return redirect(url_for('album'))
			else:
				flash('Please enter an integer between 1 and 100')
				return redirect(url_for('createreview'))
		if "home" in request.form:
			session.pop('album', session['album'])
			return redirect(url_for('home'))
	album_sql = "SELECT * FROM album WHERE album.album_id = {album_id}".format(album_id=album_id)
	result_album = sql_query(album_sql)
	album = result_album[0]
	
	return render_template('createreview.html', album=album[0]) 

# Edit Review Page
@app.route('/edit-review', methods=["GET", "POST"])
def edit(review_id):
	if 'user' not in session:
		return redirect(url_for('login'))
	review_id = session['review']
	prevcommentsql = "SELECT review.review_text FROM review WHERE review.review_id = {review_id}".format(review_id=review_id)
	result_prevcomment = sql_query(prevcommentsql)
	prevcomment = result_prevcomment[0]
	prevratingsql = "SELECT review.review_score FROM review WHERE review.review_id = {review_id}".format(review_id=review_id)
	result_prevrating = sql_query(prevratingsql)
	prevrating = result_prevrating[0]
	if request.method == "POST":
		if "submit" in request.form:
			score = int(request.form['score'])
			comment = request.form['comment']
			if score > 0 and score < 101:
				date = int(datetime.datetime.now())
				sql = ("INSERT INTO review (review_text, review_score, review_date) VALUES (%s, %d, %s)",  (comment, score, date))
				sql_execute(sql)
				delete_sql = "DELETE * FROM review WHERE review_id = {review_id}".format(review_id=review_id)
				sql_execute(delete_sql)
				session.pop('review', session['review'])
				return redirect(url_for('account'))
		if "home" in request.form:
			session.pop('review', session['review'])
			return redirect(url_for('home'))
	
	return render_template('edit.html', comment=prevcomment[0], score=prevrating[0])
	
if __name__ == '__main__':
    app.run(**config['app'])


	
	
	  
