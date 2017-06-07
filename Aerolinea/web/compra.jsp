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
        <div class="container" id="tiquetesIDA"> <!-- <div class="container" id="paso1"> -->
            <h1 style="color:gray;">Ingrese la informacion de los tiquetes IDA</h1> <!--pasar a css-->
            <br>
            <center>
                <div class="box">    
                    <label for="qty">Campos Restantes</label>
                    <input id="qtyIDA" value="0" />
                </div>
            </center>
            <br><br>
            <form class="form-inline" id ="formIDA">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="pasajeroIDA" type="text" class="form-control"  placeholder="Nombre del pasajero">
                </div>
                <div class="form-group">
                    <select id="filaIDA" class="form-control">
                        <option selected  disabled >Seleccione la fila</option>
                    </select>
                </div>
                <div class="form-group">
                    <select id="numIDA" class="form-control">
                        <option disabled selected>Seleccione el número de asiento</option>
                    </select>
                </div>
                <br><br>
                <div class="btn-group btn-group-lg" id="agregarAsientos">
                    <button type="button" class="btn btn-primary" id="btnAgregarIDA"> Agregar </button>
                </div>
            </form><br><br>
            <center><div class="row">
                    <div class="table-responsive">
                        <table id="tablaAsientosIDA" class="table-striped">
                            <thead><tr><th>Asiento</th><th>Pasajero</th><th>Eliminar</th></tr></thead>
                            <tbody id="listaAsientosIDA"></tbody>
                        </table>
                    </div>
                </div></center>
            <br>
            
        </div><br>
        
        <div class="container" id="tiquetesVuelta"> <!-- <div class="container" id="paso1"> -->
            <h1 style="color:gray;">Ingrese la informacion de los tiquetes VUELTA</h1> <!--pasar a css-->
            <br>
            <center>
                <div class="box">    
                    <label for="qty">Campos Restantes</label>
                    <input id="qtyVUELTA" value="0" />
                </div>
            </center>
            <br><br>
            <form class="form-inline" id ="formVUELTA">
                <div class="input-group">
                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                    <input id="pasajeroVUELTA" type="text" class="form-control"  placeholder="Nombre del pasajero">
                </div>
                <div class="form-group">
                    <select id="filaVUELTA" class="form-control">
                        <option selected  disabled >Seleccione la fila</option>
                    </select>
                </div>
                <div class="form-group">
                    <select id="numVUELTA" class="form-control">
                        <option disabled selected>Seleccione el número de asiento</option>
                    </select>
                </div>
                <br><br>
                <div class="btn-group btn-group-lg" id="agregarAsientos">
                    <button type="button" class="btn btn-primary" id="btnAgregarVUELTA"> Agregar </button>
                </div>
            </form><br><br>
            <center><div class="row">
                    <div class="table-responsive">
                        <table id="tablaAsientosVUELTA" class="table-striped">
                            <thead><tr><th>Asiento</th><th>Pasajero</th><th>Eliminar</th></tr></thead>
                            <tbody id="listaAsientosVUELTA"></tbody>
                        </table>
                    </div>
                </div></center>
            <br>
            
        </div><br>
       
        <div class="container" id="paso3">
            <h1 style="color:gray;">Ingrese los datos para el pago</h1> <!--pasar a css-->
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
        this.asientosIDA = [];
        this.asientosVUELTA = [];
        
        this.cantPasajeros = localStorage.getItem('pasajeros');
        this.viajeIda = localStorage.getItem('viajeIda');
        this.viajeVuelta = localStorage.getItem('viajeVuelta');
        
        this.pasajerosIDA = [];
        this.pasajerosVUELTA = [];
    }
    CompraModelo.prototype = {
        CompraModelo: function () {}
    };
</script>

