<%-- 
    Document   : index
    Created on : 20/05/2017, 08:44:34 PM
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" href="images/icon.png" />
        <title> JDK Aerolinea </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!-- Datepicker -->
        <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.5.1/moment.min.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/moment.js/2.4.0/lang/en-gb.js"></script>
        <script src="http://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.0.0/js/bootstrap-datetimepicker.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <!--Fuentes de Google Fonts-->
        <link href="https://fonts.googleapis.com/css?family=Arima+Madurai|Roboto|Sanchez|Lobster+Two|Satisfy|Lato" rel="stylesheet">

        <!-- CSS propio -->
        <link rel="stylesheet" title="estiloIndex" type="text/css" href="css/estilo.css">

        <!-- JS propio -->
        <script type="text/javascript" src="js/Ciudad.js"></script>
        <script type="text/javascript" src="js/Avion.js"></script>
        <script type="text/javascript" src="js/Vuelo.js"></script>
        <script type="text/javascript" src="js/Viaje.js"></script>
        <script type="text/javascript" src="js/Proxy.js"></script>
        <script type="text/javascript" src="js/JsonUtils.js"></script>

    </head>

    <body>

        <!--BARRA DE MENÚ-->
        <%@ include file="header.jspf" %>

        <!--CAROUSEL OFERTAS DE VUELOS-->
        <div class="container" id="contCarousel">
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators"></ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox"></div>
                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <!-- FORMULARIO DE BÚSQUEDA DE VUELO -->
        <div class="bs-docs-featurette" id="divBusqueda">
            <div class="container" id="contbusqueda">
                <h2 id="busquedaForm">Elija los vuelos de su preferencia </h2><br>
                <form class="form-horizontal" id="formulario" action="javascript:doSubmit();">
                    <center><div class="radio">
                            <label class="radio-inline"><input type="radio" name="optradio" id="radioIR" checked="checked"> Ida y regreso</label>
                            <label class="radio-inline"><input type="radio" name="optradio" id="radioID"> Solo Ida</label>
                        </div></center><br><br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i> Origen: </span>
                        <select class="form-control" id="sel1">
                            <option selected disabled>Ciudad o aeropuerto</option>
                        </select>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i> Destino: </span>
                        <select class="form-control" id="sel2">
                            <option selected disabled>Ciudad o aeropuerto</option>
                        </select>
                    </div>
                    <br>
                    <div class="input-group date">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i> Fecha ida: </span>
                        <input type="text" id="datetimepicker1" class="form-control" placeholder="DD/MM/AAAA" readonly>
                    </div>
                    <br>
                    <div class="input-group date" id="regreso"> 
                        <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i> Fecha regreso: </span>
                        <input type="text" id="datetimepicker2" class="form-control" placeholder="DD/MM/AAAA" readonly>
                    </div>
                    <br>
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-users"></i> Pasajeros: </span>
                        <div class="input-group spinner">
                            <input type="text" class="form-control" value="1" min="1" max="10" id="mySpinner"></input>
                            <div class="input-group-btn-vertical">
                                <button class="btn btn-default" type="button"><i class="fa fa-caret-up"></i></button>
                                <button class="btn btn-default" type="button"><i class="fa fa-caret-down"></i></button>
                            </div>
                        </div>
                    </div>

                    <br><br>
                    <div class="btn-group btn-group-lg" id="buscarLimpiar">
                        <button type="submit" class="btn btn-primary" id="btnBuscar">Buscar</button>
                        <button type="reset" class="btn btn-warning" id="btnReset">Limpiar</button>
                    </div>
                </form>
            </div>
        </div>

        <hr>
        <!--SECCIÓN DE REFERENTES INSTITUCIONALES-->
        <div class="bs-docs-featurette" id="Referentes">
            <div class="container">
                <div class="page-header">
                    <h1 id="timeline">Referentes institucionales</h1>
                </div>
                <div class="row slideanim">
                    <div class="col-sm-3">
                        <span class="glyphicon glyphicon-ok-sign"></span>
                        <h3>MISIÓN</h3>
                        <p>Brindar una conexión internacional de viajes que fomente el turismo costarricense y a su vez permita a los ciudadanos conocer el resto del mundo.</p>
                    </div>
                    <div class="col-sm-3">
                        <span class="glyphicon glyphicon-ok-sign"></span>
                        <h3>VISIÓN</h3>
                        <p>Ser la aerolínea líder de Costa Rica, reconocida internacionalmente brindando una experiencia única y segura.</p>
                    </div>
                    <div class="col-sm-3 val">
                        <span class="glyphicon glyphicon-heart"></span>
                        <h3>VALORES</h3>
                        <p> Honestidad <br> Respeto <br> Integridad <br> Confiabilidad </p>
                    </div>
                    <div class="col-sm-3 val">
                        <span class="glyphicon glyphicon-star"></span>
                        <h3>COMPROMISOS</h3>
                        <p> Seguridad <br> Satisfacción del cliente <br> Ambiente positivo <br> Mejora continua</p>
                    </div>
                </div>

            </div>
        </div>
        <hr>
        <!--SECCIÓN DE HISTORIA-->
        <div class="bs-docs-featurette" id="Historia">
            <div class="container">
                <div class="page-header">
                    <h1 id="timeline">Historia</h1>
                </div>
                <ul class="timeline">
                    <li>
                        <div class="timeline-badge"><i class="glyphicon glyphicon-briefcase"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">¿Quiénes somos?</h4>
                            </div>
                            <div class="timeline-body">
                                <p>JDK Aerolíneas es una aerolínea de bajo costo, con servicio punto a punto que opera en Costa Rica.</p>
                            </div>
                        </div>
                    </li>
                    <li class="timeline-inverted">
                        <div class="timeline-badge primary"><i class="glyphicon glyphicon-send"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Desarrollo</h4>
                            </div>
                            <div class="timeline-body">
                                <p>Desde que comenzó a operar en abril del 2017, JDK ha incrementado 
                                    sus rutas de 5 a más de 50 y su flota de 4 a 30 aeronaves.</p>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="timeline-badge"><i class="glyphicon glyphicon-globe"></i></div>
                        <div class="timeline-panel">
                            <div class="timeline-heading">
                                <h4 class="timeline-title">Alcance</h4>
                            </div>
                            <div class="timeline-body">
                                <p>JDK ofrece más de 100 segmentos de vuelos diarios, conectando a 
                                    Costa Rica con ciudades de América, Europa y Asia.</p>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

    </body>

    <!-- SECCIÓN DE CONTÁCTENOS - PIE DE PÁGINA -->
    <footer id="PgFooter">
        <%@ include file="footer.jspf" %>
    </footer>


    <script>
        //Modelo
        function IndexModelo() {
            this.IndexModelo();
        }
        IndexModelo.prototype = {
            IndexModelo: function () {}
        };
    </script>

    <script>
        //Control

        function IndexControl(modelo, vista) {
            this.IndexControl(modelo, vista);
        }

        IndexControl.prototype = {
            IndexControl: function (modelo, vista) {
                this.modelo = modelo;
                this.vista = vista;

                Proxy.getCiudades(function (result) {
                    modelo.ciudades = result;
                    vista.cargarCiudades(); //magia
                }
                );
                Proxy.getPromo(function (result) {
                    modelo.promos = result;
                    vista.cargarCarousel();
                    vista.agregarEventosCarou();
                }
                );
            },
            pasarDatos: function (origen, destino, fechaIda, fechaRegreso, pasajeros) {
                /*Esto guarda en el local storage*/
                localStorage.setItem('origen', origen);
                localStorage.setItem('destino', destino);
                localStorage.setItem('fechaIda', fechaIda);
                localStorage.setItem('fechaRegreso', fechaRegreso);
                localStorage.setItem('pasajeros', pasajeros);
            }
        }
    </script>

    <script>
        //Vista
        var modelo;
        var controlador;

        function cargarPagina(event) {
            modelo = new IndexModelo();
            controlador = new IndexControl(modelo, window);
            var formulario = document.getElementById("formulario");
            formulario.reset();
            formulario.addEventListener("submit", validar);
            formulario.addEventListener("reset", limpiar);
            //cargarInicio();
        }

        function cargarCarousel() {

            var nameO = "NA";
            var nameD = "NA";
            var codigoO = "NA";
            var codigoD = "NA";
            var descripcion = "NA";
            var item = "NA";
            var descuento = 0;

            for (var i = 0; i < modelo.promos.length; i++) {
                descuento = modelo.promos[i].descuento;
                if (descuento > 0) {
                    nameO = modelo.promos[i].origen.nombre;
                    nameD = modelo.promos[i].destino.nombre;
                    codigoO = modelo.promos[i].origen.codigo;
                    codigoD = modelo.promos[i].destino.codigo;
                    descripcion = descuento + "% - Precios desde $150";
                    var item = '<div class="item"><img src="images/' + nameD +
                            '.jpg"><div class="carousel-caption flex"><div class="tituloOferta"><span class="glyphicon glyphicon-plane" aria-hidden="true"></span> '
                            + nameO + " - " + nameD +
                            '</div><br><div class="infoDesc">' + descripcion +
                            '<br><div class="btn-group"><button type="button" class="btn btn-success" id="butt'
                            + codigoO + codigoD + '">Ver oferta</button></div></div></div></div>';

                    $(item).appendTo('.carousel-inner');
                    $('<li data-target="#myCarousel" data-slide-to="' + i + '"></li>').appendTo('.carousel-indicators');
                }
            }
            $('.item').first().addClass('active');
            $('.carousel-indicators > li').first().addClass('active');
        }

        function limpiar(event) {
            //Quitar estilo de datos inválidos en todos los inputs
            var origen = document.getElementById("sel1");
            var destino = document.getElementById("sel2");
            var fechaIda = document.getElementById("datetimepicker1");
            var fechaRegreso = document.getElementById("datetimepicker2");
            origen.classList.remove("invalid");
            destino.classList.remove("invalid");
            fechaIda.classList.remove("invalid");
            fechaRegreso.classList.remove("invalid");

            //Quitar límites (minDate-maxDate) de fechas seleccionadas
            var dt = new Date();
            dt.setDate(dt.getDate() - 1);
            $('#datetimepicker1').data("DateTimePicker").setMinDate(true);
            $('#datetimepicker1').data("DateTimePicker").setMaxDate("");
            $('#datetimepicker2').data("DateTimePicker").setMinDate(true);
            $('#datetimepicker1').data("DateTimePicker").setMinDate(dt);
            $('#datetimepicker2').data("DateTimePicker").setMinDate(dt);
        }

        function validar(event) {
            var origen = document.getElementById("sel1");
            var destino = document.getElementById("sel2");
            var idaRegreso = document.getElementById("radioIR");
            var fechaIda = document.getElementById("datetimepicker1");
            var fechaRegreso = document.getElementById("datetimepicker2");
            var error = false;

            origen.classList.remove("invalid");
            if (origen.value == "Ciudad o aeropuerto") {
                origen.classList.add("invalid");
                error = true;
            }

            destino.classList.remove("invalid");
            if (destino.value == "Ciudad o aeropuerto") {
                destino.classList.add("invalid");
                error = true;
            }

            fechaIda.classList.remove("invalid");
            if (fechaIda.value.length == 0) {
                fechaIda.classList.add("invalid");
                error = true;
            }

            if (idaRegreso.checked) {
                fechaRegreso.classList.remove("invalid");
                if (fechaRegreso.value.length == 0) {
                    fechaRegreso.classList.add("invalid");
                    error = true;
                }
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

        function doSubmit() {
            //-->OBTENER DATOS DEL FORM<---
            var origen = $("#sel1").val();
            var destino = $("#sel2").val();
            var fechaIda = $("#datetimepicker1").val();
            var fechaRegreso = "NA";
            if ($('#radioIR').is(':checked'))
                fechaRegreso = $("#datetimepicker2").val();
            var pasajeros = $("#mySpinner").val();


            controlador.pasarDatos(origen, destino, fechaIda, fechaRegreso, pasajeros);
            location.href = "busqueda.jsp";
        }

        $(document).ready(function () {
            $('#btnReset').click(function () {
                $("#regreso").show();
            });
            // Validación de radio buttons
            $('#radioID').click(function () {
                $("#regreso").hide();
            });
            $('#radioIR').click(function () {
                $("#regreso").show();
            });
        });


        //Calendarios
        $(function () {
            $('#datetimepicker1').datetimepicker({
                format: 'DD/MM/YYYY',
                pickTime: false
            });
            $('#datetimepicker2').datetimepicker({
                format: 'DD/MM/YYYY',
                pickTime: false
            });
            var dt = new Date();
            dt.setDate(dt.getDate() - 1);
            $('#datetimepicker1').data("DateTimePicker").setMinDate(dt);
            $('#datetimepicker2').data("DateTimePicker").setMinDate(dt);
            $("#datetimepicker1").on("dp.change", function (e)  {
                $('#datetimepicker2').data("DateTimePicker").setMinDate(e.date);
            });
            $("#datetimepicker2").on("dp.change", function (e)  {
                $('#datetimepicker1').data("DateTimePicker").setMaxDate(e.date);
            });
        });

        //Spinner
        $(function () {
            $('.spinner .btn:first-of-type').on('click', function () {
                var btn = $(this);
                var input = btn.closest('.spinner').find('input');
                if (input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max'))) {
                    input.val(parseInt(input.val(), 10) + 1);
                } else {
                    btn.next("disabled", true);
                }
            });
            $('.spinner .btn:last-of-type').on('click', function () {
                var btn = $(this);
                var input = btn.closest('.spinner').find('input');
                if (input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min'))) {
                    input.val(parseInt(input.val(), 10) - 1);
                } else {
                    btn.prev("disabled", true);
                }
            });
        });

        function cargarCiudades() {
            for (var i = 0; i < modelo.ciudades.length; i++) {
                var name = modelo.ciudades[i].nombre;
                $('#sel1').append($('<option>', {
                    value: name,
                    text: name
                }));
                $('#sel2').append($('<option>', {
                    value: name,
                    text: name
                }));
            }
        }

        function verOferta(codO, codD, origen, destino) {
            var id = "#butt" + codO + codD;
            $(id).click(function () {
                $('#sel1').val(origen);
                $('#sel2').val(destino);
                $('#btnBuscar').focus();
            });
        }

        function agregarEventosCarou() {
            for (var i = 0; i < modelo.promos.length; i++) {
                var miCodO = modelo.promos[i].origen.codigo;
                var miCodD = modelo.promos[i].destino.codigo;
                var miOrigen = modelo.promos[i].origen.nombre;
                var miDestino = modelo.promos[i].destino.nombre;

                verOferta(miCodO, miCodD, miOrigen, miDestino);
            }
        }



        document.addEventListener("DOMContentLoaded", cargarPagina);
    </script>

</html>