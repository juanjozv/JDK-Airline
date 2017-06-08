<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Gestión de Ciudades </title>
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
            <h2>Gestión de Ciudades</h2>
            <br><br>  
            <form class="form-inline">
                <div class = "input-group input-group-lg">
                    <input id="buscarCiudad" type="text" class="form-control" placeholder="Buscar ciudad por ID" autocomplete="off">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button" onclick ="controlador.buscarCiudad();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp       
                <div class="btn-group btn-group-lg" id="agregarCiudad">
                    <button type="button" class="btn btn-primary" id="btnAgregarCiudad">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar una nueva ciudad </button>
                </div>
            </form>       
        </div>
        <br><br><br>
        <div class="container">
            <div class="table-responsive">
                <table id="tablaCiudades" class="table-striped">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre</th>
                            <th>País</th>
                            <th>Zona Horaria</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="listaCiudades"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarCiudadModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarCiudades" id="close">&times;</span> 
                    <center><h2>Agregar una ciudad</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formCiudad" action="javascript:registrar();">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="codigo" type="text" class="form-control" placeholder="Ingrese el código de la ciudad" autocomplete="off">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input id="nombre" type="text" class="form-control" placeholder="Ingrese el nombre de la ciudad" autocomplete="off">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <input id="pais" type="text" class="form-control" placeholder="Ingrese el país" autocomplete="off">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <input id="zonaHoraria" type="text" class="form-control" placeholder="Ingrese la zona horaria" autocomplete="off">
                        </div>
                        <br>
                        <div class="input-group ">
                            <span class="input-group-addon btn btn-default btn-file">
                                <i class="glyphicon glyphicon-open-file"></i>&nbsp Explorar<input type="file" accept="image/*" id="fileIn" onchange="act();" hidden>
                            </span>
                            <input id="imagen" type="text" class="form-control" placeholder="Seleccione una imagen de la ciudad" readonly disabled autocomplete="off">
                        </div>
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarCiudad">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarCiudad">Agregar</button>
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
        function GestionCiudadesModelo() {
            this.GestionCiudadesModelo();
        }
        GestionCiudadesModelo.prototype = {
            GestionCiudadesModelo: function () {}
        };
    </script>

    <script>
        //Control
        function GestionCiudadesControl(modelo, vista) {
            this.GestionCiudadesControl(modelo, vista);
        }

        GestionCiudadesControl.prototype = {
            GestionCiudadesControl: function(modelo, vista) {
                this.modelo = modelo;
                this.vista = vista;
                this.obtenerCiudades();
            },
            obtenerCiudades: function() {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getCiudades(function (result) {
                    modelo.ciudades = result;
                    vista.listarCiudades(modelo.ciudades);
                    vista.crearTablaCiudades();
                });
            },
            agregarCiudad: function() {
                var vista = this.vista;
                var ciudad = this.crearCiudad();
                var imagen = document.getElementById("fileIn").files[0];
                Proxy.ciudadAdd(ciudad, imagen, function (status){
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
            modificarCiudad: function() {
                var vista = this.vista;
                var ciudad = this.crearCiudad();
                var imagen = document.getElementById("fileIn").files[0];
                Proxy.modifyCiudad(ciudad, imagen, function(status){
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
            buscarCiudad: function(){
                var vista = this.vista;
                var ciudad = document.getElementById("buscarCiudad").value;
                Proxy.ciudadSearch(ciudad, function(result){
                    var busqueda = result;
                    vista.listarCiudades(busqueda);
                    vista.finBusqueda();                    
                });
            },
            crearCiudad:function(){
                var codigo = document.getElementById("codigo").value;
                var nombre = document.getElementById("nombre").value;
                var pais = document.getElementById("pais").value;
                var zonaHoraria = document.getElementById("zonaHoraria").value;
                return new Ciudad(codigo, nombre, pais, zonaHoraria);           
            },
            obtenerCiudad: function(ciudad) {
                var modelo = this.modelo;
                return modelo.ciudades.find(function(c){return c.codigo == ciudad.codigo; });
            }
        };
    </script>

    <script>
        //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new GestionCiudadesModelo();
            controlador = new GestionCiudadesControl(modelo, window);
            var fromulario = document.getElementById("formCiudad");
            fromulario.addEventListener("submit", validar);
            initModal();
        }

        function initModal() {
            var modal = document.getElementById("registrarCiudadModal");
            var btn = document.getElementById("btnAgregarCiudad");
            var close = document.getElementsByClassName("cerrarRegistrarCiudades")[0];
            btn.onclick = function () {
                document.getElementById("codigo").disabled = false;
                document.getElementById("btnRegistrarCiudad").innerText = "Agregar";
                document.getElementsByTagName("h2")[2].innerText = "Agregar una ciudad";
                document.getElementById("formCiudad").reset();
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

        function crearTablaCiudades() {
            if (!$.fn.dataTable.isDataTable('#tablaCiudades') ) {
                $("#tablaCiudades").DataTable({
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
                            {orderable: false},
                            {orderable: false}
                    ],
                    order: [ [0, 'asc'] ]
                });
            }
        }

        function listarCiudades(ciudades) {
            var listaCiudades = document.getElementById("listaCiudades");
            listaCiudades.innerHTML = "";
            for (var i = 0; i < ciudades.length; i++) {
                listarCiudad(ciudades[i],listaCiudades);
            }
        }

        function listarCiudad(ciudad, listaCiudades) {
            var tr = document.createElement("tr");
            var img;
            var td;     
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ciudad.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ciudad.nombre));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ciudad.pais));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(ciudad.zonaHoraria));
            tr.appendChild(td);

            td = document.createElement("td");
            img = document.createElement("img");
            img.src = "images/modificar.png";
            img.id = "Modificar";
            img.title = "Modificar";
            img.addEventListener("click", function (e) {
                modificarCiudad(ciudad);
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

            listaCiudades.appendChild(tr);
        }

        function modificarCiudad(ciudad){
            mostrarCiudad(controlador.obtenerCiudad(ciudad));
            quitarInvalid();
            quitarDescripciones();
            agregarDescripciones();
            document.getElementById("btnRegistrarCiudad").innerText = "Modificar";
            document.getElementsByTagName("h2")[2].innerText = "Modificar una ciudad";
            document.getElementById('registrarCiudadModal').style.display = "block";             
        }

        function mostrarCiudad(ciudad){
            var codigo =  document.getElementById("codigo");
            codigo.value = ciudad.codigo;
            codigo.disabled = true;
            document.getElementById("nombre").value = ciudad.nombre;
            document.getElementById("pais").value = ciudad.pais;
            document.getElementById("zonaHoraria").value = ciudad.zonaHoraria;     
        }
        
        function registrar(){
            var btn = document.getElementById("btnRegistrarCiudad");
            if(btn.innerText === "Modificar")  
                controlador.modificarCiudad();
            if(btn.innerText === "Agregar")     
                controlador.agregarCiudad();
        }
        
        function recargar(){
            var modal = document.getElementById("registrarCiudadModal");            
            controlador.obtenerCiudades();
            modal.style.display = "none";           
        }
        
        function validar(event) {
            var codigo = document.getElementById("codigo");
            var nombre = document.getElementById("nombre");
            var pais = document.getElementById("pais");
            var zonaHoraria = document.getElementById("zonaHoraria");
            var imgtxt = document.getElementById("imagen");
            var error = false;

            codigo.classList.remove("invalid");
            if (codigo.value.length == 0) {
                codigo.classList.add("invalid");
                error = true;
            }

            nombre.classList.remove("invalid");
            if (nombre.value.length == 0) {
                nombre.classList.add("invalid");
                error = true;
            }

            pais.classList.remove("invalid");
            if (pais.value.length == 0) {
                pais.classList.add("invalid");
                error = true;
            }

            zonaHoraria.classList.remove("invalid");
            if (zonaHoraria.value.length == 0) {
                zonaHoraria.classList.add("invalid");
                error = true;
            }

            imgtxt.classList.remove("invalid");
            if (imgtxt.value.length == 0) {
                imgtxt.classList.add("invalid");
                error = true;
            }

            if (error) {
                window.alert("Error: Espacios vacios");
                event.preventDefault();
            }
        }
        
        function quitarInvalid(){
            document.getElementById("codigo").classList.remove("invalid");
            document.getElementById("nombre").classList.remove("invalid");
            document.getElementById("pais").classList.remove("invalid");
            document.getElementById("zonaHoraria").classList.remove("invalid");
            document.getElementById("imagen").classList.remove("invalid");     
        }

        function agregarDescripciones(){
            var spans = document.getElementsByTagName("span");
            spans[14].append(" Código ");
            spans[15].append(" Nombre ");
            spans[16].append(" País ");
            spans[17].append(" Zona Horaria ");
            spans[18].append(" Explorar ");
        }

        function quitarDescripciones(){
            $(".input-group-addon").contents().filter(function () {
                return this.nodeType === 3; 
            }).remove();
        }    
        
        function finBusqueda(){
           window.alert("Busqueda realizada");
           document.getElementById("buscarCiudad").value = "";
        }

        function act() {
            var fullPath = document.getElementById('fileIn').value;
            var img = document.getElementById("imagen");
            if (fullPath) {
                var startIndex = (fullPath.indexOf('\\') >= 0 ? fullPath.lastIndexOf('\\') : fullPath.lastIndexOf('/'));
                var filename = fullPath.substring(startIndex);
                if (filename.indexOf('\\') === 0 || filename.indexOf('/') === 0) {
                    filename = filename.substring(1);
                }
                img.value = filename;
            }
        }
        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>
</html>