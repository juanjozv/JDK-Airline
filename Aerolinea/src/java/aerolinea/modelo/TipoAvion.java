package aerolinea.modelo;

public class TipoAvion implements Jsonable{
   
    String codigo;
    String annio;
    String marca;
    String modelo;
    int cantidadPasajeros;
    int cantidadFilas;
    int cantidadAsientosFila;
    
    public TipoAvion() {}

    public TipoAvion(String codigo, String annio, String marca, String modelo, int cantidadPasajeros, int cantidadFilas, int cantidadAsientosFila) {
        this.codigo = codigo;
        this.annio = annio;
        this.marca = marca;
        this.modelo = modelo;
        this.cantidadPasajeros = cantidadPasajeros;
        this.cantidadFilas = cantidadFilas;
        this.cantidadAsientosFila = cantidadAsientosFila;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getAnnio() {
        return annio;
    }

    public void setAnnio(String annio) {
        this.annio = annio;
    }
    
    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public int getCantidadPasajeros() {
        return cantidadPasajeros;
    }

    public void setCantidadPasajeros(int cantidadPasajeros) {
        this.cantidadPasajeros = cantidadPasajeros;
    }

    public int getCantidadFilas() {
        return cantidadFilas;
    }

    public void setCantidadFilas(int cantidadFilas) {
        this.cantidadFilas = cantidadFilas;
    }

    public int getCantidadAsientosFila() {
        return cantidadAsientosFila;
    }

    public void setCantidadAsientosFila(int cantidadAsientosFila) {
        this.cantidadAsientosFila = cantidadAsientosFila;
    }
    
   
}
