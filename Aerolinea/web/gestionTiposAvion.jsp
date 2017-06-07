<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Gestión de Tipos de Avión </title>
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
            <h2>Gestión de Tipos de Aviones</h2>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarTipoAvion" type="text" class="form-control" placeholder="Buscar tipo de avión por ID">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button" onclick="controlador.buscarTipoAvion();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp       
                <div class="btn-group btn-group-lg" id="agregarTipoAvion">
                    <button type="button" class="btn btn-primary" id="btnAgregarTipoAvion">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar un nuevo tipo de avión</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaTiposAvion" class="table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Año</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Pasajeros</th>
                            <th>Filas</th>
                            <th>Asientos por fila</th>
                            <th>Modificar / Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="listaTiposAvion"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarTipoAvionModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarTiposAvion" id="close">&times;</span> 
                    <center><h2>Registrar un tipo de avión</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formTipoAvion" action="javascript:registrar();">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idTipoAvion" type="text" class="form-control" placeholder="Ingrese el identificador del tipo de avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input id="añoAvion" type="text" class="form-control" placeholder="Ingrese el año del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <input id="marcaAvion" type="text" class="form-control" placeholder="Ingrese la marca del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <input id="modeloAvion" type="text" class="form-control" placeholder="Ingrese el modelo del avión">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <input id="filasAvion" type="text" class="form-control" placeholder="Ingrese la cantidad de filas">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-pushpin"></i></span>
                            <input id="asientosAvion" type="text" class="form-control" placeholder="Ingrese la cantidad de asientos por fila">
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarTipoAvion">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarTipoAvion">Registrar</button>
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
        function GestionTiposAvionModelo() {
            this.GestionTiposAvionModelo();
        }
        GestionTiposAvionModelo.prototype = {
            GestionTiposAvionModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionTiposAvionControl(modelo, vista) {
            this.GestionTiposAvionControl(modelo, vista);
        }

        GestionTiposAvionControl.prototype = {
            GestionTiposAvionControl: function (modelo, vista) {
                this.modelo = modelo;
                this.vista = vista;
                this.obtenerTiposAvion();
            },
            obtenerTiposAvion: function () {
                var model = this.modelo;
                var vista = this.vista;
                Proxy.getTiposAvion(function (result) {
                    model.tiposAvion = result;
                    vista.listarAviones(model.tiposAvion);
                    vista.crearTablaTiposAvion();
                });
            },
            agregarTipoAvion: function () {
                var vista = this.vista;
                var tipo = this.crearTipoAvion();
                Proxy.tipoAvionAdd(tipo, function (status) {
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
            modificarTipoAvion: function () {
                var vista = this.vista;
                var tipoavion = this.crearTipoAvion();
                Proxy.tipoAvionModify(tipoavion, function (status) {
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
            buscarTipoAvion: function () {
                var vista = this.vista;
                var tipo = document.getElementById("buscarTipoAvion").value;
                Proxy.tipoAvionSearch(tipo, function (result) {
                    var busqueda = result;
                    vista.listarAviones(busqueda);
                    vista.finBusqueda();
                });
            },
            crearTipoAvion: function () {
                var codigo = document.getElementById("idTipoAvion").value;
                var annio = document.getElementById("añoAvion").value;
                var marca = document.getElementById("marcaAvion").value;
                var modelo = document.getElementById("modeloAvion").value;
                var cantidadFilas = parseInt(document.getElementById("filasAvion").value);
                var cantidadAsientosFila = parseInt(document.getElementById("asientosAvion").value);
                var cantidadPasajeros = cantidadFilas * cantidadAsientosFila;
                return new TipoAvion(codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila);
            },
            obtenerTipoAvion: function (tipo) {
                var modelo = this.modelo;
                return modelo.tiposAvion.find(function (r) {
                    return r.codigo == tipo.codigo;
                });
            }
        };
    </script>

    <script>
        //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new GestionTiposAvionModelo();
            controlador = new GestionTiposAvionControl(modelo, window);
            var formulario = document.getElementById("formTipoAvion");
            formulario.addEventListener("submit", validar);
            initModal();
        }

        function initModal() {
            var modal = document.getElementById('registrarTipoAvionModal');
            var btn = document.getElementById("btnAgregarTipoAvion");
            var close = document.getElementsByClassName("cerrarRegistrarTiposAvion")[0];
            btn.onclick = function () {
                document.getElementById("idTipoAvion").disabled = false;
                document.getElementById("btnRegistrarTipoAvion").innerText = "Agregar";
                document.getElementsByTagName("h2")[2].innerText = "Agregar un tipo de avión";
                document.getElementById("formTipoAvion").reset();
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

        function crearTablaTiposAvion() {
            if (!$.fn.dataTable.isDataTable('#tablaTiposAvion') ) {
                $("#tablaTiposAvion").DataTable({
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
                            {orderable: true},
                            {orderable: true},
                            {orderable: true},
                            {orderable: true},
                            {orderable: false}
                    ],
                    order: [ [0, 'asc'] ]
                });
            }
        }

        function listarAviones(tipos) {
            var listaTiposAvion = document.getElementById("listaTiposAvion");
            listaTiposAvion.innerHTML = "";
            for (var i = 0; i < tipos.length; i++) {
                listarAvion(tipos[i], listaTiposAvion);
            }
        }

        function listarAvion(tipo, listaTiposAvion) {
            var tr = document.createElement("tr");
            var img;
            var td;
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.annio));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.marca));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.modelo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.cantidadPasajeros));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.cantidadFilas));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(tipo.cantidadAsientosFila));
            tr.appendChild(td);

            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/modificar.png";
            img.id = "Modificar";
            img.title = "Modificar";
            img.addEventListener("click", function (e) {
                modificarTipoAvion(tipo);
            });
            img.width = "30";
            img.height = "30";
            td.appendChild(img);

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

            listaTiposAvion.appendChild(tr);
        }

        function modificarTipoAvion(tipo) {
            mostrarTipoAvion(controlador.obtenerTipoAvion(tipo));
            quitarInvalid();
            quitarDescripciones();
            agregarDescripciones();
            document.getElementById("btnRegistrarTipoAvion").innerText = "Modificar";
            document.getElementsByTagName("h2")[2].innerText = "Modificar un tipo de avion";
            document.getElementById('registrarTipoAvionModal').style.display = "block";
        }

        function mostrarTipoAvion(tipo) {
            var codigo = document.getElementById("idTipoAvion");
            codigo.value = tipo.codigo;
            codigo.disabled = true;
            document.getElementById("añoAvion").value = tipo.annio;
            document.getElementById("marcaAvion").value = tipo.marca;
            document.getElementById("modeloAvion").value = tipo.modelo;
            document.getElementById("filasAvion").value = tipo.cantidadFilas;
            document.getElementById("asientosAvion").value = tipo.cantidadAsientosFila;
        }

        function registrar(){
            var btn = document.getElementById("btnRegistrarTipoAvion");
            if(btn.innerText === "Modificar")  
                controlador.modificarTipoAvion();
            if(btn.innerText === "Agregar")     
                controlador.agregarTipoAvion();
        }
        
        function recargar(){
            var modal = document.getElementById("registrarTipoAvionModal");            
            controlador.obtenerTiposAvion();
            modal.style.display = "none";           
        }
        
        function validar(event) {
            var codigo = document.getElementById("idTipoAvion");
            var annio = document.getElementById("añoAvion");
            var marca = document.getElementById("marcaAvion");
            var modelo = document.getElementById("modeloAvion");
            var cantFilas = document.getElementById("filasAvion");
            var cantAsientosFila = document.getElementById("asientosAvion");
            var error = false;

            codigo.classList.remove("invalid");
            if (codigo.value.length == 0) {
                codigo.classList.add("invalid");
                error = true;
            }

            annio.classList.remove("invalid");
            if (annio.value.length == 0) {
                annio.classList.add("invalid");
                error = true;
            }

            marca.classList.remove("invalid");
            if (marca.value.length == 0) {
                marca.classList.add("invalid");
                error = true;
            }

            modelo.classList.remove("invalid");
            if (modelo.value.length == 0) {
                modelo.classList.add("invalid");
                error = true;
            }

            cantFilas.classList.remove("invalid");
            if (cantFilas.value.length == 0) {
                cantFilas.classList.add("invalid");
                error = true;
            }
            cantAsientosFila.classList.remove("invalid");
            if (cantAsientosFila.value.length == 0) {
                cantAsientosFila.classList.add("invalid");
                error = true;
            }

            if (error) {
                window.alert("Error: Espacios vacios");
                event.preventDefault();
            }
        }
        
        function quitarInvalid(){
            document.getElementById("idTipoAvion").classList.remove("invalid");
            document.getElementById("añoAvion").classList.remove("invalid");
            document.getElementById("marcaAvion").classList.remove("invalid");
            document.getElementById("modeloAvion").classList.remove("invalid");
            document.getElementById("filasAvion").classList.remove("invalid");
            document.getElementById("asientosAvion").classList.remove("invalid");            
        }
        
        function agregarDescripciones() {
            var spans = document.getElementsByTagName("span");
            spans[15].append(" Código: ");
            spans[16].append(" Año: ");
            spans[17].append(" Marca: ");
            spans[18].append(" Modelo: ");
            spans[19].append(" Cantidad de filas: ");
            spans[20].append(" Cantidad de asientos por fila: ");
        }

        function quitarDescripciones() {
            $(".input-group-addon").contents().filter(function () {
                return this.nodeType === 3;
            }).remove();
        }

        function finBusqueda() {
            window.alert("Busqueda realizada");
            document.getElementById("buscarTipoAvion").value = "";
        }

        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>

</html>