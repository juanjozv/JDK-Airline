var JsonUtils = JsonUtils || {};

JsonUtils.revive = function (k, v) {
    if(v instanceof Object && v._class == 'Ciudad'){
        return new Ciudad(v.codigo, v.nombre, v.pais, v.zonaHoraria);
    }
    if(v instanceof Object && v._class == 'Avion'){
        return new Avion(v.codigo, v.año, v.modelo, v.marca, v.cantPasajeros, v.cantFilas, v.cantAsiFila);
    }
    if(v instanceof Object && v._class == 'Viaje'){
        return new Viaje(v.codigo, v.fecha, v.dia, v.cantAsientOcup, v.horaSalida, v.horaLlegada, v.precio, v.avion, v.vuelo);
    }
    if(v instanceof Object && v._class == 'Vuelo'){
        return new Vuelo(v.codigo, v.origen, v.destino, v.distancia, v.duracion, v.descuento, v.avion);
    }
    return v;
};

JsonUtils.replacer = function (k, v){
    if(v instanceof Ciudad){
        v._class = "Ciudad";
    }
    if(v instanceof Avion){
        v._class = "Avion";
    }
    if(v instanceof Viaje){
        v._class = "Viaje";
    }
    if(v instanceof Vuelo){
        v._class = "Vuelo";
    }
    return v;
};

