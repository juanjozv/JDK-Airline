<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--Fuentes de Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Arima+Madurai|Roboto|Sanchez|Lobster+Two|Satisfy|Lato" rel="stylesheet">

        <!-- CSS propio -->
        <link rel="stylesheet" title="estiloIndex" type="text/css" href="css/estilo.css">

        <!-- JS propio -->
        <script type="text/javascript" src="js/Ciudad.js"></script>
        <script type="text/javascript" src="js/TipoAvion.js"></script>    
        <script type="text/javascript" src="js/Avion.js"></script>
        <script type="text/javascript" src="js/Vuelo.js"></script>
        <script type="text/javascript" src="js/Viaje.js"></script>
        <script type="text/javascript" src="js/Usuario.js"></script>
        <script type="text/javascript" src="js/JsonUtils.js"></script>
        <script type="text/javascript" src="js/Proxy.js"></script>
    </head>
    <body>
        <!-- LOGIN MODAL -->
        <div id="loginModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarLogin" id="close">&times;</span> 
                    <center><h2>Iniciar sesión</h2></center>
                </div>
                <div class="modal-body">
                    <center>
                        <br><br>
                        <img src="images/usuario.png" style="width:150px;height:150px;">
                        <br><br>
                        <div class="input-group" id="loginInputs">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="usuario" type="text" class="form-control" placeholder="Ingrese su nombre de usuario">
                        </div> 
                        <br>
                        <div class="input-group" id="loginInputs">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="contraseña" type="password" class="form-control" placeholder="Ingrese su contraseña">
                        </div> 
                        <br>
                            <div class="btn-group btn-group-lg" id="ingresar">
                                <button type="submit" class="btn btn-primary" id="btnIngresar">Ingresar</button>
                            </div>
                        <br><br>
                    </center>       
                </div>
            </div>
        </div>
   
    <script>
       //Modelo
       function loginModelo() {
           this.loginModelo();
       }

       loginModelo.prototype = {
           loginModelo: function () {}
       }
    </script>

    <script>
        //Controller
        function loginControl(loginModelo, vista) {
            this.loginControl(loginModelo, vista);
        }

        loginControl.prototype = {
            loginControl: function(loginModelo, vista) {
                this.loginModelo = loginModelo;
                this.vista = vista;
            },
            login: function(){
                var view = this.vista;
                usuario = new Usuario(document.getElementById("usuario").value, document.getElementById("contraseña").value, "nombre", "apellidos", "email",
                    "fechaNacimiento", "direccion", "telefono", "celular", 0);
                Proxy.usuarioLogin(usuario,
                    function(usuario){
                        switch(usuario.tipo){
                            case 0: // usuario no existe
                                view.mostrarError();
                                break;
                            case 1: // cliente
                                //document.location = "/Aerolinea/index.jsp";
                                location.reload();
                                break;
                            case 2: // administrador
                                //document.location = "/Aerolinea/index.jsp";
                                location.reload();
                                break;
                        }
                    }
                );
            }

        }

    </script>

    <script>
        //Vista
        var modelo;
        var control;
     
        function pageLoad(event) {
            modelo = new loginModelo();
            control = new loginControl(modelo, window);
            
            var btn = document.getElementById("btnIngresar");
            btn.onclick = function () {
                control.login();
            };            
        }
        
        function  mostrarError() {
            window.alert("Usuario incorrecto!");
        }

        var modal = document.getElementById('loginModal');
        var link = document.getElementById("login");
        var close = document.getElementsByClassName("cerrarLogin")[0];

        link.onclick = function() {
            modal.style.display = "block";
        }

        close.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
       
        document.addEventListener("DOMContentLoaded",pageLoad);
    </script>
    
   </body>
</html>
