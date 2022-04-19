package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CriterioEvaluacionAndOpcionesProCompraALPDao {


	public static int saveCriterioByIdS(CriterioEvaluacionDTO p) {		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
			"INSERT INTO dbo.CriterioEvaluacionDetalleALP(idCriterio, idCDFK, noOferta) values(?,?,?)");			
			ps.setLong(1, p.getidC());
			ps.setLong(2, p.getidCD());
			ps.setInt(3, p.getidProceso());			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {	
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateCriteriosBynoOferta(String noOferta, int idCD, int idC) {
		System.out.println("aCTUALIZAR");
		int status = 0;		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionDetalleALP SET idCDFK=? WHERE noOferta=? and idCriterio =?");
			ps.setInt(1, idCD);			
			ps.setString(2, noOferta);		
			ps.setInt(3, idC);		
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " Stado actualiza todo criterios por id");		
		return status;
	}
	
	
	
	public static int updateCriterio(CriterioEvaluacionDTO p) {
		int status = 0;	
		
		System.out.println(p.getEstado() +" "+  p.getidSolicitud() +" "+ p.getidC());
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionVaciadoRecomendacionALP SET Estado=? WHERE idSolicitudDisponibilidad=? and idC=?"
					+ "");
			ps.setBoolean(1, p.getEstado());			
			ps.setLong(2, p.getidSolicitud());
			ps.setLong(3, p.getidC());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status update");
		return status;
	}
	
	
	public static int validarOpcion(String noOferta, int idCriterio ) {
		int existe = 0 ;
		System.out.println(noOferta + " ccccc " + idCriterio);
		try {	
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[CriterioEvaluacionDetalleALP] where idCriterio=? and noOferta=? ");		
			ps.setInt(1, idCriterio); 
			ps.setString(2, noOferta);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}
			
			existe = count;
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;
	}
	
	
	public static String GetCriterios(String noOferta) {
		String existe = "" ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select ce.NombreCriterio, ced.NombreCriterioDetalle  from [dbo].[CriterioEvaluacionDetalleALP] as cedalp\r\n"
					+ "inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio\r\n"
					+ "inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK\r\n"
					+ "where cedalp.noOferta =?");		    
			 ps.setString(1, noOferta);			
			ResultSet rs = ps.executeQuery();
			String count = "";
			if (rs.next()) {
				count += 1;
			}
			existe = count;
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;	
	}
	
	public static ArrayList<CriterioEvaluacionDTO> getCriteriosByproCompra(int cod) {
		ArrayList<CriterioEvaluacionDTO> ListAplica = new ArrayList<CriterioEvaluacionDTO>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select ce.NombreCriterio, ced.NombreCriterioDetalle  from [dbo].[CriterioEvaluacionDetalleALP] as cedalp\r\n"
					+ "inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio\r\n"
					+ "inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK\r\n"
					+ "inner join [dbo].[CriterioEvaluacionALP] as cealp on cedalp.idCriterio = cealp.idC\r\n"
					+ "where cedalp.noOferta = 34 and cealp.Estado = 'true'\r\n"
					+ "group by ce.NombreCriterio, ced.NombreCriterioDetalle");
			ps.setInt(1, cod);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacionDTO dc = new CriterioEvaluacionDTO();
				dc.setidC(rs.getInt(1));
				dc.setNombreCriterio(rs.getString(2));
				dc.setlistDetalle(CriterioEvalucionDao.getLisOpcionesCriterio(dc.getidC()));
				ListAplica.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(cod);
		System.out.println(ListAplica);
		
		return ListAplica;
	}
	
	public static String getCriteriosOpcionesProCompra(int proCompra, int idPK) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select ce.id, CEALP.idC, CED.NombreCriterio from [dbo].[CriterioEvaluacionALP] as CEALP\r\n"
							+ "INNER JOIN CriteriosEvaluacionDetalle AS CED ON CEALP.idC = CED.idCE  \r\n"
							+ "where CEALP.Estado = 'true' and CEALP.cod = ?\r\n"
							+ "group by CEALP.idC, CED.NombreCriterio,ce.id");
			ps.setInt(1, proCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String idCriterio =  rs.getString(1);
				String criterio = rs.getString(2);					
				String checkboxEstado;	
				String opciones;	
				String op = "";				
				
				ArrayList<CriterioEvaluacionDTO> opcioneslist = CriterioEvaluacionAndOpcionesALPDao.getCriteriosOpcionesByIdCrt(Integer.parseInt(idCriterio));
				
				opciones = "<select name='opcionSeleccionada' class='form-control'>";				
				for(CriterioEvaluacionDTO opcion : opcioneslist){   
					
					System.out.println(idPK +  " " + opcion.getId());
					CriterioEvaluacionDTO registradoGuardado = CriterioEvaluacionAndOpcionesALPDao.getCriterioOpcionByidSolicitudIdCD(idPK, opcion.getId());
					
					System.out.println(registradoGuardado.getNombreCriterioDetalle() + " nombre detalle");
					 if (registradoGuardado.getNombreCriterioDetalle() != null && registradoGuardado.getNombreCriterioDetalle().equalsIgnoreCase(opcion.getNombreCriterioDetalle())) {
						
						 opciones += "<option value=" + opcion.getId() +" selected>"+opcion.getNombreCriterioDetalle()+" </option>";
					}else {
						 System.out.println("iguales");
						 opciones += "<option value=" + opcion.getId() +">"+opcion.getNombreCriterioDetalle()+" </option>";
						
					}					
				}				
				opciones += "</select>";				
				op = opciones;
				
				j += "[" + "\"" + "<input type='text' style=' border: 0; background-color:transparent;' name='idCriterio' value='" + idCriterio + "'/>" + "\"," + "\"" + criterio + "\"," + "\"" + op  +  "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty  + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
}
