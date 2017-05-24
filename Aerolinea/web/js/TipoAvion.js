function TipoAvion(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFilas) {
  this.TipoAvion(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFilas);
}

TipoAvion.prototype = {
  TipoAvion: function(codigo, annio, modelo, marca, cantidadPasajeros, cantidadFilas, cantidadAsientosFilas) {
    this.codigo = codigo;
    this.annio = annio;
    this.modelo = modelo;
    this.marca = marca;
    this.cantidadPasajeros = cantidadPasajeros;
    this.cantidadFilas = cantidadFilas;
    this.cantidadAsientosFilas = cantidadAsientosFilas;
    }
}

