package aerolinea.modelo;

public class Viaje implements Jsonable{
    String codigo;
    String fecha;
    String dia;
    int cantAsientOcup;
    String horaSalida;
    String horaLlegada;
    float precio;
    Avion avion;
    Vuelo vuelo;
    
    public Viaje() {}

    public Viaje(String codigo, String fecha, String dia, String horaSalida, String horaLlegada, float precio, Avion avion, Vuelo vuelo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.dia = dia;
        this.cantAsientOcup = 0;
        this.horaSalida = horaSalida;
        this.horaLlegada = horaLlegada;
        this.precio = precio;
        this.avion = avion;
        this.vuelo = vuelo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getCantAsientOcup() {
        return cantAsientOcup;
    }

    public void setCantAsientOcup(int cantAsientOcup) {
        this.cantAsientOcup = cantAsientOcup;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(String horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }

    public Vuelo getVuelo() {
        return vuelo;
    }

    public void setVuelo(Vuelo vuelo) {
        this.vuelo = vuelo;
    }
      
    
}


