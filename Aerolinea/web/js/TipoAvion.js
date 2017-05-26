function TipoAvion(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFila) {
  this.TipoAvion(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFila);
}

TipoAvion.prototype = {
  TipoAvion: function(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFila) {
    this.codigo = codigo;
    this.annio = annio;
    this.modelo = modelo;
    this.marca = marca;
    this.cantidadPasajeros = cantidadPasajeros;
    this.cantidadFilas = cantidadFilas;
    this.cantidadAsientosFila = cantidadAsientosFila;
    }
}

