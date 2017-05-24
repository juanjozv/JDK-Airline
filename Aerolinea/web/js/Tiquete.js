function Tiquete(codigo, pasajero, viaje) {
  this.Tiquete(codigo, pasajero, viaje);
}

Tiquete.prototype = {
  Tiquete: function(codigo, pasajero, viaje) {
    this.codigo = codigo;
    this.pasajero = pasajero;
    this.viaje = viaje;
  }
}
