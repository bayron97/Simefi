package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pCompraWizardRouting
 */
@WebServlet("/pControlGarantiasGeneral")
public class pControlGarantiasGeneral extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pControlGarantiasGeneral() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String openMode;
		try {
			String accion = request.getParameter("submit");
			System.out.println("garantia /"+ accion);
			HttpSession session = request.getSession(true);
			Gral_controlGarantias controlGarantias = new Gral_controlGarantias();
			ArrayList<Gral_aperturaProceso> beneficiarioAperturaList = Gral_aperturaProcesoDao.GetListBeneficiarios();
			ArrayList<Gral_controlGarantias> garantiasList =  Gral_controlGarantiasDao.GetListGarantias();
			System.out.println("array /"+ beneficiarioAperturaList);
			
			if (accion.contentEquals("nuevo")) {
				
				openMode = "";
				
				request.setAttribute("openMode", openMode);
//				request.setAttribute("aperturaProceso", aperturaProceso);
				request.setAttribute("beneficiarioAperturaList", beneficiarioAperturaList);
				request.setAttribute("garantiasList", garantiasList);
				session.setAttribute("idControlGarantias", 0);
				
				
			}
			
			else if(accion.contentEquals("modificar") || accion.contentEquals("consultar")){
				System.out.println("garantia MODIF /"+ accion);
				
				Gral_controlGarantiasDTO garantia = Gral_controlGarantiasDao.Getgarantia(Integer.parseInt(request.getParameter("idControlGarantias")));
				
				System.out.println("garantia MODIF /"+ garantia);
				
				request.setAttribute("idcontratoOrdenCompra", garantia.getIdcontratoOrdenCompra());
				request.setAttribute("tipoGarantia", garantia.getTipoGarantia());
				request.setAttribute("tipoDocumento", garantia.getTipoDocumento());
				request.setAttribute("numGarantiaEnmienda", garantia.getNumGarantiaEnmienda());
				request.setAttribute("beneficiario", garantia.getBeneficiario());
				request.setAttribute("numProcesoCompra", garantia.getNumProcesoCompra());
				request.setAttribute("numDocumento", garantia.getNumDocumento());
				System.out.println("garantia MODIF /"+ garantia.getNumProcesoCompra());
				request.setAttribute("monedaCompra", garantia.getMonedaCompra());
				request.setAttribute("fechaFirma", garantia.getFechaFirma());
				request.setAttribute("precioTotal", garantia.getPrecioTotal());
				request.setAttribute("nombreInstitucionFinanciera", garantia.getNombreInstitucionFinanciera());
				request.setAttribute("numGarantia", garantia.getNumGarantia());
				request.setAttribute("monedaGarantia", garantia.getMonedaGarantia());
				request.setAttribute("tasaCambio", garantia.getTasaCambio());
				request.setAttribute("valorGarantia", garantia.getValorGarantia());
				request.setAttribute("proveedor", garantia.getNombreProveedor());
				request.setAttribute("usuarioResponsable", garantia.getUsuarioResponsable());
				request.setAttribute("fechaEmision", garantia.getFechaEmision());
				request.setAttribute("fechaInicioValidez", garantia.getFechaInicioValidez());
				request.setAttribute("fechaFinValidez", garantia.getFechaFinValidez());
				request.setAttribute("horaVencimiento", garantia.getHoraVencimiento());
				request.setAttribute("diasAnticipacion", garantia.getDiasAnticipacion());
				request.setAttribute("correo1", garantia.getCorreo1());
				request.setAttribute("correo2", garantia.getCorreo2());
				request.setAttribute("correo3", garantia.getCorreo3());
				request.setAttribute("correo4", garantia.getCorreo4());
				request.setAttribute("correo5", garantia.getCorreo5());
				request.setAttribute("correo6", garantia.getCorreo6());
				request.setAttribute("observaciones", garantia.getObservaciones());
				request.setAttribute("nombreDocumento", garantia.getNombreDocumento());
				System.out.println("garantia docu /"+ garantia.getNombreDocumento());
				
				session.setAttribute("idControlGarantias", request.getParameter("idControlGarantias"));
				
				System.out.println("garantia /"+ request.getParameter("idControlGarantias"));
				
			}
			
			session.setAttribute("accion", accion);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nControlGarantiasGeneral.jsp").forward(request, response);
			
			
		}catch(Exception e) {
			
		}
	}
		
		
		

