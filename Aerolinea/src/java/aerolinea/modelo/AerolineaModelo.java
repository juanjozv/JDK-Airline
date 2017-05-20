package aerolinea.modelo;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class AerolineaModelo {
    List<Ciudad> ciudades = this.getCiudades();
    List<Avion> aviones = this.getAviones();
    List<Vuelo> promos = this.getPromo();
    List<Vuelo> vuelos = this.getVuelos();
    List<Viaje> viajes = this.getViajes();
    
    public List<Ciudad> getCiudades(){
        Ciudad[] ciudades2 = {
            new Ciudad("HA", "Hawai", "Estados Unidos", "UTC+6"), //0
            new Ciudad("LN", "Londres", "Inglaterra", "UTC+6"), //1
            new Ciudad("OR", "Orlando", "Estados Unidos", "UTC+6"), //2
            new Ciudad("SJ", "San Jose", "Costa Rica", "UTC+6"), //3
            new Ciudad("RI", "Rio", "Brasil", "UTC+6"), //4
            new Ciudad("MIA", "Miami", "Estados Unidos", "UTC+6"), //5
            new Ciudad("NY", "Nueva York", "Estados Unidos", "UTC+6"), //6

            //No tendran descuento como destino en los vuelos
            new Ciudad("BE", "Berlin", "Alemania", "UTC+6"), //7
            new Ciudad("AM", "Amsterdam", "Holanda", "UTC+6") //8
        };
        return new ArrayList(Arrays.asList(ciudades2));
    }

    public List<Avion> getAviones(){
        Avion[] aviones2 = {
            new Avion("1", "1", "1", "1", "70", "1", "1"),
            new Avion("2", "2", "2", "2", "65", "2", "2"),
            new Avion("3", "3", "3", "3", "60", "3", "3"),
            new Avion("4", "4", "4", "4", "55", "4", "4"),
            new Avion("5", "5", "5", "5", "50", "5", "5")  
        };
        return new ArrayList(Arrays.asList(aviones2));
    }
    
    public List<Vuelo> getPromo() {
        Vuelo[] promos2 = {
            new Vuelo("1001", ciudades.get(0), ciudades.get(1), "5780km", "3hs", "20", aviones.get(0)), //0 Hawai-Londres
            new Vuelo("2001", ciudades.get(1), ciudades.get(0), "5780km", "3hs", "20", aviones.get(0)), //1

            new Vuelo("1002", ciudades.get(4), ciudades.get(5), "1180km", "3hs", "15", aviones.get(1)), //2 Rio - Miami
            new Vuelo("2002", ciudades.get(5), ciudades.get(4), "1180km", "3hs", "15", aviones.get(1)), //3

            new Vuelo("1003", ciudades.get(5), ciudades.get(6), "1180km", "3hs", "30", aviones.get(4)), //4 Miami - Nueva York
        };
        return new ArrayList(Arrays.asList(promos2));
    }
    
    public List<Vuelo> getVuelos(){
        Vuelo[] vuelos2 =  {
            new Vuelo("1001", ciudades.get(0), ciudades.get(1), "5780km", "3hs", "20", aviones.get(0)), //0 Hawai-Londres
            new Vuelo("2001", ciudades.get(1), ciudades.get(0), "5780km", "3hs", "20", aviones.get(0)), //1

            new Vuelo("1002", ciudades.get(4), ciudades.get(5), "1180km", "3hs", "15", aviones.get(1)), //2 Rio - Miami
            new Vuelo("2002", ciudades.get(5), ciudades.get(4), "1180km", "3hs", "15", aviones.get(1)), //3

            new Vuelo("1003", ciudades.get(5), ciudades.get(6), "1180km", "3hs", "30", aviones.get(4)), //4 Miami - Nueva York
            new Vuelo("2003", ciudades.get(6), ciudades.get(5), "1180km", "3hs", "0", aviones.get(4)), //5

            new Vuelo("1005", ciudades.get(7), ciudades.get(8), "1200km", "3hs", "0", aviones.get(3)), //6 Berlin - Amsterdam
            new Vuelo("2005", ciudades.get(8), ciudades.get(7), "1200km", "3hs", "0", aviones.get(3)), //7
            
            new Vuelo("1004", ciudades.get(3), ciudades.get(2), "4000km", "3hs", "0", aviones.get(4)), //8 San Jose - Orlando
            new Vuelo("2004", ciudades.get(2), ciudades.get(3), "4000km", "3hs", "0", aviones.get(4)) //9
        };
        return new ArrayList(Arrays.asList(vuelos2));
    }
    
    public List<Viaje> getViajes() {
        Viaje[] viajes2 = {
            new Viaje("11", "05/05/2017", "V", 20, "9:00am", "12:00pm", "$150", aviones.get(0), vuelos.get(0)), //Hawai-Londres
            new Viaje("12", "05/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(0), vuelos.get(0)),
            new Viaje("13", "09/05/2017", "M", 10, "9:00am", "12:00pm", "$230", aviones.get(0), vuelos.get(1)), //Londres-Hawai
            new Viaje("14", "09/05/2017", "M", 10, "5:00pm", "8:00pm", "$230", aviones.get(0), vuelos.get(1)),
            new Viaje("15", "05/05/2017", "V", 20, "9:00am", "12:00pm", "$270", aviones.get(1), vuelos.get(2)), //Rio - Miami
            new Viaje("16", "05/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(1), vuelos.get(2)),
            new Viaje("17", "09/05/2017", "M", 10, "9:00am", "12:00pm", "$230", aviones.get(1), vuelos.get(3)), //Miami - Rio
            new Viaje("18", "09/05/2017", "M", 10, "5:00pm", "8:00pm", "$230", aviones.get(1), vuelos.get(3)),
            new Viaje("19", "05/05/2017", "V", 20, "9:00am", "12:00pm", "$270", aviones.get(4), vuelos.get(4)), //Miami - Nueva York
            new Viaje("20", "05/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(4), vuelos.get(4)),
            new Viaje("19", "09/05/2017", "V", 20, "9:00am", "12:00pm", "$270", aviones.get(4), vuelos.get(5)), //Nueva York - Miami
            new Viaje("20", "09/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(4), vuelos.get(5)),
            new Viaje("19", "05/05/2017", "V", 20, "9:00am", "12:00pm", "$270", aviones.get(3), vuelos.get(6)), //Berlin - Amsterdam
            new Viaje("20", "05/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(3), vuelos.get(6)),
            new Viaje("19", "09/05/2017", "V", 20, "9:00am", "12:00pm", "$270", aviones.get(3), vuelos.get(7)), //Amsterdam - Berlin
            new Viaje("20", "09/05/2017", "V", 20, "5:00pm", "8:00pm", "$270", aviones.get(3), vuelos.get(7)),
            /*Vuelos para demostrar la paginacion  San Jose-Orlando  Orlando-San Jose*/
            new Viaje("21", "05/05/2017", "M", 10, "09:00am", "12:00am", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("22", "05/05/2017", "M", 10, "10:00am", "01:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("23", "05/05/2017", "M", 10, "11:00am", "02:00pm", "$230", aviones.get(4), vuelos.get(8)),
            new Viaje("24", "05/05/2017", "M", 10, "12:00pm", "03:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("25", "05/05/2017", "M", 10, "01:00pm", "04:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("26", "05/05/2017", "M", 10, "02:00pm", "05:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("27", "05/05/2017", "M", 10, "03:00pm", "06:00pm", "$230", aviones.get(4), vuelos.get(8)),
            new Viaje("28", "05/05/2017", "M", 10, "04:00pm", "07:00pm", "$230", aviones.get(4), vuelos.get(8)),
            new Viaje("29", "05/05/2017", "M", 10, "05:00pm", "08:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("30", "05/05/2017", "M", 10, "06:00pm", "09:00pm", "$230", aviones.get(4), vuelos.get(8)),
            new Viaje("31", "05/05/2017", "M", 10, "07:00pm", "10:00pm", "$150", aviones.get(4), vuelos.get(8)),
            new Viaje("32", "05/05/2017", "M", 10, "08:00pm", "11:00pm", "$230", aviones.get(4), vuelos.get(8)),
            new Viaje("35", "09/05/2017", "M", 10, "09:00am", "12:00am", "$230", aviones.get(4), vuelos.get(9)),
            new Viaje("36", "09/05/2017", "M", 10, "10:00am", "01:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("37", "09/05/2017", "M", 10, "11:00am", "02:00pm", "$230", aviones.get(4), vuelos.get(9)),
            new Viaje("38", "09/05/2017", "M", 10, "12:00pm", "03:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("39", "09/05/2017", "M", 10, "01:00pm", "04:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("40", "09/05/2017", "M", 10, "02:00pm", "05:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("41", "09/05/2017", "M", 10, "03:00pm", "06:00pm", "$230", aviones.get(4), vuelos.get(9)),
            new Viaje("42", "09/05/2017", "M", 10, "04:00pm", "07:00pm", "$230", aviones.get(4), vuelos.get(9)),
            new Viaje("43", "09/05/2017", "M", 10, "05:00pm", "08:00pm", "$230", aviones.get(4), vuelos.get(9)),
            new Viaje("44", "09/05/2017", "M", 10, "06:00pm", "09:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("45", "09/05/2017", "M", 10, "07:00pm", "10:00pm", "$150", aviones.get(4), vuelos.get(9)),
            new Viaje("46", "09/05/2017", "M", 10, "08:00pm", "11:00pm", "$150", aviones.get(4), vuelos.get(9))
        };
        return new ArrayList(Arrays.asList(viajes2));
    }
    
    public Vuelo getVuelos(String origen, String destino) {
        for(Vuelo v: this.getVuelos()) {
            if(v.origen.nombre.contains(origen) && v.destino.nombre.contains(destino))
                return v;
        }
        return null;
    }
    
    public List<Viaje> getViajes(String origen, String destino, String fecha, String cantAsientOcup) {
        ArrayList<Viaje> result = new ArrayList();
        for(Viaje v: this.getViajes()) {
           int cantAsientos =  Integer.parseInt(cantAsientOcup);
            if(v.vuelo.origen.nombre.contains(origen) && v.vuelo.destino.nombre.contains(destino) && v.fecha.contains(fecha) && v.cantAsientOcup  >= cantAsientos )
                result.add(v);
        }
        return result;
    }
}
