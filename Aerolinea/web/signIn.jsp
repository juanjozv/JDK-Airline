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

    </head>
    <body>
        <%@ include file="header.jspf" %>
        <br><br><br>
        <div class="container">
            <h2>Crear cuenta</h2>
            <br><br>
            <form class="form-horizontal" action="">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="nombre" type="text" class="form-control" placeholder="Ingrese su nombre">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-triangle-right"></i></span>
                    <input id="apellido" type="text" class="form-control" placeholder="Ingrese su apellido">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                    <input id="nacimiento" type="text" class="form-control" placeholder="Fecha de nacimiento DD/MM/AAAA">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
                    <input id="celular" type="text" class="form-control" placeholder="Ingrese su celular">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                    <input id="email" type="email" class="form-control" placeholder="Ingrese su correo electrónico">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="usuario" type="text" class="form-control" placeholder="Ingrese su nombre de usuario">
                </div>
                <br>
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="contraseña" type="password" class="form-control" placeholder="Ingrese su nueva contraseña">
                </div>
                <br>
                <center>
                    <div id="map" style="width:60%;height:400px"></div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                        <input id="ubicacion" type="text" class="form-control" placeholder="Escoja ubicación">
                    </div>
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
    function myMap() {
                      var mapCanvas = document.getElementById("map");
                      var myCenter=new google.maps.LatLng(9.908250364159004, -84.100341796875);
                      var mapOptions = {center: myCenter, zoom: 5};
                      var map = new google.maps.Map(mapCanvas, mapOptions);
                      google.maps.event.addListener(map, 'click', function(event) {
                        placeMarker(map, event.latLng);
                      });
                    }

                    function placeMarker(map, location) {
                      var marker = new google.maps.Marker({
                        position: location,
                        map: map
                      });
                      var infowindow = new google.maps.InfoWindow({
                        content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
                      });
                      infowindow.open(map,marker);
                    }                function myMap() {
                      var mapCanvas = document.getElementById("map");
                      var myCenter=new google.maps.LatLng(9.908250364159004, -84.100341796875);
                      var mapOptions = {center: myCenter, zoom: 5};
                      var map = new google.maps.Map(mapCanvas, mapOptions);
                      google.maps.event.addListener(map, 'click', function(event) {
                        placeMarker(map, event.latLng);
                      });
                    }

                    function placeMarker(map, location) {
                      var marker = new google.maps.Marker({
                        position: location,
                        map: map
                      });
                      var infowindow = new google.maps.InfoWindow({
                        content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
                      });
                      infowindow.open(map,marker);
                    }
</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjVarU3j6-ep42xFVVDevyVvmuGgCFEvc&callback=myMap"></script>