//		
//				break;
//			case "modificar":
//				if (id == null) {
//					int i = (Integer) request.getAttribute("id");
//					id = String.valueOf(i);
//				}
//				if (id != null && !id.isEmpty()) {
//					cod = Integer.parseInt(id);
//					next = "nControlGarantiasGeneral.jsp";
//
//					controlGarantiasGeneral p = controlGarantiasGeneralDao.getById(Integer.parseInt(id));
//
//					request.setAttribute("Id", p.getId());
//					session.setAttribute("procesocompra", p.getBuyProcessId());
//					request.setAttribute("ordencompra", p.getBuyOrderId());
//					request.setAttribute("procesocompracod", p.getBuyProcessCod());
//					request.setAttribute("tipogarantia", p.getWarrantytype());
//					request.setAttribute("nogarantia", p.getWarrantyNo());
//					request.setAttribute("myfile", p.getDocumentName());
//					request.setAttribute("fechaemision", p.getFechaemision());
//					request.setAttribute("fechacaducidad", p.getFechacaducidad());
//					request.setAttribute("fecha", p.getFecha());
//					request.setAttribute("diasanticipacion", p.getDiasanticipacion());
//					
//					request.setAttribute("beneficiario", p.getbeneficiario());
//					request.setAttribute("tipoProcesoCompra", p.gettipoProcesoCompra());
//					request.setAttribute("valorGarantia", p.getvalorGarantia());
//					request.setAttribute("correo1", p.getcorreo1()); 
//					request.setAttribute("correo2", p.getcorreo2());
//					request.setAttribute("correo3", p.getcorreo3());
//
//					session.setAttribute("type", t);
//					session.setAttribute("noCompra", cod);
//					session.setAttribute("funcion", "modificar");
//					session.setAttribute("ogFunc", "modificar");
//					session.setAttribute("read", read);
//					session.setAttribute("disable", disable);
//				}
//				break;
//			case "consultar":
//
//				if (id != null && !id.isEmpty()) {
//					cod = Integer.parseInt(id);
//					next = "nControlGarantiasGeneral.jsp";
//
//					controlGarantiasGeneral p = controlGarantiasGeneralDao.getById(Integer.parseInt(id));
//
//					request.setAttribute("Id", p.getId());
//					session.setAttribute("procesocompra", p.getBuyProcessId());
//					request.setAttribute("ordencompra", p.getBuyOrderId());
//					request.setAttribute("procesocompracod", p.getBuyProcessCod());
//					request.setAttribute("tipogarantia", p.getWarrantytype());
//					request.setAttribute("nogarantia", p.getWarrantyNo());
//					request.setAttribute("myfile", p.getDocumentName());
//					request.setAttribute("fechaemision", p.getFechaemision());
//					request.setAttribute("fechacaducidad", p.getFechacaducidad());
//					request.setAttribute("fecha", p.getFecha());
//					request.setAttribute("diasanticipacion", p.getDiasanticipacion());
//					
//					request.setAttribute("beneficiario", p.getbeneficiario());
//					request.setAttribute("tipoProcesoCompra", p.gettipoProcesoCompra());
//					request.setAttribute("valorGarantia", p.getvalorGarantia());
//					request.setAttribute("correo1", p.getcorreo1()); 
//					request.setAttribute("correo2", p.getcorreo2());
//					request.setAttribute("correo3", p.getcorreo3());
//
//					session.setAttribute("type", t);
//					session.setAttribute("noCompra", cod);
//					session.setAttribute("funcion", "consultar");
//					session.setAttribute("ogFunc", "consultar");
//					session.setAttribute("read", read);
//					session.setAttribute("disable", disable);
//				}
//				break;
//			default:
//				break;
//		


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
