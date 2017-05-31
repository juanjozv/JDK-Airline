<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Sign In </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- DataTable -->
        <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

        <!--Fuentes de Google Fonts-->
       <link href="https://fonts.googleapis.com/css?family=Arima+Madurai|Roboto|Sanchez|Lobster+Two|Satisfy|Lato" rel="stylesheet"
             
        <!-- CSS propio -->
        <link rel="stylesheet" title="xxx" type="text/css" href="css/estilo.css">
       
       <!-- JS propio -->
        <script type="text/javascript" src="js/Ciudad.js"></script>
        <script type="text/javascript" src="js/Avion.js"></script>
        <script type="text/javascript" src="js/TipoAvion.js"></script>
        <script type="text/javascript" src="js/Vuelo.js"></script>
        <script type="text/javascript" src="js/Viaje.js"></script>
        <script type="text/javascript" src="js/Usuario.js"></script>
        <script type="text/javascript" src="js/Proxy.js"></script>
        <script type="text/javascript" src="js/JsonUtils.js"></script>
        
        
        
        <%@ include file="header.jspf" %>
    </head>
    <body>
        
        <br><br><br>
        <div class="container">
            <h2>Crear cuenta</h2>
            <br><br>
            <form class="form-horizontal"  id="inicioSesion" action="javascript:doSubmit();">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="userName" type="text" class="form-control" placeholder="Ingrese su nombre de usuario" autocomplete="off">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="contrasena" type="password" class="form-control" placeholder="Ingrese su nueva contraseña">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="nombre" type="text" class="form-control" placeholder="Ingrese su nombre" autocomplete="off">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="apellido" type="text" class="form-control" placeholder="Ingrese su apellido" autocomplete="off">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input id="email" type="email" class="form-control" placeholder="Ingrese su correo electrónico" autocomplete="off">
                </div>
                <br>
                <div class="input-group" id="birthday">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                        <span>
                        <div><select class="form-control" id="years" ><option selected disabled>Año de nacimiento</option></select></div>
                        <div><select class="form-control" id="months"><option selected disabled>Mes de nacimiento</option></select></div>
                        <div><select class="form-control" id="days"></select></div>     
                        </span>
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                    <input id="telefono" type="text" class="form-control" placeholder="Ingrese su número telefónico de trabajo" autocomplete="off">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <input id="celular" type="text" class="form-control" placeholder="Ingrese su número de celular" autocomplete="off">
                </div>
                <br>
                <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                        <input id="ubicacion" type="text" class="form-control" placeholder="Seleccione ubicación en el mapa" disabled>
                </div>
                <br>
                <center>
                    <div id="map" style="width:60%;height:400px"></div>
                    <br>
                    
                    <br>
                    <div class="btn-group btn-group-lg" id="registrarse">
                        <button type="submit" class="btn btn-primary" id="btnRegistrarse">Registrarse</button>
                    </div>
                 </center>
                <br>
                <br>
            </form>
        </div>
    </body>
    
    <!-- SECCIÓN DE CONTÁCTENOS - PIE DE PÁGINA -->
    <footer id="PgFooter">
        <%@ include file="footer.jspf" %>
    </footer>
</html>

<script>
    //Modelo
    function signInModelo() {
        this.signInModelo();
       
    }
    signInModelo.prototype = {
        signInModelo: function () {}
    };
</script>

<script>
    //Control
    function signInControl(modelo, vista) {
        this.signInControl(modelo, vista);
    }
    
    signInControl.prototype = {
        signInControl: function (modelo, vista) {
            this.modelo = modelo;
            this.vista = vista;
        },
        agregarUsuario: function (nuevoUsuario) {
            var modelo = this.modelo;
            var vista = this.vista;
            Proxy.UsuarioAdd(nuevoUsuario, function(result) {
                if(result != 0){
                    window.alert("El nombre de usuario ya existe");
                }
                if(result == 0) {
                    window.alert("Nuevo Usuario agregado");
                }
            });
        }
        
    };
    
</script>

