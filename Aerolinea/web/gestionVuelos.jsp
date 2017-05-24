<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea Busqueda - Gestión de Rutas </title>
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
            <h2>Gestión de Rutas</h2>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarVuelo" type="text" class="form-control" placeholder="Buscar ruta por ID">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp       
                    <div class="btn-group btn-group-lg" id="agregarVuelo">
                    <button type="button" class="btn btn-primary" id="btnAgregarVuelo">
                    <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar una nueva ruta</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaVuelos" class="table-striped">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Origen</th>
                        <th>Destino</th>
                        <th>Distancia</th>
                        <th>Duración</th>
                        <th>Descuento</th>
                        <th>Avión</th>
                        <th>Modificar / Eliminar</th>
                    </tr>
                    </thead>
                    <tbody id="listaVuelos">
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                        <tr> <th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th><th>11</th></tr>
                    </tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarVueloModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarVuelos" id="close">&times;</span> 
                    <center><h2>Registrar una ruta</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idVuelo" type="text" class="form-control" placeholder="Ingrese el identificador de la ruta">
                        </div>
                        <br>                        
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                            <select class="form-control" id="selOrigen">
                                <option selected disabled>Elija la ciudad de origen</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
                            <select class="form-control" id="selDestino">
                                <option selected disabled>Elija la ciudad de destino</option>
                            </select>
                        </div>
                        <br>              
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-road"></i></span>
                            <input id="distancia" type="text" class="form-control" placeholder="Ingrese la distancia de la ruta">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                            <input id="duracion" type="text" class="form-control" placeholder="Ingrese la duración de la ruta">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                            <input id="descuento" type="text" class="form-control" placeholder="Ingrese el descuento de la ruta (Opcional)">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <select class="form-control" id="selAvion">
                                <option selected disabled>Elija el avión encargado de la ruta</option>
                            </select>
                        </div>                      
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarVuelo">
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
        function GestionVuelosModelo() {
            this.GestionVuelosModelo();
        }
        GestionVuelosModelo.prototype = {
            GestionVuelosModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionVuelosModelo(modelo, vista) {
            this.GestionVuelosModelo(modelo, vista);
        }

        GestionVuelosModelo.prototype = {
            GestionVuelosModelo function (modelo, vista) {
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
            modelo = new GestionVuelosModelo();
            controlador = new GestionVuelosModelo(modelo, window);
            //----------------Mover esto de aquí----------------
            var modal = document.getElementById('registrarVueloModal');
            var btn = document.getElementById("btnAgregarVuelo");
            var close = document.getElementsByClassName("cerrarRegistrarVuelos")[0];

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

            var table = $("#tablaVuelos").DataTable({
                bFilter: false,
                lengthChange: false,
                pageLength: 10,
                oLanguage: {
                    sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                columns: [{
                            orderable: true
                        },
                        {
                            orderable: false
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
                        {
                            orderable: false
                        }
                    ],
                    order: [
                        [0, 'asc']
                    ]
                });
        }
    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>