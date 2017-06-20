<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Gestión de Aviones </title>
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
            <h1>Gestión de flota de aviones</h1>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscar" type="text" class="form-control" placeholder="Buscar avión por ID" autocomplete="off">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button" onclick="controlador.buscarAvion();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp
                <div class="btn-group btn-group-lg" id="agregarUnidad">
                    <button type="button" class="btn btn-primary" id="btnAgregarAvion">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar avión a la flota</button>
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
                            <th>Tipo de avión</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="listaAviones"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarAvionModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarAvion" id="close">&times;</span> 
                    <center><h2>Registrar un avión en la flota</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formAvion" action="javascript:registrar();">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idAvion" type="text" class="form-control" placeholder="Ingrese el identificador del avión" autocomplete="off">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <select class="form-control" id="tipoAvion">
                                <option selected disabled>Seleccione el tipo de avion</option>
                            </select>
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
        function GestionAvionesControl(modelo, vista) {
            this.GestionAvionesControl(modelo, vista);
        }

        GestionAvionesControl.prototype = {
            GestionAvionesControl: function (modelo, vista) {
                this.modelo = modelo;
                this.vista = vista;
                this.obtenerAviones();
                this.obtenerTipos();
            },
            obtenerAviones: function () {
                var model = this.modelo;
                var vista = this.vista;
                Proxy.getAviones(function (result) {
                    model.aviones = result;
                    vista.listarAviones(model.aviones);
                    vista.crearTablaAviones();
                });
            },
            obtenerTipos: function () {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getTiposAvion(function (result) {
                    modelo.tipos = result;
                    vista.cargarTipos();
                });
            },
            agregarAvion: function () {
                var vista = this.vista;
                var avion = this.crearAvion();
                Proxy.avionAdd(avion, function (status) {
                    switch (status) {
                        case 0:
                            window.alert("Datos agregados");
                            vista.recargar();
                            break;
                        case 1:
                            window.alert("Registro duplicado");
                            break;
                    }
                });
            },
            modificarAvion: function () {
                var vista = this.vista;
                var avion = this.crearAvion();
                Proxy.avionModify(avion, function (status) {
                    switch (status) {
                        case 0:
                            window.alert("Datos modificados");
                            vista.recargar();
                            break;
                        case 1:
                            window.alert("Error");
                            break;
                    }
                });
            },
            eliminarAvion: function(codigo){
                var vista = this.vista;
                Proxy.deleteAvion(codigo, function(status){
                    switch(status){
                        case 0: 
                            window.alert("Datos eliminados");
                            vista.recargar();
                            break;  
                        case 1:
                            window.alert("Error");
                            break;
                    }
                });     
            },
            buscarAvion: function () {
                var vista = this.vista;
                var avion = document.getElementById("buscar").value;
                Proxy.avionSearch(avion, function (result) {
                    var busqueda = result;
                    vista.listarAviones(busqueda);
                    vista.finBusqueda();
                });
            },
            crearAvion: function () {
                var codigo = document.getElementById("idAvion").value;
                var tipoAvion = this.obtenerTipoAvion(document.getElementById("tipoAvion").value);
                return new Avion(codigo, tipoAvion);
            },
            obtenerAvion: function (avion) {
                var modelo = this.modelo;
                return modelo.aviones.find(function (r) {
                    return r.codigo == avion.codigo;
                });
            },
            obtenerTipoAvion: function (tipoavion) {
                var modelo = this.modelo;
                return modelo.tipos.find(function (r) {
                    return r.codigo == tipoavion;
                });
            }
        };
    </script>

    <script>
        //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new GestionAvionesModelo();
            controlador = new GestionAvionesControl(modelo, window);
            var formulario = document.getElementById("formAvion");
            formulario.addEventListener("submit", validar);
            initModal();
        }

        function initModal() {
            var modal = document.getElementById("registrarAvionModal");
            var btn = document.getElementById("btnAgregarAvion");
            var close = document.getElementsByClassName("cerrarRegistrarAvion")[0];
            btn.onclick = function () {
                document.getElementById("idAvion").disabled = false;
                document.getElementById("btnRegistrarAvion").innerText = "Agregar";
                document.getElementsByTagName("h2")[1].innerText = "Agregar un avión";
                document.getElementById("formAvion").reset();
                quitarInvalid();
                quitarDescripciones();
                modal.style.display = "block";
            };
            close.onclick = function () {
                modal.style.display = "none";
            };
            window.onclick = function (event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            };
        }

        function crearTablaAviones() {
            if (!$.fn.dataTable.isDataTable('#tablaAviones')) {
                $("#tablaAviones").DataTable({
                    bFilter: false,
                    lengthChange: false,
                    pageLength: 10,
                    oLanguage: {
                        sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                    },
                    columns: [
                        {orderable: true},
                        {orderable: true},
                        {orderable: true},
                        {orderable: false}
                    ],
                    order: [[0, 'asc']]
                });
            }
        }

        function listarAviones(aviones) {
            var listaAviones = document.getElementById("listaAviones");
            listaAviones.innerHTML = "";
            for (var i = 0; i < aviones.length; i++) {
                listarAvion(aviones[i], listaAviones);
            }
        }

        function listarAvion(avion, listaAviones) {
            var tr = document.createElement("tr");
            var img;
            var td;
            td = document.createElement("td");
            td.appendChild(document.createTextNode(avion.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(avion.tipoAvion.codigo));
            tr.appendChild(td);

            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/modificar.png";
            img.id = "Modificar";
            img.title = "Modificar";
            img.addEventListener("click", function (e) {
                modificarAvion(avion);
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
                eliminarAvion(avion.codigo);
            });
            img.width = "30";
            img.height = "30";
            td.appendChild(img);
            tr.appendChild(td);

            listaAviones.appendChild(tr);
        }

        function modificarAvion(avion) {
            mostrarAvion(controlador.obtenerAvion(avion));
            quitarInvalid();
            quitarDescripciones();
            agregarDescripciones();
            document.getElementById("btnRegistrarAvion").innerText = "Modificar";
            document.getElementsByTagName("h2")[1].innerText = "Modificar un avion";
            document.getElementById("registrarAvionModal").style.display = "block";
        }

        function mostrarAvion(avion) {
            var codigo = document.getElementById("idAvion");
            codigo.value = avion.codigo;
            codigo.disabled = true;
            document.getElementById("tipoAvion").value = avion.tipoAvion.codigo;
        }

        function eliminarAvion(codigo){
            controlador.eliminarAvion(codigo);
        }
        
        function cargarTipos() {
            for (var i = 0; i < modelo.tipos.length; i++) {
                var cod = modelo.tipos[i].codigo;
                var opcion = cod;
                $('#tipoAvion').append($('<option>', {
                    value: opcion,
                    text: opcion
                }));
            }
        }

        function registrar() {
            var btn = document.getElementById("btnRegistrarAvion");
            if (btn.innerText === "Modificar")
                controlador.modificarAvion();
            if (btn.innerText === "Agregar")
                controlador.agregarAvion();
        }

        function recargar() {
            var modal = document.getElementById("registrarAvionModal");
            controlador.obtenerAviones();
            modal.style.display = "none";
        }

        function validar(event) {
            var codigo = document.getElementById("idAvion");
            var tipoAvion = document.getElementById("tipoAvion");
            var error = false;

            codigo.classList.remove("invalid");
            if (codigo.value.length === 0) {
                codigo.classList.add("invalid");
                error = true;
            }

            tipoAvion.classList.remove("invalid");
            if (tipoAvion.value === "Seleccione el tipo de avion") {
                tipoAvion.classList.add("invalid");
                error = true;
            }

            if (error) {
                window.alert("Error: Espacios vacios");
                event.preventDefault();
            }
        }

        function quitarInvalid() {
            document.getElementById("idAvion").classList.remove("invalid");
            document.getElementById("tipoAvion").classList.remove("invalid");
        }

        function agregarDescripciones() {
            var spans = document.getElementsByTagName("span");
            spans[15].append(" Código ");
            spans[16].append(" Tipo de avión ");
        }

        function quitarDescripciones() {
            $(".input-group-addon").contents().filter(function () {
                return this.nodeType === 3;
            }).remove();
        }

        function finBusqueda() {
            window.alert("Busqueda realizada");
            document.getElementById("buscar").value = "";
        }

        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>
</html>