<script>
    //Vista
    var modelo;
    var controlador;
    
    function cargarPagina(event) {
        modelo = new signInModelo();
        controlador = new signInControl(modelo, window);
        var formulario = document.getElementById("inicioSesion");
        formulario.reset();
        formulario.addEventListener("submit", validar); 
    }
    function validar(event) {
        var usuario = document.getElementById("userName");
        var contrasena = document.getElementById("contrasena");
        var nombre = document.getElementById("nombre");
        var apellido = document.getElementById("apellido");
        var email = document.getElementById("email");
        var diaNacimiento = document.getElementById("days");
        var mesNacimiento = document.getElementById("months");
        var anoNacimiento = document.getElementById("years");
        var telefono = document.getElementById("telefono");
        var celular = document.getElementById("celular");
        var ubicacion = document.getElementById("ubicacion");
        
        var error = false;

        usuario.classList.remove("invalid");
        if (usuario.value == "") {
            usuario.classList.add("invalid");
            error = true;
        }
        
        contrasena.classList.remove("invalid");
        if (contrasena.value == "") {
            contrasena.classList.add("invalid");
            error = true;
        }
        
        nombre.classList.remove("invalid");
        if (nombre.value == "") {
            nombre.classList.add("invalid");
            error = true;
        }
        
        apellido.classList.remove("invalid");
        if (apellido.value == "") {
            apellido.classList.add("invalid");
            error = true;
        }
        
        email.classList.remove("invalid");
        if (email.value == "") {
            email.classList.add("invalid");
            error = true;
        }
        
        diaNacimiento.classList.remove("invalid");
        if (diaNacimiento.value == "Día de nacimiento") {
            diaNacimiento.classList.add("invalid");
            error = true;
        }
        
        mesNacimiento.classList.remove("invalid");
        if (mesNacimiento.value == "Mes de nacimiento") {
            mesNacimiento.classList.add("invalid");
            error = true;
        }
        
        anoNacimiento.classList.remove("invalid");
        if (anoNacimiento.value == "Año de nacimiento") {
            anoNacimiento.classList.add("invalid");
            error = true;
        }
        
        
        telefono.classList.remove("invalid");
        if (telefono.value == "") {
            telefono.classList.add("invalid");
            error = true;
        }
        
        celular.classList.remove("invalid");
        if (celular.value == "") {
            celular.classList.add("invalid");
            error = true;
        }
        
        ubicacion.classList.remove("invalid");
        if (ubicacion.value == "") {
            ubicacion.classList.add("invalid");
            error = true;
        }
        
        usuario.classList.remove("invalid");
        if (usuario.value == "") {
            usuario.classList.add("invalid");
            error = true;
        }
        
        if (error) {
            window.alert("Error: Espacios vacios");
            event.preventDefault();
        }
    }
    
    function doSubmit() {
        var usuario = document.getElementById("userName").value;
        var contrasena = document.getElementById("contrasena").value;
        var nombre = document.getElementById("nombre").value;
        var apellido = document.getElementById("apellido").value;
        var email = document.getElementById("email").value;
        var diaNacimiento = document.getElementById("days").value;
        var mesNacimiento = document.getElementById("months").value;
        var anoNacimiento = document.getElementById("years").value;
        var telefono = document.getElementById("telefono").value;
        var celular = document.getElementById("celular").value;
        var ubicacion = document.getElementById("ubicacion").value;
        
        var nacimiento = anoNacimiento + "-" + mesNacimiento + "-" + diaNacimiento;
        ubicacion = getCleanedString(ubicacion);
        
        var usuarioNuevo = new Usuario(usuario, contrasena, nombre, apellido, email, nacimiento,
        ubicacion, telefono, celular, 1);
        
        controlador.agregarUsuario(usuarioNuevo);
        var form = document.getElementById("inicioSesion");
        form.reset();
    }
    
    $(function() {

        //populate our years select box
        for (i = new Date().getFullYear(); i > 1940; i--){
            $('#years').append($('<option />').val(i).html(i));
        }
        //populate our months select box
        for (i = 1; i < 13; i++){
            $('#months').append($('<option />').val(i).html(i));
        }
        //populate our Days select box
        updateNumberOfDays(); 

        //"listen" for change events
        $('#years, #months').change(function(){
            updateNumberOfDays(); 
        });

    });

    //function to update the days based on the current values of month and year
    function updateNumberOfDays(){
        $('#days').html('');
        month = $('#months').val();
        year = $('#years').val();
        days = daysInMonth(month, year);
        $('#days').append('<option selected disabled>Día de nacimiento</option>');
        for(i=1; i < days+1 ; i++){
                $('#days').append($('<option />').val(i).html(i));
        }
    }

    //helper function
    function daysInMonth(month, year) {
        return new Date(year, month, 0).getDate();
    }
    
    
    function getCleanedString(cadena){
        // caracteres eliminar
        var specialChars = "!@#$^&%*()+=-[]\/{}|:<>?.";

        // elimina todos
        for (var i = 0; i < specialChars.length; i++) {
            cadena= cadena.replace(new RegExp("\\" + specialChars[i], 'gi'), '');
        }   

        //devolver limpio en minusculas
        //cadena = cadena.toLowerCase();

       
        //cadena = cadena.replace(/ /g," ");

        // Quita acentos y "ñ".
        cadena = cadena.replace(/á/gi,"a");
        cadena = cadena.replace(/é/gi,"e");
        cadena = cadena.replace(/í/gi,"i");
        cadena = cadena.replace(/ó/gi,"o");
        cadena = cadena.replace(/ú/gi,"u");
        cadena = cadena.replace(/ñ/gi,"n");
        return cadena;
    }
    
    function myMap() {
        var mapCanvas = document.getElementById("map");
        var myCenter = new google.maps.LatLng(9.908250364159004, -84.100341796875);
        var mapOptions = {center: myCenter, zoom: 5};
        var map = new google.maps.Map(mapCanvas, mapOptions);
        google.maps.event.addListener(map, 'click', function(event) {
            placeMarker(map, event.latLng);
        });        
    }
    
    var marker;
    function placeMarker(map, location) {
      var geocoder = new google.maps.Geocoder;
      //var infowindow = new google.maps.InfoWindow;
      if ( marker ) {
        marker.setPosition(location);
      } else {
        marker = new google.maps.Marker({
          position: location,
          map: map
        });
      }
      //geocodeLatLng(geocoder, map, infowindow, location, marker);
      geocodeLatLng(geocoder, location);
      
    }
    function geocodeLatLng(geocoder, position) {
          geocoder.geocode({'location': position}, function(results, status) {
          if (status === 'OK') {
            if (results[1]) {
              //infowindow.setContent(results[0].formatted_address);
              //infowindow.open(map, marker);
              document.getElementById('ubicacion').value = results[0].formatted_address;
            } else {
              window.alert('No results found');
            }
            } else {
              window.alert('Geocoder failed due to: ' + status);
            }
          });   
    }
    document.addEventListener("DOMContentLoaded", cargarPagina);
    
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjVarU3j6-ep42xFVVDevyVvmuGgCFEvc&callback=myMap"></script>