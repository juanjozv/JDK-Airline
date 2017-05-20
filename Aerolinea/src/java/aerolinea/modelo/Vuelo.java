package aerolinea.modelo;


public class Vuelo implements Jsonable{
    String codigo;
    Ciudad origen;
    Ciudad destino;
    String distancia;
    String duracion;
    String descuento;
    Avion avion;  

    public Vuelo(String codigo, Ciudad origen, Ciudad destino, String distancia, String duracion, String descuento, Avion avion) {
        this.codigo = codigo;
        this.origen = origen;
        this.destino = destino;
        this.distancia = distancia;
        this.duracion = duracion;
        this.descuento = descuento;
        this.avion = avion;
    }
}
