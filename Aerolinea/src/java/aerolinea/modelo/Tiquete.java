package aerolinea.modelo;

public class Tiquete implements Jsonable{
    String codigo;
    String pasajero;
    Viaje viaje;
    String codigoAsiento;
    Compra codCompra;
    
    public Tiquete(){}

    public Tiquete(String pasajero, Viaje viaje, String codigoAsiento) {
        this.pasajero = pasajero;
        this.viaje = viaje;
        this.codigoAsiento = codigoAsiento;
    }


    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getPasajero() {
        return pasajero;
    }

    public void setPasajero(String pasajero) {
        this.pasajero = pasajero;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }

    public String getCodigoAsiento() {
        return codigoAsiento;
    }

    public void setCodigoAsiento(String codigoAsiento) {
        this.codigoAsiento = codigoAsiento;
    }

    public Compra getCodCompra() {
        return codCompra;
    }

    public void setCodCompra(Compra codCompra) {
        this.codCompra = codCompra;
    }

    
}
