<%-- 
    Document   : gestionFlota
    Created on : 23/05/2017, 07:56:02 PM
    Author     : Dani
--%>
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
            <h1>Gestión de flota de aviones</h1>
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
                <div class="btn-group btn-group-lg" id="agregarUnidad">
                    <button type="button" class="btn btn-primary" id="btnAgregarUnidad">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar avión a la flota</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaFlota" class="table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Ruta</th>
                            <th>Horario</th>
                            <th>Tipo de avión</th>
                        </tr>
                    </thead>
                    <tbody id="listaFlota">
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th></tr>
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th></tr>
                    </tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarFlotaModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarFlota" id="close">&times;</span> 
                    <center><h2>Registrar un avión en la flota</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idAvionF" type="text" class="form-control" placeholder="Ingrese el identificador del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-globe"></i></span>
                            <select class="form-control" id="rutaAvion">
                                <option selected disabled>Seleccione la ruta</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                            <select class="form-control" id="horarioAvion">
                                <option selected disabled>Seleccione el horario</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <select class="form-control" id="tipoAvion">
                                <option selected disabled>Seleccione el tipo de avion</option>
                            </select>
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarEnFlota">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarEnFlota">Registrar</button>
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
    function GestionFlotaModelo() {
        this.GestionFlotaModelo();
    }
    GestionFlotaModelo.prototype = {
        GestionFlotaModelo: function () {}
    };
</script>

<script>
    //Control
    function GestionFlotaModelo(modelo, vista) {
        this.GestionFlotaModelo(modelo, vista);
    }

    GestionFlotaModelo.prototype = {
        GestionFlotaModelo function(modelo, vista) {
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
        modelo = new GestionFlotaModelo();
        controlador = new GestionFlotaModelo(modelo, window);
        //----------------Mover esto de aquí----------------
        var modal = document.getElementById('registrarFlotaModal');
        var btn = document.getElementById("btnAgregarUnidad");
        var close = document.getElementsByClassName("cerrarRegistrarFlota")[0];

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

        var table = $("#tablaFlota").DataTable({
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