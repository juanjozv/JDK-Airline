var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k, v) {
    if(v instanceof Object && v._class == 'Ciudad'){
        return new Ciudad(v.codigo, v.nombre, v.pais, v.zonaHoraria);
    }
    if(v instanceof Object && v._class == 'TipoAvion'){
        return new TipoAvion(v.codigo, v.annio, v.modelo, v.marca, v.cantidadPasajeros, v.cantidadFilas, v.cantidadAsientosFila);
    }
    if(v instanceof Object && v._class == 'Avion'){
        return new Avion(v.codigo, v.tipo);
    }
    if(v instanceof Object && v._class == 'Vuelo'){
        return new Vuelo(v.codigo, v.origen, v.destino, v.distancia, v.duracion, v.descuento, v.avion);
    }
    if(v instanceof Object && v._class == 'Viaje'){
        return new Viaje(v.codigo, v.fecha, v.dia, v.cantAsientOcup, v.horaSalida, v.horaLlegada, v.precio, v.avion, v.vuelo);
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
    
    return v;
};

