package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ofertasALPRouting
 */
@WebServlet("/ListaEstimacionDeCompraReport")
public class ListaEstimacionDeCompraReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ListaEstimacionDeCompraReport() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String token = (String)request.getParameter("token");
		if (token != null && token.equals("fd966d32e0c5822a1fb7eecb00449db544754c3ab19a61d1fa8144c423a2a20c")) {
			String codSD = (String)request.getParameter("codSD");
			if (codSD != null)
			{
				solicitudDisponibilidadALP SDData = solicitudDisponibilidadALPDao.getOneBySDCod(codSD);
				solicitudCompraALP SCData = solicitudCompraALPDao.getOneByID(SDData.getIdSolicitudCompra());
				procesoCompraALP PCData = procesoCompraALPDao.getByCod(SCData.getNoProcesoCompra());
				ArrayList<listaRequerimientoSolicitudDisponibilidadALP> listaRequerimientosSDList = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDID(SDData.getId());
				ArrayList<Long> itemsBPM = new ArrayList<>();
				ArrayList<Long> itemsRegSan = new ArrayList<>();
				
				for (listaRequerimientoSolicitudDisponibilidadALP requerimiento : listaRequerimientosSDList)
				{
					System.out.println("Solicitud 123");
					if(requerimiento.getNumCertBPM() != null && !requerimiento.getNumCertBPM().equalsIgnoreCase("NINGUNO"))
					{
						itemsBPM.add(requerimiento.getNoItem());
					}
					
					if(requerimiento.getNumCertRegSan() != null && !requerimiento.getNumCertRegSan().equalsIgnoreCase("NO AGREGADO"))
					{
						itemsRegSan.add(requerimiento.getNoItem());
					}
				}
				
				String fechaAperturaProcesoCompra = "XX de XXXXXX del 20XX";
				String fechaSolicitudCompra = "XX de XXXXXX del 20XX";
				String fechaEmision = "XX de XXXXXX del 20XX";
				String fechaMaxima = "XX de XXXXXX del 20XX";
				
				SimpleDateFormat originalFormat = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat targetFormat = new SimpleDateFormat("dd 'de' MMMMM 'del' yyyy");
				try
				{
					//fechaAperturaProcesoCompra = targetFormat.format(originalFormat.parse(PCData.getFechaApertura()));
					fechaSolicitudCompra = targetFormat.format(originalFormat.parse(SCData.getFecha()));
					fechaEmision = targetFormat.format(originalFormat.parse(SDData.getFechaEmision()));
					fechaMaxima = targetFormat.format(originalFormat.parse(SDData.getFechaMaximaRespuesta()));
				}
				catch (ParseException e)
				{
				   System.out.println(e);
				}
				
				request.setAttribute("codPC", SCData.getNoProcesoCompra());
				request.setAttribute("codSD", codSD);
				request.setAttribute("codSC", SCData.getCodSolicitudCompra());
				request.setAttribute("itemsBPM", itemsBPM);
				request.setAttribute("itemsRegSan", itemsRegSan);
				request.setAttribute("fechaAperturaProcesoCompra", fechaAperturaProcesoCompra);
				request.setAttribute("fechaAperturaProcesoCompra", fechaAperturaProcesoCompra);
				request.setAttribute("fechaSolicitudCompra", fechaSolicitudCompra);
				request.setAttribute("fechaEmision", fechaEmision);
				request.setAttribute("fechaMaxima", fechaMaxima);
				request.setAttribute("proveedor", SDData.getProveedor());
				request.setAttribute("listaRequerimientosSDList", listaRequerimientosSDList);
				
				request.getRequestDispatcher("reporteListaEstimacionDeCompra.jsp").forward(request, response);
			}
			else {
				response.sendRedirect("/");
			}
		}
		else {
			response.sendRedirect("/");
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
