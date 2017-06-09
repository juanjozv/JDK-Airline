function Compra(usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad) {
  this.Compra(usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad);
}

Compra.prototype = {
  Compra: function(usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad) {
    this.usuario = usuario;
    this.fechaCompra = fechaCompra;
    this.numeroTarjeta = numeroTarjeta;
    this.precioTotal = precioTotal;
    this.codigoSeguridad = codigoSeguridad;
  }
};