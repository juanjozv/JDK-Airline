function Tiquete(pasajero, viaje, codigoAsiento) {
  this.Tiquete(pasajero, viaje, codigoAsiento);
}

Tiquete.prototype = {
  Tiquete: function(pasajero, viaje, codigoAsiento) {
    this.pasajero = pasajero;
    this.viaje = viaje;
    this.codigoAsiento = codigoAsiento;
  }
};
