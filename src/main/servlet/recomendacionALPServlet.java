package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class recomendacionesServlet
 */
@WebServlet("/recomendacionALPServlet")
public class recomendacionALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public recomendacionALPServlet() {
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
		String proc = (String) session.getAttribute("proc");
		int codPadre = (int) session.getAttribute("codPadre");

		String[] dist = request.getParameterValues("dist");
		String[] codAtc = request.getParameterValues("atc");
		String[] medReq = request.getParameterValues("medReq");
		String[] medOff = request.getParameterValues("medOff");
		String[] desc = request.getParameterValues("desc");
		String[] up = request.getParameterValues("up");
		String[] precio = request.getParameterValues("precio");

		String[] recCom = request.getParameterValues("recCom");
		String[] criteria = request.getParameterValues("criteria");
		String[] obs = request.getParameterValues("obs");
		String[] recBen = request.getParameterValues("recBen");
		String[] moneda = request.getParameterValues("moneda");
		System.out.println("Llege");
		int cant = 0;
		if (dist != null && dist.length > 0) {
			for (int i = 0; i < dist.length; i++) {
				System.out.println("Llege for");
				ofertaALP o = new ofertaALP();
				o.setDistribuidor(dist[i]);
				o.setCodATC(codAtc[i]);
				o.setMedicamentoEstimado(medReq[i]);
				o.setMedicamentoOfertado(medOff[i]);
				o.setDescripcionTecnica(desc[i]);
				o.setUp(up[i]);
				o.setPrecio(precio[i]);
				o.setProcesoCompra(proc);
				o.setRecomendacionComite(recCom[i]);
				o.setCriterioRecomendacion(criteria[i]);
				o.setObservaciones(obs[i]);
				o.setRecomendacionesBeneficiario(recBen[i]);
				o.setMoneda(moneda[i]);
				o.setCodPadre(codPadre);
				o.setProcesoCompra(proc);
				if (o.getRecomendacionComite().contentEquals("SI")) {
					cant++;
				}
				ofertaALPDao.updateRecomendaciones(o);
			}
			vaciadoOfertasALPDao.updateCantRec(codPadre, cant);
		}
		session.removeAttribute("codPadre");
		session.removeAttribute("procesoCompra");
		session.removeAttribute("funcion");
		request.getRequestDispatcher("recomendacionOfertaALP.jsp").forward(request, response);
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
