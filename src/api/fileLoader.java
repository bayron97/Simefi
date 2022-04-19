package api;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class fileLoader
 */
@WebServlet("/fileLoader")
@MultipartConfig
public class fileLoader extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fileLoader() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
			String proc = request.getParameter("noProcesoCompra");
			String oficio = request.getParameter("oficioCOD");
			String submit = request.getParameter("submit");
			String contextPath = getServletContext().getRealPath("/assets/files/oficio" + proc + "_" + oficio + ".pdf");
			File pdfFile = new File(contextPath);

			Part filePart = request.getPart("oficio");

			if (submit.contentEquals("insert")) {
				if (filePart != null && filePart.getSize() > 0) {

					InputStream fileContent = filePart.getInputStream();
					byte[] buffer = new byte[fileContent.available()];
					fileContent.read(buffer);

					File dest = new File(contextPath);
					if (!dest.exists())
						dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
				}
			} else {
				response.setContentType("application/pdf");
				response.addHeader("Content-Disposition", "attachment; filename=" + oficio);
				response.setContentLength((int) pdfFile.length());

				FileInputStream fileInputStream = new FileInputStream(pdfFile);
				OutputStream responseOutputStream = response.getOutputStream();
				int bytes;
				while ((bytes = fileInputStream.read()) != -1) {
					responseOutputStream.write(bytes);
				}
				fileInputStream.close();
				responseOutputStream.close();
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

}
