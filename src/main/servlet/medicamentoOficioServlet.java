package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class solicitudCompraALPServlet
 */
@WebServlet("/medicamentoOficioServlet")
@MultipartConfig
public class medicamentoOficioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public medicamentoOficioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet de Guardado, Edicion y Consulta: Datos Generales

		HttpSession session = request.getSession(true);
		//String func = (String) session.getAttribute("funcion");
		
		String Id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		
		

		if (Id!=null) {
			//Oficios
			String[] idArchivo = request.getParameterValues("idArchivo");
			String[] oficioNombre = request.getParameterValues("oficioNombre");
			String[] noOficio = request.getParameterValues("noOficio");
			
			if (noOficio != null) {            
                for (int i = 0; i < noOficio.length; i++) {	
                	for(int j=0; j<idArchivo.length; j++) {
                		if(idArchivo[j].contentEquals(String.valueOf(i))){
                			String inputName = "oficioFiles_" + i;
							Part filePart = request.getPart(inputName);

							if (filePart != null && filePart.getSize() > 0) {
								InputStream fileContent = filePart.getInputStream();
								byte[] buffer = new byte[fileContent.available()];
								fileContent.read(buffer);
								String fileName = Id+"_" + noOficio[j] + ".pdf";

								String contextPath = getServletContext().getRealPath("/assets/files/medicineFiles/"+ fileName);
								System.out.print(contextPath);
								File dest = new File(contextPath);
								if (!dest.exists()) {
									dest.createNewFile();
									OutputStream outStream = new FileOutputStream(dest);
									outStream.write(buffer);
									outStream.close();
								}
								medicamentoOficio o = new medicamentoOficio();
								o.setIdmedicamento(Integer.parseInt(Id));
								o.setOficio(noOficio[j]);
								o.setNombreDocumento(fileName);
								medicamentoOficioDao.save(o);
							}
                		}
						
                	}
                }
		        
			}
			
			//Oficios
		} 

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
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
