package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class listaRequerimientoSolicitudDisponibilidadALPDao {
	
	public static int save(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoSolicitudDisponibilidadALP(idSolicitudDisponibilidad, noItem, noOficio, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, fechaOferta, recomendacionesBeneficiarios, regSanVenc, certBPMVenc, codSolicitudCompra, estadoCompra, noOferta, registroSanitario, codigoSesal) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, l.getIdSolicitudDisponibilidad());
			ps.setLong(2, l.getNoItem());
			ps.setString(3, l.getNoOficio());
			ps.setString(4, l.getCodigoATC());
			ps.setString(5, l.getNombreProductoRequerido());
			ps.setString(6, l.getNombreProductoOfertado());
			ps.setString(7, l.getDescripcionTecnicaRequerida());
			ps.setString(8, l.getDescripcionTecnicaOfertada());
			ps.setString(9, l.getUnidadPresentacionRequerida());
			ps.setString(10, l.getUnidadPresentacionOfertada());
			ps.setString(11, l.getOrigenFP());
			ps.setString(12, l.getNumCertRegSan());
			ps.setString(13, l.getNumCertBPM());
			ps.setFloat(14, l.getCantidadRequerida());
			ps.setFloat(15, l.getPrecioUnitarioAcordado());
			ps.setFloat(16, (l.getCantidadRequerida() * l.getPrecioUnitarioAcordado()));
			ps.setString(17, l.getMoneda());
			ps.setString(18, l.getTiempoEntregaOfertado());
			ps.setString(19, l.getVidaUtilOfertada());
			ps.setString(20, l.getFechaOferta());
			ps.setString(21, l.getRecomendacionesBeneficiarios());
			ps.setString(22, l.getRegSanVenc());
			ps.setString(23, l.getCertBPMVenc());
			ps.setString(24, l.getCodSolicitudCompra());
			ps.setString(25, "GENERADO");
			ps.setInt(26, l.getnoOferta());
			ps.setString(27, l.getregistroSanitario());
			ps.setString(28, l.getcodigoSesal());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateEmptyingOffer(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					//"update dbo.listaRequerimientoSolicitudDisponibilidadALP set cantidadOfertada = ?, tiempoEntregaOfertado = ?, cantidadEmpaquePrimario = ?, cantidadEmpaqueSecundario = ?, cantidadEmpaqueTrciario = ?, vidaUtilOfertada = ?, aclaracion = ?, estadoCompra = ?, fechaVaciado = ?, numCertRegSan = ?, numCertBPM = ?, fechaRegSanitarioVen = ?, fechaCerBPMVen = ?, ObserRespuestaProveedor = ?, registroSanitario = ? where idSolicitudDisponibilidad = ? and noItem = ?");
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set cantidadOfertada = ?, tiempoEntregaOfertado = ?, cantidadEmpaquePrimario = ?, cantidadEmpaqueSecundario = ?, cantidadEmpaqueTrciario = ?, vidaUtilOfertada = ?, aclaracion = ?, estadoCompra = ?, fechaVaciado = ?, numCertRegSan = ?, numCertBPM = ?, fechaRegSanitarioVen = ?, fechaCerBPMVen = ?, ObserRespuestaProveedor = ?, registroSanitario = ? where id = ?");
			ps.setInt(1, l.getCantidadOfertada());
			ps.setString(2, l.getTiempoEntregaOfertado());
			ps.setFloat(3, l.getCantidadEmpaquePrimario());
			ps.setFloat(4, l.getCantidadEmpaqueSecundario());
			ps.setFloat(5, l.getcantidadEmpaqueTerciario());
			ps.setString(6, l.getVidaUtilOfertada());
			ps.setString(7, l.getAclaracion());
			ps.setString(8, l.getEstadoCompra());
			ps.setString(9, l.getFechaVaciado());
			ps.setString(10, l.getnumRegSanitarioVen());
			ps.setString(11, l.getCertBPMVenc());	
			ps.setString(12,  l.getfechaRegSanitarioVen());
			ps.setString(13,  l.getfechaCerBPMVen());		
			ps.setString(14,  l.getObserRespuestaProveedor());
			ps.setString(15,  l.getregistroSanitario());
			ps.setLong(16, l.getId());
//			ps.setLong(16, l.getIdSolicitudDisponibilidad()); 
//			ps.setLong(17, l.getNoItem());
			
		
					
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateEvaluateOffer(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set regSanCriterio = ?, cantCriterio = ?, certBPMCriterio = ?, tiempoEntregaCriterio = ?, vidaUtilCriterio = ?, fechaEvaluacion = ?, estadoCompra = ? where idSolicitudDisponibilidad = ? and noItem = ?");
			ps.setString(1, l.getRegSanCriterio());
			ps.setString(2, l.getCantCriterio());
			ps.setString(3, l.getCertBPMCriterio());
			ps.setString(4, l.getTiempoEntregaCriterio());
			ps.setString(5, l.getVidaUtilCriterio());
			ps.setString(6, l.getFechaEvaluacion());
			ps.setString(7, l.getEstadoCompra());

			ps.setLong(8, l.getIdSolicitudDisponibilidad());
			ps.setLong(9, l.getNoItem());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateRecommendOffer(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set recomendacionCE = ?, criterioRecomendacion = ?, observaciones = ?, prelacionRT = ?, fechaRecomendacion = ?, estadoCompra = ? where idSolicitudDisponibilidad = ? and noItem = ?");
			ps.setString(1, l.getRecomendacionCE());
			ps.setString(2, l.getCriterioRecomendacion());
			ps.setString(3, l.getObservaciones());
			ps.setString(4, l.getPrelacionRT());
			ps.setString(5, l.getFechaRecomendacion());
			ps.setString(6, l.getEstadoCompra());

			ps.setLong(7, l.getIdSolicitudDisponibilidad());
			ps.setLong(8, l.getNoItem());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	
	public static int updateRecommendOfferById(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set recomendacionCE = ?, criterioRecomendacion = ?, observaciones = ?, prelacionRT = ?, fechaRecomendacion = ?, estadoCompra = ?, segundaRCC =? where id = ?");
			ps.setString(1, l.getRecomendacionCE());
			ps.setString(2, l.getCriterioRecomendacion());
			ps.setString(3, l.getObservaciones());
			ps.setString(4, l.getPrelacionRT());
			ps.setString(5, l.getFechaRecomendacion());
			ps.setString(6, l.getEstadoCompra());
			ps.setString(7, l.getsegundaRCC());
			ps.setLong(8, l.getId());

			//ps.setLong(7, l.getIdSolicitudDisponibilidad());
			//ps.setLong(8, l.getNoItem());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int updateRatifiedOffer(listaRequerimientoSolicitudDisponibilidadALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set ratificacionCT = ?, criterioResolucionCT = ?, comentariosRatificacion = ?, fechaRatificacion = ?, estadoCompra = ?  where idSolicitudDisponibilidad = ? and noItem = ?");
			ps.setString(1, l.getRatificacionCT());
			ps.setString(2, l.getCriterioResolucionCT());
			ps.setString(3, l.getComentariosRatificacion());
			ps.setString(4, l.getFechaRatificacion());
			ps.setString(5, l.getEstadoCompra());

			ps.setLong(6, l.getIdSolicitudDisponibilidad());
			ps.setLong(7, l.getNoItem());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int actualizarRactificacion(listaRequerimientoSolicitudDisponibilidadALP l, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			
			System.out.println(l.getsegundaRCC());
			
	if(l.getsegundaRCC().contentEquals("SOLICITADA") && l.getRatificacionCT().contentEquals("NO RATIFICADO"))
		{
		
		PreparedStatement ps = con.prepareStatement(
				"update dbo.listaRequerimientoSolicitudDisponibilidadALP set ratificacionCT = ?, criterioResolucionCT = ?, comentariosRatificacion = ?, fechaRatificacion = ?, estadoCompra = ? , segundaRCC = ?, prelacionRT = ? where id = ?");
		ps.setString(1, l.getRatificacionCT());
		ps.setString(2, l.getCriterioResolucionCT());
		ps.setString(3, l.getComentariosRatificacion());
		ps.setString(4, l.getFechaRatificacion());
		ps.setString(5, "EVALUACION REALIZADA");
		ps.setString(6, l.getsegundaRCC());
		ps.setString (7, String.valueOf(Integer.parseInt(l.getPrelacionRT())+1));
		ps.setInt(8, id);
		
		status = ps.executeUpdate();
		con.close();
		}
		else
		{
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudDisponibilidadALP set ratificacionCT = ?, criterioResolucionCT = ?, comentariosRatificacion = ?, fechaRatificacion = ?, estadoCompra = ?  where id = ?");
			ps.setString(1, l.getRatificacionCT());
			ps.setString(2, l.getCriterioResolucionCT());
			ps.setString(3, l.getComentariosRatificacion());
			ps.setString(4, l.getFechaRatificacion());
			ps.setString(5, l.getEstadoCompra());
			ps.setInt(6, id);
			
			status = ps.executeUpdate();
			con.close();
		}
		
			
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int getCountByBuyRequestCod(String codSolicitudCompra) {
		int count = 0;

		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select count(*) from dbo.listaRequerimientoSolicitudDisponibilidadALP where codSolicitudCompra = ?");
			ps.setString(1, codSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return count;
	}
	
	public static ArrayList<listaRequerimientoSolicitudDisponibilidadALP> getAllBySDID(long SDID) {
		ArrayList<listaRequerimientoSolicitudDisponibilidadALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select fechaVaciado, noItem, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, fechaEvaluacion, fechaRecomendacion, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, numRegSanitarioVen, fechaRegSanitarioVen, numCerBPMVen, fechaCerBPMVen, id, cantidadEmpaqueTrciario, ObserRespuestaProveedor, noOferta, registroSanitario, codigoSesal from dbo.listaRequerimientoSolicitudDisponibilidadALP where idSolicitudDisponibilidad = ?");
					//"select fechaVaciado, noItem, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, fechaEvaluacion, fechaRecomendacion, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, numRegSanitarioVen, fechaRegSanitarioVen, numCerBPMVen, fechaCerBPMVen, id from dbo.listaRequerimientoSolicitudDisponibilidadALP where idSolicitudDisponibilidad = ? and prelacionRT ='1'");
			ps.setLong(1, SDID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudDisponibilidadALP lr = new listaRequerimientoSolicitudDisponibilidadALP();
				lr.setFechaVaciado(rs.getString(1));
				if (rs.getString(1) == null)
				{
					lr.setFechaVaciado("-");
				}
				lr.setNoItem(rs.getInt(2));
				lr.setCodigoATC(rs.getString(3));
				lr.setNombreProductoRequerido(rs.getString(4));
				if (rs.getString(4) == null)
				{
					lr.setNombreProductoRequerido("ERROR");
				}
				lr.setNombreProductoOfertado(rs.getString(5));
				lr.setDescripcionTecnicaRequerida(rs.getString(6));
				if (rs.getString(6) == null)
				{
					lr.setDescripcionTecnicaRequerida("NO AGREGADA");
				}
				lr.setDescripcionTecnicaOfertada(rs.getString(7));
				lr.setUnidadPresentacionRequerida(rs.getString(8));
				if (rs.getString(8) == null)
				{
					lr.setUnidadPresentacionRequerida("NINGUNA");
				}
				lr.setUnidadPresentacionOfertada(rs.getString(9));
				lr.setOrigenFP(rs.getString(10));
				lr.setNumCertRegSan(rs.getString(11));
				if (rs.getString(11) == null)
				{
					lr.setNumCertRegSan("NINGUNO");
				}
				lr.setNumCertBPM(rs.getString(12));
				if (rs.getString(12) == null)
				{
					lr.setNumCertRegSan("NINGUNO");
				}
				
				
				PreparedStatement psS = con.prepareStatement(
						"SELECT OALP.numSanitario, OALP.numCertif FROM [dbo].[ofertaALP] AS OALP\r\n"
						+ "INNER JOIN [dbo].[solicitudCompraALP] AS SCALP ON OALP.procesoCompra = SCALP.noProcesoCompra\r\n"
						+ "INNER JOIN [dbo].[solicitudDisponibilidadALP] AS SDALP ON SDALP.idSolicitudCompra = SCALP.id\r\n"
						+ "inner join listaRequerimientoSolicitudDisponibilidadALP as lrsdalp ON lrsdalp.idSolicitudDisponibilidad = SDALP.id\r\n"
						+ "WHERE lrsdalp.id = ? AND OALP.medicamentoEstimado = ?");
				psS.setLong(1, Long.parseLong(rs.getString(43)));
				psS.setString(2, rs.getString(4));
				ResultSet rsS = psS.executeQuery();
				while (rsS.next()) {
					
					String numSanitarioP = rs.getString(1);
					String numCertifP = rs.getString(2);
					
					if(!rsS.getString(1).contentEquals(rs.getString(11))) {
						lr.setNumCertRegSan(rsS.getString(1));
					}
					
					if(!rsS.getString(2).contentEquals(rs.getString(12))) {
						lr.setNumCertBPM(rsS.getString(2));
					}
					
					System.out.println(rsS.getString(1) + " " + rs.getString(11));
					System.out.println(rsS.getString(2) + " " + rs.getString(12));
					
				}
				
				lr.setCantidadRequerida(rs.getFloat(13));
				lr.setCantidadOfertada(rs.getInt(14));
				lr.setPrecioUnitarioAcordado(rs.getFloat(15));
				lr.setPrecioTotal(rs.getFloat(16));
				lr.setMoneda(rs.getString(17));
				lr.setTiempoEntregaOfertado(rs.getString(18));
				lr.setVidaUtilOfertada(rs.getString(19));
				lr.setCantidadEmpaquePrimario(rs.getInt(20));
				lr.setCantidadEmpaqueSecundario(rs.getInt(21));
				lr.setFechaEvaluacion(rs.getString(22));
				if (rs.getString(22) == null)
				{
					lr.setFechaEvaluacion("-");
				}
				lr.setFechaRecomendacion(rs.getString(23));
				if (rs.getString(23) == null)
				{
					lr.setFechaRecomendacion("-");
				}
				lr.setRegSanCriterio(rs.getString(24));
				if (rs.getString(24) == null)
				{
					lr.setRegSanCriterio("-");
				}
				lr.setCantCriterio(rs.getString(25));
				if (rs.getString(25) == null)
				{
					lr.setCantCriterio("-");
				}
				lr.setCertBPMCriterio(rs.getString(26));
				if (rs.getString(26) == null)
				{
					lr.setCertBPMCriterio("-");
				}
				lr.setTiempoEntregaCriterio(rs.getString(27));
				if (rs.getString(27) == null)
				{
					lr.setTiempoEntregaCriterio("-");
				}
				lr.setVidaUtilCriterio(rs.getString(28));
				if (rs.getString(28) == null)
				{
					lr.setVidaUtilCriterio("-");
				}
				lr.setRecomendacionCE(rs.getString(29));
				if (rs.getString(29) == null)
				{
					lr.setRecomendacionCE("-");
				}
				lr.setCriterioRecomendacion(rs.getString(30));
				if (rs.getString(30) == null)
				{
					lr.setCriterioRecomendacion("-");
				}
				lr.setPrelacionRT(rs.getString(31));
				if (rs.getString(31) == null)
				{
					lr.setPrelacionRT("-");
				}
				lr.setObservaciones(rs.getString(32));
				if (rs.getString(32) == null)
				{
					lr.setObservaciones("-");
				}
				lr.setRecomendacionesBeneficiarios(rs.getString(33));
				if (rs.getString(33) == null)
				{
					lr.setRecomendacionesBeneficiarios("-");
				}
				lr.setEstadoCompra(rs.getString(34));
				lr.setObservacionEstadoCompra(rs.getString(35));
				if (rs.getString(35) == null)
				{
					lr.setObservacionEstadoCompra("-");
				}
				lr.setAclaracion(rs.getString(36));
				if (rs.getString(36) == null)
				{
					lr.setAclaracion("-");
				}
				lr.setRegSanVenc(rs.getString(37));
				if (rs.getString(37) == null)
				{
					lr.setRegSanVenc("-");
				}
				lr.setCertBPMVenc(rs.getString(38));
				if (rs.getString(38) == null)
				{
					lr.setCertBPMVenc("-");
				}
				lr.setnumRegSanitarioVen(rs.getString(39));
				if (rs.getString(39) == null)
				{
					lr.setnumRegSanitarioVen("-");
				}
				lr.setfechaRegSanitarioVen(rs.getString(40));
				if (rs.getString(40) == null)
				{
					lr.setfechaRegSanitarioVen("-");
				}
				lr.setnumCerBPMVen(rs.getString(41));
				if (rs.getString(41) == null)
				{
					lr.setnumCerBPMVen("-");
				}
				lr.setfechaCerBPMVen(rs.getString(42));
				if (rs.getString(42) == null)
				{
					lr.setfechaCerBPMVen("-");
				}
				lr.setId(Long.parseLong(rs.getString(43)));
				
				lr.setcantidadEmpaqueTerciario(rs.getInt(44));
				if (rs.getString(44) == null)
				{
					lr.setcantidadEmpaqueTerciario(0);
				}
				
				lr.setObserRespuestaProveedor(rs.getString(45));
				if (rs.getString(45) == null)
				{
					lr.setObserRespuestaProveedor("-");
				}
				
				lr.setnoOferta(rs.getInt(46));
				lr.setregistroSanitario(rs.getString(47));
				if (rs.getString(47) == null)
				{
					lr.setregistroSanitario("-");
				}
				
				lr.setcodigoSesal(rs.getString(48));
				
				reqList.add(lr);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	public static String getAllBySDID_JSON(long SDID) {
		String arList = "";
		
		ArrayList<listaRequerimientoSolicitudDisponibilidadALP> mainList = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDID(SDID);
		String j = "{ \"data\":[";
		int count = 0;
		for (listaRequerimientoSolicitudDisponibilidadALP offer : mainList) {
			count++;
			j += "[" + "\"" + offer.getFechaVaciado() + "\"," + "\"" +
					offer.getNoItem() + "\"," + "\"" +
					offer.getcodigoSesal() + "\"," + "\"" +
					offer.getNombreProductoRequerido() + "\"," + "\"" +
					offer.getNombreProductoOfertado() + "\"," + "\"" +
					offer.getDescripcionTecnicaRequerida() + "\"," + "\"" +
					offer.getDescripcionTecnicaOfertada() + "\"," + "\"" +
					offer.getUnidadPresentacionRequerida() + "\"," + "\"" +
					offer.getUnidadPresentacionOfertada() + "\"," + "\"" +
					offer.getOrigenFP() + "\"," + "\"" +
					offer.getNumCertRegSan() + "\"," + "\"" +
					offer.getRegSanVenc() + "\"," + "\"" +
					offer.getNumCertBPM() + "\"," + "\"" +
					offer.getCertBPMVenc() + "\"," + "\"" +
					offer.getCantidadRequerida() + "\"," + "\"" +
					offer.getCantidadOfertada()   + "\"," + "\"" +
					offer.getPrecioUnitarioAcordado() + "\"," + "\"" +
					offer.getPrecioTotal() + "\"," + "\"" +
					offer.getMoneda() + "\"," + "\"" +
					offer.getTiempoEntregaOfertado() + "\"," + "\"" +
					offer.getVidaUtilOfertada() + "\"," + "\"" +
					offer.getCantidadEmpaquePrimario()  + "\"," + "\"" +
					offer.getCantidadEmpaqueSecundario()  + "\"," + "\"" +
					offer.getRegSanCriterio() + "\"," + "\"" +
					offer.getCantCriterio() + "\"," + "\"" +
					offer.getCertBPMCriterio() + "\"," + "\"" +
					offer.getTiempoEntregaCriterio() + "\"," + "\"" +
					offer.getVidaUtilCriterio() + "\"," + "\"" +
					offer.getRecomendacionCE() + "\"," + "\"" +
					offer.getCriterioRecomendacion() + "\"," + "\"" +
					offer.getPrelacionRT() + "\"," + "\"" +
					offer.getObservaciones() + "\"," + "\"" +
					offer.getRecomendacionesBeneficiarios() + "\"," + "\"" +
					offer.getEstadoCompra() + "\"," + "\"" +
					offer.getObservacionEstadoCompra() + "\"," + "\"" +
					offer.getAclaracion() + "\"," + "\"" +
					offer.getNumCertRegSan() + "\"," + "\"" +
					offer.getfechaRegSanitarioVen() + "\"," + "\"" +
					offer.getNumCertBPM() + "\"," + "\"" +		
					offer.getfechaCerBPMVen() + "\"," + "\"" +	
					offer.getcantidadEmpaqueTerciario() + "\"," + "\"" +	
					offer.getObserRespuestaProveedor() + "\"," + "\"" +	
					offer.getId() + "\"," + "\"" +	
					offer.getnoOferta() + "\"," + "\"" +	
					offer.getregistroSanitario() +  "\"],";
		}
		if (count == 0) {
			String empty = "-";
			j += "[" + "\"" + empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +
					  		  empty + "\"," + "\"" +					  		
							  empty + "\"],";
		}
		j = j.substring(0, j.length() - 1);
		j += "]}";
		arList = j;

		return arList;
	}
	
	public static String getAllByNoItem_JSON(String buyRequestCod, long noItem, String procesoCompra) {
		System.out.println(" parametros " + buyRequestCod + " " +noItem);
		String arList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select lrSD.fechaVaciado, lrSD.idSolicitudDisponibilidad, lrSD.codigoATC, lrSD.nombreProductoRequerido, lrSD.nombreProductoOfertado, lrSD.descripcionTecnicaRequerida, lrSD.descripcionTecnicaOfertada, lrSD.unidadPresentacionRequerida, lrSD.unidadPresentacionOfertada, lrSD.origenFP, lrSD.numCertRegSan, lrSD.numCertBPM, lrSD.cantidadRequerida, lrSD.cantidadOfertada, lrSD.precioUnitarioAcordado, lrSD.precioTotal, lrSD.moneda, lrSD.tiempoEntregaOfertado, lrSD.vidaUtilOfertada, lrSD.cantidadEmpaquePrimario, lrSD.cantidadEmpaqueSecundario, lrSD.fechaEvaluacion, lrSD.fechaRecomendacion, lrSD.regSanCriterio, lrSD.cantCriterio, lrSD.certBPMCriterio, lrSD.tiempoEntregaCriterio, lrSD.vidaUtilCriterio, lrSD.recomendacionCE, lrSD.criterioRecomendacion, lrSD.prelacionRT, lrSD.observaciones, lrSD.recomendacionesBeneficiarios, lrSD.estadoCompra, lrSD.observacionEstadoCompra, lrSD.aclaracion, lrSD.regSanVenc, lrSD.certBPMVenc, lrSD.id, lrSD.segundaRCC from dbo.listaRequerimientoSolicitudDisponibilidadALP as lrSD\r\n"
					+ "INNER JOIN ofertaALP as oALP on lrSD.noOferta = oALP.noOferta where lrSD.noItem = ? and lrSD.codSolicitudCompra = ? and oALP.procesoCompra = ?  and lrSD.estadoCompra = 'EVALUACION REALIZADA' or lrSD.estadoCompra = 'RECOMENDACION REALIZADA'");
			ps.setLong(1, noItem);
			ps.setString(2, buyRequestCod);
			ps.setString(3, procesoCompra);
			//ps.setLong(3, coddSd);
			ResultSet rs = ps.executeQuery();
			String j = "{ \"data\":[";
			int count = 0;
			while (rs.next()) {
				count++;
				
				String fechaVaciado = rs.getString(1);
				if (fechaVaciado == null)
				{
					fechaVaciado = "-";
				}
				solicitudDisponibilidadALP temp = solicitudDisponibilidadALPDao.getOneBySDID(rs.getLong(2));
				String codSolicitudDisponibilidad = temp.getCodSolicitudDisponibilidad();
				String proveedor = temp.getProveedor();
				String codigoATC = rs.getString(3);
				String nombreProductoRequerido = rs.getString(4);
				if (nombreProductoRequerido == null)
				{
					nombreProductoRequerido = "ERROR";
				}
				String nombreProductoOfertado = rs.getString(5);
				String descripcionTecnicaRequerida = rs.getString(6);
				if (descripcionTecnicaRequerida == null)
				{
					descripcionTecnicaRequerida = "NINGUNA";
				}
				String descripcionTecnicaOfertada = rs.getString(7);
				String unidadPresentacionRequerida = rs.getString(8);
				if (unidadPresentacionRequerida == null)
				{
					unidadPresentacionRequerida = "NINGUNA";
				}
				String unidadPresentacionOfertada = rs.getString(9);
				String origenFP = rs.getString(10);
				String numCertRegSan = rs.getString(11);
				if (numCertRegSan == null)
				{
					numCertRegSan = "NINGUNO";
				}
				String numCertBPM = rs.getString(12);
				if (numCertBPM == null)
				{
					numCertBPM = "NINGUNO";
				}
				float cantidadRequerida = rs.getFloat(13);
				float cantidadOfertada = rs.getFloat(14);
				float precioUnitarioAcordado = rs.getFloat(15);
				float precioTotal = rs.getFloat(16);
				String moneda = rs.getString(17);
				String tiempoEntregaOfertado = rs.getString(18);
				String vidaUtilOfertada = rs.getString(19);
				float cantidadEmpaquePrimario = rs.getFloat(20);
				float cantidadEmpaqueSecundario = rs.getFloat(21);
				String fechaEvaluacion = rs.getString(22);
				if (fechaEvaluacion == null)
				{
					fechaEvaluacion = "-";
				}
				String fechaRecomendacion = rs.getString(23);
				if (fechaRecomendacion == null)
				{
					fechaRecomendacion = "-";
				}
				String regSanCriterio = rs.getString(24);
				if (regSanCriterio == null)
				{
					regSanCriterio = "-";
				}
				String cantCriterio = rs.getString(25);
				if (cantCriterio == null)
				{
					cantCriterio = "-";
				}
				String certBPMCriterio = rs.getString(26);
				if (certBPMCriterio == null)
				{
					certBPMCriterio = "-";
				}
				String tiempoEntregaCriterio = rs.getString(27);
				if (tiempoEntregaCriterio == null)
				{
					tiempoEntregaCriterio = "-";
				}
				String vidaUtilCriterio = rs.getString(28);
				if (vidaUtilCriterio == null)
				{
					vidaUtilCriterio = "-";
				}
				String recomendacionCE = rs.getString(29);
				if (recomendacionCE == null)
				{
					recomendacionCE = "-";
				}
				String criterioRecomendacion = rs.getString(30);
				if (criterioRecomendacion == null)
				{
					criterioRecomendacion = "-";
				}
				String prelacionRT = rs.getString(31);
				if (prelacionRT == null)
				{
					prelacionRT = "-";
				}
				String observaciones = rs.getString(32);
				if (observaciones == null)
				{
					observaciones = "-";
				}
				String recomendacionesBeneficiarios = rs.getString(33);
				if (recomendacionesBeneficiarios == null)
				{
					recomendacionesBeneficiarios = "-";
				}
				String estadoCompra = rs.getString(34);
				if (estadoCompra == null)
				{
					estadoCompra = "SIN ESTADO";
				}
				String observacionEstadoCompra = rs.getString(35);
				if (observacionEstadoCompra == null)
				{
					observacionEstadoCompra = "-";
				}
				String aclaracion = rs.getString(36);
				if (aclaracion == null)
				{
					aclaracion = "-";
				}
				String regSanVenc = rs.getString(37);
				if (regSanVenc == null)
				{
					regSanVenc = "-";
				}
				String certBPMVenc = rs.getString(38);
				if (certBPMVenc == null)
				{
					certBPMVenc = "-";
				}
				
				String segundaRCC = rs.getString(40);
				if (segundaRCC == null)
				{
					segundaRCC = "SIN SOLICITAR";
				}
				
				String ID = rs.getString(39);
				String CE = "";
				String criteriosEvaluacion = "<td><ul>";
				
				ArrayList<CriterioEvaluacionDTO> cd = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpcionesRecomendacion(rs.getInt(39));
				
				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
					criteriosEvaluacion += "<li> <b> CITERIO: </b> "+opcionesCriterios.getNombreCriterio().toUpperCase() +" <strong> &nbsp;&nbsp;OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle().toUpperCase() +"</li> ";
				}
				criteriosEvaluacion += "</ul></td>";
				
				CE =criteriosEvaluacion;
				
				
				
				j += "[" + "\"" + fechaVaciado + "\"," + "\"" +
								  codSolicitudDisponibilidad + "\"," + "\"" +
								  proveedor + "\"," + "\"" +
								  codigoATC + "\"," + "\"" +
								  nombreProductoRequerido + "\"," + "\"" +
								  nombreProductoOfertado + "\"," + "\"" +
								  descripcionTecnicaRequerida + "\"," + "\"" +
								  descripcionTecnicaOfertada + "\"," + "\"" +
								  unidadPresentacionRequerida + "\"," + "\"" +
								  unidadPresentacionOfertada + "\"," + "\"" +
								  origenFP + "\"," + "\"" +
								  numCertRegSan + "\"," + "\"" +
								  regSanVenc + "\"," + "\"" +
								  numCertBPM + "\"," + "\"" +
								  certBPMVenc + "\"," + "\"" +
								  cantidadRequerida + "\"," + "\"" +
								  cantidadOfertada + "\"," + "\"" +
								  precioUnitarioAcordado + "\"," + "\"" +
								  precioTotal + "\"," + "\"" +
								  moneda + "\"," + "\"" +
								  tiempoEntregaOfertado + "\"," + "\"" +
								  vidaUtilOfertada + "\"," + "\"" +
								  cantidadEmpaquePrimario + "\"," + "\"" +
								  cantidadEmpaqueSecundario + "\"," + "\"" +
								  regSanCriterio + "\"," + "\"" +
								  cantCriterio + "\"," + "\"" +
								  certBPMCriterio + "\"," + "\"" +
								  tiempoEntregaCriterio + "\"," + "\"" +
								  vidaUtilCriterio + "\"," + "\"" +
								  recomendacionCE + "\"," + "\"" +
								  criterioRecomendacion + "\"," + "\"" +
								  prelacionRT + "\"," + "\"" +
								  observaciones + "\"," + "\"" +
								  recomendacionesBeneficiarios + "\"," + "\"" +
								  estadoCompra + "\"," + "\"" +
								  observacionEstadoCompra + "\"," + "\"" +
								  CE + "\"," + "\"" +
								  aclaracion + "\"," + "\"" +
								  ID + "\"," + "\"" +
								  segundaRCC + "\"],";
			}
			
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
								  empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			arList = j;
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return arList;
	}
	
	
	public static String getAllByNoItemForRatifiedOffers_JSON(String buyRequestCod, long noItem, String prelacionRTS ) {
		String arList = "";
		System.out.println(buyRequestCod + " "+ noItem + " "+ prelacionRTS) ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					//"select fechaRatificacion, idSolicitudDisponibilidad, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, ratificacionCT, criterioResolucionCT, comentariosRatificacion,prelacionRT, id from dbo.listaRequerimientoSolicitudDisponibilidadALP where noItem = ? and codSolicitudCompra = ? and prelacionRT ='"+ prelacionRTS+"' and recomendacionCE='SI'");
					//"select fechaRatificacion, idSolicitudDisponibilidad, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, ratificacionCT, criterioResolucionCT, comentariosRatificacion, prelacionRT, id from dbo.listaRequerimientoSolicitudDisponibilidadALP where  prelacionRT= ? and codSolicitudCompra = ? and noItem=? and recomendacionCE='SI'");
					"select fechaRatificacion, idSolicitudDisponibilidad, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, ratificacionCT, criterioResolucionCT, comentariosRatificacion, prelacionRT, id, segundaRCC from dbo.listaRequerimientoSolicitudDisponibilidadALP where  codSolicitudCompra = ? and noItem=? and recomendacionCE='SI'");
			ps.setLong(2, noItem);
			ps.setString(1, buyRequestCod);
			//ps.setString(1, prelacionRTS);
			ResultSet rs = ps.executeQuery();
			String j = "{ \"data\":[";
			int count = 0;
			while (rs.next()) {
				count++;
				
				String fechaRatificacion = rs.getString(1);
				if (fechaRatificacion == null)
				{
					fechaRatificacion = "-";
				}
				solicitudDisponibilidadALP temp = solicitudDisponibilidadALPDao.getOneBySDID(rs.getLong(2));
				String codSolicitudDisponibilidad = temp.getCodSolicitudDisponibilidad();
				String proveedor = temp.getProveedor();
				String codigoATC = rs.getString(3);
				String nombreProductoRequerido = rs.getString(4);
				if (nombreProductoRequerido == null)
				{
					nombreProductoRequerido = "ERROR";
				}
				String nombreProductoOfertado = rs.getString(5);
				String descripcionTecnicaRequerida = rs.getString(6);
				if (descripcionTecnicaRequerida == null)
				{
					descripcionTecnicaRequerida = "NINGUNA";
				}
				String descripcionTecnicaOfertada = rs.getString(7);
				String unidadPresentacionRequerida = rs.getString(8);
				if (unidadPresentacionRequerida == null)
				{
					unidadPresentacionRequerida = "NINGUNA";
				}
				String unidadPresentacionOfertada = rs.getString(9);
				String origenFP = rs.getString(10);
				String numCertRegSan = rs.getString(11);
				if (numCertRegSan == null)
				{
					numCertRegSan = "NINGUNO";
				}
				String numCertBPM = rs.getString(12);
				if (numCertBPM == null)
				{
					numCertBPM = "NINGUNO";
				}
				float cantidadRequerida = rs.getFloat(13);
				float cantidadOfertada = rs.getFloat(14);
				float precioUnitarioAcordado = rs.getFloat(15);
				float precioTotal = rs.getFloat(16);
				String moneda = rs.getString(17);
				String tiempoEntregaOfertado = rs.getString(18);
				String vidaUtilOfertada = rs.getString(19);
				float cantidadEmpaquePrimario = rs.getFloat(20);
				float cantidadEmpaqueSecundario = rs.getFloat(21);
				String regSanCriterio = rs.getString(22);
				if (regSanCriterio == null)
				{
					regSanCriterio = "-";
				}
				String cantCriterio = rs.getString(23);
				if (cantCriterio == null)
				{
					cantCriterio = "-";
				}
				String certBPMCriterio = rs.getString(24);
				if (certBPMCriterio == null)
				{
					certBPMCriterio = "-";
				}
				String tiempoEntregaCriterio = rs.getString(25);
				if (tiempoEntregaCriterio == null)
				{
					tiempoEntregaCriterio = "-";
				}
				String vidaUtilCriterio = rs.getString(26);
				if (vidaUtilCriterio == null)
				{
					vidaUtilCriterio = "-";
				}
				String recomendacionCE = rs.getString(27);
				if (recomendacionCE == null)
				{
					recomendacionCE = "-";
				}
				String criterioRecomendacion = rs.getString(28);
				if (criterioRecomendacion == null)
				{
					criterioRecomendacion = "-";
				}
				String prelacionRT = rs.getString(29);
				if (prelacionRT == null)
				{
					prelacionRT = "-";
				}
				String observaciones = rs.getString(30);
				if (observaciones == null)
				{
					observaciones = "-";
				}
				String recomendacionesBeneficiarios = rs.getString(31);
				if (recomendacionesBeneficiarios == null)
				{
					recomendacionesBeneficiarios = "-";
				}
				String estadoCompra = rs.getString(32);
				if (estadoCompra == null)
				{
					estadoCompra = "SIN ESTADO";
				}
				String observacionEstadoCompra = rs.getString(33);
				if (observacionEstadoCompra == null)
				{
					observacionEstadoCompra = "-";
				}
				String aclaracion = rs.getString(34);
				if (aclaracion == null)
				{
					aclaracion = "-";
				}
				String regSanVenc = rs.getString(35);
				if (regSanVenc == null)
				{
					regSanVenc = "-";
				}
				String certBPMVenc = rs.getString(36);
				if (certBPMVenc == null)
				{
					certBPMVenc = "-";
				}
				String ratificacionCT = rs.getString(37);
				if (ratificacionCT == null)
				{
					ratificacionCT = "-";
				}
				String criterioResolucionCT = rs.getString(38);
				if (criterioResolucionCT == null)
				{
					criterioResolucionCT = "-";
				}
				String comentariosRatificacion = rs.getString(39);
				if (comentariosRatificacion == null)
				{
					comentariosRatificacion = "-";
				}
				String prelacion = rs.getString(40);
				if (prelacion == null)
				{
					prelacion = "0";
				}
				
				String id = rs.getString(41);
				if (id == null)
				{
					id = "0";
				}
				
				String segundaRCC = rs.getString(42);
				if (segundaRCC == null)
				{
					segundaRCC = "SIN SOLICITAR";
				}
				
				
				j += "[" + "\"" + fechaRatificacion + "\"," + "\"" +
								  codSolicitudDisponibilidad + "\"," + "\"" +
								  proveedor + "\"," + "\"" +
								  codigoATC + "\"," + "\"" +
								  nombreProductoRequerido + "\"," + "\"" +
								  nombreProductoOfertado + "\"," + "\"" +
								  descripcionTecnicaRequerida + "\"," + "\"" +
								  descripcionTecnicaOfertada + "\"," + "\"" +
								  unidadPresentacionRequerida + "\"," + "\"" +
								  unidadPresentacionOfertada + "\"," + "\"" +
								  origenFP + "\"," + "\"" +
								  numCertRegSan + "\"," + "\"" +
								  regSanVenc + "\"," + "\"" +
								  numCertBPM + "\"," + "\"" +
								  certBPMVenc + "\"," + "\"" +
								  cantidadRequerida + "\"," + "\"" +
								  cantidadOfertada + "\"," + "\"" +
								  precioUnitarioAcordado + "\"," + "\"" +
								  precioTotal + "\"," + "\"" +
								  moneda + "\"," + "\"" +
								  tiempoEntregaOfertado + "\"," + "\"" +
								  vidaUtilOfertada + "\"," + "\"" +
								  cantidadEmpaquePrimario + "\"," + "\"" +
								  cantidadEmpaqueSecundario + "\"," + "\"" +
								  regSanCriterio + "\"," + "\"" +
								  cantCriterio + "\"," + "\"" +
								  certBPMCriterio + "\"," + "\"" +
								  tiempoEntregaCriterio + "\"," + "\"" +
								  vidaUtilCriterio + "\"," + "\"" +
								  recomendacionCE + "\"," + "\"" +
								  criterioRecomendacion + "\"," + "\"" +
								  prelacionRT + "\"," + "\"" +
								  observaciones + "\"," + "\"" +
								  recomendacionesBeneficiarios + "\"," + "\"" +
								  estadoCompra + "\"," + "\"" +
								  observacionEstadoCompra + "\"," + "\"" +
								  aclaracion + "\"," + "\"" +
								  ratificacionCT + "\"," + "\"" +
								  criterioResolucionCT + "\"," + "\"" +
								  comentariosRatificacion + "\"," + "\"" +
								  prelacion + "\"," + "\"" +
								  id + "\"," + "\"" +
								  segundaRCC + "\"],";
			}
			
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"," + "\"" +
						  		  empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			arList = j;
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return arList;
	}
	
	
	public static String getAllByNoItemForRatifiedOffers_JSON_(String buyRequestCod, long noItems, String prelacionRTS ) {
		String arList = "";
		System.out.println(buyRequestCod + " "+ noItems + " "+ prelacionRTS) ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(					
					"select lrSDADLP.id, oALP.distribuidor, lrSDADLP.noItem, lrSDADLP.codigoATC, oALP.codSesal, lrSDADLP.nombreProductoRequerido,\r\n"
					+ "lrSDADLP.nombreProductoOfertado, lrSDADLP.descripcionTecnicaRequerida, lrSDADLP.descripcionTecnicaOfertada, \r\n"
					+ "lrSDADLP.unidadPresentacionRequerida, lrSDADLP.unidadPresentacionOfertada, lrSDADLP.cantidadRequerida, \r\n"
					+ "lrSDADLP.cantidadOfertada, lrSDADLP.moneda, lrSDADLP.precioUnitarioAcordado, lrSDADLP.precioTotal, oALP.noOfertasRecibidas,\r\n"
					+ "oALP.paisOrigen, lrSDADLP.numRegSanitarioVen, lrSDADLP.fechaRegSanitarioVen, oALP.fechaEmisionSan, oALP.registroSanitario,\r\n"
					+ "lrSDADLP.numCerBPMVen, lrSDADLP.fechaCerBPMVen, oALP.fechaEmisionManufactura, oALP.etiquetadoPrimario,\r\n"
					+ "oALP.etiquetadoSecundario, oALP.etiquetadoTerciario, oALP.vidaUtil, lrSDADLP.vidaUtilOfertada, oALP.tiempoEntrega,\r\n"
					+ "lrSDADLP.tiempoEntregaOfertado, SCalp.codSolicitudCompra, SDalp.codSolicitudDisponibilidad, oALP.prelacionRALP,\r\n"
					+ "lrSDADLP.criterioRecomendacion, oALP.obsInformeRCC,\r\n"
					+ "lrSDADLP.ratificacionCT, lrSDADLP.criterioResolucionCT, lrSDADLP.comentariosRatificacion, lrSDADLP.segundaRCC, lrSDADLP.estadoCompra, lrSDADLP.prelacionRT \r\n"
					+ "from listaRequerimientoSolicitudDisponibilidadALP as lrSDADLP\r\n"
					+ "INNER JOIN ofertaALP as oALP on lrSDADLP.noOferta = oALP.noOferta\r\n"
					+ "INNER JOIN solicitudDisponibilidadALP AS SDalp ON SDalp.id = lrSDADLP.idSolicitudDisponibilidad\r\n"
					+ "INNER JOIN solicitudCompraALP AS SCalp on SCalp.id = SDalp.idSolicitudCompra\r\n"
					+ "where lrSDADLP.codSolicitudCompra = ? and lrSDADLP.noItem=? and lrSDADLP.recomendacionCE='SI'");
			ps.setLong(2, noItems);
			ps.setString(1, buyRequestCod);
			//ps.setString(1, prelacionRTS);
			ResultSet rs = ps.executeQuery();
			String j = "{ \"data\":[";
			int count = 0;
			while (rs.next()) {
				count++;
				
				String id = rs.getString(1);
				String distribuidor = rs.getString(2);  
				String noItem = rs.getString(3);
				String codigoATC = rs.getString(4);
				String codSesal  = rs.getString(5);
				String nombreProductoRequerido = rs.getString(6);
				String nombreProductoOfertado  = rs.getString(7);
				String descripcionTecnicaRequerida  = rs.getString(8);
				String descripcionTecnicaOfertada  = rs.getString(9);
				String unidadPresentacionRequerida  = rs.getString(10);
				String unidadPresentacionOfertada  = rs.getString(11);
				String cantidadRequerida = rs.getString(12);
				String cantidadOfertada  = rs.getString(13);
				String moneda = rs.getString(14);
				String precioUnitarioAcordado = rs.getString(15);
				String precioTotal = rs.getString(16);
				String noOfertasRecibidas = rs.getString(17);
				String paisOrigen = rs.getString(18);
				String numRegSanitarioVen = rs.getString(19);
				String fechaRegSanitarioVen  = rs.getString(20);
				String fechaEmisionSan = rs.getString(21);
				String registroSanitario = rs.getString(22);
				String numCerBPMVen = rs.getString(23);
				String fechaCerBPMVen  = rs.getString(24);
				String fechaEmisionManufactura  = rs.getString(25);
				String etiquetadoPrimario = rs.getString(26);
				String etiquetadoSecundario  = rs.getString(27);
				String etiquetadoTerciario  = rs.getString(28);
				String vidaUtil = rs.getString(29);
				String vidaUtilOfertada  = rs.getString(30);
				String tiempoEntrega = rs.getString(31);
				String tiempoEntregaOfertado  = rs.getString(32);
				String codSolicitudCompra = rs.getString(33);
				String codSolicitudDisponibilidad  = rs.getString(34);
				String prelacionRALP = rs.getString(35);
				String criterioRecomendacion  = rs.getString(36);
				String obsInformeRCC = rs.getString(37);
				
				
				String ratificacionCT = rs.getString(38);
				String criterioResolucionCT = rs.getString(39);
				String comentariosRatificacion = rs.getString(40);
				String segundaRCC = rs.getString(41);
				String estadoCompra = rs.getString(42); 
				String prelacionRT = rs.getString(43);
				

				j += "[" + "\"" + id + "\"," + "\"" 
								+ ratificacionCT + "\"," + "\""
								+ criterioResolucionCT + "\"," + "\""
								+ comentariosRatificacion + "\"," + "\""
								+ segundaRCC + "\"," + "\""
								+ estadoCompra + "\"," + "\""
								+ prelacionRT + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								
								+ distribuidor + "\"," + "\""
								+ noItem + "\"," + "\""
								+ codigoATC + "\"," + "\""
								+ codSesal + "\"," + "\""
								+ nombreProductoRequerido + "\"," + "\""
								+ nombreProductoOfertado + "\"," + "\""
								+ descripcionTecnicaRequerida + "\"," + "\""
								+ descripcionTecnicaOfertada + "\"," + "\""
								+ unidadPresentacionRequerida + "\"," + "\""
								+ unidadPresentacionOfertada + "\"," + "\""
								+ cantidadRequerida + "\"," + "\""
								+ cantidadOfertada + "\"," + "\""
								+ moneda + "\"," + "\""
								+ precioUnitarioAcordado + "\"," + "\""
								+ precioTotal + "\"," + "\""
								+ noOfertasRecibidas + "\"," + "\""
								+ paisOrigen + "\"," + "\""
								+ numRegSanitarioVen + "\"," + "\""
								+ fechaRegSanitarioVen + "\"," + "\""
								+ fechaEmisionSan + "\"," + "\""
								+ registroSanitario + "\"," + "\""
								+ numCerBPMVen + "\"," + "\""
								+ fechaCerBPMVen + "\"," + "\""
								+ fechaEmisionManufactura + "\"," + "\""
								+ etiquetadoPrimario + "\"," + "\""
								+ etiquetadoSecundario + "\"," + "\""
								+ etiquetadoTerciario + "\"," + "\""
								+ vidaUtil + "\"," + "\""
								+ vidaUtilOfertada + "\"," + "\""
								+ tiempoEntrega + "\"," + "\""
								+ tiempoEntregaOfertado + "\"," + "\""
								+ codSolicitudCompra + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								+ prelacionRALP + "\"," + "\""
								+ criterioRecomendacion + "\"," + "\""
								+ obsInformeRCC + "\"],";
				
		}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"," + "\""
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"," + "\""
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			arList = j;
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return arList;
	}
	
	public static ArrayList<listaRequerimientoSolicitudDisponibilidadALP> getAllBySDIDSIoFERTAADO(long SDID) {
		ArrayList<listaRequerimientoSolicitudDisponibilidadALP> reqList = new ArrayList<>();
		try {
				System.out.println(SDID + " SDID");
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select fechaVaciado, noItem, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, fechaEvaluacion, fechaRecomendacion, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, numRegSanitarioVen, fechaRegSanitarioVen, numCerBPMVen, fechaCerBPMVen, id from dbo.listaRequerimientoSolicitudDisponibilidadALP where idSolicitudDisponibilidad = ? and estadoCompra != 'NO PRESENTO OFERTA' ");
					//"select fechaVaciado, noItem, codigoATC, nombreProductoRequerido, nombreProductoOfertado, descripcionTecnicaRequerida, descripcionTecnicaOfertada, unidadPresentacionRequerida, unidadPresentacionOfertada, origenFP, numCertRegSan, numCertBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, moneda, tiempoEntregaOfertado, vidaUtilOfertada, cantidadEmpaquePrimario, cantidadEmpaqueSecundario, fechaEvaluacion, fechaRecomendacion, regSanCriterio, cantCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, recomendacionCE, criterioRecomendacion, prelacionRT, observaciones, recomendacionesBeneficiarios, estadoCompra, observacionEstadoCompra, aclaracion, regSanVenc, certBPMVenc, numRegSanitarioVen, fechaRegSanitarioVen, numCerBPMVen, fechaCerBPMVen, id from dbo.listaRequerimientoSolicitudDisponibilidadALP where idSolicitudDisponibilidad = ? and prelacionRT ='1'");
			ps.setLong(1, SDID);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudDisponibilidadALP lr = new listaRequerimientoSolicitudDisponibilidadALP();
				lr.setFechaVaciado(rs.getString(1));
				if (rs.getString(1) == null)
				{
					lr.setFechaVaciado("-");
				}
				lr.setNoItem(rs.getInt(2));
				lr.setCodigoATC(rs.getString(3));
				lr.setNombreProductoRequerido(rs.getString(4));
				if (rs.getString(4) == null)
				{
					lr.setNombreProductoRequerido("ERROR");
				}
				lr.setNombreProductoOfertado(rs.getString(5));
				lr.setDescripcionTecnicaRequerida(rs.getString(6));
				if (rs.getString(6) == null)
				{
					lr.setDescripcionTecnicaRequerida("NO AGREGADA");
				}
				lr.setDescripcionTecnicaOfertada(rs.getString(7));
				lr.setUnidadPresentacionRequerida(rs.getString(8));
				if (rs.getString(8) == null)
				{
					lr.setUnidadPresentacionRequerida("NINGUNA");
				}
				lr.setUnidadPresentacionOfertada(rs.getString(9));
				lr.setOrigenFP(rs.getString(10));
				lr.setNumCertRegSan(rs.getString(11));
				if (rs.getString(11) == null)
				{
					lr.setNumCertRegSan("NINGUNO");
				}
				lr.setNumCertBPM(rs.getString(12));
				if (rs.getString(12) == null)
				{
					lr.setNumCertRegSan("NINGUNO");
				}
				lr.setCantidadRequerida(rs.getFloat(13));
				lr.setCantidadOfertada(rs.getInt(14));
				lr.setPrecioUnitarioAcordado(rs.getFloat(15));
				lr.setPrecioTotal(rs.getFloat(16));
				lr.setMoneda(rs.getString(17));
				lr.setTiempoEntregaOfertado(rs.getString(18));
				lr.setVidaUtilOfertada(rs.getString(19));
				lr.setCantidadEmpaquePrimario(rs.getInt(20));
				lr.setCantidadEmpaqueSecundario(rs.getInt(21));
				lr.setFechaEvaluacion(rs.getString(22));
				if (rs.getString(22) == null)
				{
					lr.setFechaEvaluacion("-");
				}
				lr.setFechaRecomendacion(rs.getString(23));
				if (rs.getString(23) == null)
				{
					lr.setFechaRecomendacion("-");
				}
				lr.setRegSanCriterio(rs.getString(24));
				if (rs.getString(24) == null)
				{
					lr.setRegSanCriterio("-");
				}
				lr.setCantCriterio(rs.getString(25));
				if (rs.getString(25) == null)
				{
					lr.setCantCriterio("-");
				}
				lr.setCertBPMCriterio(rs.getString(26));
				if (rs.getString(26) == null)
				{
					lr.setCertBPMCriterio("-");
				}
				lr.setTiempoEntregaCriterio(rs.getString(27));
				if (rs.getString(27) == null)
				{
					lr.setTiempoEntregaCriterio("-");
				}
				lr.setVidaUtilCriterio(rs.getString(28));
				if (rs.getString(28) == null)
				{
					lr.setVidaUtilCriterio("-");
				}
				lr.setRecomendacionCE(rs.getString(29));
				if (rs.getString(29) == null)
				{
					lr.setRecomendacionCE("-");
				}
				lr.setCriterioRecomendacion(rs.getString(30));
				if (rs.getString(30) == null)
				{
					lr.setCriterioRecomendacion("-");
				}
				lr.setPrelacionRT(rs.getString(31));
				if (rs.getString(31) == null)
				{
					lr.setPrelacionRT("-");
				}
				lr.setObservaciones(rs.getString(32));
				if (rs.getString(32) == null)
				{
					lr.setObservaciones("-");
				}
				lr.setRecomendacionesBeneficiarios(rs.getString(33));
				if (rs.getString(33) == null)
				{
					lr.setRecomendacionesBeneficiarios("-");
				}
				lr.setEstadoCompra(rs.getString(34));
				lr.setObservacionEstadoCompra(rs.getString(35));
				if (rs.getString(35) == null)
				{
					lr.setObservacionEstadoCompra("-");
				}
				lr.setAclaracion(rs.getString(36));
				if (rs.getString(36) == null)
				{
					lr.setAclaracion("-");
				}
				lr.setRegSanVenc(rs.getString(37));
				if (rs.getString(37) == null)
				{
					lr.setRegSanVenc("-");
				}
				lr.setCertBPMVenc(rs.getString(38));
				if (rs.getString(38) == null)
				{
					lr.setCertBPMVenc("-");
				}
				lr.setnumRegSanitarioVen(rs.getString(39));
				if (rs.getString(39) == null)
				{
					lr.setnumRegSanitarioVen("-");
				}
				lr.setfechaRegSanitarioVen(rs.getString(40));
				if (rs.getString(40) == null)
				{
					lr.setfechaRegSanitarioVen("-");
				}
				lr.setnumCerBPMVen(rs.getString(41));
				if (rs.getString(41) == null)
				{
					lr.setnumCerBPMVen("-");
				}
				lr.setfechaCerBPMVen(rs.getString(42));
				if (rs.getString(42) == null)
				{
					lr.setfechaCerBPMVen("-");
				}
				lr.setId(Long.parseLong(rs.getString(43)));

				reqList.add(lr);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	
	public static String getAll(String buyRequestCod, int idPadre) {
		System.out.println(" parametros " + buyRequestCod );
		String arList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select lrSDalp.id, lrSDalp.noOferta, oALP.noOfertaIngresada, oALP.distribuidor, lrSDalp.noItem, lrSDalp.codigoATC, oALP.codSesal, lrSDalp.nombreProductoRequerido,\r\n"
					+ "lrSDalp.nombreProductoOfertado, lrSDalp.descripcionTecnicaRequerida, lrSDalp.descripcionTecnicaOfertada, lrSDalp.unidadPresentacionRequerida, lrSDalp.unidadPresentacionOfertada, lrSDalp.cantidadRequerida,\r\n"
					+ "lrSDalp.cantidadOfertada,  lrSDalp.moneda, lrSDalp.precioUnitarioAcordado,\r\n"
					+ "lrSDalp.precioTotal, oALP.nombreFabricante, oALP.paisOrigen, oALP.registroSanitario, lrSDalp.numRegSanitarioVen, oALP.fechaVencSan,\r\n"
					+ "oALP.fechaEmisionSan, oALP.certificadoManufactura, oALP.numCertif, oALP.fechaVencManufactura, oALP.fechaEmisionManufactura, oALP.etiquetadoPrimario,\r\n"
					+ "oALP.etiquetadoSecundario, oALP.etiquetadoTerciario, oALP.obsOfertasProv, oALP.noFoliosOferta, oALP.muestraPresentada, oALP.solicitudesAclaracion,\r\n"
					+ "oALP.respuestaSolicitudesAclaracion, oALP.consultasArsa, oALP.consultasBenef, oALP.obsOfertaCEO, oALP.recomendacionComite, oALP.criterioRecomendacion,\r\n"
					+ "oALP.observaciones, oALP.recomendacionesBeneficiario, oALP.recomendacionComite, oALP.prelacionRALP, oALP.criterioRecomendacion, oALP.observaciones, oALP.recomendacionesBeneficiario, lrSDalp.prelacionRT\r\n"
					+ "from listaRequerimientoSolicitudDisponibilidadALP AS lrSDalp\r\n"
					+ "INNER JOIN ofertaALP as oALP ON oALP.noOferta = lrSDalp.noOferta\r\n"
					+ "where codSolicitudCompra = ? and estadoCompra = 'EVALUACION REALIZADA' or estadoCompra = 'RECOMENDACION REALIZADA'");
			
			ps.setString(1, buyRequestCod);
			//ps.setLong(3, coddSd);
			ResultSet rs = ps.executeQuery();
			String j = "{ \"data\":[";
			int count = 0;
			while (rs.next()) {
				count++;
				
				String id = rs.getString(1); if (id == null){id = "0";}
				String noOferta = rs.getString(2); if (noOferta == null){noOferta = "-";}
				String noOfertaIngresada = rs.getString(3); if (noOfertaIngresada == null){noOfertaIngresada = "0";}
				String distribuidor = rs.getString(4); if (distribuidor == null){distribuidor = "-";}
				String noItem = rs.getString(5); if (noItem == null){noItem = "0";}
				String codigoATC = rs.getString(6); if (codigoATC == null){codigoATC = "-";}
				String codSesal = rs.getString(7); if (codSesal == null){codSesal = "0";}
				String nombreProductoRequerido = rs.getString(8); if (nombreProductoRequerido == null){nombreProductoRequerido = "-";}
				String nombreProductoOfertado = rs.getString(9); if (nombreProductoOfertado == null){nombreProductoOfertado = "-";}
				String descripcionTecnicaRequerida = rs.getString(10); if (descripcionTecnicaRequerida == null){descripcionTecnicaRequerida = "-";}
				String descripcionTecnicaOfertada = rs.getString(11); if (descripcionTecnicaOfertada == null){descripcionTecnicaOfertada = "-";}
				
				
				String unidadPresentacionRequerida = rs.getString(12); if (unidadPresentacionRequerida == null){unidadPresentacionRequerida = "-";}
				String unidadPresentacionOfertada = rs.getString(13); if (unidadPresentacionOfertada == null){unidadPresentacionOfertada = "-";}
				String cantidadRequerida = rs.getString(14); if (cantidadRequerida == null){cantidadRequerida = "0";}
				String cantidadOfertada = rs.getString(15); if (cantidadOfertada == null){cantidadOfertada = "0";}
				
				String moneda = rs.getString(16); if (moneda == null){moneda = "-";}
				String precioUnitarioAcordado = rs.getString(17); if (precioUnitarioAcordado == null){precioUnitarioAcordado = "-";}
				String precioTotal = rs.getString(18); if (precioTotal == null){precioTotal = "0";}
				String nombreFabricante = rs.getString(19); if (nombreFabricante == null){nombreFabricante = "-";}
				String paisOrigen = rs.getString(20); if (paisOrigen == null){paisOrigen = "-";}
				
				String registroSanitario = rs.getString(21); if (registroSanitario == null){registroSanitario = "-";}
				
				String numRegSanitarioVen = rs.getString(22); if (numRegSanitarioVen == null){numRegSanitarioVen = "-";}
				String fechaVencSan = rs.getString(23); if (fechaVencSan == null){fechaVencSan = "-";}
				String fechaEmisionSan = rs.getString(24); if (fechaEmisionSan == null){fechaEmisionSan = "-";}
				String certificadoManufactura = rs.getString(25); if (certificadoManufactura == null){certificadoManufactura = "-";}
				String numCertif = rs.getString(26); if (numCertif == null){numCertif = "-";}
				String fechaVencManufactura = rs.getString(27); if (fechaVencManufactura == null){fechaVencManufactura = "-";}
				String fechaEmisionManufactura = rs.getString(28); if (fechaEmisionManufactura == null){fechaEmisionManufactura = "-";}
				String etiquetadoPrimario = rs.getString(29); if (etiquetadoPrimario == null){etiquetadoPrimario = "-";}
				String etiquetadoSecundario = rs.getString(30); if (etiquetadoSecundario == null){etiquetadoSecundario = "-";}
				String etiquetadoTerciario = rs.getString(31); if (etiquetadoTerciario == null){etiquetadoTerciario = "-";}
				String obsOfertasProv = rs.getString(32); if (obsOfertasProv == null){obsOfertasProv = "-";}
				String noFoliosOferta = rs.getString(33); if (noFoliosOferta == null){noFoliosOferta = "-";}
				String muestraPresentada = rs.getString(34); if (muestraPresentada == null){muestraPresentada = "-";}
				String solicitudesAclaracion = rs.getString(35); if (solicitudesAclaracion == null){solicitudesAclaracion = "-";}
				String respuestaSolicitudesAclaracion = rs.getString(36); if (respuestaSolicitudesAclaracion == null){respuestaSolicitudesAclaracion = "-";}
				String consultasArsa = rs.getString(37); if (consultasArsa == null){consultasArsa = "-";}
				String consultasBenef = rs.getString(38); if (consultasBenef == null){consultasBenef = "-";}
				String obsOfertaCEO = rs.getString(39); if (obsOfertaCEO == null){obsOfertaCEO = "-";}
				
				String historialCumpleCalidad = "VER REPORTE";
				String historialCumpleContrato = "VER REPORTE";
				
				String recomendacionComite = rs.getString(40); if (recomendacionComite == null){recomendacionComite = "-";}
				String criterioRecomendacion = rs.getString(41); if (criterioRecomendacion == null){criterioRecomendacion = "-";}
				String observaciones = rs.getString(42); if (observaciones == null){observaciones = "-";}
				String recomendacionesBeneficiario = rs.getString(43); if (recomendacionesBeneficiario == null){recomendacionesBeneficiario = "-";}
				
				String recomendacionComite2 = rs.getString(44); if (recomendacionComite2 == null){recomendacionComite2 = "-";}
				String prelacionRALP = rs.getString(45); if (prelacionRALP == null){prelacionRALP = "-";}
				String criterioRecomendacion2 = rs.getString(46); if (criterioRecomendacion2 == null){criterioRecomendacion2 = "-";}
				String observaciones2 = rs.getString(47); if (observaciones2 == null){observaciones2 = "-";}
				String recomendacionesBeneficiario2 = rs.getString(48); if (recomendacionesBeneficiario2 == null){recomendacionesBeneficiario2 = "-";}
				String prelacionRT = rs.getString(49); if (prelacionRT == null){prelacionRT = "-";}
				
				String CE = "";
				//String criteriosEvaluacion = "<td><ul>";
				String criteriosEvaluacion = "";
				ArrayList<CriterioEvaluacionDTO> cd = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpcionesRecomendacion(rs.getInt(1));
				
				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
					//criteriosEvaluacion += "<li> <b> CITERIO: </b> "+opcionesCriterios.getNombreCriterio().toUpperCase() +" <strong> &nbsp;&nbsp;OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle().toUpperCase() +"</li> ";
					criteriosEvaluacion += "\"" + opcionesCriterios.getNombreCriterioDetalle().toUpperCase() + "\",";
				}
				//criteriosEvaluacion += "</ul></td>";
				
				CE =criteriosEvaluacion;
				
				j += "[" + "\"" + id + "\","  + "\"" 
						+ noOfertaIngresada + "\"," + "\"" 
						+ distribuidor + "\"," + "\""
						+ noItem + "\"," + "\"" 
						+ codigoATC + "\"," + "\"" 
						+ codSesal + "\"," + "\"" 
						+ nombreProductoRequerido + "\"," + "\"" 
						+ nombreProductoOfertado + "\"," + "\"" 
						+ descripcionTecnicaRequerida + "\"," + "\""						
						+ descripcionTecnicaOfertada + "\"," + "\"" 
						+ unidadPresentacionRequerida + "\"," + "\"" 
						+ unidadPresentacionOfertada+ "\"," + "\"" 
						+ cantidadRequerida+ "\"," + "\"" 
						+ cantidadOfertada+ "\"," + "\"" 	
						+ moneda+ "\"," + "\""
						+ precioUnitarioAcordado + "\"," + "\"" 
						+ precioTotal + "\"," + "\"" 
						+ nombreFabricante + "\"," + "\"" 
						+ paisOrigen + "\"," + "\"" 
						+ registroSanitario + "\"," + "\"" 
						+ numRegSanitarioVen + "\"," + "\"" 
						+ fechaVencSan + "\"," + "\"" 
						+ fechaEmisionSan + "\"," + "\"" 
						+ certificadoManufactura + "\"," + "\"" 
						+ numCertif + "\"," + "\"" 
						+ fechaVencManufactura + "\"," + "\"" 
						+ fechaEmisionManufactura + "\"," + "\"" 
						+ etiquetadoPrimario + "\"," + "\"" 
						+ etiquetadoSecundario + "\"," + "\""
						+ etiquetadoTerciario + "\"," + "\"" 
						+ obsOfertasProv + "\"," + "\"" 
						+ noFoliosOferta + "\"," + "\""
						+ muestraPresentada + "\"," + "\"" 
						+ solicitudesAclaracion + "\"," + "\""
						+ respuestaSolicitudesAclaracion + "\"," + "\"" 
						+ consultasArsa + "\"," + "\""
						+ consultasBenef + "\"," + "\"" 
						+ obsOfertaCEO + "\"," + "\""
						+ historialCumpleCalidad + "\"," + "\"" 
						+ historialCumpleContrato + "\"," + "\""
						
						//Mostrar Ocultos Usados solo para optener la data
						+ recomendacionComite + "\"," + "\""									
						+ criterioRecomendacion + "\"," + "\"" 
						+ observaciones +  "\"," + "\"" 
						+ recomendacionesBeneficiario +  "\"," + "\""  
						+ prelacionRT +  "\"," 
						//-----------------------------
						+ CE  + "\"" 
						+ recomendacionComite + "\"," + "\""
						+ prelacionRALP +  "\"," + "\"" 
						+ criterioRecomendacion + "\"," + "\"" 
						+ observaciones +  "\"," + "\"" 																
						+ recomendacionesBeneficiario+ "\"," + "\"" + "\"],";
	}
			
			if (count == 0) {
				int st = 0;
				String criteriosEvaluacion = "";
				String empty = "-";
				
				ps = con.prepareStatement("SELECT ce.NombreCriterio FROM CriterioEvaluacionOpcionVaciadoRecomendacionALP as ceovalp\r\n"
						+ "inner join CriteriosEvaluacion as ce on ceovalp.idC = ce.id\r\n"
						+ "inner join CriteriosEvaluacionDetalle as ced on ceovalp.idCD = ced.id\r\n"
						+ "where ceovalp.idPadre =? \r\n"
						+ "group by ce.NombreCriterio ");				
				ps.setInt(1, idPadre);
				rs = ps.executeQuery();
				while (rs.next()) {
					// st = rs.getInt(1);
					 criteriosEvaluacion +=   "\"" + empty + "\"," ;
				}
				
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," 
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + criteriosEvaluacion + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			arList = j;
			con.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return arList;
	}
	
	
}
