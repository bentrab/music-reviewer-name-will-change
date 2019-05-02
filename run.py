import os

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
        sql = "SELECT * FROM user WHERE username = '{usern}'".format(usern=usern)
        result = sql_query(sql)

        # result = db.execute("SELECT * FROM user WHERE username = :u", {"u": usern}).fetchone()

        if result is not None:
            #print(result['password'])
            if result[0] == passw:
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
	template_data = {}
	sql = "select * from review where review_by.review_id=review.review_id and review_by.username={usern}".format(usern=usern)
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
			sql = "select album.album_id from album where album.album_name = {album}".format(album=album)
			album_id = sql_query(sql)
			if not album_id:
				flash('No results could be found for your search, please try again.')
				return redirect(url_for('home'))
			else:
				return redirect(url_for('album'), album_id=album_id)
		if "account" in request.form:
			return redirect(url_for('account'))
		if "logout" in request.form:
			return redirect(url_for('logout'))
	return render_template('home.html')
	

@app.route('/album', methods=['GET', 'POST'])
def album(album_id):
	if 'user' not in session:
		return redirect(url_for('login'))
	
	usern = session['user']
	if "create-review" in request.form:
		return redirect(url_for('create-review'), album_id=album_id)
	if "home" in request.form:
		#return render_template('home.html', usern=usern)
		return redirect(url_for('home'))
	sqlname = "select album.album_name from album where album.album_id = {album_id}".format(album_id=album_id)
	name = sql_query(sqlname)
	sqlart = "select album.album_artist from album where album.album_id = {album_id}".format(album_id=album_id)
	artist = sql_query(sqlart)
	sqlgen = "select album.album_genre from album where album.album_id = {album_id}".format(album_id=album_id)
	genre = sql_query(sqlgen)
	sqlrat = "select avg(review.review_score) from review where review.review_id = review_album.review_id and album.album_id = {album_id}".format(album_id=album_id)
	template_data = {}
	sqlrev = "select * from review where review.review_id = review_album.review_id and album.album_id = {album_id}".format(album_id=album_id)
	reviews = sql_query(sqlrev)
	template_data['reviews'] = reviews
	return render_template('album.html', name=name, artist=artist, genre=genre, rating=rating, template_data=template_data)
	
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
def review(album_id):
	if 'user' not in session:
		return redirect(url_for('login'))
	if request.method == "POST":
		comment = request.form.get("comment")
		my_rating = request.form.get("rating")
		sql = "INSERT INTO review (review_text, review_score) VALUES ({comment}, {my_rating})"
		sql_execute(sql)
		return redirect(url_for('home'))
	album_sql = "SELECT * FROM album WHERE album.album_id = {album_id}"
	review_sql = "SELECT * FROM review WHERE review_album.album_id = {album_id} AND review_album.review_id = review.review_id"
	rating_sql = "SELECT AVG(review_score) FROM review WHERE review_album.album_id = {album_id} AND review_album.review_id = review.review_id"
	album = sql_query(album_sql)
	reviews = sql_query(review_sql)
	rating = sql_query(rating_sql)
	
	return render_template("review.html", book_info=album, reviews=reviews, rating=rating)  
	
	  
