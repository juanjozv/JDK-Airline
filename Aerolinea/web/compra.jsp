<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> Compra de vuelo - JDK Aerolinea </title>
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
        <br><br><br><br>
         <div class="container">
            <h1 style="color:gray;">Paso 1. Ingrese los nombres de los pasajeros</h1> <!--pasar a css-->
            <br><br>
            <form class="form-inline">
                <div class = "input-group" id="pass">
                </div>
            </form><br>
            <div class="btn-group btn-group-lg" id="agregarPasajeros">
                <button type="button" class="btn btn-primary" id="btnSiguiente1" onclick="controlador.obtenerNombresPasajeros();">
                    Siguiente</button>
            </div>
        </div>
        <div class="container">
            <h1 style="color:gray;">Paso 2. Seleccione los asientos deseados</h1> <!--pasar a css-->
            <br><br>
            <form class="form-inline">
                <div class = "input-group">
                    <span><div class="input-group">
                            <select id="fila" class="form-control">
                                <option selected  disabled >Seleccione la fila</option>
                            </select>
                        </div></span>
                    <span><div class="input-group">
                            <select id="numero" class="form-control">
                                <option value="" disabled selected>Seleccione el número de asiento</option>
                            </select>
                        </div></span><br>
                    <span class = "input-group-btn">
                        <button class = "btn btn-primary" type = "button" onclick="controlador.insertarAsiento();">
                            <i class="glyphicon glyphicon-plus"></i>
                        </button>
                    </span>
                </div>
            </form>
            <br>
            <center><div class="row">
                    <div class="table-responsive">
                        <table id="tablaAsientos" class="table-striped">
                            <thead><tr><th>Asiento</th><th>Eliminar</th></tr></thead>
                            <tbody id="listaAsientos"></tbody>
                        </table>
                    </div>
                </div></center>
            <br>
            <div class="btn-group btn-group-lg" id="agregarAsientos">
                <button type="button" class="btn btn-primary" id="btnSiguiente2">
                    Siguiente</button>
            </div>
        </div>
        <div class="container">
            <h1 style="color:gray;">Paso 3. Ingrese los datos para la compra</h1> <!--pasar a css-->
            <br><br>
            <form class="form-inline">
                <div class = "input-group">

                </div>
            </form><br>
            <div class="btn-group btn-group-lg" id="agregarAsientos">
                <button type="button" class="btn btn-primary" id="btnSiguiente3">
                    Siguiente</button>
            </div>
        </div>
    </body>
</html>


<script>
    //Modelo
    function CompraModelo() {
        this.CompraModelo();
        this.asientos = [];
        this.pasajeros = [];
        this.cantPasajeros = localStorage.getItem('pasajeros');
    }
    CompraModelo.prototype = {
        CompraModelo: function () {}
    };
</script>

<script>
    //Control
    function CompraControl(modelo, vista) {
        this.CompraControl(modelo, vista);
        this.cargarAsientos();
        this.cargarEspaciosPasajeros();
    }

    CompraControl.prototype = {
        CompraControl: function (modelo, vista) {
            this.modelo = modelo;
            this.vista = vista;
        },
        cargarEspaciosPasajeros: function(){
            var modelo = this.modelo;
            var vista = this.vista;
            vista.crearEspaciosPasajeros(modelo.cantPasajeros);
        },
        obtenerNombresPasajeros: function(){
            var modelo = this.modelo;
            var vista = this.vista;
            for(var i = 0; i < modelo.cantPasajeros; i++){
                var id = "pass"+i;
                var pass = document.getElementById(id).value;
                modelo.pasajeros.push(pass);
            }
        },
        cargarAsientos: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            var viajeIda = 1;//localStorage.getItem('viajeIda');
            var viajeVuelta = localStorage.getItem('viajeVuelta');
            Proxy.obtenerViaje(viajeIda, function (result) {
                modelo.viaje = result;
                var tipo = modelo.viaje.avion.tipoAvion;
                vista.cargarAsientos(tipo.cantidadFilas, tipo.cantidadAsientosFila);
            });
        },
        insertarAsiento: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            var fila = document.getElementById("fila").value;
            var num = document.getElementById("numero").value;
            var seat = fila + num;
            modelo.asientos.push(seat);
            vista.listarAsientos(modelo.asientos);
            //Hacer visible paso 2 con display block
        },
        eliminarAsiento: function (event) {
            var asiento = event.target.id;
            var pos = modelo.asientos.indexOf(asiento);
            if (pos > -1) {
                modelo.asientos.splice(pos, 1);
            }
            vista.listarAsientos(modelo.asientos);
        }
    };

</script>
<script>
    //Vista
    var modelo;
    var controlador;

    function cargarPagina(event) {
        modelo = new CompraModelo();
        controlador = new CompraControl(modelo, window);
    }

    function crearTablaAsientos() {
        var table = $("#tablaAsientos").DataTable({
            bFilter: false,
            lengthChange: false,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [{orderable: false}, {orderable: false}]
        });
    }

    function listarAsientos(asientos) {
        var listaAsientos = document.getElementById("listaAsientos");
        listaAsientos.innerHTML = "";
        for (var i = 0; i < asientos.length; i++) {
            crearListaAsientos(listaAsientos, asientos[i]);
        }
    }

    function crearListaAsientos(listaAsientos, asiento) {
        var tr = document.createElement("tr");
        var td;
        td = document.createElement("td");
        td.appendChild(document.createTextNode(asiento));
        tr.appendChild(td);
        td = document.createElement("td");
        img = document.createElement("img");
        img.src = "images/eliminar.png";
        img.id = asiento;
        img.title = "Eliminar";
        img.addEventListener("click", function (e) {
            window.alert("Eliminar");
        });
        img.width = "30";
        img.height = "30";
        td.appendChild(img);
        tr.appendChild(td);

        listaAsientos.appendChild(tr);
    }

    function cargarAsientos(cantFilas, cantAsientosFila) {
        var abc = 65;
        for (var i = 0; i < cantAsientosFila; i++) {
            var letra = String.fromCharCode(abc);
            $('#fila').append($('<option>', {
                value: letra,
                text: letra
            }));
            abc++;
        }
        for (var i = 0; i < cantFilas; i++) {
            var numero = i+1;
            $('#numero').append($('<option>', {
                value: numero,
                text: numero
            }));
        }
    }
    
    function crearEspaciosPasajeros(cant){
        for(var i = 0; i < cant; i++){
            var idi = 'pass'+i;
            $('<input/>').attr({type: 'text', id: idi, class: 'form-control', placeholder: 'Ingrese el nombre del pasajero',
            style: "width: 500px"}).appendTo('#pass');
            $('#pass').append('<br/>');
            $('#pass').append('<br/>');
        }
    }
    

    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>
