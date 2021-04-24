from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re

# Create the application.
app = Flask(__name__)

app.secret_key = 'your secret key'

app.config['MYSQL_HOST'] = '50.87.151.191'
app.config['MYSQL_USER'] = 'rotary40_uasd'
app.config['MYSQL_PASSWORD'] = 'FE7Elmxa*)y&'
app.config['MYSQL_DB'] = 'rotary40_uasd'

mysql = MySQL(app)


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/publicaciones')
def publicaciones():
    return render_template('buscar.html')

@app.route('/single')
def single():
    return render_template('single.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    # Output message if something goes wrong...
    msg = ''
    # Check if "username" and "password" POST requests exist (user submitted form)
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form:
        # Create variables for easy access
        username = request.form['username']
        password = request.form['password']
        # Check if account exists using MySQL
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM Cuenta_Usuario WHERE username = %s AND password = %s', (username, password,))
        # Fetch one record and return result
        account = cursor.fetchone()
        # If account exists in accounts table in out database
        if account:
            # Create session data, we can access this data in other routes
            session['loggedin'] = True
            session['id_usuario'] = account['id_usuario']
            session['username'] = account['username']
            session['nombre'] = account['nombre']
            session['apellidos'] = account['apellidos']
            # Redirect to admin page
            return redirect(url_for('admin'))
        else:
            # Account doesnt exist or username/password incorrect
            msg = 'Incorrect username/password!'
    # Show the login form with message (if any)
    return render_template('login.html', msg=msg)

# this will be the admin page, only accessible for loggedin users
@app.route('/admin')
def admin():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the admin page
        return render_template('admin.html', nombre=session['nombre'], apellidos=session['apellidos'])
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/ver_trabajos')
def ver_trabajos():
    # Check if user is loggedin
    if 'loggedin' in session:
        # User is loggedin show them the admin page
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('select * from Trabajo_Academico INNER JOIN Nivel_Trabajo ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo INNER JOIN Tipo_Trabajo ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo INNER JOIN Recinto ON  Trabajo_Academico.id_recinto = Recinto.id_recinto INNER JOIN Facultad ON Trabajo_Academico.id_facultad = Facultad.id_facultad INNER JOIN Escuela ON Trabajo_Academico.id_escuela = Escuela.id_escuela INNER JOIN Carrera ON Trabajo_Academico.id_carrera = Carrera.id_carrera')
        trabajos = cursor.fetchall()
        return render_template('ver_trabajos.html', nombre=session['nombre'], apellidos=session['apellidos'], trabajos=trabajos)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/ver_trabajo/<id_trabajo>')
def ver_trabajo(id_trabajo):
    id_trabajo = id_trabajo
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(
            'SELECT descripcion_estatus, fecha_entrada FROM estatus INNER JOIN paquetes ON paquetes.id_paquete = estatus.id_paquete WHERE paquetes.id_paquete  = %s ORDER BY id_estatus DESC',
            (id_trabajo,))
        paquete_estatus = cursor.fetchall()
        # Show the profile page with account info
        return render_template("ver_trabajo.html", nombre=session['nombre'], id_trabajo=id_trabajo,
                               paquete_estatus=paquete_estatus)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/registrar_trabajo')
def registrar_trabajo():
    if 'loggedin' in session:
        return render_template('registrar_trabajo.html')
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/ver_escuelas')
def ver_escuelas():
    if 'loggedin' in session:
        return render_template('ver_escuelas.html')
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/ver_carreras')
def ver_carreras():
    if 'loggedin' in session:
        return render_template('ver_carreras.html')
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/ver_usuarios')
def ver_usuarios():
    if 'loggedin' in session:
        return render_template('ver_usuarios.html')
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/perfil')
def perfil():
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM Cuenta_Usuario WHERE id_usuario = %s', (session['id_usuario'],))
        account = cursor.fetchone()
        # Show the profile page with account info
        return render_template('perfil.html', account=account)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))

@app.route('/logout')
def logout():
    # Remove session data, this will log the user out
   session.pop('loggedin', None)
   session.pop('id_usuario', None)
   session.pop('username', None)
   session.pop('nombre', None)
   session.pop('apellidos', None)
   # Redirect to login page
   return redirect(url_for('index'))


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
	app.run(debug=True)
