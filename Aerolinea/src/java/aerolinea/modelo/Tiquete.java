package aerolinea.modelo;

public class Tiquete implements Jsonable{
    String codigo;
    String pasajero;
    Viaje viaje;
    
    public Tiquete() {}

    public Tiquete(String codigo, String pasajero, Viaje viaje) {
        this.codigo = codigo;
        this.pasajero = pasajero;
        this.viaje = viaje;
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
    
    
}
