function Compra(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal) {
  this.Compra(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal) ;
}

Compra.prototype = {
  Compra: function(codigoCompra, usuario, fechaCompra, numeroTarjeta, precioTotal) {
    this.codigoCompra = codigoCompra;
    this.usuario = usuario;
    this.fechaCompra = fechaCompra;
    this.numeroTarjeta = numeroTarjeta;
    this.precioTotal = precioTotal;
  }
}