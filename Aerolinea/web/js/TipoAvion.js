function TipoAvion(codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila) {
    this.TipoAvion(codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila);
}

TipoAvion.prototype = {
    TipoAvion: function (codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila) {
        this.codigo = codigo;
        this.annio = annio;
        this.marca = marca;
        this.modelo = modelo;
        this.cantidadPasajeros = cantidadPasajeros;
        this.cantidadFilas = cantidadFilas;
        this.cantidadAsientosFila = cantidadAsientosFila;
    }
};

