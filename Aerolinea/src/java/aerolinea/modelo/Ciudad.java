package aerolinea.modelo;

public class Ciudad implements Jsonable{
    String codigo;
    String nombre;
    String pais;
    String zonaHoraria;

    public Ciudad(String codigo, String nombre, String pais, String zonaHoraria) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.pais = pais;
        this.zonaHoraria = zonaHoraria;
    } 
}
