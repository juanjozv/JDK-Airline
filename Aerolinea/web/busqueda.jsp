<html>
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea - Búsqueda de Vuelos </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- DataTable -->
        <script src="http://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css">

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
        
        <!--Fuentes de Google Fonts-->
       <link href="https://fonts.googleapis.com/css?family=Arima+Madurai|Roboto|Sanchez|Lobster+Two|Satisfy|Lato" rel="stylesheet"

        <!-- CSS propio -->
        <link rel="stylesheet" title="xxx" type="text/css" href="css/estilo.css">
       
    </head>

    <body>
        <!--BARRA DE MENÚ-->
        <%@ include file="header.jspf" %>

        <!--TABLAS DE BÚSQUEDAS-->
        <br>
        <div class="container">
            <div class="jumbotron">
                <div class="row">
                    <div class="table-responsive">
                        <table id="tablaIda" class="table-striped">
                            <thead>
                                <tr>
                            <p><span class="glyphicon glyphicon-circle-arrow-right"></span>&nbsp Ida</p>
                            </tr>
                            <tr>
                                <th>Ruta</th>
                                <th>Vuelo</th>
                                <th>Detalle</th>
                                <th>Precio</th>
                                <th>Comprar</th>
                            </tr>
                            </thead>
                            <tbody id="listaIda"></tbody>
                        </table>
                    </div>
                </div>
                <br>
                <div class="row">
                    <div class="table-responsive" id="regreso">
                        <table id="tablaRegreso" class="table-striped">
                            <thead>
                                <tr>
                            <p><span class="glyphicon glyphicon-circle-arrow-left"></span>&nbsp Regreso</p>
                            </tr>
                            <tr>
                                <th>Ruta</th>
                                <th>Vuelo</th>
                                <th>Detalle</th>
                                <th>Precio</th>
                                <th>Comprar</th>
                            </tr>
                            </thead>
                            <tbody id="listaRegreso"></tbody>
                        </table>
                    </div>
                </div>
                <br><br>
                <center>
                    <div class="btn-group btn-group-lg">
                        <button type="button" class="btn btn-warning" id="btnVer" onclick="controlador.getSeleccionados();">Ver vuelos seleccionados</button>
                    </div>
                </center>
            </div>
        </div>

        <!-- MODAL VUELOS SELECCIONADOS  -->
        <div id="vuelosModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="cerrarVuelos" id="close">&times;</span> 
                    <center><h2>Vuelos seleccionados</h2></center>
                </div> <br><br>
                <div class="modal-body">  
                    <div class="table-responsive">
                        <table id="vuelosSelec" class="table-striped">
                            <thead>
                                <tr>
                                    <th>Tipo</th>
                                    <th>Ruta</th>
                                    <th>Vuelo</th>
                                    <th>Detalle</th>
                                    <th>Precio</th>
                                </tr>
                            </thead>
                            <tbody id="vuelosS"></tbody>
                        </table>
                    </div> <br><br>
                    <center>
                        <div class="btn-group btn-group-lg">
                            <button type="button" class="btn btn-success" id="btnComprar" onclick="controlador.comprar();">Comprar</button>
                        </div>
                    </center>
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
                <p><b>Email id:</b> <a href="#">aerolineasJDK@aerolíneas.com</a></p>
                <p><b>Números de ayuda(8AM a 10PM):</b> +506-66666666, +506-99999999</p>
                <p><b>Números Telefónicos: </b> 011-27568832, 9868387223 </p>
            </div>
        </div>
    </footer>
</html>

<script>
    //Modelo
    function BusquedaModelo() {
        this.BusquedaModelo();
        this.vueloIda;
        this.vueloRegreso;
        this.viajesBuscados = [];
    }
    BusquedaModelo.prototype = {
        BusquedaModelo: function () {}
    };
</script>

