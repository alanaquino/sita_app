from ast import dump

from flask import Flask, render_template, request, redirect, url_for, session, jsonify, flash
from flask_mysqldb import MySQL
import MySQLdb.cursors
import os

# Create the application.
app = Flask(__name__)

app.secret_key = 'your secret key'

app.config['MYSQL_HOST'] = '50.87.151.191'
app.config['MYSQL_USER'] = 'rotary40_uasd'
app.config['MYSQL_PASSWORD'] = 'FE7Elmxa*)y&'
app.config['MYSQL_DB'] = 'rotary40_uasd'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config['UPLOAD_PATH'] = 'static/uploads'

mysql = MySQL(app)


@app.route('/')
def index():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
        'SELECT * '
        'FROM Trabajo_Academico '
        'INNER JOIN Nivel_Trabajo '
        '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
        'INNER JOIN Tipo_Trabajo '
        '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
        'INNER JOIN Recinto '
        '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
        'INNER JOIN Facultad '
        '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
        'INNER JOIN Escuela '
        '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
        'INNER JOIN Carrera '
        '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
        'ORDER BY fecha_publicacion DESC LIMIT 3')
    trabajos = cursor.fetchall()
    cursor.execute('SELECT * FROM Estudiante')
    estudiantes = cursor.fetchall()
    return render_template('index.html', trabajos=trabajos, estudiantes=estudiantes)


@app.route('/publicaciones')
def publicaciones():
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute('SELECT COUNT(*) FROM Trabajo_Academico')
    total = cursor.fetchone()
    cursor.execute(
        'SELECT * FROM Trabajo_Academico '
        'INNER JOIN Nivel_Trabajo '
        '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
        'INNER JOIN Tipo_Trabajo '
        '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
        'INNER JOIN Recinto '
        '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
        'INNER JOIN Facultad '
        '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
        'INNER JOIN Escuela '
        '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
        'INNER JOIN Carrera '
        '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
        'ORDER BY fecha_publicacion DESC')
    trabajos = cursor.fetchall()
    cursor.execute('SELECT * FROM Estudiante')
    estudiantes = cursor.fetchall()
    cursor.execute(
        'SELECT Facultad.nombre_facultad as Facultad, COUNT(Trabajo_Academico.id_facultad) as Total '
        'FROM Trabajo_Academico '
        'INNER JOIN Facultad '
        '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
        'GROUP BY Facultad.id_facultad '
        'ORDER BY COUNT(Trabajo_Academico.id_facultad) DESC')
    estadisticas = cursor.fetchall()
    return render_template('publicaciones.html', trabajos=trabajos, estudiantes=estudiantes, total=total,
                           estadisticas=estadisticas)


@app.route('/buscar', methods=['GET', 'POST'])
def buscar():
    if request.method == 'POST' and 'search' in request.form:
        search_term = request.form.get("search")
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        query2 = "SELECT COUNT(*) FROM Trabajo_Academico WHERE titulo_trabajo LIKE '%{}%'".format(search_term)
        cursor.execute(query2)
        total = cursor.fetchone()
        query = "SELECT * " \
                "FROM Trabajo_Academico " \
                "INNER JOIN Nivel_Trabajo " \
                "   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo " \
                "INNER JOIN Tipo_Trabajo " \
                "   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo " \
                "INNER JOIN Recinto " \
                "   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto " \
                "INNER JOIN Facultad " \
                "   ON Trabajo_Academico.id_facultad = Facultad.id_facultad " \
                "INNER JOIN Escuela " \
                "   ON Trabajo_Academico.id_escuela = Escuela.id_escuela " \
                "INNER JOIN Carrera " \
                "   ON Trabajo_Academico.id_carrera = Carrera.id_carrera " \
                "WHERE titulo_trabajo LIKE '%{}%'".format(
            search_term)
        cursor.execute(query)
        result = cursor.fetchall()
        cursor.execute('SELECT * FROM Estudiante')
        estudiantes = cursor.fetchall()
        cursor.execute(
            'SELECT Facultad.nombre_facultad as Facultad, COUNT(Trabajo_Academico.id_facultad) as Total '
            'FROM Trabajo_Academico '
            'INNER JOIN Facultad '
            '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
            'GROUP BY Facultad.id_facultad '
            'ORDER BY COUNT(Trabajo_Academico.id_facultad) DESC')
        estadisticas = cursor.fetchall()
        return render_template("buscar.html", trabajos=result, estudiantes=estudiantes, estadisticas=estadisticas,
                               total=total, search_term=search_term)
    else:
        return render_template("publicaciones.html")


