function Usuario(username, password, nombre, apellidos, email, 
                fechaNacimiento, direccion, telefono, celular, tipo) {
  this.Usuario(username, password, nombre, apellidos, email, 
                fechaNacimiento, direccion, telefono, celular, tipo);
}

Usuario.prototype = {
  Usuario: function(username, password, nombre, apellidos, email, 
                fechaNacimiento, direccion, telefono, celular, tipo) {
    this.username = username;
    this.password = password;
    this.nombre = nombre;
    this.apellidos = apellidos;
    this.email = email;
    this.fechaNacimiento = fechaNacimiento;
    this.direccion = direccion;
    this.telefono = telefono;
    this.celular = celular;
    this.tipo = tipo;
  }
};