<script>
    //Control
    function CompraControl(modelo, vista) {
        this.CompraControl(modelo, vista);
        
        
        this.cargarAsientosIDA();
        this.cargarAsientosVUELTA();
        
        
    }

    CompraControl.prototype = {
        CompraControl: function (modelo, vista) {
            this.modelo = modelo;
            this.vista = vista;
            vista.crearTablaAsientosIDA();
            vista.crearTablaAsientosVUELTA();
        },
        
        cargarAsientosIDA: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            Proxy.obtenerViaje(modelo.viajeIda, function (result) {
                modelo.viaje = result;
                var tipo = modelo.viaje.avion.tipoAvion;
                vista.cargarAsientosIDA(tipo.cantidadFilas, tipo.cantidadAsientosFila);
            });
        },
        
        cargarAsientosVUELTA: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            Proxy.obtenerViaje(modelo.viajeVuelta, function (result) {
                modelo.viaje = result;
                var tipo = modelo.viaje.avion.tipoAvion;
                vista.cargarAsientosVUELTA(tipo.cantidadFilas, tipo.cantidadAsientosFila);
            });
        },
        
        insertarAsientoIDA: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            var fila = document.getElementById("filaIDA").value;
            var num = document.getElementById("numIDA").value;
            var seat = fila + num;
            var pasajero = document.getElementById("pasajeroIDA").value;
            if (modelo.asientosIDA.length < modelo.cantPasajeros) {
                Proxy.obtenerAsientosOcupados(modelo.viajeIda, function (result) {
                    modelo.asientosOcupadosIDA = result;
                   
                    var ocupado = vista.buscarOcupado(modelo.asientosOcupadosIDA, seat);
                    var bloqueado = modelo.asientosIDA.find(function (a) {
                            return a == seat;
                            });
                    if(ocupado || bloqueado) {
                        window.alert("Asiento Ocupado");
                    } else {
                        modelo.asientosIDA.push(seat);
                        modelo.pasajerosIDA.push(pasajero);
                        vista.listarAsientosIDA(modelo.asientosIDA, modelo.pasajerosIDA);
                        vista.modify_qty(-1);
                        document.getElementById("formIDA").reset();
                    }
                });
                
            } else {
                window.alert("Ya se ingresó la cantidad máxima de pasajeros");
            }

        },
        
        insertarAsientoVUELTA: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            var fila = document.getElementById("filaVUELTA").value;
            var num = document.getElementById("numVUELTA").value;
            var seat = fila + num;
            var pasajero = document.getElementById("pasajeroVUELTA").value;
            if (modelo.asientosVUELTA.length < modelo.cantPasajeros) {
                Proxy.obtenerAsientosOcupados(modelo.viajeVUELTA, function (result) {
                    modelo.asientosOcupadosVUELTA = result;
                    
                    var ocupado = vista.buscarOcupado(modelo.asientosOcupadosVUELTA, seat);
                    var bloqueado = modelo.asientosVUELTA.find(function (a) {
                            return a == seat;
                            });
                    if(ocupado || bloqueado) {
                        window.alert("Asiento Ocupado");
                    } else {
                        modelo.asientosVUELTA.push(seat);
                        modelo.pasajerosVUELTA.push(pasajero);
                        vista.listarAsientosVUELTA(modelo.asientosVUELTA, modelo.pasajerosVUELTA);
                        vista.modify_qtyVUELTA(-1);
                        document.getElementById("formVUELTA").reset();
                    }
                    
                }); 
            } else {
                window.alert("Ya se ingresó la cantidad máxima de pasajeros");
            }

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
        
        document.getElementById("formIDA").reset();
        document.getElementById("formVUELTA").reset();
        
        document.getElementById("btnAgregarIDA").addEventListener("click", validarIDA);
        document.getElementById("btnAgregarVUELTA").addEventListener("click", validarVUELTA);
        
        if(localStorage.getItem('viajeVuelta') == "NA") {
            document.getElementById("tiquetesVuelta").style.display = "none";
        }
        
        document.getElementById('qtyIDA').value = modelo.cantPasajeros;
        document.getElementById('qtyVUELTA').value = modelo.cantPasajeros;
        
    }

    function crearTablaAsientosIDA() {
        var table = $("#tablaAsientosIDA").DataTable({
            bFilter: false,
            lengthChange: false,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [{orderable: false}, {orderable: false}, {orderable: false}],
            info: false,
            paging: false
        });
    }
    
    function crearTablaAsientosVUELTA() {
        var table = $("#tablaAsientosVUELTA").DataTable({
            bFilter: false,
            lengthChange: false,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [{orderable: false}, {orderable: false}, {orderable: false}],
            info: false,
            paging: false
        });
    }

    function listarAsientosIDA(asientos, pasajeros) {
        var listaAsientos = document.getElementById("listaAsientosIDA");
        listaAsientos.innerHTML = "";
        for (var i = 0; i < asientos.length; i++) {
            crearListaAsientos(listaAsientos, asientos[i], pasajeros[i]);
        }
    }
    
    function listarAsientosVUELTA(asientos, pasajeros) {
        var listaAsientos = document.getElementById("listaAsientosVUELTA");
        listaAsientos.innerHTML = "";
        for (var i = 0; i < asientos.length; i++) {
            crearListaAsientos(listaAsientos, asientos[i], pasajeros[i]);
        }
    }

    function crearListaAsientos(listaAsientos, asiento, pasajero) {
        var tr = document.createElement("tr");
        var td;
        td = document.createElement("td");
        td.appendChild(document.createTextNode(asiento));
        tr.appendChild(td);
        
        td = document.createElement("td");
        td.appendChild(document.createTextNode(pasajero));
        tr.appendChild(td);
        
        td = document.createElement("td");
        img = document.createElement("img");
        img.src = "images/eliminar.png";
        img.id = asiento;
        img.title = "Eliminar";
        if(listaAsientos.id == "listaAsientosIDA") {
            img.addEventListener("click", eliminarAsientoIDA);
        } else {
           img.addEventListener("click", eliminarAsientoVUELTA); 
        }
        img.width = "30";
        img.height = "30";
        td.appendChild(img);
        tr.appendChild(td);

        listaAsientos.appendChild(tr);
    }
  
    function eliminarAsientoIDA(event) {
        var asiento = event.target.id;
        var pos = modelo.asientosIDA.indexOf(asiento);
        if (pos > -1) {
            modelo.asientosIDA.splice(pos, 1);
            modelo.pasajerosIDA.splice(pos, 1); //magia
            modify_qty(1);
        }
        listarAsientosIDA(modelo.asientosIDA, modelo.pasajerosIDA);
        }
    function eliminarAsientoVUELTA(event) {
        var asiento = event.target.id;
        var pos = modelo.asientosVUELTA.indexOf(asiento);
        if (pos > -1) {
            modelo.asientosVUELTA.splice(pos, 1);
            modelo.pasajerosVUELTA.splice(pos, 1); //magia
            modify_qtyVUELTA(1);
        }
        listarAsientosVUELTA(modelo.asientosVUELTA, modelo.pasajerosVUELTA);
    }

    function cargarAsientosIDA(cantFilas, cantAsientosFila) {
        var abc = 65;
        for (var i = 0; i < cantAsientosFila; i++) {
            var letra = String.fromCharCode(abc);
            $('#filaIDA').append($('<option>', {
                value: letra,
                text: letra
            }));
            abc++;
        }
        for (var i = 0; i < cantFilas; i++) {
            var numero = i + 1;
            $('#numIDA').append($('<option>', {
                value: numero,
                text: numero
            }));
        }
    }
    
    function cargarAsientosVUELTA(cantFilas, cantAsientosFila) {
        var abc = 65;
        for (var i = 0; i < cantAsientosFila; i++) {
            var letra = String.fromCharCode(abc);
            $('#filaVUELTA').append($('<option>', {
                value: letra,
                text: letra
            }));
            abc++;
        }
        for (var i = 0; i < cantFilas; i++) {
            var numero = i + 1;
            $('#numVUELTA').append($('<option>', {
                value: numero,
                text: numero
            }));
        }
    }
    
    function validarIDA(event) {
        var error = false;
        var nombre = document.getElementById("pasajeroIDA");
        var fila = document.getElementById("filaIDA");
        var num = document.getElementById("numIDA");
        
        
        nombre.classList.remove("invalid");
        if (nombre.value == "") {
            nombre.classList.add("invalid");
            error = true;
        }
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
        } else {
            controlador.insertarAsientoIDA();
            
        }
    }
    
    function validarVUELTA(event) {
        var error = false;
        var nombre = document.getElementById("pasajeroVUELTA");
        var fila = document.getElementById("filaVUELTA");
        var num = document.getElementById("numVUELTA");
        fila.classList.remove("invalid");
        
        
        nombre.classList.remove("invalid");
        if (nombre.value == "") {
            nombre.classList.add("invalid");
            error = true;
        }
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
        } else {
            controlador.insertarAsientoVUELTA();
            
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


    
    function buscarOcupado(ocupados, asiento) {
        for (var i = 0; i < ocupados.length; i++) {
            if (ocupados[i] == asiento) return true;
        }
        return false;
    }
    
    function modify_qty(val) {
        
        var qty = document.getElementById('qtyIDA').value;
        var new_qty = parseInt(qty,10) + val;

        if (new_qty < 0) {
            new_qty = 0;
        }

        document.getElementById('qtyIDA').value = new_qty;
        return new_qty;
    }
    
    function modify_qtyVUELTA(val) {
        
        var qty = document.getElementById('qtyVUELTA').value;
        var new_qty = parseInt(qty,10) + val;

        if (new_qty < 0) {
            new_qty = 0;
        }

        document.getElementById('qtyVUELTA').value = new_qty;
        return new_qty;
    }
    

    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>
