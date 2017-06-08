<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Gestión de Horarios </title>
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
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

        <!-- CSS propio -->
        <link rel="stylesheet" title="xxx" type="text/css" href="css/estilo.css">
        <!-- JS propio -->
        <script type="text/javascript" src="js/Ciudad.js"></script>
        <script type="text/javascript" src="js/Avion.js"></script>
        <script type="text/javascript" src="js/TipoAvion.js"></script>
        <script type="text/javascript" src="js/Vuelo.js"></script>
        <script type="text/javascript" src="js/Viaje.js"></script>
        <script type="text/javascript" src="js/Usuario.js"></script>
        <script type="text/javascript" src="js/Compra.js"></script>
        <script type="text/javascript" src="js/Tiquete.js"></script>
        <script type="text/javascript" src="js/Proxy.js"></script>
        <script type="text/javascript" src="js/JsonUtils.js"></script>
        <%@ include file="header.jspf" %>
    </head>
    <body>
        <br><br><br>
        <div class="container">
            <h1>Gestión de Horarios</h1>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarAvion" type="text" class="form-control" placeholder="Buscar avión por ID" autocomplete="off">
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
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="listaHorarios">
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
                            <input id="idHorario" type="text" class="form-control" placeholder="Ingrese el identificador del horario" autocomplete="off">
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
                            <input id="salidaHorario" type="text" class="form-control" placeholder="Ingrese la hora de salida HH:mm" autocomplete="off">
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
        <%@ include file="footer.jspf" %>
    </footer>

    <script>
        //Modelo
        function GestionHorariosModelo() {
            this.GestionHorariosModelo();
            this.horarios;
        }
        GestionHorariosModelo.prototype = {
            GestionHorariosModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionHorariosControl(modelo, vista){
            this.GestionHorariosControl(modelo, vista);
        }

        GestionHorariosControl.prototype = {
            GestionHorariosControl: function(modelo, vista){
                this.modelo = modelo;
                this.vista = vista;
                this.obtenerHorarios();
            },
            obtenerHorarios: function(){
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getViajes(function (result) {
                    modelo.horarios = result;
                    vista.listarHorarios(modelo.horarios);
                    vista.crearTablaHorarios();
                });
            },
            agregarHorario: function(){

            },
            modificarHorario: function(){

            }
        };
    </script>

    <script>
       //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new GestionHorariosModelo();
            controlador = new GestionHorariosControl(modelo, window);
            initModal();
        }


        function initModal() {
            var modal = document.getElementById('registrarHorarioModal');
            var btn = document.getElementById("btnAgregarHorario");
            var close = document.getElementsByClassName("cerrarRegistrarHorarios")[0];

            btn.onclick = function () {
                modal.style.display = "block";
            };

            close.onclick = function () {
                modal.style.display = "none";
            };

            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            };
        }
        function crearTablaHorarios() {
            var table = $("#tablaHorarios").DataTable({
                bFilter: false,
                lengthChange: false,
                pageLength: 10,
                oLanguage: {
                    sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                columns: [
                    {orderable: true},
                    {orderable: false},
                    {orderable: true},
                    {orderable: true},
                    {orderable: true},
                    {orderable: true},
                    {orderable: false},
                    {orderable: false}
                ],
                order: [
                    [5, 'asc']
                ]
            });
        }

        function listarHorarios(horarios) {
            var listaHorarios = document.getElementById("listaHorarios");
            listaHorarios.innerHTML = "";
            for (var i = 0; i < horarios.length; i++) {
                crearListaHorarios(listaHorarios, horarios[i]);
            }
        }

        function crearListaHorarios(listaHorarios, horario) {
            //horario = viaje
            var tr = document.createElement("tr");
            var td;

            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.vuelo.origen.nombre + "-" + horario.vuelo.destino.nombre)); //ruta
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.dia));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.horaSalida));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.horaLlegada));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.precio));
            tr.appendChild(td);

            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/modificar.png";
            img.id = "Modificar";
            img.title = "Modificar";
            img.addEventListener("click", function (e) {
                window.alert("Modificar");
            });
            img.width = "30";
            img.height = "30";
            td.appendChild(img);
            tr.appendChild(td);
            
            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/eliminar.png";
            img.id = "Eliminar";
            img.title = "Eliminar";
            img.addEventListener("click", function (e) {
                window.alert("Eliminar");
            });
            img.width = "30";
            img.height = "30";
            td.appendChild(img);
            tr.appendChild(td);

            listaHorarios.appendChild(tr);
        }


        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>
</html>