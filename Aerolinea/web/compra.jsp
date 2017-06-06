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
        <div class="container" id="paso1">
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
        </div><br>
        <div class="container" id="paso2">
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
                            <select id="num" class="form-control">
                                <option disabled selected>Seleccione el número de asiento</option>
                            </select>
                        </div></span><br>
                    <span class = "input-group-btn">
                        <button id= "addAsiento" class = "btn btn-primary" type = "button">
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
        </div><br>
        <div class="container" id="paso3">
            <h1 style="color:gray;">Paso 3. Ingrese los datos para el pago</h1> <!--pasar a css-->
            <br>
            <form class="form-inline" id="formulario" >
                <div class="input-group" style="margin: 0 auto;">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-credit-card"></i></span>
                    <input id="tarjeta" type="text" class="form-control" style="width:500px;"
                           placeholder="Ingrese su número de tarjeta">
                </div>
                <br><br>
                <div class="input-group" style="margin: 0 auto;">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                    <input id="codSeguridad" type="text" class="form-control" style="width:500px;"
                           placeholder="Ingrese el código de seguridad de la tarjeta">
                </div>
            </form><br>
            <div class="btn-group btn-group-lg" id="agregarPago">
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
            vista.crearTablaAsientos();
        },
        cargarEspaciosPasajeros: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            vista.crearEspaciosPasajeros(modelo.cantPasajeros);
        },
        obtenerNombresPasajeros: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            for (var i = 0; i < modelo.cantPasajeros; i++) {
                var id = "pass" + i;
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
            var num = document.getElementById("num").value;
            var seat = fila + num;
            if(modelo.asientos.length < modelo.cantPasajeros){
                modelo.asientos.push(seat);
                vista.listarAsientos(modelo.asientos);
            }else{
                window.alert("Ya se ingresó la cantidad máxima de pasajeros");
            }
            
            //Hacer visible paso 2 con display block
        },
        eliminarAsiento: function (event) {
            var asiento = event.target.id;
            var pos = modelo.asientos.indexOf(asiento);
            if (pos > -1) {
                modelo.asientos.splice(pos, 1);
            }
            vista.listarAsientos(modelo.asientos);
        },
        
    };

</script>
<script>
    //Vista
    var modelo;
    var controlador;

    function cargarPagina(event) {
        modelo = new CompraModelo();
        controlador = new CompraControl(modelo, window);
        document.getElementById("btnSiguiente1").addEventListener("click", validarPaso1);
        document.getElementById("btnSiguiente2").addEventListener("click", validarPaso2);
        document.getElementById("addAsiento").addEventListener("click", validarAsiento);
        document.getElementById("btnSiguiente3").addEventListener("click", validarPaso3);
    }

    function crearTablaAsientos() {
        var table = $("#tablaAsientos").DataTable({
            bFilter: false,
            lengthChange: false,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [{orderable: false}, {orderable: false}],
            info: false,
            paging: false
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
            var numero = i + 1;
            $('#num').append($('<option>', {
                value: numero,
                text: numero
            }));
        }
    }

    function crearEspaciosPasajeros(cant) {
        for (var i = 0; i < cant; i++) {
            var idi = 'pass' + i;
            $('<input/>').attr({type: 'text', id: idi, class: 'form-control', placeholder: 'Ingrese el nombre del pasajero',
                style: "width: 500px"}).appendTo('#pass');
            $('#pass').append('<br/>');
            $('#pass').append('<br/>');
        }
    }

    function validarPaso1(event) {
        var error = false;
        for (var i = 0; i < modelo.cantPasajeros; i++) {
            var id = "pass" + i;
            var pass = document.getElementById(id);
            pass.classList.remove("invalid");
            if (pass.value.length == 0) {
                pass.classList.add("invalid");
                error = true;
            }
        }
        if (error) {
            window.alert("Error: Espacios vacios");
            event.preventDefault();
        }else{
            $('#paso1').css("display","none");
            $('#paso2').css("display","block");
        }
    }

    function validarAsiento(event) {
        var error = false;
        var fila = document.getElementById("fila");
        var num = document.getElementById("num");
        fila.classList.remove("invalid");
        if (fila.value == "Seleccione la fila") {
            fila.classList.add("invalid");
            error = true;
        }
        num.classList.remove("invalid");
        if (num.value == "Seleccione el número de asiento") {
            num.classList.add("invalid");
            error = true;
        }
        if (error) {
            window.alert("Error: Espacios vacios");
            event.preventDefault();
        }else{
            controlador.insertarAsiento();
        }
        
    }
    
    function validarPaso2(event) {
        if ($("#tablaAsientos").data().count() < modelo.cantPasajeros) {
            window.alert("Error: Faltan asientos por elegir");
            event.preventDefault();
        }else{
            
            
        }
        
    }
    
    
    
    function validarPaso3(event) {
        var error = false;
        var tarjeta = document.getElementById("tarjeta");
        var codigo = document.getElementById("codSeguridad");
        tarjeta.classList.remove("invalid");
        if (tarjeta.value.length == 0) {
            tarjeta.classList.add("invalid");
            error = true;
        }
        codigo.classList.remove("invalid");
        if (codigo.value.length == 0) {
            codigo.classList.add("invalid");
            error = true;
        }
        if (error) {
            window.alert("Error: Espacios vacios");
            event.preventDefault();
        }
    }

    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>
