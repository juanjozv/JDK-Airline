function Ciudad(codigo, nombre, pais, zonaHoraria) {
  this.Ciudad(codigo, nombre, pais, zonaHoraria);
}

Ciudad.prototype = {
  Ciudad: function(codigo, nombre, pais, zonaHoraria) {
    this.codigo = codigo;
    this.nombre = nombre;
    this.pais = pais;
    this.zonaHoraria = zonaHoraria;
  }
}
