package aerolinea.modelo;

public class Compra implements Jsonable{
    String codigoCompra;
    String usuario;
    String fechaCompra;
    String numeroTarjeta;
    float precioTotal;

    public Compra(String codigoCompra, String usuario, String fechaCompra, String numeroTarjeta, float precioTotal) {
        this.codigoCompra = codigoCompra;
        this.usuario = usuario;
        this.fechaCompra = fechaCompra;
        this.numeroTarjeta = numeroTarjeta;
        this.precioTotal = precioTotal;
    }

    public String getCodigoCompra() {
        return codigoCompra;
    }

    public void setCodigoCompra(String codigoCompra) {
        this.codigoCompra = codigoCompra;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
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
    
}
