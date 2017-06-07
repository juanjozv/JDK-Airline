function Tiquete(codigo, pasajero, viaje, codCompra) {
  this.Tiquete(codigo, pasajero, viaje, codCompra);
}

Tiquete.prototype = {
  Tiquete: function(codigo, pasajero, viaje, codigoAsiento, codCompra) {
    this.codigo = codigo;
    this.pasajero = pasajero;
    this.viaje = viaje;
    this.codigoAsiento = codigoAsiento;
    this.codCompra = codCompra;
  }
}
