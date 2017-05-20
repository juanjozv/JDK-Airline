package aerolinea.modelo;

public class Avion implements Jsonable {
    String codigo;
    String año;
    String modelo;
    String marca;
    String cantPasajeros;
    String cantFilas;
    String cantAsiFila; 

    public Avion(String codigo, String año, String modelo, String marca, String cantPasajeros, String cantFilas, String cantAsiFila) {
        this.codigo = codigo;
        this.año = año;
        this.modelo = modelo;
        this.marca = marca;
        this.cantPasajeros = cantPasajeros;
        this.cantFilas = cantFilas;
        this.cantAsiFila = cantAsiFila;
    }
}

