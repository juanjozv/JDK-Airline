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
                    <input id="buscarAvion" type="text" class="form-control" placeholder="Buscar tipo de avión por ID">
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
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Pasajeros</th>
                            <th>Filas</th>
                            <th>Asientos por fila</th>
                            <th>Modificar / Eliminar</th>
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
                    <span class="cerrarRegistrarAviones" id="close">&times;</span> 
                    <center><h2>Registrar un tipo de avión</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formulario">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="idAvionA" type="text" class="form-control" placeholder="Ingrese el identificador del tipo de avión">
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
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="pasajerosAvion" type="text" class="form-control" placeholder="Ingrese la cantidad de pasajeros">
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
                        <center><div class="btn-group btn-group-lg" id="registrarAvion">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarAvion" onclick="controlador.agregarTipoAvion();">Registrar</button>
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
    function GestionTiposAvionModelo() {
        this.GestionTiposAvionModelo();
        this.tiposAvion;
        this.tipo;
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
                vista.crearTablaAviones();
            });
        },
        buscarTipoAvion: function (codigo) {
        },
        agregarTipoAvion: function () {
            var tipo = this.crearTipoAvion();
            Proxy.tipoAvionAdd(tipo, function (result) {
            });
        },
        crearTipoAvion: function (){
            var codigo = document.getElementById("idAvionA").value;
            var annio = document.getElementById("añoAvion").value;
            var marca = document.getElementById("marcaAvion").value;
            var modelo = document.getElementById("modeloAvion").value;
            var cantidadPasajeros = parseInt(document.getElementById("pasajerosAvion").value);
            var cantidadFilas = parseInt(document.getElementById("filasAvion").value);
            var cantidadAsientosFila = parseInt(document.getElementById("asientosAvion").value);
            var tipo = new TipoAvion(codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila);
            return tipo;
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
        initModal();
        var formulario = document.getElementById("formulario");
        formulario.reset();
        formulario.addEventListener("submit", validar);
    }

    function initModal() {
        var modal = document.getElementById('registrarAvionModal');
        var btn = document.getElementById("btnAgregarAvion");
        var close = document.getElementsByClassName("cerrarRegistrarAviones")[0];

        btn.onclick = function () {
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

    function validar(event) {
        var codigo = document.getElementById("idAvionA");
        var annio = document.getElementById("añoAvion");
        var marca = document.getElementById("marcaAvion");
        var modelo = document.getElementById("modeloAvion");
        var cantPasajeros = parseInt(document.getElementById("pasajerosAvion"));
        var cantFilas = parseInt(document.getElementById("filasAvion"));
        var cantAsientosFila = parseInt(document.getElementById("asientosAvion"));
        var error = false;

        codigo.classList.remove("invalid");
        if (codigo.value.length === 0) {
            codigo.classList.add("invalid");
            error = true;
        }

        annio.classList.remove("invalid");
        if (annio.value.length === 0) {
            annio.classList.add("invalid");
            error = true;
        }

        marca.classList.remove("invalid");
        if (marca.value.length === 0) {
            marca.classList.add("invalid");
            error = true;
        }

        modelo.classList.remove("invalid");
        if (modelo.value.length === 0) {
            modelo.classList.add("invalid");
            error = true;
        }

        cantPasajeros.classList.remove("invalid");
        if (cantPasajeros.value.length === 0) {
            cantPasajeros.classList.add("invalid");
            error = true;
        }
        cantFilas.classList.remove("invalid");
        if (cantFilas.value.length === 0) {
            cantFilas.classList.add("invalid");
            error = true;
        }
        cantAsientosFila.classList.remove("invalid");
        if (cantAsientosFila.value.length === 0) {
            cantAsientosFila.classList.add("invalid");
            error = true;
        }

        if (error) {
            window.alert("Error: Espacios vacios");
            event.preventDefault();
        }
    }

    function crearTablaAviones() {
        var table = $("#tablaAviones").DataTable({
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
                    orderable: true
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
                    orderable: true
                },
                {
                    orderable: true
                },
                {
                    orderable: false
                }
            ],
            order: [
                [7, 'asc']
            ]
        });
    }

    function listarAviones(aviones) {
        var listaAviones = document.getElementById("listaAviones");
        listaAviones.innerHTML = "";
        for (var i = 0; i < aviones.length; i++) {
            crearListaAviones(listaAviones, aviones[i]);
        }
    }

    function crearListaAviones(listaAviones, avion) {
        var tr = document.createElement("tr");
        var td;

        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.codigo));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.annio));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.marca));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.modelo));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.cantidadPasajeros));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.cantidadFilas));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(avion.cantidadAsientosFila));
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

        listaAviones.appendChild(tr);
    }


    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>