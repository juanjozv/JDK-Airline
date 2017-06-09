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
 
        <!-- DataTable -->
        <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">
        
        <!-- Datepicker -->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

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
                    <input id="buscarHorario" type="text" class="form-control" placeholder="Buscar horario por ID">
                    <span class = "input-group-btn">
                        <button class = "btn btn-default" type = "button" onclick ="controlador.buscarHorario();">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>&nbsp&nbsp&nbsp
                <div class="btn-group btn-group-lg" id="agregarHorario">
                    <button type="button" class="btn btn-primary" id="btnAgregarHorario">
                        <i class="glyphicon glyphicon-plus"></i>&nbsp Agregar un nuevo horario</button>
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
                            <th>Avión</th>
                            <th>Fecha</th>
                            <th>Día</th>
                            <th>Hora salida</th>
                            <th>Hora llegada</th>
                            <th>Precio</th>
                            <th>Modificar</th>
                            <th>Eliminar</th>
                        </tr>
                    </thead>
                    <tbody id="listaHorarios"></tbody>
                </table>
                <br><br>
            </div>
        </div>

        <div id="registrarHorarioModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarRegistrarHorarios" id="close">&times;</span> 
                    <center><h2>Agregar un horario</h2></center>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" id="formHorario" action="javascript:registrar();">
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-barcode"></i></span>
                            <input id="codigo" type="text" class="form-control" placeholder="Ingrese el código del horario">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-road"></i></span>
                            <select class="form-control" id="selRuta">
                                <option selected disabled>Elija una ruta para este horario</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group date"> 
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i> </span>
                            <input type="text" id="fecha" class="form-control" placeholder="Fecha: DD-MM-AAAA" readonly>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <select class="form-control" id="dia">
                                <option selected disabled>Seleccione el día</option>
                                <option>Domingo</option><option>Lunes</option><option>Martes</option>
                                <option>Miercoles</option><option>Jueves</option><option>Viernes</option>
                                <option>Sabado</option>
                            </select>
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-time"></i></span>
                            <input id="horaSalida" type="text" class="form-control" placeholder="Ingrese la hora de salida HH:mm">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-usd"></i></span>
                            <input id="precio" type="text" class="form-control" placeholder="Ingrese el precio del viaje">
                        </div>
                        <br>
                         <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-plane"></i></span>
                            <select class="form-control" id="selAvion">
                                <option selected disabled>Elija un avión para este horario</option>
                            </select>
                        </div>                      
                        <br>
                        <center><div class="btn-group btn-group-lg" id="registrarHorario">
                                <button type="submit" class="btn btn-primary" id="btnRegistrarHorario">Agregar</button>
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
                this.obtenerRutas();
                this.obtenerAviones();
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
            obtenerRutas: function () {
                var modelo = this.modelo;
                var vista = this.vista;
                Proxy.getVuelos(function (result) {
                    modelo.rutas = result;
                    vista.cargarRutas();
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
            agregarHorario: function(){
                var vista = this.vista;
                var horario = this.crearHorario();
                Proxy.viajeAdd(horario, function (status){
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
            modificarHorario: function(){
                var vista = this.vista;
                var horario = this.crearHorario();
                Proxy.modifyViaje(horario, function(status){
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
            eliminarHorario: function(codigo){
                var vista = this.vista;
                Proxy.deleteViaje(codigo, function(status){
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
            buscarHorario: function(){
                var vista = this.vista;
                var horario = document.getElementById("buscarHorario").value;
                Proxy.horarioSearch(horario, function(result){
                    var busqueda = result;
                    vista.listarHorarios(busqueda);
                    vista.finBusqueda();                    
                });
            },
            crearHorario:function(){
                var id = document.getElementById("codigo").value;
                var avion = this.obtenerAvion(document.getElementById("selAvion").value);
                var ruta = this.obtenerRuta(document.getElementById("selRuta").value);
                var fecha = document.getElementById("fecha").value;
                var dia = document.getElementById("dia").value;
                var asient = 0;
                var salida = document.getElementById("horaSalida").value;
                var llegada = moment(salida, "hmm").add(ruta.duracion, 'hours').format('hh:mm a');
                var precio = document.getElementById("precio").value;
                return new Viaje(id,fecha,dia,asient,salida,llegada,precio,avion,ruta);           
            },
            obtenerHorario: function(horario) {
                var modelo = this.modelo;
                return modelo.horarios.find(function(h){return h.codigo == horario.codigo; });
            },
            obtenerAvion: function(avion) {
                var modelo = this.modelo;
                return modelo.aviones.find(function(a){return a.codigo == avion; });
            },
            obtenerRuta: function(ruta) {
                var modelo = this.modelo;
                return modelo.rutas.find(function(r){return r.codigo == ruta; });
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
            var formulario = document.getElementById("formHorario");
            formulario.addEventListener("submit", validar);    
            initModal();
        }

        function initModal() {
            var modal = document.getElementById('registrarHorarioModal');
            var btn = document.getElementById("btnAgregarHorario");
            var close = document.getElementsByClassName("cerrarRegistrarHorarios")[0];
            btn.onclick = function () {
                document.getElementById("codigo").disabled = false;
                document.getElementById("btnRegistrarHorario").innerText = "Agregar";
                document.getElementsByTagName("h2")[2].innerText = "Agregar un horario";
                document.getElementById("formHorario").reset();
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
        
        function crearTablaHorarios() {
            if (!$.fn.dataTable.isDataTable('#tablaHorarios') ) {
                $("#tablaHorarios").DataTable({
                    bFilter: false,
                    lengthChange: false,
                    pageLength: 10,
                    info: false,
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
                            {orderable: true },
                            {orderable: true },
                            {orderable: false},
                            {orderable: false}
                    ],
                    order: [ [0, 'asc'] ]
                });
            }
        }

        function listarHorarios(horarios) {
            var listaHorarios = document.getElementById("listaHorarios");
            listaHorarios.innerHTML = "";
            for (var i = 0; i < horarios.length; i++) {
                listarHorario(listaHorarios, horarios[i]);
            }
        }

        function listarHorario(listaHorarios, horario) {
            var tr = document.createElement("tr");
            var img;
            var td;

            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.codigo));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.vuelo.origen.nombre + "-" + horario.vuelo.destino.nombre));
            tr.appendChild(td);
            td = document.createElement("td");
            td.appendChild(document.createTextNode(horario.avion.codigo));
            tr.appendChild(td);        
            td = document.createElement("td");
            td.appendChild(document.createTextNode(moment(horario.fecha).format("DD-MM-YYYY")));
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
               modificarHorario(horario);
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
                eliminarHorario(horario.codigo);
            });
            img.width = "30";
            img.height = "30";
            td.appendChild(img);
            tr.appendChild(td);

            listaHorarios.appendChild(tr);
        }
        
        function modificarHorario(horario){
            mostrarHorario(controlador.obtenerHorario(horario));
            quitarInvalid();
            quitarDescripciones();
            agregarDescripciones();
            document.getElementById("btnRegistrarHorario").innerText = "Modificar";
            document.getElementsByTagName("h2")[1].innerText = "Modificar una horario";
            document.getElementById('registrarHorarioModal').style.display = "block";             
        }
   
        function mostrarHorario(horario){
            var codigo =  document.getElementById("codigo");
            codigo.value = horario.codigo;
            codigo.disabled = true;
            document.getElementById("codigo").value = horario.codigo;
            document.getElementById("selRuta").value = horario.vuelo.codigo;
            document.getElementById("dia").value = horario.dia;
            document.getElementById("fecha").value = moment(horario.fecha).format("DD-MM-YYYY");
            document.getElementById("horaSalida").value = horario.horaSalida;
            document.getElementById("precio").value = horario.precio;
            document.getElementById("selAvion").value = horario.avion.codigo;     
        }
        
        function eliminarHorario(codigo){
            controlador.eliminarHorario(codigo);
        }
        
        function cargarRutas() {
            for (var i = 0; i < modelo.rutas.length; i++) {
                var codigo = modelo.rutas[i].codigo;
                $('#selRuta').append($('<option>', {
                    value: codigo,
                    text: codigo
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
            var btn = document.getElementById("btnRegistrarHorario");
            if(btn.innerText === "Modificar")  
                controlador.modificarHorario();
            if(btn.innerText === "Agregar")     
                controlador.agregarHorario();
        }
        
        function recargar(){
            var modal = document.getElementById("registrarHorarioModal");            
            controlador.obtenerHorarios();
            modal.style.display = "none";           
        }

        function validar(event) {
            var identificador = document.getElementById("codigo");
            var ruta = document.getElementById("selRuta");
            var fecha = document.getElementById("fecha");
            var dia = document.getElementById("dia");
            var horaSalida = document.getElementById("horaSalida");
            var precio = document.getElementById("precio");
            var avion = document.getElementById("selAvion");
            var error = false;
            
            identificador.classList.remove("invalid");
            if (identificador.value.length == 0) {
                identificador.classList.add("invalid");
                error = true;
            }
            
            ruta.classList.remove("invalid");
            if (ruta.value == "Elija una ruta para este horario") {
                ruta.classList.add("invalid");
                error = true;
            }
            
            fecha.classList.remove("invalid");
            if (fecha.value.length == 0) {
                fecha.classList.add("invalid");
                error = true;
            }

            dia.classList.remove("invalid");
            if (dia.value == "Seleccione el día") {
                dia.classList.add("invalid");
                error = true;
            }

            horaSalida.classList.remove("invalid");
            if (horaSalida.value.length == 0) {
                horaSalida.classList.add("invalid");
                error = true;
            }

            precio.classList.remove("invalid");
            if (precio.value.length == 0) {
                precio.classList.add("invalid");
                error = true;
            }

            avion.classList.remove("invalid");
            if (avion.value == "Elija un avión para este horario") {
                avion.classList.add("invalid");
                error = true;
            }
            
            if (error) {
                window.alert("Error: Espacios vacios");
                event.preventDefault();
            }
        }
        
        function quitarInvalid(){
            document.getElementById("codigo").classList.remove("invalid");
            document.getElementById("selRuta").classList.remove("invalid");
            document.getElementById("dia").classList.remove("invalid");
            document.getElementById("fecha").classList.remove("invalid");
            document.getElementById("horaSalida").classList.remove("invalid");
            document.getElementById("precio").classList.remove("invalid");
            document.getElementById("selAvion").classList.remove("invalid");    
        }
        
        function agregarDescripciones(){
            var spans = document.getElementsByTagName("span");
            spans[15].append(" Código ");
            spans[16].append(" Ruta ");
            spans[17].append(" Fecha ");
            spans[18].append(" Día ");
            spans[19].append(" Hora Salida ");
            spans[20].append(" Precio ");
            spans[21].append(" Avión ");
        }
        
        function quitarDescripciones(){
            $(".input-group-addon").contents().filter(function () {
                return this.nodeType === 3; 
            }).remove();
        }

        function finBusqueda(){
           window.alert("Busqueda realizada");
           document.getElementById("buscarHorario").value = "";
        }
        
        //Calendarios
        $(function () {
            $('#fecha').datetimepicker({
                format: 'DD-MM-YYYY',
                pickTime: false
            });
            var dt = new Date();
            dt.setDate(dt.getDate() - 1);
            $('#fecha').data("DateTimePicker").setMinDate(dt);
        });


        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>
</html>