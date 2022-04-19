package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.listaRequerimientoSolicitudCompraALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPReqListForSCBySupplierNameAPI")
public class ALPReqListForSCBySupplierNameAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPReqListForSCBySupplierNameAPI() {
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
		Long codPadre = (Long) session.getAttribute("codPadreSolCompra");

		String search = request.getParameter("searchByKey");
		String productos = request.getParameter("productos");
		String reqList = "";

		if (search != null && !search.isBlank()) {
			//reqList = listaRequerimientoSolicitudCompraALPDao.getReqListByBuyRequestIdAndSupplierNameJSON(codPadre,search.toUpperCase());
			reqList = listaRequerimientoSolicitudCompraALPDao.getListaRequerimientoParaGenerarDisponibilidad(codPadre,search.toUpperCase(), productos);
		}
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(reqList.toString());
		out.flush();
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
