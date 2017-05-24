package aerolinea.modelo;


public class Vuelo implements Jsonable{
    String codigo;
    Ciudad origen;
    Ciudad destino;
    float distancia;
    int duracion;
    float descuento;
    Avion avion;
    
    public Vuelo() {}

    public Vuelo(String codigo, Ciudad origen, Ciudad destino, float distancia, int duracion, float descuento, Avion avion) {
        this.codigo = codigo;
        this.origen = origen;
        this.destino = destino;
        this.distancia = distancia;
        this.duracion = duracion;
        this.descuento = descuento;
        this.avion = avion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Ciudad getOrigen() {
        return origen;
    }

    public void setOrigen(Ciudad origen) {
        this.origen = origen;
    }

    public Ciudad getDestino() {
        return destino;
    }

    public void setDestino(Ciudad destino) {
        this.destino = destino;
    }

    public float getDistancia() {
        return distancia;
    }

    public void setDistancia(float distancia) {
        this.distancia = distancia;
    }

    public int getDuracion() {
        return duracion;
    }

    public void setDuracion(int duracion) {
        this.duracion = duracion;
    }

    public float getDescuento() {
        return descuento;
    }

    public void setDescuento(float descuento) {
        this.descuento = descuento;
    }

    public Avion getAvion() {
        return avion;
    }

    public void setAvion(Avion avion) {
        this.avion = avion;
    }
}
