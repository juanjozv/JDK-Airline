package aerolinea.modelo;

import aerolinea.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AerolineaModelo {
    
    static Database aerolinea;
    
    static {
        initAerolinea();
    }
    
    private static void initAerolinea() {
        aerolinea = new Database(null, null, null);
    }
   
    
    public static List<Ciudad> getCiudades() throws Exception{
        List<Ciudad> ciudades;
        ciudades = new ArrayList();
        try {
            String sql = "select * from ciudades";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                ciudades.add(toCiudades(rs));
            }
        } catch (SQLException ex) {
        }
        return ciudades;
    }
    
    public static List<TipoAvion> getTiposAvion() throws Exception {
        List<TipoAvion> tipos;
        tipos = new ArrayList();
        try {
            String sql = "select * from tiposavion";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                tipos.add(toTipoAvion(rs));
            }
        } catch (SQLException ex) {
        }
        return tipos;
    }
    

    public static List<Avion> getAviones(){
        Avion[] aviones2 = {
            
        };
        return new ArrayList(Arrays.asList(aviones2));
    }
    
    public static List<Vuelo> getVuelos(){
        Vuelo[] vuelos2 =  {
           
        };
        return new ArrayList(Arrays.asList(vuelos2));
    }
    
    /*public static List<Vuelo> getPromo() {
        List<Vuelo> promos2 = new ArrayList<Vuelo>();
        for(Vuelo vuelo: vuelos) {
            if(!"0".equals(vuelo.descuento)) {
                promos2.add(vuelo);
            }
        }
        return promos2;
    }*/
    
    public static List<Viaje> getViajes() {
        Viaje[] viajes2 = {
     
        };
        return new ArrayList(Arrays.asList(viajes2));
    }
    
    
    
    //Metodos que aplican los filtros de búsqueda
    public static Vuelo getVuelos(String origen, String destino) {
        for(Vuelo v: getVuelos()) {
            if(v.getOrigen().getNombre().contains(origen) && v.getDestino().getNombre().contains(destino))
                return v;
        }
        return null;
    }
    
    public static List<Viaje> getViajes(String origen, String destino, String fecha, String cantAsientOcup) {
        ArrayList<Viaje> result = new ArrayList();
        for(Viaje v: getViajes()) {
           int cantAsientos =  Integer.parseInt(cantAsientOcup);
            if(v.getVuelo().getOrigen().getNombre().contains(origen) && v.getVuelo().getDestino().getNombre().contains(destino) &&
                    v.getFecha().contains(fecha) && v.getCantAsientOcup()  >= cantAsientos )
                result.add(v);
        }
        return result;
    }
    
    
    private static Ciudad toCiudades(ResultSet rs) throws Exception {
        Ciudad obj = new Ciudad();
        obj.setCodigo(rs.getString("codigoCiudad"));
        obj.setNombre(rs.getString("nombre"));
        obj.setPais(rs.getString("pais"));
        obj.setZonaHoraria(rs.getString("zonaHoraria"));
        return obj;
    }
    
    private static TipoAvion toTipoAvion(ResultSet rs) throws Exception {
        TipoAvion obj = new TipoAvion();
        obj.setCodigo(rs.getString("codigo"));
        obj.setAnnio(rs.getString("annio"));
        obj.setModelo(rs.getString("modelo"));
        obj.setMarca(rs.getString("marca"));
        obj.setCantidadPasajeros(rs.getInt("cantidadPasajeros"));
        obj.setCantidadFilas(rs.getInt("cantidadFilas"));
        obj.setCantidadAsientosFila(rs.getInt("cantidadAsientosFila"));
        return obj;
    }
    
    private static Avion toAvion(ResultSet rs) throws Exception {
        Avion obj = new Avion();
        obj.setCodigo(rs.getString("codigo"));
        obj.setTipo(toTipoAvion(rs));
        return obj;
    }
    
    private static Vuelo toVuelo(ResultSet rs) throws Exception {
        Vuelo obj = new Vuelo();
        obj.setCodigo(rs.getString("codigo"));
        obj.setOrigen(toCiudades(rs));
        obj.setDestino(toCiudades(rs));
        obj.setDistancia(rs.getFloat("distancia"));
        obj.setDuracion(rs.getInt("duracion"));
        obj.setDescuento(rs.getFloat("descuento"));
        obj.setAvion(toAvion(rs));
        return obj;
    }
   
    private static Viaje toViaje(ResultSet rs) throws Exception {
        Viaje obj = new Viaje();
        obj.setCodigo(rs.getString("codigo"));
        obj.setFecha(rs.getString("fecha"));
        obj.setDia(rs.getString("dia"));
        obj.setCantAsientOcup(rs.getInt("cantAsientOcup"));
        obj.setHoraSalida(rs.getString("horaSalida"));
        obj.setHoraLlegada(rs.getString("horaLlegada"));
        obj.setPrecio(rs.getFloat("precio"));
        obj.setAvion(toAvion(rs));
        obj.setVuelo(toVuelo(rs));
        return obj;
    }
  
    private static Usuario toUsuario(ResultSet rs) throws Exception {
        Usuario obj = new Usuario();
        obj.setUsername(rs.getString("username"));
        obj.setNombre(rs.getString("nombre"));
        obj.setApellidos(rs.getString("apellidos"));
        obj.setEmail(rs.getString("email"));
        obj.setFechaNacimiento(rs.getString("fechaNacimiento"));
        obj.setDireccion(rs.getString("direccion"));
        obj.setTelefono(rs.getString("telefono"));
        obj.setCelular(rs.getString("celular"));
        return obj;
    }
  
    private static Tiquete toTiquete(ResultSet rs) throws Exception {
        Tiquete obj = new Tiquete();
        obj.setCodigo(rs.getString("codigo"));
        obj.setPasajero(rs.getString("pasajero"));
        obj.setViaje(toViaje(rs));
        return obj;
    }
    
    /*To do:
    to... de las demas tablas con dudas
    */
    
}


