package aerolinea.modelo;

public class Usuario implements Jsonable{
    String username;
    String password;
    String nombre;
    String apellidos;
    String email;
    String fechaNacimiento;
    String direccion;
    String telefono;
    String celular;
    int tipo;
    
    public Usuario() {}

    public Usuario(String username, String password, String nombre, String apellidos, String email, String fechaNacimiento, String direccion, String telefono, String celular, int tipo) {
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFechaNacimiento() {
        return fechaNacimiento;
    }

    public void setFechaNacimiento(String fechaNacimiento) {
        this.fechaNacimiento = fechaNacimiento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public int getTipo() {
        return tipo;
    }

    public void setTipo(int tipo) {
        this.tipo = tipo;
    }

    
}