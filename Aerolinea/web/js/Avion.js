function Avion(codigo, año, modelo, marca, cantPasajeros, cantFilas, cantAsiFila) {
  this.Avion(codigo, año, modelo, marca, cantPasajeros, cantFilas, cantAsiFila);
}

Avion.prototype = {
  Avion: function(codigo, año, modelo, marca, cantPasajeros, cantFilas, cantAsiFila) {
    this.codigo = codigo;
    this.año = año;
    this.modelo = modelo;
    this.marca = marca;
    this.cantPasajeros = cantPasajeros;
    this.cantFilas = cantFilas;
    this.cantAsiFila = cantAsiFila;
    }
}
