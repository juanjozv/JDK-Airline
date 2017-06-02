var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k, v) {
    if(v instanceof Object && v._class == 'Ciudad') {
        return new Ciudad(v.codigo, v.nombre, v.pais, v.zonaHoraria);
    }
    if(v instanceof Object && v._class == 'TipoAvion'){
        return new TipoAvion(v.codigo, v.annio, v.marca, v.modelo, v.cantidadPasajeros, v.cantidadFilas, v.cantidadAsientosFila);
    }
    if(v instanceof Object && v._class == 'Avion') {
        return new Avion(v.codigo, v.tipoAvion);
    }
    if(v instanceof Object && v._class == 'Vuelo') {
        return new Vuelo(v.codigo, v.origen, v.destino, v.distancia, v.duracion, v.descuento, v.avion);
    }
    if(v instanceof Object && v._class == 'Viaje') {
        return new Viaje(v.codigo, v.fecha, v.dia, v.cantAsientOcup, v.horaSalida, v.horaLlegada, v.precio, v.avion, v.vuelo);
    }
    if(v instanceof Object && v._class == 'Usuario') {
        return new Usuario(v.username, v.password, v.nombre, v.apellidos, v.email, v.fechaNacimiento, v.direccion, v.telefono, v.celular, v.tipo);
    }
    if(v instanceof Object && v._class == 'Compra') {
        return new Compra(v.codigoCompra, v.usuario, v.tiquete, v.fechaCompra, v.numeroTarjeta, v.precioTotal);
    }
    if(v instanceof Object && v._class == 'Tiquete') {
        return new Tiquete(v.codigo, v.pasajero, v.viaje, v.codigoAsiento, v.codCompra);
    }
    
    return v;
};

JsonUtils.replacer = function (k, v){
    if(v instanceof Ciudad){
        v._class = "Ciudad";
    }
    if(v instanceof TipoAvion){
        v._class = "TipoAvion";
    }
    if(v instanceof Avion){
        v._class = "Avion";
    }
    if(v instanceof Vuelo){
        v._class = "Vuelo";
    }
    if(v instanceof Viaje){
        v._class = "Viaje";
    }
    if(v instanceof Usuario){
        v._class = "Usuario";
    }
    if(v instanceof Compra) {
        v._class = "Compra";
    }
    if(v instanceof Tiquete) {
        v._class = "Tiquete";
    }
    return v;
};

