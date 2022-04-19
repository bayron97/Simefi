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
 * Servlet implementation class aclaracionesEnmiendasServlet
 */
@WebServlet("/Gral_aclaracionEnmiendaServlet")
@MultipartConfig
public class Gral_aclaracionEnmiendaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_aclaracionEnmiendaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		
		
		try {
			//String submit = request.getParameter("submit");		
			String accion = (String) session.getAttribute("accion");
			System.out.println("La session trae "+ session);

//		String id = request.getParameter("id");

			Gral_aclaracionEnmiendaDTO aclaracionEnmienda = new Gral_aclaracionEnmiendaDTO();
		
		
		
		aclaracionEnmienda.setIdAperturaProceso(Integer.parseInt(request.getParameter("idAperturaProceso")));
		aclaracionEnmienda.setFecha(request.getParameter("fecha"));
		aclaracionEnmienda.setAclaracionEnmienda(request.getParameter("aclaracionEnmienda"));
		aclaracionEnmienda.setHoraLimite(request.getParameter("horaLimite"));
		aclaracionEnmienda.setDiaLimite(request.getParameter("diaLimite"));
		aclaracionEnmienda.setHoraApertura(request.getParameter("horaApertura"));
		aclaracionEnmienda.setDiaApertura(request.getParameter("diaApertura"));
		aclaracionEnmienda.setLugarApertura(request.getParameter("lugarApertura"));
		aclaracionEnmienda.setDocumento(request.getParameter("documento"));
		aclaracionEnmienda.setObservaciones(request.getParameter("observaciones"));
		aclaracionEnmienda.setCorrelativoEnmienda(Integer.parseInt(request.getParameter("correlativoEnmienda")));
		aclaracionEnmienda.setOficio(Integer.parseInt(request.getParameter("oficio")));
		aclaracionEnmienda.setBeneficiario(request.getParameter("beneficiario"));
		
//		int correlativo = Gral_aclaracionEnmiendaDao.getNewCorrelative(aclaracionEnmienda.getAclaracionEnmienda(), aclaracionEnmienda.getIdAperturaProceso());
		
//		String amendmentProduct = (String) request.getParameter("amendmentProductCheck");
		
		if (accion != null && !accion.contentEquals("cancelar")) {
			
			int status = 0;
			switch (accion) {
			case "nuevo":
				
				
				
				Part filePart = request.getPart("documentFile");
				
				aclaracionEnmienda.setIdAclaracionEnmienda(Gral_aclaracionEnmiendaDao.save(aclaracionEnmienda))  ;

				if (filePart != null && filePart.getSize() > 0) {
					aclaracionEnmienda.setDocumento(aclaracionEnmienda.getIdAclaracionEnmienda() + "_"+ aclaracionEnmienda.getAclaracionEnmienda()
					+ "_" + aclaracionEnmienda.getIdAperturaProceso() + "_" + aclaracionEnmienda.getFecha() + ".pdf");
					InputStream fileContent = filePart.getInputStream();
					byte[] buffer = new byte[fileContent.available()];
					fileContent.read(buffer);

					String contextPath = getServletContext().getRealPath("/assets/files/amendmentsGeneralFiles/" +aclaracionEnmienda.getIdAclaracionEnmienda() + "_"+ aclaracionEnmienda.getAclaracionEnmienda()
							+ "_" + aclaracionEnmienda.getIdAperturaProceso() + "_" + aclaracionEnmienda.getFecha() + ".pdf");

					File dest = new File(contextPath);
					if (!dest.exists()) {
						dest.createNewFile();
						OutputStream outStream = new FileOutputStream(dest);
						outStream.write(buffer);
						outStream.close();
						
						Gral_aclaracionEnmiendaDao.updateRutaArchivo(aclaracionEnmienda);
					}
				}
			
				break;
			case "modificar":
				
				aclaracionEnmienda.setIdAclaracionEnmienda(Integer.parseInt(request.getParameter("idAclaracionEnmienda")));
				 filePart = request.getPart("documentFile");

				if (filePart != null && filePart.getSize() > 0) {
					aclaracionEnmienda.setDocumento(aclaracionEnmienda.getAclaracionEnmienda() + "_" + aclaracionEnmienda.getIdAperturaProceso() + "_" + aclaracionEnmienda.getFecha() + ".pdf");
					InputStream fileContent = filePart.getInputStream();
					byte[] buffer = new byte[fileContent.available()];
					fileContent.read(buffer);

					String contextPath = getServletContext().getRealPath("/assets/files/amendmentsGeneralFiles/" + aclaracionEnmienda.getAclaracionEnmienda()
							+ "_" + aclaracionEnmienda.getIdAperturaProceso() + "_" + aclaracionEnmienda.getFecha() + ".pdf");

					File dest = new File(contextPath);
					if (!dest.exists()) {
						dest.createNewFile();
						OutputStream outStream = new FileOutputStream(dest);
						outStream.write(buffer);
						outStream.close();
						
						int idAclaracionEnmienda =  Gral_aclaracionEnmiendaDao.update(aclaracionEnmienda);
					}
					
					
				}
				
				else {
					int idAclaracionEnmienda =  Gral_aclaracionEnmiendaDao.updatewithoutdocument(aclaracionEnmienda);
				}
				
				break;	
		}	
		

			}
		request.setAttribute("throughServlet", "true");
		if(aclaracionEnmienda.getAclaracionEnmienda().contentEquals("ACLARACION"))
		{

		session.removeAttribute("idAclaracionEnmienda");
		session.removeAttribute("accion");
		request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
		} else {
			
			
			request.setAttribute("throughServlet", "true");
			
			if(request.getParameter("amendmentProductCheck") == null) {
				session.removeAttribute("idAclaracionEnmienda");
			      session.removeAttribute("idAperturaProceso");
			      session.removeAttribute("accion");
				request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
			}else {
				ArrayList<Gral_listaRequerimientoConsolidada> listaConsolidada = Gral_listaRequerimientoDao.getListConsolidadaAE(aclaracionEnmienda.getIdAperturaProceso());
				request.setAttribute("listaConsolidada", listaConsolidada);
				request.setAttribute("oficio", aclaracionEnmienda.getOficio());
				request.setAttribute("beneficiario", aclaracionEnmienda.getBeneficiario());
				session.setAttribute("idAperturaProceso", aclaracionEnmienda.getIdAperturaProceso());
				System.out.println("beneficiario s"+ aclaracionEnmienda.getBeneficiario());
				session.removeAttribute("idAclaracionEnmienda");
				session.setAttribute("idAclaracionEnmienda", aclaracionEnmienda.getIdAclaracionEnmienda());
				request.getRequestDispatcher("nAmendmentEstListForGeneral.jsp").forward(request, response);
			}
			
			
		}
		
		
		}
		
		catch (Exception e) {
			// TODO: handle exception
			System.out.println("No guardo " + e);
			request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
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
