function Vuelo(codigo, origen, destino, distancia, duracion, descuento, avion) {
  this.Vuelo (codigo, origen, destino, distancia, duracion, descuento, avion);
}

Vuelo.prototype = {
  Vuelo: function(codigo, origen, destino, distancia, duracion, descuento, avion) {
    this.codigo = codigo;
    this.origen = origen;
    this.destino = destino;
    this.distancia = distancia;
    this.duracion = duracion;
    this.descuento = descuento;
    this.avion = avion;
  }
}
