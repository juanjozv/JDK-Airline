<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Gestión de Rutas </title>
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
            <h2>Gestión de Rutas</h2>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarRuta" type="text" class="form-control" placeholder = "Buscar ruta por ciudad">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button" onclick ="controlador.buscarRuta();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp       
                <div class="btn-group btn-group-lg" id="agregarRuta">
                    <button type="button" class="btn btn-primary" id="btnAgregarRuta">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar una nueva ruta</button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaRutas" class="table-striped">
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
                    <tbody id="listaRutas"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarRutaModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarRutas" id="close">&times;</span> 
                    <center><h2>Agregar una ruta</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formRuta" action="javascript:registrar();">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="codigo" type="text" class="form-control" placeholder="Ingrese el identificador de la ruta">
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
                        <center><div class="btn-group btn-group-lg" id="registrarRuta">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarRuta">Agregar</button>
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
        function GestionRutasModelo() {
            this.GestionRutasModelo();
        }
        GestionRutasModelo.prototype = {
            GestionRutasModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionRutasControl(modelo, vista) {
            this.GestionRutasControl(modelo, vista);
        }

        GestionRutasControl.prototype = {
            GestionRutasControl: function (modelo, vista) {
                this.modelo = modelo;
                this.vista = vista;
                this.obtenerRutas();
                this.obtenerCiudades();
                this.obtenerAviones();
            },
            obtenerRutas: function () {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getVuelos(function (result) {
                    modelo.rutas = result;
                    vista.listarRutas(modelo.rutas); 
                    vista.crearTablaRutas();
                });
            },
            obtenerCiudades: function () {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getCiudades(function (result) {
                    modelo.ciudades = result;
                    vista.cargarCiudades();
                });
            },
            obtenerAviones: function () {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getAviones(function (result) {
                    modelo.aviones = result;
                    vista.cargarAviones();
                });
            },
            agregarRuta: function(){
                var vista = this.vista;
                var vuelo = this.crearRuta();
                Proxy.vueloAdd(vuelo, function(status){
                    switch(status){
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
            modificarRuta: function(){
                var vista = this.vista;
                var vuelo = this.crearRuta();
                Proxy.modifyVuelo(vuelo, function(status){
                    switch(status){
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
            buscarRuta: function(){
                var vista = this.vista;
                var ciudad = document.getElementById("buscarRuta").value;
                Proxy.vueloCiudadSearch(ciudad, function(result){
                    var busqueda = result;
                    vista.listarRutas(busqueda);
                    vista.finBusqueda();                    
                });
            },
            crearRuta: function(){
                var id = document.getElementById("codigo").value;
                var orig = this.obtenerCiudad(document.getElementById("selOrigen").value);
                var dest = this.obtenerCiudad(document.getElementById("selDestino").value);
                var dist = document.getElementById("distancia").value;
                var dura = document.getElementById("duracion").value;
                var desc = document.getElementById("descuento").value;
                var avion = this.obtenerAvion(document.getElementById("selAvion").value);
                if (desc.length == 0) desc = 0;
                return new Vuelo(id,orig,dest,dist,dura,desc,avion);                
            },
            obtenerCiudad: function(ciudad) {
                var modelo = this.modelo;
                return modelo.ciudades.find(function(c){return c.codigo == ciudad; });
            },
            obtenerAvion: function(avion) {
                var modelo = this.modelo;
                return modelo.aviones.find(function(a){return a.codigo == avion; });
            },
            obtenerRuta: function(ruta) {
                var modelo = this.modelo;
                return modelo.rutas.find(function(r){return r.codigo == ruta.codigo; });
            }
        };
    </script>

    <script>
        //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new GestionRutasModelo();
            controlador = new GestionRutasControl(modelo, window);
            var formulario = document.getElementById("formRuta");
            formulario.addEventListener("submit", validar); 
            initModal();
        }

        function initModal() {
            var modal = document.getElementById("registrarRutaModal");
            var btn = document.getElementById("btnAgregarRuta");
            var close = document.getElementsByClassName("cerrarRegistrarRutas")[0];
            btn.onclick = function () {
                document.getElementById("codigo").disabled = false;
                document.getElementById("btnRegistrarRuta").innerText = "Agregar";
                document.getElementsByTagName("h2")[2].innerText = "Agregar una ruta";
                document.getElementById("formRuta").reset();
                quitarInvalid();
                quitarDescripciones();
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

        function crearTablaRutas() {
            if (!$.fn.dataTable.isDataTable('#tablaRutas') ) {
                $("#tablaRutas").DataTable({
                    bFilter: false,
                    lengthChange: false,
                    pageLength: 10,
                    oLanguage: {
                        sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                    },
                    columns: [
                        {orderable: true },
                        {orderable: false},
                        {orderable: false},
                        {orderable: true },
                        {orderable: true },
                        {orderable: true },
                        {orderable: false},
                        {orderable: false}
                    ],
                    order: [ [0, 'asc'] ]
                });
            }
        }

        function listarRutas(rutas) {
            var listaRutas = document.getElementById("listaRutas");
            listaRutas.innerHTML = "";
            for (var i = 0; i < rutas.length; i++) {
                listarRuta(rutas[i], listaRutas);
            }
        }

        function listarRuta(ruta, listaRutas) {
            var tr = document.createElement("tr");
            var img;
            var td;
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.origen.nombre));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.destino.nombre));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.distancia));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.duracion));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.descuento));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ruta.avion.codigo));
            tr.appendChild(td);

            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/modificar.png";
            img.id = "Modificar";
            img.title = "Modificar";
            img.addEventListener("click", function (e) {
                modificarRuta(ruta);
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
            listaRutas.appendChild(tr);
        }
        
        function modificarRuta(ruta){
            mostrarRuta(controlador.obtenerRuta(ruta));
            quitarInvalid();
            quitarDescripciones();
            agregarDescripciones();
            document.getElementById("btnRegistrarRuta").innerText = "Modificar";
            document.getElementsByTagName("h2")[2].innerText = "Modificar una ruta";
            document.getElementById('registrarRutaModal').style.display = "block";             
        }
   
        function mostrarRuta(vuelo){
            var codigo =  document.getElementById("codigo");
            codigo.value = vuelo.codigo;
            codigo.disabled = true;
            document.getElementById("selOrigen").value = vuelo.origen.codigo;
            document.getElementById("selDestino").value = vuelo.destino.codigo;
            document.getElementById("distancia").value = vuelo.distancia;
            document.getElementById("duracion").value = vuelo.duracion;
            document.getElementById("descuento").value = vuelo.descuento;
            document.getElementById("selAvion").value = vuelo.avion.codigo;     
        }
        
        function cargarCiudades() {
            for (var i = 0; i < modelo.ciudades.length; i++) {
                var codigo = modelo.ciudades[i].codigo;
                var nombre = modelo.ciudades[i].nombre;
                $('#selOrigen').append($('<option>', {
                    value: codigo,
                    text: nombre
                }));
                $('#selDestino').append($('<option>', {
                    value: codigo,
                    text: nombre
                }));
            }
        }
             
        function cargarAviones() {
            for (var i = 0; i < modelo.aviones.length; i++) {
                var codigo = modelo.aviones[i].codigo;
                $('#selAvion').append($('<option>', {
                    value: codigo,
                    text: codigo
                }));
            }
        }
        
        function registrar(){
            var btn = document.getElementById("btnRegistrarRuta");
            if(btn.innerText === "Modificar")  
                controlador.modificarRuta();
            if(btn.innerText === "Agregar")     
                controlador.agregarRuta();
        }
        
        function recargar(){
            var modal = document.getElementById("registrarRutaModal");            
            controlador.obtenerRutas();
            modal.style.display = "none";           
        }
        
        function validar(event) {
            var identificador = document.getElementById("codigo");
            var origen = document.getElementById("selOrigen");
            var destino = document.getElementById("selDestino");
            var distancia = document.getElementById("distancia");
            var duracion = document.getElementById("duracion");
            var avion = document.getElementById("selAvion");
            var error = false;
            
            identificador.classList.remove("invalid");
            if (identificador.value.length == 0) {
                identificador.classList.add("invalid");
                error = true;
            }
            
            origen.classList.remove("invalid");
            if (origen.value == "Elija la ciudad de origen") {
                origen.classList.add("invalid");
                error = true;
            }

            destino.classList.remove("invalid");
            if (destino.value == "Elija la ciudad de destino") {
                destino.classList.add("invalid");
                error = true;
            }

            distancia.classList.remove("invalid");
            if (distancia.value.length == 0) {
                distancia.classList.add("invalid");
                error = true;
            }

            duracion.classList.remove("invalid");
            if (duracion.value.length == 0) {
                duracion.classList.add("invalid");
                error = true;
            }

            avion.classList.remove("invalid");
            if (avion.value == "Elija el avión encargado de la ruta") {
                avion.classList.add("invalid");
                error = true;
            }
            
            if (error) {
                window.alert("Error: Espacios vacios");
                event.preventDefault();
            } else if (origen.value == destino.value) {
                origen.classList.add("invalid");
                destino.classList.add("invalid");
                window.alert("Error: Ciudades iguales");
                event.preventDefault();
            }
        }
        
        function quitarInvalid(){
            document.getElementById("codigo").classList.remove("invalid");
            document.getElementById("selOrigen").classList.remove("invalid");
            document.getElementById("selDestino").classList.remove("invalid");
            document.getElementById("distancia").classList.remove("invalid");
            document.getElementById("duracion").classList.remove("invalid");
            document.getElementById("selAvion").classList.remove("invalid");            
        }
        
        function agregarDescripciones(){
            var spans = document.getElementsByTagName("span");
            spans[15].append(" Código ");
            spans[16].append(" Origen ");
            spans[17].append(" Destino ");
            spans[18].append(" Distancia ");
            spans[19].append(" Duración ");
            spans[20].append(" Descuento ");
            spans[21].append(" Avión ");
        }
        
        function quitarDescripciones(){
            $(".input-group-addon").contents().filter(function () {
                return this.nodeType === 3; 
            }).remove();
        }

        function finBusqueda(){
           window.alert("Busqueda realizada");
           document.getElementById("buscarRuta").value = "";
        }
        
        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>
</html>