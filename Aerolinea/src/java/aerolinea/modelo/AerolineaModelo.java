package aerolinea.modelo;

import aerolinea.database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class AerolineaModelo {

    static Database aerolinea;

    static {
        initAerolinea();
    }

    private static void initAerolinea() {
        aerolinea = new Database(null, null, null);
    }

    /*--------------------------OBTENER TODOS--------------------------------*/
    public static List<Ciudad> getCiudadesAll() throws Exception {
        List<Ciudad> ciudades;
        ciudades = new ArrayList();
        try {
            String sql = "select * from ciudades;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                ciudades.add(toCiudades(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo las ciudades");
        }
        return ciudades;
    }

    public static List<Avion> getAvionesAll() throws Exception {
        List<Avion> aviones;
        aviones = new ArrayList();
        try {
            String sql = "select * from aviones;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                aviones.add(toAvion(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo los aviones");
        }
        return aviones;
    }

    public static List<TipoAvion> getTiposAvionAll() throws Exception {
        List<TipoAvion> tipos;
        tipos = new ArrayList();
        try {
            String sql = "select * from tiposAvion;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                tipos.add(toTipoAvion(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo los tiposAvion");
        }
        return tipos;
    }

    public static List<Vuelo> getVuelosAll() throws Exception {
        List<Vuelo> vuelos;
        vuelos = new ArrayList();
        try {
            String sql = "select * from vuelos;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                vuelos.add(toVuelo(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener vuelos");
        }
        return vuelos;
    }

    //->Crear el getViajesBusqueda all y getViaje
    public static List<Viaje> getViajesAll() throws Exception {
        List<Viaje> viajes;
        viajes = new ArrayList();
        try {
            String sql = "select * from viajes;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                viajes.add(toViaje(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener viajes");
        }
        return viajes;
    }

    /*--------------------------OBTENER SÓLO UNO------------------------------*/
    public static Ciudad getCiudad(String codigo) throws Exception { //Va a obtener sola mente una ciudad
        Ciudad ciudad = new Ciudad();
        try {
            String sql = "select * from ciudades "
                    + "where codigo = '%s';";
            sql = String.format(sql, codigo);
            ResultSet rs = aerolinea.executeQuery(sql);

            if (rs.next()) {
                ciudad = toCiudades(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo solamente una ciudad");
        }
        return ciudad;
    }

    public static TipoAvion getTipoAvion(String codigo) throws Exception { //Va a obtener sola mente un tipoAvion
        TipoAvion tipo = new TipoAvion();
        try {
            String sql = "select * from tiposAvion "
                    + "where codigo = '%s';";
            sql = String.format(sql, codigo);
            ResultSet rs = aerolinea.executeQuery(sql);
            if (rs.next()) {
                tipo = toTipoAvion(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo solamente un tipoAvion");
        }
        return tipo;
    }

    public static Avion getAvion(String codigo) throws Exception { //Va a obtener sola mente un Avion
        Avion avion = new Avion();
        try {
            String sql = "select * from aviones "
                    + "where codigo = '%s';";
            sql = String.format(sql, codigo);
            ResultSet rs = aerolinea.executeQuery(sql);
            if (rs.next()) {
                avion = toAvion(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo solamente un avion");
        }
        return avion;
    }

    public static Vuelo getVuelo(String codigo) throws Exception { //buscacara un vuelo solamente
        Vuelo vuelo = new Vuelo();
        try {
            String sql = "select * from vuelos where codigo = '%s';";
            sql = String.format(sql, codigo);
            ResultSet rs = aerolinea.executeQuery(sql);
            if (rs.next()) {
                vuelo = toVuelo(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener solamente el vuelo");
        }
        return vuelo;
    }

    /*------------------------------ BÚSQUEDAS -------------------------------*/
    public static Ciudad getCiudadPorNombre(String nombre) throws Exception { //Va a obtener sola mente una ciudad
        Ciudad ciudad = new Ciudad();
        try {
            String sql = "select * from ciudades "
                    + "where nombre = '%s';";
            sql = String.format(sql, nombre);
            ResultSet rs = aerolinea.executeQuery(sql);

            if (rs.next()) {
                ciudad = toCiudades(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo solamente una ciudad por nombre");
        }
        return ciudad;
    }

    public static Vuelo getVueloBusqueda(String nomOrig, String nomDest) throws Exception {
        Vuelo vuelo = new Vuelo();
        Ciudad origen = getCiudadPorNombre(nomOrig);
        Ciudad destino = getCiudadPorNombre(nomDest);
        try {
            String sql = "select * from vuelos where origen = '%s' and destino = '%s';";
            sql = String.format(sql, origen.getCodigo(), destino.getCodigo());
            ResultSet rs = aerolinea.executeQuery(sql);
            if (rs.next()) {
                vuelo = toVuelo(rs);
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener el vuelo buscado");
        }
        return vuelo;
    }

    public static List<Vuelo> getPromos() throws Exception {
        List<Vuelo> promo;
        promo = new ArrayList();
        try {
            String sql = "select * from vuelos "
                    + "where descuento > 0;";
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                promo.add(toVuelo(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener vuelos con descuento");
        }
        return promo;
    }

    public static List<Viaje> getViajesBusqueda(String origen, String destino, String fecha, String cantAsientOcup) throws ParseException, Exception {
        List<Viaje> result;
        result = new ArrayList();
        int cantAsientos = Integer.parseInt(cantAsientOcup);
        SimpleDateFormat delUsuario = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat miFormato = new SimpleDateFormat("yyyy-MM-dd");
        String formatoFecha = miFormato.format(delUsuario.parse(fecha));
        Vuelo vueloBuscado = getVueloBusqueda(origen, destino);

        try {
            String sql = "select * from viajes where vuelo = '%s' and fecha = '%s'\n"
                    + "and cantAsientOcup >= '%s';";
            sql = String.format(sql, vueloBuscado.getCodigo(), formatoFecha, cantAsientos);
            ResultSet rs = aerolinea.executeQuery(sql);
            while (rs.next()) {
                result.add(toViaje(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error en obtener viajes");
        }
        return result;
    }
    
    public static List<Ciudad> getCiudadLike(String nombre) throws Exception { //Va a obtener sola mente una ciudad
        List<Ciudad> ciudades = new ArrayList();
        
        try {
            String sql = "select * from ciudades "
                    + "where nombre like '%%%s%%';";
            sql = String.format(sql, nombre);
            ResultSet rs = aerolinea.executeQuery(sql);

            while (rs.next()) {
                ciudades.add(toCiudades(rs));
            }
        } catch (SQLException ex) {
            System.out.println("Error obteniendo solamente una ciudad like");
        }
        return ciudades;
    }

    public static List<Vuelo> getVuelosBusquedaLike(String nomLike) throws Exception {
        List<Vuelo> vuelos = new ArrayList();
        List<Ciudad> ciudades = getCiudadLike(nomLike);
        for(Ciudad c :ciudades){
            try {
                String sql = "select * from vuelos where origen = '%s' or destino = '%s';";
                sql = String.format(sql, c.getCodigo(), c.getCodigo());
                ResultSet rs = aerolinea.executeQuery(sql);
                while (rs.next()) {
                    vuelos.add(toVuelo(rs));
                }
            } catch (SQLException ex) {
                System.out.println("Error en obtener vuelos like");
            }
        }
        return vuelos;
    }

    /*---------------------    AGREGAR         ----------------------------*/
    public static int ciudadAdd(Ciudad ciudad) throws Exception {
        String sql = "insert into ciudades "
                + "(codigo, nombre, pais, zonaHoraria) "
                + "values ('%s','%s','%s','%s')";
        sql = String.format(sql, ciudad.getCodigo(), ciudad.getNombre(), ciudad.getPais(), ciudad.getZonaHoraria());
        return aerolinea.executeUpdate(sql);
    }

    public static int tipoAvionAdd(TipoAvion tipo) throws Exception {
        String sql = "insert into TiposAvion "
                + "(codigo, annio, marca, modelo, cantidadPasajeros, cantidadFilas, cantidadAsientosFila) "
                + "values ('%s','%s','%s','%s',%d,%d,%d)";
        sql = String.format(sql, tipo.getCodigo(), tipo.getAnnio(), tipo.getMarca(), tipo.getModelo(),
                tipo.getCantidadPasajeros(), tipo.getCantidadFilas(), tipo.getCantidadAsientosFila());
        return aerolinea.executeUpdate(sql);
    }

    //Agregar metodos del usuario all, getUsuario, toUsuario
    public static int usuarioAdd(Usuario user) throws Exception {
        //Validar el formato de la fecha

        String sql = "insert into usuarios "
                + "(username, password, nombre, apellidos, email, fechaNacimiento, direccion, telefono, celular) "
                + "values ('%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')";
        sql = String.format(sql, user.getUsername(), user.getPassword(), user.getNombre(), user.getApellidos(), user.getEmail(),
                user.getFechaNacimiento(), user.getDireccion(), user.getTelefono(), user.getCelular());
        return aerolinea.executeUpdate(sql);
    }

    public static int addVuelo(Vuelo vuelo) throws Exception {
        String sql = "insert into Vuelos "
                + "(codigo, distancia, duracion, descuento, origen, destino, avion) "
                + "values ('%s',%.2f,%d,%.2f,'%s','%s','%s') ";
        sql = String.format(sql, vuelo.getCodigo(), vuelo.getDistancia(), vuelo.getDuracion(),
                vuelo.getDescuento(), vuelo.getOrigen().getCodigo(),
                vuelo.getDestino().getCodigo(), vuelo.getAvion().getCodigo());
        return aerolinea.executeUpdate(sql);
    }

    
    
    /*---------------------    MODIFICAR         ----------------------------*/
    public static int modifyVuelo(Vuelo vuelo) throws Exception {
        String sql = "update Vuelos set distancia=%.2f, duracion=%d, descuento=%.2f, "
                + "origen='%s', destino='%s', avion='%s' " + "where codigo='%s'";
        sql = String.format(sql, vuelo.getDistancia(), vuelo.getDuracion(), vuelo.getDescuento(), vuelo.getOrigen().getCodigo(),
                vuelo.getDestino().getCodigo(), vuelo.getAvion().getCodigo(), vuelo.getCodigo());
        return aerolinea.executeUpdate(sql);
    }

    
    
    /*---------------------  TO SOMETHING  ----------------------------*/
    // Inicio de métodos toSomething
    private static Ciudad toCiudades(ResultSet rs) throws Exception {
        Ciudad obj = new Ciudad();
        obj.setCodigo(rs.getString("codigo"));
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
        obj.setTipoAvion(getTipoAvion(rs.getString("tipoAvion")));
        return obj;
    }

    private static Vuelo toVuelo(ResultSet rs) throws Exception {
        Vuelo obj = new Vuelo();
        obj.setCodigo(rs.getString("codigo"));
        obj.setDistancia(rs.getFloat("distancia"));
        obj.setDuracion(rs.getInt("duracion"));
        obj.setDescuento(rs.getFloat("descuento"));
        obj.setOrigen(getCiudad(rs.getString("origen")));
        obj.setDestino(getCiudad(rs.getString("destino")));
        obj.setAvion(getAvion(rs.getString("avion")));
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
        obj.setAvion(getAvion(rs.getString("avion")));
        obj.setVuelo(getVuelo(rs.getString("vuelo")));
        return obj;
    }

    //-Modificar los gets
    private static Usuario toUsuario(ResultSet rs) throws Exception {
        Usuario obj = new Usuario();
        obj.setUsername(rs.getString("username"));
        obj.setContraseña(rs.getString("password"));
        obj.setNombre(rs.getString("nombre"));
        obj.setApellidos(rs.getString("apellidos"));
        obj.setEmail(rs.getString("email"));
        obj.setFechaNacimiento(rs.getString("fechaNacimiento"));
        obj.setDireccion(rs.getString("direccion"));
        obj.setTelefono(rs.getString("telefono"));
        obj.setCelular(rs.getString("celular"));
        return obj;
    }

    //Cambiar para que funcione toViaje con get
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
