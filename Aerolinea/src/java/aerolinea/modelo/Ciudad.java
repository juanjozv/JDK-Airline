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

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getZonaHoraria() {
        return zonaHoraria;
    }

    public void setZonaHoraria(String zonaHoraria) {
        this.zonaHoraria = zonaHoraria;
    }
    
}
