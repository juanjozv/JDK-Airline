package aerolinea.modelo;

public class Avion implements Jsonable {
    String codigo;
    TipoAvion tipoAvion;
    
    public Avion() {}

    public Avion(String codigo, TipoAvion tipoAvion) {
        this.codigo = codigo;
        this.tipoAvion = tipoAvion;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public TipoAvion getTipo() {
        return tipoAvion;
    }

    public void setTipo(TipoAvion tipoAvion) {
        this.tipoAvion = tipoAvion;
    }
   
}

