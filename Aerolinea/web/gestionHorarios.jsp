<%-- 
    Document   : gestionHorarios
    Created on : 23/05/2017, 07:21:55 PM
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
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet"

              <!-- CSS propio -->
              <link rel="stylesheet" title="xxx" type="text/css" href="css/estilo.css">

    </head>
    <body>
        <%@ include file="header.jspf" %>
        <br><br><br>
        <div class="container">
            <h1>Gestión de Horarios</h1>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarAvion" type="text" class="form-control" placeholder="Buscar avión por ID">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp
                <div class="btn-group btn-group-lg" id="agregarHorario">
                    <button type="button" class="btn btn-primary" id="btnAgregarHorario">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar nuevo horario</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaHorarios" class="table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ruta</th>
                            <th>Día</th>
                            <th>Hora salida</th>
                            <th>Hora llegada</th>
                            <th>Precio</th>
                        </tr>
                    </thead>
                    <tbody id="listaHorarios">
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                    </tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarHorarioModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarHorarios" id="close">&times;</span> 
                    <center><h2>Registrar un horario</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idHorario" type="text" class="form-control" placeholder="Ingrese el identificador del horario">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
                            <select class="form-control" id="rutaHorario">
                                <option selected disabled>Seleccione la ruta</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <select class="form-control" id="diaHorario">
                                <option selected disabled>Seleccione el día</option>
                                <option>Domingo</option><option>Lunes</option><option>Martes</option>
                                <option>Miércoles</option><option>Jueves</option><option>Viernes</option>
                                <option>Sábado</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                            <input id="salidaHorario" type="text" class="form-control" placeholder="Ingrese la hora de salida HH:mm">
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarHorario">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarHorario">Registrar</button>
                            </div></center>
                        <br>
                    </form>       
                </div>
            </div>
        </div>
    </body>

    <!-- SECCIÓN DE CONTÁCTENOS - PIE DE PÁGINA -->
    <footer id="PgFooter">
        <div class="container">
            <h2><b>Detalle de Contacto</b></h2>
            <div class="footerp">
                <h3><b>JDK Aerolíneas</b></h3>
                <p><b>Email:</b> <a href="#">aerolineasJDK@aerolíneas.com</a></p>
                <p><b>Números de ayuda (8AM a 10PM):</b> +506-66666666, +506-99999999</p>
                <p><b>Números Telefónicos: </b> 011-27568832, 9868387223 </p>
            </div>
        </div>
    </footer>
</html>


<script>
    //Modelo
    function GestionHorariosModelo() {
        this.GestionHorariosModelo();
    }
    GestionHorariosModelo.prototype = {
        GestionHorariosModelo: function () {}
    };
</script>

<script>
    //Control
    function GestionHorariosModelo(modelo, vista) {
        this.GestionHorariosModelo(modelo, vista);
    }

    GestionHorariosModelo.prototype = {
        GestionHorariosModelo function(modelo, vista) {
            this.modelo = modelo;
            this.vista = vista;
        }
    }
</script>

<script>
    //Vista
    var modelo;
    var controlador;

    function cargarPagina(event) {
        modelo = new GestionHorariosModelo();
        controlador = new GestionHorariosModelo(modelo, window);
        //----------------Mover esto de aquí----------------
        var modal = document.getElementById('registrarHorarioModal');
        var btn = document.getElementById("btnAgregarHorario");
        var close = document.getElementsByClassName("cerrarRegistrarHorarios")[0];

        btn.onclick = function () {
            modal.style.display = "block";
        }

        close.onclick = function () {
            modal.style.display = "none";
        }

        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        var table = $("#tablaHorarios").DataTable({
            bFilter: false,
            lengthChange: false,
            pageLength: 10,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [{
                    orderable: false
                },
                {
                    orderable: true
                },
                {
                    orderable: false
                },
                {
                    orderable: true
                },
                {
                    orderable: true
                },
                {
                    orderable: true
                },
                {
                    orderable: false
                },
            ],
            order: [
                [1, 'asc']
            ]
        });
    }
    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>