@app.route('/ver_publicacion/<id_trabajo>')
def publicacion(id_trabajo):
    id_trabajo = id_trabajo
    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    cursor.execute(
        'SELECT * FROM Trabajo_Academico '
        'INNER JOIN Nivel_Trabajo '
        '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
        'INNER JOIN Tipo_Trabajo '
        '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
        'INNER JOIN Recinto '
        '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
        'INNER JOIN Facultad '
        '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
        'INNER JOIN Escuela '
        '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
        'INNER JOIN Carrera '
        '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
        'WHERE id_trabajo  = %s',
        (id_trabajo,))
    trabajo = cursor.fetchone()
    cursor.execute('SELECT * FROM Estudiante')
    estudiantes = cursor.fetchall()
    cursor.execute('SELECT * FROM Asesor')
    asesores = cursor.fetchall()
    return render_template('ver_publicacion.html', trabajo=trabajo, estudiantes=estudiantes, asesores=asesores)


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
        cursor.execute(
            'SELECT * '
            'FROM Trabajo_Academico '
            'INNER JOIN Nivel_Trabajo '
            '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
            'INNER JOIN Tipo_Trabajo '
            '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
            'INNER JOIN Recinto '
            '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
            'INNER JOIN Facultad '
            '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
            'INNER JOIN Escuela '
            '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
            'INNER JOIN Carrera '
            '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
            'ORDER BY fecha_publicacion DESC')
        trabajos = cursor.fetchall()
        cursor.execute('SELECT * FROM Estudiante')
        estudiantes = cursor.fetchall()
        return render_template('ver_trabajos.html', nombre=session['nombre'], apellidos=session['apellidos'],
                               trabajos=trabajos, estudiantes=estudiantes)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route("/ver_trabajo/<id_trabajo>")
def ver_trabajo(id_trabajo):
    id_trabajo = id_trabajo
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(
            'SELECT * FROM Trabajo_Academico '
            'INNER JOIN Nivel_Trabajo '
            '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
            'INNER JOIN Tipo_Trabajo '
            '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
            'INNER JOIN Recinto '
            '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
            'INNER JOIN Facultad '
            '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
            'INNER JOIN Escuela'
            '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
            'INNER JOIN Carrera '
            '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
            'INNER JOIN Cuenta_Usuario '
            '   ON Trabajo_Academico.registrado_por = Cuenta_Usuario.id_usuario '
            'WHERE id_trabajo  = %s',
            (id_trabajo,))
        trabajo = cursor.fetchone()
        cursor.execute('SELECT * FROM Estudiante')
        estudiantes = cursor.fetchall()
        cursor.execute('SELECT * FROM Asesor')
        asesores = cursor.fetchall()
        # Show the profile page with account info
        return render_template("ver_trabajo.html", nombre=session['nombre'], apellidos=session['apellidos'],
                               trabajo=trabajo, estudiantes=estudiantes, asesores=asesores)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route("/editar_trabajo/<id_trabajo>")
