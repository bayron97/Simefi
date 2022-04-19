package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.actaAperturaALPDao;
import main.dao.distribuidorDao;
import main.dao.listaRequerimientoALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPmedEstForOffersAPI")
public class ALPmedEstForOffersAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPmedEstForOffersAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("searchByBuyProcess");
		String reqList = "";
		if (search != null && !search.isBlank()) {
			if (search.contentEquals("DIST")) {
				String noProceso = request.getParameter("noProceso");
				
				//reqList = distribuidorDao.getAllApi();
				reqList = actaAperturaALPDao.getDistribuidorByProcesoApi(noProceso);
				
			} else {
				//reqList = listaRequerimientoALPDao.getReqListByBuyProcessNumberForNewOfferJSON(search.toUpperCase());
				reqList = listaRequerimientoALPDao.getReqListByBuyProcessNumberForNewOfferJSONByProveedor(search.toUpperCase(),request.getParameter("distribuitor"));
			}
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
