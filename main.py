# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

# Create the application.
app = Flask(__name__)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/buscar')
def buscar():
    return render_template('buscar.html')

@app.route('/single')
def single():
    return render_template('single.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/register')
def register():
    return render_template('index.html')

@app.route('/home')
def home():
    return render_template('index.html')


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
	app.run(debug=True)
