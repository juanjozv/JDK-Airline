<%-- 
    Document   : login
    Created on : 20/05/2017, 07:03:26 PM
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea Busqueda </title>
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
                    <input id="userName" type="text" class="form-control" placeholder="Ingrese su nombre de usuario">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="contrasena" type="password" class="form-control" placeholder="Ingrese su nueva contraseña">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="nombre" type="text" class="form-control" placeholder="Ingrese su nombre">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="apellido" type="text" class="form-control" placeholder="Ingrese su apellido">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input id="email" type="email" class="form-control" placeholder="Ingrese su correo electrónico">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input id="nacimiento" type="text" class="form-control" placeholder="Fecha de nacimiento DD/MM/AAAA">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                    <input id="telefono" type="text" class="form-control" placeholder="Ingrese su número telefónico de trabajo">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
                    <input id="celular" type="text" class="form-control" placeholder="Ingrese su número de celular">
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
        var nacimiento = document.getElementById("nacimiento");
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
        
        nacimiento.classList.remove("invalid");
        if (nacimiento.value == "") {
            nacimiento.classList.add("invalid");
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
        var nacimiento = document.getElementById("nacimiento").value;
        var telefono = document.getElementById("telefono").value;
        var celular = document.getElementById("celular").value;
        var ubicacion = document.getElementById("ubicacion").value;
        
        var usuarioNuevo = new Usuario(usuario, contrasena, nombre, apellido, email, nacimiento,
        ubicacion, telefono, celular);
        Proxy.UsuarioAdd(usuarioNuevo, function(result) {
            window.alert("Usuario Insertado");
        });
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