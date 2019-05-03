import os
import sys
import datetime
import configparser
#from flask_bcrypt import Bcrypt
from flask import Flask, render_template, request, flash, session, redirect, url_for
import mysql.connector

# Read configuration from file.
config = configparser.ConfigParser()
config.read('config.ini')

# Set up application server.
app = Flask(__name__)
#bcrypt = Bcrypt(app)
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

# For this example you can select a handler function by
# uncommenting one of the @app.route decorators.

@app.route('/')
def basic_response():
	return redirect(url_for('login'))

# This route involves some LOGIN stuff, not implemented yet	
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
	
		# result = db.execute("SELECT * FROM user WHERE username = :u", {"u": usern}).fetchone()
		
		if password[0] == passw:
			session['user'] = usern
			return redirect(url_for('home'))
		message = "Username or password is incorrect."
	return render_template("login.html", message=message)
   

# route for account registartion
@app.route("/register", methods=["GET", "POST"])
def register():
	message = None
	if 'user' in session:
		return redirect(url_for('home'))
	if request.method == "POST":
		usern = request.form.get("username")
		#sql_check = "select * from user where user.username={usern}".format(usern=usern)
		#user_check = sql_query(sql_check)
		#if not user_check:
		x = 1
		if x:
			passw = request.form.get("password")
			#passw_hash = bcrypt.generate_password_hash(passw).decode('utf-8')
			sql = ("INSERT INTO user (username, password) VALUES (%s,%s)", (usern, passw))
            
			#result = db.execute("INSERT INTO user (username, password) VALUES (:u, :p)", {"u": usern, "p": passw_hash})
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
		return redirect(url_for('edit-review'), review_id=review_id)
	if "delete-review" in request.form:
		review_id = int(request.form["delete-review"])
		sql = "delete * from review where review.review_id={review_id}".format(review_id=review_id)
		sql_execute(sql)
	if "home" in request.form:
		#return render_template('home.html', usern=usern)
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
#@app.route('/home/', methods=['GET', 'POST'])	
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
				return redirect(url_for('album', album_id=album_id[0]))
		if "account" in request.form:
			return redirect(url_for('account'))
		if "logout" in request.form:
			session.pop('user', session['user'])
			return redirect(url_for('login'))
	return render_template('home.html')
	

@app.route('/album', methods=['GET', 'POST'])
def album():
	if 'user' not in session:
		return redirect(url_for('login'))
	
	usern = session['user']
	if "create-review" in request.form:
		return redirect(url_for('create-review', album_id2=album_id))
	album_id = request.args['album_id']
	if "home" in request.form:
		#return render_template('home.html', usern=usern)
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
	
# Home page after login
#@app.route('/home/', methods=['GET', 'POST'])	
#@app.route('/home/<username>', methods=['GET', 'POST'])
#def home(username = None):
#	search_all = Search_All_Form(request.form)
#	if request.method == 'POST':
#		return search_all_results(search_all, username = username)
#	return render_template('home.html', username = username, form = search_all)

# Gets search results (don't think route is needed)	
# @app.route('/results')
def search_all_results(search_all, username):
	results = []
	search_string = search_all.data['search']
	if search_all.data['search'] == '':
		sql = "select artist_id, artist_name from artist order by artist_name"
		results = sql_query(sql)
	
	if not results:
		flash('No results could be found for your search, please try again.')
		return redirect('/home/%s' % username)
	else:
		return render_template('search_all_results.html', results = results)

# Given code from teacher's example, not used yet
#@app.route('/', methods=['GET', 'POST'])
def template_response_with_data():
    print(request.form)
    if "buy-book" in request.form:
        book_id = int(request.form["buy-book"])
        sql = "delete from book where id={book_id}".format(book_id=book_id)
        sql_execute(sql)
    template_data = {}
    sql = "select id, title from book order by title"
    books = sql_query(sql)
    template_data['books'] = books
    return render_template('home-w-data.html', template_data=template_data)

if __name__ == '__main__':
    app.run(**config['app'])

@app.route("/create-review", methods=["GET", "POST"])
def review():
	if 'user' not in session:
		return redirect(url_for('login'))
	album_id2 = request.args['album_id2']
	if request.method == "POST":
		if "submit" in request.form:
			score = request.form['score']
			comment = request.form['comment']
			if score > 0 and score < 101:
				date = str(datetime.datetime.today()).split()[0]
				sql = ("INSERT INTO review (review_text, review_score, review_date) VALUES (%s, %d, %d)",  (comment, score, date))
				return redirect(url_for('album', album_id2=album_id2))
			else:
				flash('No results could be found for your search, please try again.')
				return redirect(url_for('create-review'))
		if "home" in request.form:
			return redirect(url_for('home'))
	album_sql = "SELECT * FROM album WHERE album.album_id = {album_id}".format(album_id=album_id2)
	result_album = sql_query(album_sql)
	album = result_album[0]
	
	return render_template("review.html", album=album[0]) 

@app.route("/edit-review", methods=["GET", "POST"])
def edit(review_id):
	if 'user' not in session:
		return redirect(url_for('login'))
	prevcommentsql = "SELECT review.review_text FROM review WHERE review.review_id = {review_id}".format(review_id=review_id)
	result_prevcomment = sql_query(prevcommentsql)
	prevcomment=result_prevcomment[0]
	prevratingsql = "SELECT review.review_score FROM review WHERE review.review_id = {review_id}".format(review_id=review_id)
	result_prevrating = sql_query(prevratingsql)
	prevrating = result_prevrating[0]
	if request.method == "POST":
		comment = request.form.get("comment")
		my_rating = request.form.get("rating")
		if comment == null:
			commentsql = prevcomment[0]
		if  my_rating == null:
			my_rating = prevrating[0]
		#delete old comment
		delete_sql = "DELETE * FROM review WHERE review_id = {review_id}".format(review_id=review_id)
		sql_execute(delete_sql)
		#insert new comment
		new_sql = ("INSERT INTO review (review_text, review_score) VALUES (%s, %d)",  (comment,my_rating))
		sql_execute(new_sql)
	
	return render_template("edit.html", )


	
	
	  
