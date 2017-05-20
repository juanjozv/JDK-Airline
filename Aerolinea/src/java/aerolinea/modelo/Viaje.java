package aerolinea.modelo;

public class Viaje implements Jsonable{
    String codigo;
    String fecha;
    String dia;
    int cantAsientOcup;
    String horaSalida;
    String horaLlegada;
    String precio;
    Avion avion;
    Vuelo vuelo;  

    public Viaje(String codigo, String fecha, String dia, int cantAsientOcup, String horaSalida, String horaLlegada, String precio, Avion avion, Vuelo vuelo) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.dia = dia;
        this.cantAsientOcup = cantAsientOcup;
        this.horaSalida = horaSalida;
        this.horaLlegada = horaLlegada;
        this.precio = precio;
        this.avion = avion;
        this.vuelo = vuelo;
    }
}


