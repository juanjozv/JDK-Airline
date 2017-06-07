///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package aerolinea.modelo;
//
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//import com.itextpdf.text.Document;
//import com.itextpdf.text.DocumentException;
//import com.itextpdf.text.Element;
//import com.itextpdf.text.Font;
//import com.itextpdf.text.FontFactory;
//import com.itextpdf.text.Paragraph;
//import com.itextpdf.text.Phrase;
//import com.itextpdf.text.pdf.PdfPCell;
//import com.itextpdf.text.pdf.PdfPTable;
//import com.itextpdf.text.pdf.PdfWriter;
//import java.io.FileNotFoundException;
//import java.io.FileOutputStream;
//
//public class PDFTiquete {
//
//    public static void crearTiquetePDF(Tiquete tiquete) throws DocumentException {
//        Font fnormal = FontFactory.getFont(FontFactory.COURIER, 16);
//        Font fbold = FontFactory.getFont(FontFactory.COURIER_BOLD, 16);
//        Font ftitle = FontFactory.getFont(FontFactory.COURIER_BOLD, 18);
//        // We create the document and set the file name.        
//        // Creamos el documento e indicamos el nombre del fichero.
//        Document document = new Document();
//        FileOutputStream ficheropdf;
//        try {            
//            String userhome = System.getProperty("user.home");
//            ficheropdf = new FileOutputStream(userhome + "/Desktop/FacturaFerreteria.pdf");
//            PdfWriter.getInstance(document, ficheropdf);
//        }
//        catch (FileNotFoundException fileNotFoundException) {
//                System.out.println("(No se encontró el fichero para generar el pdf)" + fileNotFoundException);
//        }
//        
//        try{
//            document.open();   
//            
//            //Encabezado de la factura (Título, Fecha, Número, Nombres)
//            Paragraph titulo = new Paragraph("FERRETERÍA XYZ \n", ftitle);
//            titulo.setAlignment(Element.ALIGN_CENTER);
//            document.add(titulo);
//            Paragraph lugar = new Paragraph("HEREDIA, COSTA RICA", fnormal);
//            lugar.setAlignment(Element.ALIGN_CENTER);
//            document.add(lugar);
//            Paragraph fecha = new Paragraph(factura.imprimeFecha(), fnormal);
//            document.add(fecha);
//            Paragraph numFact = new Paragraph("NÚMERO DE FACTURA: " + factura.getNumero(), fnormal);
//            document.add(numFact);
//            Cliente cliente = Modelo.getInstancia().buscarClienteId(factura.getCliente());
//            Empleado empleado = Modelo.getInstancia().buscarEmpleadoId(factura.getVendedor());
//            Paragraph info = new Paragraph("CLIENTE: " + cliente.getNombre().toUpperCase() 
//                    + "\nCAJERO: " + empleado.getNombre().toUpperCase()
//                    + "\n------------------------------------------------------\n\n", fnormal);
//            document.add(info);
//         
//            //Tabla de productos
//            Integer columnas = 6;
//            Integer filas = factura.getProductos().size();
//            PdfPTable tabla = new PdfPTable(columnas);
//            tabla.setTotalWidth(document.getPageSize().getWidth()-90);
//            tabla.setLockedWidth(true);
//
//                    //Editar nombre de cada columna de la tabla
//            PdfPCell nombreColumna;
//            nombreColumna = new PdfPCell(new Phrase("CANTIDAD", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            nombreColumna = new PdfPCell(new Phrase("PRODUCTO", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            nombreColumna = new PdfPCell(new Phrase("CÓDIGO", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            nombreColumna = new PdfPCell(new Phrase("PRECIO", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            nombreColumna = new PdfPCell(new Phrase("DESC(%)", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            nombreColumna = new PdfPCell(new Phrase("TOTAL", fnormal));
//            nombreColumna.setHorizontalAlignment(Element.ALIGN_CENTER);
//            tabla.addCell(nombreColumna);
//            
//                   //INSERTAR LÍNEAS
//            tabla.setHeaderRows(1);
//            Paragraph txt;
//            PdfPCell celda;
//            for (LineaDetalle linea : factura.getProductos()) {
//                Producto producto = Modelo.getInstancia().buscarProductoCodigo(linea.getProducto());
//                txt = new Paragraph(Integer.toString(linea.getCantidad()), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//                txt = new Paragraph(producto.getDescripcion(), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//                txt = new Paragraph(producto.getCodigo(), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//                txt = new Paragraph(Double.toString(producto.getPrecioUnitario()), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//                txt = new Paragraph(Double.toString(linea.getDescuento()), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//                txt = new Paragraph(Double.toString(linea.getSubtotal()), fnormal);
//                celda = new PdfPCell(txt);
//                tabla.addCell(celda);
//
//            }
//            document.add(tabla);
//             
//            //Pie de la factura (Total, Tipo de pago, Despedida)
//            Paragraph total = new Paragraph("TOTAL: " + factura.getTotal() + " \t \n\n", fbold);
//            total.setAlignment(Element.ALIGN_RIGHT);
//            document.add(total);
//            
//            /////////Tipo de pago
//            String tPago = factura.getPago().getTipoPago();
//            Paragraph pago;
//            switch(tPago){
//                case "Efectivo": { 
//                    pago = new Paragraph("Tipo de pago: Efectivo"  
//                            + "\n  Monto: " + factura.getPago().getMonto() 
//                            + "\n  Cambio: " + factura.getPago().getVuelto(),
//                        FontFactory.getFont(FontFactory.TIMES, 16));
//                    break;
//                }
//                case "Tarjeta": {
//                    pago = new Paragraph("Tipo de pago: Tarjeta"  
//                            + "\n  Número de voucher: " + factura.getPago().getNumVoucher(),
//                        FontFactory.getFont(FontFactory.TIMES, 16));
//                    break;
//                }
//                case "Cheque": {
//                    pago = new Paragraph("Tipo de pago: Cheque"  
//                            + "\n  Número de cheque: " + factura.getPago().getNumCheque(),
//                        FontFactory.getFont(FontFactory.TIMES, 16));
//                    break;
//                }
//                default:{
//                    break;
//                }
//            }
//            Paragraph despedida = new Paragraph("¡GRACIAS POR SU COMPRA!", fbold);
//            despedida.setAlignment(Element.ALIGN_CENTER);
//            document.add(despedida);
//
//            document.close();
//
//            System.out.println("PDF generado correctamente");
//        } catch (DocumentException documentException) {
//            System.out.println("Error generando el PDF: " + documentException);
//        }
//    }
//}