<script>
    //Control
    function BusquedaControl(modelo, vista) {
        this.BusquedaControl(modelo, vista);
    }

    BusquedaControl.prototype = {
        BusquedaControl: function (modelo, vista) {
            this.modelo = modelo;
            this.vista = vista;
            this.busqueda();
        },
        busqueda: function () {
            var modelo = this.modelo;
            var vista = this.vista;
            var orig = localStorage.getItem('origen');
            var dest = localStorage.getItem('destino');
            var fIda = localStorage.getItem('fechaIda');
            var fReg = localStorage.getItem('fechaRegreso');
            var cantPasajeros = localStorage.getItem('pasajeros');
            Proxy.vueloSearch(orig, dest, function (result) {
                modelo.vueloIda = result;
                Proxy.viajeSearch(orig, dest, fIda, cantPasajeros, function (result) {
                    modelo.viajesBuscados = result;
                    vista.listarViajes(modelo.vueloIda, modelo.viajesBuscados, "listaIda");
                    vista.crearDataTable("#tablaIda");
                });
            });
            if (fReg != "NA") {
                Proxy.vueloSearch(dest, orig, function (result) {
                    modelo.vueloRegreso = result;
                    Proxy.viajeSearch(dest, orig, fReg, cantPasajeros, function (result) {
                        modelo.viajesBuscados = result;
                        vista.listarViajes(modelo.vueloRegreso, modelo.viajesBuscados, "listaRegreso");
                        vista.crearDataTable("#tablaRegreso");
                    });
                });

            } else
                vista.bloquearTablaRegreso();

        },
        getSeleccionados: function () {
            var vista = this.vista;
            var ida = $('input[name=listaIda]:checked');
            var regreso = $('input[name=listaRegreso]:checked');
            var fReg = localStorage.getItem('fechaRegreso');
            var fIda = localStorage.getItem('fechaIda');
            if(fReg != "NA" && !regreso.val() || fIda != "NA" && !ida.val())
                window.alert("Debe seleccionar un vuelo!")
            else{
                vista.openModal();
                vista.showSeleccionados(ida, "Ida");
                if (fReg != "NA")
                    vista.showSeleccionados(regreso, "Regreso");   
            }
            
        },
        comprar: function(){
            var viajeIda = $('input[name=listaIda]:checked').val();
            var viajeVuelta = $('input[name=listaRegreso]:checked').val();
            localStorage.setItem('viajeIda', viajeIda);
            if(!viajeVuelta)
                localStorage.setItem('viajeVuelta', "NA");
            else
                localStorage.setItem('viajeVuelta', viajeVuelta);
            location.href = "compra.jsp";
        }
    }
</script>

<script>
    //Vista
    var modelo;
    var controlador;

    function cargarPagina(event) {
        modelo = new BusquedaModelo();
        controlador = new BusquedaControl(modelo, window);
        initModal();
    }

    function bloquearTablaRegreso() {
        $("#regreso").hide();
    }

    function crearDataTable(tabla) {
        $(tabla).DataTable({
            bFilter: false,
            lengthChange: false,
            pageLength: 10,
            oLanguage: {
                sUrl: "https://cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
            },
            columns: [
                {orderable: false},
                {orderable: false},
                {orderable: false},
                {orderable: true },
                {orderable: false}
            ],
            order: [
                [3, 'asc']
            ]
        });
    }
    
    function crearMiniDataTable(tabla) {
        $(tabla).DataTable({
            bFilter: false,
            lengthChange: false,
            ordering: false,
            info: false,
            paging: false
        });
    }

    function listarViajes(vuelo, viajes, lista) {
        var listaViajes = document.getElementById(lista);
        listaViajes.innerHTML = "";
        for (var i = 0; i < viajes.length; i++) {
            listarViaje(listaViajes, vuelo, viajes[i], lista);
        }
    }

    function listarViaje(listaViajes, vuelo, viaje, lista) {
        var tr = document.createElement("tr");
        var td;
        var radio;
        td = document.createElement("td");
        td.appendChild(document.createTextNode(vuelo.origen.nombre + " - " + vuelo.destino.nombre));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(viaje.fecha + " " + viaje.horaSalida + " - " + viaje.horaLlegada));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(vuelo.distancia + "Km - " + vuelo.duracion + "h"));
        tr.appendChild(td);
        td = document.createElement("td");
        td.appendChild(document.createTextNode(viaje.precio));
        tr.appendChild(td);
        radio = document.createElement("input");
        radio.setAttribute("type", "radio");
        radio.setAttribute("name", (lista));
        radio.setAttribute("value", viaje.codigo);
        td = document.createElement("td");
        td.appendChild(radio);
        tr.appendChild(td);
        listaViajes.appendChild(tr);
    }
        
    function initModal() {
        var modal = document.getElementById("vuelosModal");
        var close = document.getElementsByClassName("cerrarVuelos")[0];
        crearMiniDataTable("#vuelosSelec"); 
        
        close.onclick = function () {
            modal.style.display = "none";
        };
        
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    }
    
    function openModal(){
        var modal = document.getElementById("vuelosModal");
        modal.style.display = "block";
        $("#vuelosS").empty();
    }
    
    function showSeleccionados(select, name) {
        var tr = document.createElement("tr");
        var vuelo = $(select).parent('td').parents('tr');
        var vuelosS = document.getElementById("vuelosS");
        $(document.createTextNode(name)).appendTo(tr);
        vuelo.find('td').each(function () {
            $(this).clone().appendTo(tr);
        });
        tr.removeChild(tr.lastChild);
        vuelosS.append(tr);
    }
    
    document.addEventListener("DOMContentLoaded", cargarPagina);
</script>



