package aerolinea.modelo;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

public class PDFCompra {

    public static void crearCompraPDF(List<Tiquete> tiquetes, Compra compra) throws DocumentException, MalformedURLException, IOException {
        Font fnormal = FontFactory.getFont(FontFactory.COURIER, 16);
        Font fbold = FontFactory.getFont(FontFactory.COURIER_BOLD, 16);
        Font ftitle = FontFactory.getFont(FontFactory.COURIER_BOLD, 18);
        // We create the document and set the file name.        
        // Creamos el documento e indicamos el nombre del fichero.
        Document document = new Document();
        FileOutputStream ficheropdf;
        try {
            String userhome = System.getProperty("user.home");
            ficheropdf = new FileOutputStream(userhome + "/Desktop/TiquetesCompra.pdf");
            PdfWriter.getInstance(document, ficheropdf);
        } catch (FileNotFoundException fileNotFoundException) {
            System.out.println("(No se encontró el fichero para generar el pdf)" + fileNotFoundException);
        }

        try {
            document.open();

            Image img = Image.getInstance("/images/JDK.png");
            document.add(img);
            
            String codCompra = compra.getCodigoCompra();
            Paragraph titulo = new Paragraph("JDK AEROLINEA\n", ftitle);
            titulo.setAlignment(Element.ALIGN_CENTER);
            document.add(titulo);
            
            String cliente = compra.getUsuario().getNombre() + " " + compra.getUsuario().getApellidos();
            String total = Float.toString(compra.getPrecioTotal());
            Paragraph encabezado = new Paragraph("COMPRA #"+ codCompra+ "\n"+
                    "CLIENTE: "+ cliente+ "\n"+
                    "TOTAL: $"+ total + "\n", fnormal);
                    
            Paragraph subtitulo = new Paragraph("\n \n TIQUETES COMPRADOS \n", ftitle);
            subtitulo.setAlignment(Element.ALIGN_CENTER);
            document.add(subtitulo);
            PdfPTable tabla = new PdfPTable(1);
            Paragraph txt, seat;
            PdfPCell celda;
            Paragraph space = new Paragraph("\n------------------------------------------------------\n");
            document.add(space);
            for (int i = 0; i < tiquetes.size(); i++) {
                tabla.setTotalWidth(document.getPageSize().getWidth() - 90);
                Tiquete tiquete = tiquetes.get(i);
                String vuelo = tiquete.getViaje().getVuelo().getCodigo();
                String fecha = tiquete.getViaje().getFecha();
                String horaSalida = tiquete.getViaje().getHoraSalida();
                String pasajero = tiquete.getPasajero();
                String asiento = tiquete.getCodigoAsiento();
                String origen = tiquete.getViaje().getVuelo().getOrigen().getNombre();
                String destino = tiquete.getViaje().getVuelo().getDestino().getNombre();
                txt = new Paragraph("NAME " + pasajero + "\n"
                        + "FLIGHT " + vuelo + "\n"
                        + "DATE " + fecha + "   " + "TIME " + horaSalida + "\n"
                        + "ORIGEN " + origen + "   " + "DESTINO " + destino + "\n"
                        + "ASIENTO" + asiento, fnormal);
                celda = new PdfPCell(txt);
                tabla.addCell(celda);
                document.add(tabla);
                document.add(space);
            }
            document.close();
            System.out.println("PDF generado correctamente");
        } catch (DocumentException documentException) {
            System.out.println("Error generando el PDF: " + documentException);
        }
    }
}
