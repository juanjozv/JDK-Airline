package aerolinea.modelo;

public class Avion implements Jsonable {
    String codigo;
    TipoAvion tipo;

    public Avion(String codigo, TipoAvion tipo) {
        this.codigo = codigo;
        this.tipo = tipo;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public TipoAvion getTipo() {
        return tipo;
    }

    public void setTipo(TipoAvion tipo) {
        this.tipo = tipo;
    }
   
}

