package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.Gral_listaRequerimientoDao;
import main.dao.Gral_oficioBeneficiarioDao;
import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.Gral_listaRequerimiento;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/Gral_listaRequerimientoAPI")
public class Gral_listaRequerimientoAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_listaRequerimientoAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String accion = request.getParameter("accion");
			if (accion != null && !accion.isEmpty()) {
				PrintWriter out = response.getWriter();				
				switch (accion) {
				case "nuevo":
					String data = "";

					Gral_listaRequerimiento listaRequerimiento = new Gral_listaRequerimiento();
					listaRequerimiento.setIdlistaRequerimiento(Integer.parseInt(request.getParameter("idlistaRequerimiento")));
					listaRequerimiento.setIdOficioBeneficiario(Integer.parseInt(request.getParameter("idOficioBeneficiario")));
					listaRequerimiento.setCodigoATC(request.getParameter("codigoATC").toUpperCase());
					listaRequerimiento.setCodigoSesal(request.getParameter("codigoSesal").toUpperCase());
					listaRequerimiento.setIdMedicamento(Integer.parseInt(request.getParameter("idMedicamento")));
					listaRequerimiento.setNombreMedicamento(request.getParameter("nombreMedicamento").toUpperCase());
					listaRequerimiento.setDescripcionTecnica(request.getParameter("descripcionTecnica").toUpperCase());
					listaRequerimiento.setUnidadPresentacion(request.getParameter("unidadPresentacion").toUpperCase());
					listaRequerimiento.setCantidadRequerida(Integer.parseInt(request.getParameter("cantidadRequerida").replaceAll(",", "")));
					listaRequerimiento.setPlazosEntrega(request.getParameter("plazosEntrega").toUpperCase());
					listaRequerimiento.setVidaUtil(request.getParameter("vidaUtil").toUpperCase());
					listaRequerimiento.setObservacionesBeneficiario(request.getParameter("observacionesBeneficiario").toUpperCase());
					listaRequerimiento.setMoneda(request.getParameter("moneda").toUpperCase());
					
//					int numItem = 0;
//					int optenerNUmItem = Gral_listaRequerimientoDao.GetNumItemXmedicamento(Integer.parseInt(request.getParameter("idAperturaProceso")),listaRequerimiento.getIdMedicamento());
//					if(optenerNUmItem == 0) {
//						numItem = Gral_listaRequerimientoDao.GetNumItemXapertura(Integer.parseInt(request.getParameter("idAperturaProceso")))+1;
//					}else {
//						numItem = optenerNUmItem;
//					}
//					
//					listaRequerimiento.setNumItem(numItem);
//					
					int Guardado = Gral_listaRequerimientoDao.save(listaRequerimiento);

					if (Guardado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					out.close();
					break;

				case "GetlistaRequerimientoTB":
					data = Gral_listaRequerimientoDao.getListaRequerimientoXapertura(Integer.parseInt(request.getParameter("idAperturaProceso")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					//out.close();
					break;
				case "anularItem":
					
					int anulado = Gral_listaRequerimientoDao.anularItem(Integer.parseInt(request.getParameter("idlistaRequerimiento")));

					if (anulado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "editar":
					
					int editado = Gral_listaRequerimientoDao.Update(Integer.parseInt(request.getParameter("idlistaRequerimiento")),Integer.parseInt(request.getParameter("cantidadRequerida")));

					if (editado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;

				default:
					
					break;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
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