def editar_trabajo(id_trabajo):
    id_trabajo = id_trabajo
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(
            'SELECT * FROM Trabajo_Academico '
            'INNER JOIN Nivel_Trabajo '
            '   ON  Trabajo_Academico.id_nivel_trabajo = Nivel_Trabajo.id_nivel_trabajo '
            'INNER JOIN Tipo_Trabajo '
            '   ON  Trabajo_Academico.id_tipo_trabajo = Tipo_Trabajo.id_tipo_trabajo '
            'INNER JOIN Recinto '
            '   ON  Trabajo_Academico.id_recinto = Recinto.id_recinto '
            'INNER JOIN Facultad '
            '   ON Trabajo_Academico.id_facultad = Facultad.id_facultad '
            'INNER JOIN Escuela '
            '   ON Trabajo_Academico.id_escuela = Escuela.id_escuela '
            'INNER JOIN Carrera '
            '   ON Trabajo_Academico.id_carrera = Carrera.id_carrera '
            'INNER JOIN Cuenta_Usuario '
            '   ON Trabajo_Academico.registrado_por = Cuenta_Usuario.id_usuario '
            'WHERE id_trabajo  = %s',
            (id_trabajo,))
        trabajo = cursor.fetchone()
        cursor.execute('SELECT * FROM Estudiante')
        estudiantes = cursor.fetchall()
        cursor.execute('SELECT * FROM Asesor')
        asesores = cursor.fetchall()
        cursor.execute('SELECT * FROM Recinto')
        recintos = cursor.fetchall()
        cursor.execute("SELECT * FROM Facultad")
        facultades = cursor.fetchall()
        # Show the profile page with account info
        return render_template("editar_trabajo.html", nombre=session['nombre'], apellidos=session['apellidos'],
                               trabajo=trabajo, estudiantes=estudiantes, asesores=asesores, recintos=recintos,
                               facultades=facultades)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/editar_trabajo/get_escuelas/<id_facultad>')
def get_escuelas2(id_facultad):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    result = cur.execute("SELECT * FROM Escuela WHERE id_facultad = %s", [id_facultad])
    escuelas = cur.fetchall()
    escuelaArray = []
    for escuela in escuelas:
        escuelaObj = {
            'id_escuela': escuela['id_escuela'],
            'nombre_escuela': escuela['nombre_escuela']}
        escuelaArray.append(escuelaObj)
    return jsonify({'facultad_escuela': escuelaArray})


@app.route('/editar_trabajo/get_carreras/<id_escuela>')
def get_carreras2(id_escuela):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    result = cur.execute("SELECT * FROM Carrera WHERE id_escuela = %s", [id_escuela])
    carreras = cur.fetchall()
    carreraArray = []
    for carrera in carreras:
        carreraObj = {
            'id_carrera': carrera['id_carrera'],
            'nombre_carrera': carrera['nombre_carrera']}
        carreraArray.append(carreraObj)
    return jsonify({'listacarreras': carreraArray})


