function Compra(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad) {
  this.Compra(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad);
}

Compra.prototype = {
  Compra: function(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal, codigoSeguridad) {
    this.codigoCompra = codigoCompra;
    this.usuario = usuario;
    this.fechaCompra = fechaCompra;
    this.numeroTarjeta = numeroTarjeta;
    this.precioTotal = precioTotal;
    this.codigoSeguridad = codigoSeguridad;
  }
};