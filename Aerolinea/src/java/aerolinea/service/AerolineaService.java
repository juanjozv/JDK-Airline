package aerolinea.service;

import aerolinea.modelo.*;
import com.google.gson.*;
import com.google.gson.typeadapters.RuntimeTypeAdapterFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*import aerolinea.modelo.Ciudad;
import aerolinea.modelo.Avion;
import aerolinea.modelo.Viaje;
import aerolinea.modelo.Vuelo;
import aerolinea.modelo.TipoAvion;*/

@WebServlet(name = "AerolineaService", urlPatterns = {"/AerolineaService"})
public class AerolineaService extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            response.setContentType("text/xml");
            RuntimeTypeAdapterFactory<Jsonable> rta = RuntimeTypeAdapterFactory.of(Jsonable.class, "_class")
                    .registerSubtype(Ciudad.class, "Ciudad")
                    .registerSubtype(TipoAvion.class, "TipoAvion")
                    .registerSubtype(Avion.class, "Avion")
                    .registerSubtype(Vuelo.class, "Vuelo")
                    .registerSubtype(Viaje.class, "Viaje")
                    .registerSubtype(Usuario.class, "Usuario")
                    .registerSubtype(Compra.class, "Compra")
                    .registerSubtype(Tiquete.class, "Tiquete");
            Gson gson = new GsonBuilder().registerTypeAdapterFactory(rta).setDateFormat("dd/MM/yyyy").create();
            String json;
            String accion = request.getParameter("action");
            List<Ciudad> ciudades;
            List<Avion> aviones;
            List<Viaje> viajes;
            List<Vuelo> promos;
            List<Vuelo> vuelos;
            List<TipoAvion> tipos;
            Vuelo vuelo;
            Viaje viaje;
            switch (accion) {
                case "ciudadListAll":
                    ciudades = AerolineaModelo.getCiudadesAll();
                    json = gson.toJson(ciudades);
                    out.write(json);
                    System.out.print(json);
                    break;
                case "vueloListPromo":
                    promos = AerolineaModelo.getPromos();
                    json = gson.toJson(promos);
                    out.write(json);
                    break;
                case "vueloListSearch":
                    String origen = request.getParameter("origen");
                    String destino = request.getParameter("destino");
                    vuelo = AerolineaModelo.getVueloBusqueda(origen, destino);
                    json = gson.toJson(vuelo);
                    out.write(json);
                    break;
                case "viajeListSearch":
                    String origen2 = request.getParameter("origen");
                    String destino2 = request.getParameter("destino");
                    String fecha = request.getParameter("fecha");
                    String cantAsientOcup = request.getParameter("cantAsientOcup");
                    viajes = AerolineaModelo.getViajesBusqueda(origen2, destino2, fecha, cantAsientOcup);
                    json = gson.toJson(viajes);
                    out.write(json);
                    break;
                case "viajeListAll":
                    viajes = AerolineaModelo.getViajesAll();
                    json = gson.toJson(viajes);
                    out.write(json);
                    System.out.print(json);
                    break;
                case "vueloListAll":
                    vuelos = AerolineaModelo.getVuelosAll();
                    json = gson.toJson(vuelos);
                    out.write(json);
                    System.out.print(json);
                    break;
                case "avionesListAll":
                    aviones = AerolineaModelo.getAvionesAll();
                    json = gson.toJson(aviones);
                    out.write(json);
                    System.out.print(json);
                    break;
                case "tiposAvionListAll":
                    tipos = AerolineaModelo.getTiposAvionAll();
                    json = gson.toJson(tipos);
                    out.write(json);
                    System.out.print(json);
                    break;
                case "tiposAvionSearch":
                    break;
                case "tipoAvionAdd":
                    json = request.getParameter("tipoAvion");
                    TipoAvion tipoAdd = gson.fromJson(json, TipoAvion.class);
                    int inserted = AerolineaModelo.tipoAvionAdd(tipoAdd);
                    out.write((inserted == 1) ? "0" : "1");
                    break;
                case "agregarUsuario":
                    json = request.getParameter("usuario");
                    Usuario usuarioAdd = gson.fromJson(json, Usuario.class);
                    int miInsertado = AerolineaModelo.usuarioAdd(usuarioAdd);
                    out.write((miInsertado == 1) ? "0" : "1");
                    break;
                case "vueloAdd":
                    json = request.getParameter("vuelo");
                    Vuelo vueloAdd = gson.fromJson(json, Vuelo.class);
                    int insertedV = AerolineaModelo.addVuelo(vueloAdd);
                    out.write((insertedV == 1) ? "0" : "1");
                    break;
                case "vueloModify":
                    json = request.getParameter("vuelo");
                    Vuelo vueloMod = gson.fromJson(json, Vuelo.class);
                    int modified = AerolineaModelo.modifyVuelo(vueloMod);
                    out.write((modified == 1) ? "0" : "1");
                    break;
                case "ciudadAdd":
                    json = request.getParameter("ciudad");
                    Ciudad ciudadAdd = gson.fromJson(json, Ciudad.class);
                    int ok = AerolineaModelo.ciudadAdd(ciudadAdd);
                    out.write((ok == 1) ? "0" : "1");
                    break;
                case "avionSearch":
                    break;
                case "vueloCiudadSearch":
                    String ciudadB = request.getParameter("ciudad");
                    vuelos = AerolineaModelo.getVuelosBusquedaLike(ciudadB);
                    json = gson.toJson(vuelos);
                    out.write(json);
                    break;
                case "loginUsuarios":
                    json = request.getParameter("user");
                    Usuario nuevoUsuario = gson.fromJson(json, Usuario.class);
                    nuevoUsuario = AerolineaModelo.loginUsuario(nuevoUsuario);
                    if (nuevoUsuario.getTipo()!=0){
                        request.getSession().setAttribute("user", nuevoUsuario);
                        switch(nuevoUsuario.getTipo()){
                            case 1: // client
                                //client = Model.clientGet(user.getId());
                                //request.getSession().setAttribute("user", nuevoUsuario);
                                //request.getRequestDispatcher("/index.jsp").forward(request, response);
                                break;
                            case 2: // manager
                                break;
                        }
                    }
                    json = gson.toJson(nuevoUsuario); 
                    out.write(json);
                    break;
                case "logoutUsuarios":
                    request.getSession().removeAttribute("user");
                    request.getSession().invalidate();
                    response.sendRedirect("http://localhost:8080/Aerolinea/index.jsp");
                    break;
                
                case "obtenerViaje":
                    String codigo = request.getParameter("codigo");
                    viaje = AerolineaModelo.getViaje(codigo);
                    json = gson.toJson(viaje);
                    out.write(json);
                    break;
                    
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