@app.route('/actualizar_trabajo', methods=['GET', 'POST'])
def actualizar_trabajo():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * '
                       'FROM Recinto')
        recintos = cursor.fetchall()
        cursor.execute("SELECT * FROM Facultad")
        facultades = cursor.fetchall()

        msg = ''
        id_est = ''
        nombres_est = ''
        apellidos_est = ''
        matricula_est = ''
        id_as = ''
        nombres_as = ''
        apellidos_as = ''
        i = 0

        # Si se envía el formulario
        if request.method == 'POST':
            id_trabajo = request.form['id_trabajo']
            titulo_trabajo = request.form['titulo']
            extracto = request.form['extracto']
            id_tipo_trabajo = request.form['tipo_trabajo_academico']
            id_nivel_trabajo = request.form['nivel_trabajo_academico']
            fecha_publicacion = request.form['fecha_publicacion']
            id_recinto = request.form['recinto_universitario']
            id_facultad = request.form['facultad']
            id_escuela = request.form['escuela']
            id_carrera = request.form['carrera']
            registrado_por = session['id_usuario']

            if request.files['archivo'] is None:
                uploaded_file = None
            else:
                uploaded_file = request.files['archivo']

            # Obtiene los datos de los estudiantes ingresados
            id_est = request.form.getlist('id_estudiantes[]')
            nombres_est = request.form.getlist('nombres_estudiantes[]')
            apellidos_est = request.form.getlist('apellidos_estudiantes[]')
            matricula_est = request.form.getlist('matricula_estudiantes[]')
            # Obtiene los datos de los asesores ingresados
            id_as = request.form.getlist('id_asesores[]')
            nombres_as = request.form.getlist('nombres_asesores[]')
            apellidos_as = request.form.getlist('apellidos_asesores[]')

            # guarda el archivo adjunto
            if uploaded_file.filename != '':
                uploaded_file.save(os.path.join(app.config['UPLOAD_PATH'], uploaded_file.filename))

            cursor.execute('UPDATE Trabajo_Academico '
                           'SET titulo_trabajo = %s,'
                           'extracto = %s, '
                           'id_tipo_trabajo = %s, '
                           'id_nivel_trabajo = %s,'
                           'fecha_publicacion = %s, '
                           'id_recinto = %s, '
                           'id_facultad = %s, '
                           'id_escuela = %s, '
                           'id_carrera = %s, '
                           'registrado_por = %s, '
                           'archivo_adjunto = %s '
                           'WHERE id_trabajo = %s',
                           (titulo_trabajo, extracto, id_tipo_trabajo, id_nivel_trabajo,
                            fecha_publicacion, id_recinto, id_facultad, id_escuela, id_carrera,
                            registrado_por, uploaded_file.filename, id_trabajo,))
            mysql.connection.commit()

            print(cursor.rowcount, "Trabajo_Academico(s) affected")

            if not nombres_est:
                print("List is empty")
            else:
                while i < len(nombres_est):
                    print(nombres_est[i], apellidos_est[i], matricula_est[i], id_est[i])
                    sql = "UPDATE Estudiante SET nombres = %s, apellidos = %s, matricula = %s WHERE id_estudiante = %s"
                    val = (nombres_est[i], apellidos_est[i], matricula_est[i], id_est[i])
                    cursor.execute(sql, val)
                    mysql.connection.commit()
                    print(cursor.rowcount, "Estudiante(s) affected")
                    i = i + 1

            if not nombres_as:
                print("List is empty")
            else:
                for x in range(len(nombres_as)):
                    print(nombres_as[x], apellidos_as[x], id_as[x])
                    sql2 = "UPDATE Asesor SET nombre = %s, apellidos = %s WHERE id_asesor = %s"
                    val2 = (nombres_as[x], apellidos_as[x], id_as[x])
                    cursor.execute(sql2, val2)
                    mysql.connection.commit()
                    print(cursor.rowcount, "Asesor(s) affected")

            msg = 'Se ha actualizado exitosamente el Trabajo Académico #' + id_trabajo

        return render_template('msj.html', nombre=session['nombre'], apellidos=session['apellidos'], msg=msg)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/registrar_trabajo', methods=['GET', 'POST'])
