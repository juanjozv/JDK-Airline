<%-- 
    Document   : gestionAviones
    Created on : 23/05/2017, 05:35:02 PM
    Author     : Kim
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
            <h2>Gestión de Tipos de Aviones</h2>
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
                    <div class="btn-group btn-group-lg" id="agregarAvion">
                    <button type="button" class="btn btn-primary" id="btnAgregarAvion">
                    <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar un nuevo avión</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaAviones" class="table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Año</th>
                        <th>Modelo</th>
                        <th>Pasajeros</th>
                        <th>Filas</th>
                        <th>Asientos por fila</th>
                        <th>Modificar / Eliminar</th>
                    </tr>
                    </thead>
                    <tbody id="listaAviones">
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                    </tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarAvionModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarAviones" id="close">&times;</span> 
                    <center><h2>Registrar un avión</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="apellido" type="text" class="form-control" placeholder="Ingrese el identificador del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input id="nacimiento" type="text" class="form-control" placeholder="Ingrese el año del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <input id="celular" type="text" class="form-control" placeholder="Ingrese el modelo del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="email" type="email" class="form-control" placeholder="Ingrese la cantidad de pasajeros">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <input id="email" type="email" class="form-control" placeholder="Ingrese la cantidad de filas">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <input id="email" type="email" class="form-control" placeholder="Ingrese la cantidad de asientos por fila">
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarAvion">
                            <button type="submit" class="btn btn-primary" id="btnRegistrarAvion">Registrar</button>
                        </div></center>
                        <br>
                    </form>       
                </div>
            </div>
        </div>
    </body>
    
    <!-- SECCIÓN DE CONTÁCTENOS - PIE DE PÁGINA -->
    <footer id="PgFooter">
        <%@ include file="footer.jspf" %>
    </footer>
</html>
 <script>
        //Modelo
        function GestionAvionesModelo() {
            this.GestionAvionesModelo();
        }
        GestionAvionesModelo.prototype = {
            GestionAvionesModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionAvionesModelo(modelo, vista) {
            this.GestionAvionesModelo(modelo, vista);
        }

        GestionAvionesModelo.prototype = {
            GestionAvionesModelo function (modelo, vista) {
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
            modelo = new GestionAvionesModelo();
            controlador = new GestionAvionesModelo(modelo, window);
            //----------------Mover esto de aquí----------------
            var modal = document.getElementById('registrarAvionModal');
            var btn = document.getElementById("btnAgregarAvion");
            var close = document.getElementsByClassName("cerrarRegistrarAviones")[0];

            btn.onclick = function() {
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

            var table = $("#tablaAviones").DataTable({
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