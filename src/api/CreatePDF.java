package api;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.itextpdf.html2pdf.ConverterProperties;
import com.itextpdf.html2pdf.HtmlConverter;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import main.model.listaRequerimientoConsolidadaALP;
import main.dao.listaRequerimientoConsolidadaALPDao;
import main.dao.procesoCompraALPDao;

public class CreatePDF {
	private static Font TIME_ROMAN = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
	private static Font TIME_ROMAN_SMALL = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);

	/**
	 * @param args
	 */

	public static Document orden_compraPDF(String file, String tFile) {
		Document document = null;
		try {
			document = new Document();
			Path path = Paths.get(tFile + "/log.png");
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();
			Image img = Image.getInstance(path.toAbsolutePath().toString());
			document.add(img);
			Font font = FontFactory.getFont(FontFactory.COURIER, 16, BaseColor.BLACK);
			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("ORDEN DE COMPRA", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			creteEmptyLine(preface, 1);
			String procCompra = procesoCompraALPDao.getProcesoCompra(111);
			List<listaRequerimientoConsolidadaALP> prod = listaRequerimientoConsolidadaALPDao
					.getConsolidatedListByBuyProcessNumber(procCompra);
			preface.add(new Paragraph("Proceso de Compra: " + procCompra + "\nBeneficiario: BENEFACTIVO"
					+ "\nSolicitud de Compra: -" + "\nProveedor: -" + "\nProducto: " + prod.get(0).getNombreProducto(),
					TIME_ROMAN));
			document.add(preface);
			document.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return document;
	}

	public static Document oferta_createPDF(String file, String[] no, String[] dist, String[] atc, String[] medReq,
			String[] medOff, String[] desc, String[] up, String[] precio) {

		Document document = null;

		try {
			document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();

			document.addTitle("Reporte de Oferta");
			document.addSubject("Reporte de Oferta");
			document.addAuthor("Banco de Occidente");
			document.addCreator("Banco de Occidente");

			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("Reporte de Oferta", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			document.add(preface);

			createTableOferta(document, no, dist, atc, medReq, medOff, desc, up, precio);

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;

	}

	public static Document recomendacion_createPDF(String file, String[] no, String[] dist, String[] atc,
			String[] medReq, String[] medOff, String[] desc, String[] up, String[] precio, String[] rec, String[] crit,
			String[] obs, String[] reB, String[] prelacion) {

		Document document = null;

		try {
			document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();

			document.addTitle("Reporte de Recomendacion");
			document.addSubject("Reporte de Recomendacion");
			document.addAuthor("Banco de Occidente");
			document.addCreator("Banco de Occidente");

			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("Reporte de Oferta", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			document.add(preface);

			createTableRecomenacion(document, no, dist, atc, medReq, medOff, desc, up, precio, rec, crit, obs, reB,
					prelacion);

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;
	}

	public static Document consolidado_createPDF(String file, String[] numero, String[] codigoatc, String[] nombre,
			String[] descripciones, String[] unidad, String[] cantidad) {

		Document document = null;

		try {
			document = new Document(PageSize.A4.rotate(), 10f, 10f, 10f, 0f);
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();
			document.setPageSize(PageSize.A4.rotate());
			document.addTitle("Reporte Consolidado Lista de Estimaciones de Compra");
			document.addSubject("Reporte Consolidado Lista de Estimaciones de Compra");
			document.addAuthor("Banco de Occidente");
			document.addCreator("Banco de Occidente");

			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("Reporte Consolidado", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			document.add(preface);

			createTableConsolidado(document, numero, codigoatc, nombre, descripciones, unidad, cantidad);

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;
	}
	
	
	public static Document ordenPago_createPDF(String file, String[] noItem, String[] noFactura, String[] fechaLimiteEntrega,
			String[] fechaSolicitudCita, String[] diasAtraso, String[] totalPagado,String[] totalMulta,String[] pagoTotal) {

		Document document = null;

		try {
			document = new Document(PageSize.A4.rotate(), 10f, 10f, 10f, 0f);
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();
			document.setPageSize(PageSize.A4.rotate());
			document.addTitle("Reporte de Pago");
			document.addSubject("Reporte de Pago");
			document.addAuthor("Banco de Occidente");
			document.addCreator("Banco de Occidente");

			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("Reporte de Pago", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			document.add(preface);

			createTableOrdenPago(document, noItem, noFactura, fechaLimiteEntrega, fechaSolicitudCita, diasAtraso, totalPagado,totalMulta, pagoTotal);

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;
	}

	public static Document ratificacion_createPDF(String file, String[] no, String[] dist, String[] atc,
			String[] medReq, String[] medOff, String[] desc, String[] up, String[] precio, String[] rec, String[] crit,
			String[] obs, String[] reB, String[] ratificacion, String[] comentarios) {

		Document document = null;

		try {
			document = new Document();
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();

			document.addTitle("Reporte de Ratificacion");
			document.addSubject("Reporte de Ratificacion");
			document.addAuthor("Banco de Occidente");
			document.addCreator("Banco de Occidente");

			Paragraph preface = new Paragraph();
			creteEmptyLine(preface, 1);
			preface.add(new Paragraph("Reporte de Oferta", TIME_ROMAN));

			creteEmptyLine(preface, 1);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
			document.add(preface);

			createTableRatificacion(document, no, dist, atc, medReq, medOff, desc, up, precio, rec, crit, obs, reB,
					ratificacion, comentarios);

			document.close();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;
	}

	public static Document createPDF(String file, String[] noOficio, String[] codAtc, String[] medicamento,
			String[] descripcionTecnica, String[] up, String[] cantidad, String[] beneficiario) {

		Document document = null;

		try {
			document = new Document(PageSize.A4.rotate(), 10f, 10f, 10f, 0f);
			PdfWriter.getInstance(document, new FileOutputStream(file));
			document.open();

			addMetaData(document);

			addTitlePage(document);

			createTable(document, noOficio, codAtc, medicamento, descripcionTecnica, up, cantidad, beneficiario);

			document.close();

		} catch (FileNotFoundException e) {

			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
		return document;
	}

	private static void addMetaData(Document document) {
		document.addTitle("Reporte Estimaciones de Compra");
		document.addSubject("Reporte Estimaciones de Compra");
		document.addAuthor("Banco de Occidente");
		document.addCreator("Banco de Occidente");
	}

	private static void addTitlePage(Document document) throws DocumentException {

		Paragraph preface = new Paragraph();
		creteEmptyLine(preface, 1);
		preface.add(new Paragraph("Reporte Estimaciones de Compra", TIME_ROMAN));

		creteEmptyLine(preface, 1);
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
		preface.add(new Paragraph("Reporte creado el " + simpleDateFormat.format(new Date()), TIME_ROMAN_SMALL));
		document.add(preface);

	}

	private static void creteEmptyLine(Paragraph paragraph, int number) {
		for (int i = 0; i < number; i++) {
			paragraph.add(new Paragraph(" "));
		}
	}

	private static void createTableRatificacion(Document document, String[] no, String[] dist, String[] atc,
			String[] medReq, String[] medOff, String[] desc, String[] up, String[] precio, String[] rec, String[] crit,
			String[] obs, String[] reB, String[] ratificacion, String[] comentarios) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(14);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DISTRIBUIDOR/FABRICANTE"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CODIGO ATC"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO REQUERIDO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO OFERTADO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DESCRIPCION TECNICA OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("UNIDAD DE PRESENTACION OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("PRECIO UNITARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("RECOMENDACION DEL COMITE"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CRITERIO DE RECOMENDACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("OBSERVACIONES"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("RECOMENDACIONES AL BENEFICIARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("RATIFICACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("COMENTARIOS"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (no.length > 0) {
			for (int i = 0; i < no.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(no[i]);
				table.addCell(dist[i]);
				table.addCell(atc[i]);
				table.addCell(medReq[i]);
				table.addCell(medOff[i]);
				table.addCell(desc[i]);
				table.addCell(up[i]);
				table.addCell(precio[i]);
				table.addCell(rec[i]);
				table.addCell(crit[i]);
				table.addCell(obs[i]);
				table.addCell(reB[i]);
				table.addCell(ratificacion[i]);
				table.addCell(comentarios[i]);
			}
		}
		document.add(table);
	}

	private static void createTableConsolidado(Document document, String[] numero, String[] codigoatc, String[] nombre,
			String[] descripciones, String[] unidad, String[] cantidad) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(6);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CODIGO ATC"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE DEL PRODUCTO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DESCRIPCION TECNICA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("UNIDAD DE PRESENTACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CANTIDAD"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (numero.length > 0) {
			for (int i = 0; i < numero.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(numero[i]);
				table.addCell(codigoatc[i]);
				table.addCell(nombre[i]);
				table.addCell(descripciones[i]);
				table.addCell(unidad[i]);
				table.addCell(cantidad[i]);
			}
		}
		document.add(table);
	}
	
	private static void createTableOrdenPago(Document document, String[] noItem, String[] noFactura, String[] fechaLimiteEntrega,
			String[] fechaSolicitudCita, String[] diasAtraso, String[] totalPagado, String[] totalMulta, String[] pagoTotal) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(8);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NO. FACTURA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("FECHA LIMITE ENTREGA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("FECHA SOLICITUD CITA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DIAS ATRASO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("TOTAL PAGADO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("TOTAL MULTA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);
		
		c1 = new PdfPCell(new Phrase("PAGO TOTAL"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (noItem.length > 0) {
			for (int i = 0; i < noItem.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(noItem[i]);
				table.addCell(noFactura[i]);
				table.addCell(fechaLimiteEntrega[i]);
				table.addCell(fechaSolicitudCita[i]);
				table.addCell(diasAtraso[i]);
				table.addCell(totalPagado[i]);
				table.addCell(totalMulta[i]);
				table.addCell(pagoTotal[i]);
			}
		}
		document.add(table);
	}

	private static void createTableRecomenacion(Document document, String[] no, String[] dist, String[] atc,
			String[] medReq, String[] medOff, String[] desc, String[] up, String[] precio, String[] rec, String[] crit,
			String[] obs, String[] reB, String[] prelacion) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(13);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DISTRIBUIDOR/FABRICANTE"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CODIGO ATC"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO REQUERIDO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO OFERTADO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DESCRIPCION TECNICA OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("UNIDAD DE PRESENTACION OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("PRECIO UNITARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("RECOMENDACION DEL COMITE"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CRITERIO DE RECOMENDACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("OBSERVACIONES"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("RECOMENDACIONES AL BENEFICIARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("PRELACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (no.length > 0) {
			for (int i = 0; i < no.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(no[i]);
				table.addCell(dist[i]);
				table.addCell(atc[i]);
				table.addCell(medReq[i]);
				table.addCell(medOff[i]);
				table.addCell(desc[i]);
				table.addCell(up[i]);
				table.addCell(precio[i]);
				table.addCell(rec[i]);
				table.addCell(crit[i]);
				table.addCell(obs[i]);
				table.addCell(reB[i]);
				table.addCell(prelacion[i]);
			}
		}
		document.add(table);
	}

	private static void createTableOferta(Document document, String[] no, String[] dist, String[] atc, String[] medReq,
			String[] medOff, String[] desc, String[] up, String[] precio) throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(8);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DISTRIBUIDOR/FABRICANTE"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CODIGO ATC"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO REQUERIDO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO OFERTADO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DESCRIPCION TECNICA OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("UNIDAD DE PRESENTACION OFERTADA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("PRECIO UNITARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (no.length > 0) {
			for (int i = 0; i < no.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(no[i]);
				table.addCell(dist[i]);
				table.addCell(atc[i]);
				table.addCell(medReq[i]);
				table.addCell(medOff[i]);
				table.addCell(desc[i]);
				table.addCell(up[i]);
				table.addCell(precio[i]);
			}
		}
		document.add(table);
	}

	private static void createTable(Document document, String[] noOficio, String[] codAtc, String[] medicamento,
			String[] descripcionTecnica, String[] up, String[] cantidad, String[] beneficiario)
			throws DocumentException {
		Paragraph paragraph = new Paragraph();
		creteEmptyLine(paragraph, 2);
		document.add(paragraph);
		PdfPTable table = new PdfPTable(8);

		PdfPCell c1 = new PdfPCell(new Phrase("NO. ITEM"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NO. DE OFICIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CODIGO ATC"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("NOMBRE MEDICAMENTO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("DESCRIPCION TECNICA"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("UNIDAD DE PRESENTACION"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("CANTIDAD"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		c1 = new PdfPCell(new Phrase("BENEFICIARIO"));
		c1.setHorizontalAlignment(Element.ALIGN_CENTER);
		table.addCell(c1);

		table.setHeaderRows(1);

		if (noOficio.length > 0) {
			for (int i = 0; i < noOficio.length; i++) {
				table.setWidthPercentage(100);
				table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
				table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
				table.addCell(String.valueOf(i + 1));
				table.addCell(noOficio[i]);
				table.addCell(codAtc[i]);
				table.addCell(medicamento[i]);
				table.addCell(descripcionTecnica[i]);
				table.addCell(up[i]);
				table.addCell(cantidad[i]);
				table.addCell(beneficiario[i]);
			}
		}
		document.add(table);
	}
}