def registrar_trabajo():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * '
                       'FROM Recinto')
        recintos = cursor.fetchall()
        cursor.execute("SELECT * FROM Facultad")
        facultades = cursor.fetchall()

        msg = ''
        nombres_est = ''
        apellidos_est = ''
        matricula_est = ''
        nombres_as = ''
        apellidos_as = ''
        i = 0
        x = 0

        # Si se envía el formulario
        if request.method == 'POST':
            titulo_trabajo = request.form['titulo']
            extracto = request.form['extracto']
            id_tipo_trabajo = request.form['tipo_trabajo_academico']
            id_nivel_trabajo = request.form['nivel_trabajo_academico']
            fecha_publicacion = request.form['fecha_publicacion']
            id_recinto = request.form['recinto_universitario']
            id_facultad = request.form['facultad']
            id_escuela = request.form['escuela']
            id_carrera = request.form['carrera']
            registrado_por = session['id_usuario']
            uploaded_file = request.files['archivo']

            # Obtiene los datos de los estudiantes ingresados
            nombres_est = request.form.getlist('nombres_estudiantes[]')
            apellidos_est = request.form.getlist('apellidos_estudiantes[]')
            matricula_est = request.form.getlist('matricula_estudiantes[]')
            # Obtiene los datos de los asesores ingresados
            nombres_as = request.form.getlist('nombres_asesores[]')
            apellidos_as = request.form.getlist('apellidos_asesores[]')

            # guarda el archivo adjunto
            if uploaded_file.filename != '':
                uploaded_file.save(os.path.join(app.config['UPLOAD_PATH'], uploaded_file.filename))

            cursor.execute(
                'INSERT INTO Trabajo_Academico ('
                'titulo_trabajo, '
                'extracto, '
                'id_tipo_trabajo, '
                'id_nivel_trabajo,'
                'fecha_publicacion, '
                'id_recinto, '
                'id_facultad, '
                'id_escuela, '
                'id_carrera, '
                'registrado_por, '
                'archivo_adjunto) '
                'VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)',
                (titulo_trabajo, extracto, id_tipo_trabajo, id_nivel_trabajo,
                 fecha_publicacion, id_recinto, id_facultad, id_escuela, id_carrera,
                 registrado_por, uploaded_file.filename,))
            mysql.connection.commit()

            # Obtiene el ID del trabajo registrado para asignaselo a los estudiantes y asesores
            trabajo_est = cursor.lastrowid

            while i < len(nombres_est):
                print(nombres_est[i], apellidos_est[i], matricula_est[i])
                sql = "INSERT INTO Estudiante (nombres, apellidos, matricula, id_trabajo) VALUES (%s, %s, %s, %s)"
                val = (nombres_est[i], apellidos_est[i], matricula_est[i], trabajo_est)
                cursor.execute(sql, val)
                mysql.connection.commit()
                i = i + 1

            while x < len(nombres_as):
                print(nombres_as[x], apellidos_as[x])
                sql2 = "INSERT INTO Asesor (nombre, apellidos, id_trabajo) VALUES (%s, %s, %s)"
                val2 = (nombres_as[x], apellidos_as[x], trabajo_est)
                cursor.execute(sql2, val2)
                mysql.connection.commit()
                x = x + 1

            msg = "¡Trabajo registrado exitosamente!"
            return render_template('msg.html', nombre=session['nombre'], apellidos=session['apellidos'], msg=msg)
        # Mientras no se envíe el nuevo trabajo se muestra esta página
        return render_template('registrar_trabajo.html', nombre=session['nombre'], apellidos=session['apellidos'],
                               recintos=recintos, facultades=facultades, msg=msg)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/get_escuelas/<id_facultad>')
def get_escuelas(id_facultad):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    result = cur.execute("SELECT * FROM Escuela WHERE id_facultad = %s", [id_facultad])
    escuelas = cur.fetchall()
    escuelaArray = []
    for escuela in escuelas:
        escuelaObj = {
            'id_escuela': escuela['id_escuela'],
            'nombre_escuela': escuela['nombre_escuela']}
        escuelaArray.append(escuelaObj)
    return jsonify({'facultad_escuela': escuelaArray})


@app.route('/get_carreras/<id_escuela>')
def get_carreras(id_escuela):
    cur = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
    result = cur.execute("SELECT * FROM Carrera WHERE id_escuela = %s", [id_escuela])
    carreras = cur.fetchall()
    carreraArray = []
    for carrera in carreras:
        carreraObj = {
            'id_carrera': carrera['id_carrera'],
            'nombre_carrera': carrera['nombre_carrera']}
        carreraArray.append(carreraObj)
    return jsonify({'listacarreras': carreraArray})


@app.route('/ver_escuelas')
def ver_escuelas():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * '
                       'FROM Escuela '
                       '    INNER JOIN Facultad '
                       'WHERE Escuela.id_facultad = Facultad.id_facultad')
        escuelas = cursor.fetchall()
        return render_template('ver_escuelas.html', nombre=session['nombre'], apellidos=session['apellidos'],
                               escuelas=escuelas)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/ver_carreras')
