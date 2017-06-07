function Viaje(codigo, fecha, dia, cantAsientOcup, horaSalida, horaLlegada, precio, avion, vuelo) {
  this.Viaje(codigo, fecha, dia, cantAsientOcup, horaSalida, horaLlegada, precio, avion, vuelo) ;
}

Viaje.prototype = {
  Viaje: function(codigo, fecha, dia, cantAsientOcup, horaSalida, horaLlegada, precio, avion, vuelo) {
    this.codigo = codigo;
    this.fecha = fecha;
    this.dia = dia;
    this.cantAsientOcup = cantAsientOcup;
    this.horaSalida = horaSalida;
    this.horaLlegada = horaLlegada;
    this.precio = precio;
    this.avion = avion;
    this.vuelo = vuelo;
  }
};
