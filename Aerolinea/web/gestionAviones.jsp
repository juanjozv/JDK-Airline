<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea Gestión </title>
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
                <table id="tablaAviones" class="table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
<!--                            <th>Ruta</th>
                            <th>Horario</th>-->
                            <th>Tipo de avión</th>
                            <th>Modificar/Eliminar
                        </tr>
                    </thead>
                    <tbody id="listaAviones"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarAvionesModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarAviones" id="close">&times;</span> 
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
<!--                        <div class="input-group">
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
                        <br>-->
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <select class="form-control" id="tipoAvion">
                                <option selected disabled>Seleccione el tipo de avion</option>
                            </select>
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarAviones">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarAviones">Registrar</button>
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
    function GestionAvionesModelo() {
        this.GestionAvionesModelo();
        this.aviones;
        this.tipos;
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
            //Para llenar el select del formulario
            var modelo = this.modelo;
            var vista = this.vista;
            Proxy.getTiposAvion(function (result) {
                modelo.tipos = result;
                vista.cargarTipos();
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
        initModal();
    }

    function initModal() {
        var modal = document.getElementById('registrarAvionesModal');
        var btn = document.getElementById("btnAgregarUnidad");
        var close = document.getElementsByClassName("cerrarRegistrarAviones")[0];

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
                    orderable: false
                }
            ],
            order: [
                [2, 'asc']
            ]
        });
    }
    
    function cargarTipos(){
        for (var i = 0; i < modelo.tipos.length; i++) {
                var cod = modelo.tipos[i].codigo;
                var mar = modelo.tipos[i].marca;
                var mod = modelo.tipos[i].modelo;
                var opcion = cod + " - " + mar + " " + mod;
                $('#tipoAvion').append($('<option>', {
                    value: opcion,
                    text: opcion
                }));
            }
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
        td.appendChild(document.createTextNode(avion.tipoAvion.codigo));
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