def ver_carreras():
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * '
                       'FROM Carrera '
                       '    INNER JOIN Escuela '
                       'WHERE Carrera.id_escuela = Escuela.id_escuela')
        carreras = cursor.fetchall()
        # Show the profile page with account info
        return render_template("ver_carreras.html", nombre=session['nombre'], apellidos=session['apellidos'],
                               carreras=carreras)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/agregar_carrera', methods=['GET', 'POST'])
def agregar_carrera():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute("SELECT * FROM Facultad")
        facultades = cursor.fetchall()
        msg = ''
        # Si se envía el formulario
        if request.method == 'POST':
            nombre_carrera = request.form['nombre_carrera']
            id_escuela = request.form['escuela']

            cursor.execute('INSERT INTO Carrera (nombre_carrera, id_escuela) VALUES (%s, %s)',
                           (nombre_carrera, id_escuela,))
            mysql.connection.commit()

            msg = "!Carrera registrada exitosamente!"
        elif request.method == 'POST':
            # Form is empty... (no POST data)
            msg = 'Please fill out the form!'
        # Show registration form with message (if any)
        return render_template('agregar_carrera.html', nombre=session['nombre'], apellidos=session['apellidos'],
                               facultades=facultades, msg=msg)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/ver_usuarios')
def ver_usuarios():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(
            "SELECT * FROM Cuenta_Usuario INNER JOIN Recinto WHERE Cuenta_Usuario.id_recinto = Recinto.id_recinto")
        usuarios = cursor.fetchall()
        return render_template('ver_usuarios.html', nombre=session['nombre'], apellidos=session['apellidos'],
                               usuarios=usuarios)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/perfil')
def perfil():
    # Check if user is loggedin
    if 'loggedin' in session:
        # We need all the account info for the user so we can display it on the profile page
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute(
            'SELECT * FROM Cuenta_Usuario '
            'INNER JOIN Recinto '
            '   ON Cuenta_Usuario.id_recinto = Recinto.id_recinto '
            'WHERE id_usuario = %s',
            (session['id_usuario'],))
        usuarios = cursor.fetchall()
        # Show the profile page with account info
        return render_template('perfil.html', nombre=session['nombre'], apellidos=session['apellidos'], usuarios=usuarios)
    # User is not loggedin redirect to login page
    return redirect(url_for('login'))


@app.route('/cambio_clave', methods=['GET', 'POST'])
def cambiar_clave():
    if request.method == 'POST' and 'clave_antigua' in request.form and 'clave_nueva' in request.form:
        id_usuario = str(session['id_usuario'])
        clave_antigua = request.form['clave_antigua']
        clave_nueva = request.form['clave_nueva']
        confirmacion_clave_nueva = request.form['confirmacion_clave_nueva']
        cursor = mysql.connection.cursor()
        cursor.execute('SELECT * FROM Cuenta_Usuario WHERE id_usuario = %s', (id_usuario,))
        registro_obtenido = cursor.fetchall()
        confirmacion_clave_antigua = registro_obtenido[0]['password']

        if clave_antigua == confirmacion_clave_antigua:
            if clave_nueva != confirmacion_clave_nueva:
                mensaje = "Las contraseñas nuevas introducidas no son iguales!"
                flash(mensaje, 'danger')
                return redirect(url_for('cambiar_clave'))

            cursor.execute("UPDATE Cuenta_Usuario SET password ='{0}' WHERE id_usuario = '{1}'".format(clave_nueva, id_usuario))
            mysql.connection.commit()
            cursor.close()
            mensaje = "Contraseña cambiada correctamente!"
            flash(mensaje, 'success')
            return redirect(url_for('perfil'))
        else:
            mensaje = "La clave antigua introducida es incorrecta!"
            flash(mensaje, 'danger')
            return redirect(url_for('cambiar_clave'))

    return render_template('cambiar_clave.html')



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
