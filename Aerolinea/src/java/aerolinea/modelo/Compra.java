package aerolinea.modelo;

public class Compra implements Jsonable{
    String codigoCompra;
    Usuario usuario;
    String fechaCompra;
    String numeroTarjeta;
    float precioTotal;
    String codigoSeguridad;
    
    public Compra(){}

    public Compra(String codigoCompra, Usuario usuario, String fechaCompra, String numeroTarjeta, float precioTotal, String codigoSeguridad) {
        this.codigoCompra = codigoCompra;
        this.usuario = usuario;
        this.fechaCompra = fechaCompra;
        this.numeroTarjeta = numeroTarjeta;
        this.precioTotal = precioTotal;
        this.codigoSeguridad = codigoSeguridad;
    }

    public String getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(String codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public String getNumeroTarjeta() {
        return numeroTarjeta;
    }

    public void setNumeroTarjeta(String numeroTarjeta) {
        this.numeroTarjeta = numeroTarjeta;
    }

    public float getPrecioTotal() {
        return precioTotal;
    }

    public void setPrecioTotal(float precioTotal) {
        this.precioTotal = precioTotal;
    }

    public String getCodigoSeguridad() {
        return codigoSeguridad;
    }

    public void setCodigoSeguridad(String codigoSeguridad) {
        this.codigoSeguridad = codigoSeguridad;
    }
   
}
