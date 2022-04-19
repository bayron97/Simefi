package api;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

/**
 * Servlet implementation class reportStep4Creator
 */
@WebServlet("/reportStep4Creator")
public class reportStep4Creator extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reportStep4Creator() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final ServletContext servletContext = request.getSession().getServletContext();
		final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		final String temperotyFilePath = tempDirectory.getAbsolutePath();

		String fileName = "";
		response.setContentType("application/pdf");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "max-age=0");

		String[] no = request.getParameterValues("no");
		String[] distribuidor = request.getParameterValues("distribuidor");
		String[] atc = request.getParameterValues("atc");
		String[] medicamentoReg = request.getParameterValues("medicamentoReg");
		String[] medicamentoOFF = request.getParameterValues("medicamentoOFF");
		String[] descripcion = request.getParameterValues("descripcion");
		String[] up = request.getParameterValues("up");
		String[] precio = request.getParameterValues("precio");

		try {
			String origin = request.getParameter("origin");
			if (origin == null) {
				origin = "default";
			}
			if (origin != null && !origin.isEmpty()) {
				switch (origin) {
					case "ordenCompra":
						fileName = "OrdenCompra_" + System.currentTimeMillis() + ".pdf";
						CreatePDF.orden_compraPDF(temperotyFilePath + "\\" + fileName, temperotyFilePath);
						break;
					case "oferta":
						fileName = "Reporte Oferta_" + System.currentTimeMillis() + ".pdf";
						CreatePDF.oferta_createPDF(temperotyFilePath + "\\" + fileName, no, distribuidor, atc,
								medicamentoReg, medicamentoOFF, descripcion, up, precio);
						break;
					case "recomendacion":
						fileName = "Reporte Recomendacion_" + System.currentTimeMillis() + ".pdf";
						String[] rec = request.getParameterValues("reC");
						String[] crit = request.getParameterValues("crit");
						String[] obs = request.getParameterValues("obs");
						String[] reB = request.getParameterValues("reB");
						String[] prelacion = request.getParameterValues("prelacion");
						CreatePDF.recomendacion_createPDF(temperotyFilePath + "\\" + fileName, no, distribuidor, atc,
								medicamentoReg, medicamentoOFF, descripcion, up, precio, rec, crit, obs, reB,
								prelacion);
						break;
					case "ratificacion":
						fileName = "Reporte Ratificacion_" + System.currentTimeMillis() + ".pdf";
						String[] reC = request.getParameterValues("reC");
						String[] criterio = request.getParameterValues("crit");
						String[] obser = request.getParameterValues("obs");
						String[] rev = request.getParameterValues("reB");
						String[] ratificacion = request.getParameterValues("ratificacion");
						String[] comentarios = request.getParameterValues("comentarios");
						CreatePDF.ratificacion_createPDF(temperotyFilePath + "\\" + fileName, no, distribuidor, atc,
								medicamentoReg, medicamentoOFF, descripcion, up, precio, reC, criterio, obser, rev,
								ratificacion, comentarios);
						break;
					case "consolidado":
						fileName = "Reporte Consolidado_" + System.currentTimeMillis() + ".pdf";
						String[] numero = request.getParameterValues("numero");
						String[] codigoatc = request.getParameterValues("codigoatc");
						String[] nombre = request.getParameterValues("nombre");
						String[] descripciones = request.getParameterValues("descripciones");
						String[] unidad = request.getParameterValues("unidad");
						String[] cantidad = request.getParameterValues("cantidad");
						CreatePDF.consolidado_createPDF(temperotyFilePath + "\\" + fileName, numero, codigoatc, nombre,
								descripciones, unidad, cantidad);
						break;
						
					case "ordenpago":
						fileName = "Reporte Orden de Pago_" + System.currentTimeMillis() + ".pdf";
						String[] noItem = request.getParameterValues("noItem");
						String[] noFactura = request.getParameterValues("noFactura");
						String[] fechaLimiteEntrega = request.getParameterValues("fechaLimiteEntrega");
						String[] fechaSolicitudCita = request.getParameterValues("fechaSolicitudCita");
						String[] diasAtraso = request.getParameterValues("diasAtraso");
						String[] totalPagado = request.getParameterValues("totalPagado");
						String[] totalMulta = request.getParameterValues("totalMulta");
						String[] pagoTotal = request.getParameterValues("pagoTotal");
						CreatePDF.ordenPago_createPDF(temperotyFilePath + "\\" + fileName, noItem, noFactura, fechaLimiteEntrega,
								fechaSolicitudCita, diasAtraso, totalPagado,totalMulta,pagoTotal);
						break;
					default:
						fileName = "Reporte Estimaciones de Compra_" + System.currentTimeMillis() + ".pdf";
						String[] tipoCompra = request.getParameterValues("inputPT");
						String[] nombreProducto = request.getParameterValues("inputNM");
						String[] unidadPresentacion = request.getParameterValues("inputPU");
						String[] cantidadRequerida = request.getParameterValues("inputRC");
						String[] tiempoEntrega = request.getParameterValues("inputDT");
						String[] codigo = request.getParameterValues("inputMIC");
						String[] descripcionTecnica = request.getParameterValues("inputTD");
						CreatePDF.createPDF(temperotyFilePath + "\\" + fileName, tipoCompra, codigo, nombreProducto,
								descripcionTecnica, unidadPresentacion, cantidadRequerida, tiempoEntrega);
						break;
				}

				response.setHeader("Content-disposition", "attachment; " + "filename=" + fileName);

				ByteArrayOutputStream baos = new ByteArrayOutputStream();
				baos = convertPDFToByteArrayOutputStream(temperotyFilePath + "\\" + fileName);
				OutputStream os = response.getOutputStream();
				baos.writeTo(os);
				os.flush();
			}

		} catch (Exception e1) {
			System.out.println(e1);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private static ByteArrayOutputStream convertPDFToByteArrayOutputStream(String fileName) {

		InputStream inputStream = null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {

			inputStream = new FileInputStream(fileName);

			byte[] buffer = new byte[1024];
			baos = new ByteArrayOutputStream();

			int bytesRead;
			while ((bytesRead = inputStream.read(buffer)) != -1) {
				baos.write(buffer, 0, bytesRead);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return baos;
	}

}
