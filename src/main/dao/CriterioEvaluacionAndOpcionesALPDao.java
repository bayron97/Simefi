package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.print.DocFlavor.STRING;



public class CriterioEvaluacionAndOpcionesALPDao {

	
	public static String getAllReqListByBuyRequestJSON(long idvaciado) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT CE.id, CE.NombreCriterio  FROM CriteriosEvaluacion as CE INNER JOIN CriteriosEvaluacionDetalle as CED ON CE.id = CED.idCE group by CE.id, CE.NombreCriterio");
			//ps.setLong(1, idSolicitudCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String id = rs.getString(1);
				String criterio = rs.getString(2);					
				String checkboxEstado;				
				CriterioEvaluacionDTO citeriosTrue = CriterioEvaluacionAndOpcionesALPDao.getCriteriosByidSolicitudAndIdCD(idvaciado, Integer.parseInt(id));
				
				if (citeriosTrue.getEstado() == false)
				{
					
					checkboxEstado = "<input type='checkbox' name='EstadoCriterio' value='" + id + "'/>";
				}
				else 
				{
					checkboxEstado = "<input type='checkbox' name='EstadoCriterio' value='" + id + "' checked/>";
				}				

				j += "[" + "\"" + id + "\"," + "\"" + criterio + "\"," + "\"" + checkboxEstado  +  "\"],";
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
	
	
	public static CriterioEvaluacionDTO getCriteriosByidSolicitudAndIdCD(long idvaciado, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio, CEVRALP.Estado FROM CriterioEvaluacionVaciadoRecomendacionALP AS CEVRALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CEVRALP.idC = CE.id WHERE CEVRALP.idSolicitudDisponibilidad = ? and CEVRALP.idC = ?");
			ps.setLong(1, idvaciado);
			ps.setInt(2, IdC);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				List.setId(rs.getInt(1));
				List.setNombreCriterio(rs.getString(2));
				List.setEstado(rs.getBoolean(3));				
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}

	public static int saveCriterioByIdS(CriterioEvaluacionDTO p) {
		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO dbo.CriterioEvaluacionVaciadoRecomendacionALP(idSolicitudDisponibilidad, idC) values(?, ?)");
			//ps.setInt(1, p.getid());
			ps.setLong(1, p.getidSolicitud());
			ps.setInt(2, p.getidC());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateCriteriosByIdSolicitud(int idSolicitudDisponibilidad) {
		int status = 0;		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionVaciadoRecomendacionALP SET Estado=? WHERE idSolicitudDisponibilidad=?");
			ps.setBoolean(1, false);			
			ps.setLong(2, idSolicitudDisponibilidad);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " Stado actualiza todo criterios por id");
		return status;
	}
	
	public static ArrayList<Integer> getIdByidSolicitud(int idsolicitud) {
		ArrayList<Integer> ListCri = new ArrayList<Integer>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CALP.idC FROM CriterioEvaluacionVaciadoRecomendacionALP AS CALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CE.id = CALP.idC WHERE CALP.idSolicitudDisponibilidad = ? ");
			ps.setLong(1, idsolicitud);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				ListCri.add(rs.getInt(1));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return ListCri;
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
	
	//-----EVALUACION DE OFERTA
	
	public static String getCriteriosOpciones(int idSolicitud, int idPK) {
		String reqList = "";
		try {
			
			int solicitudNUm = CriterioEvaluacionAndOpcionesALPDao.getIdSolicitudCompra(idPK);
			
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select CTALP.idC, CT.NombreCriterio from  CriterioEvaluacionSolicitudCompraALP  CTALP inner join CriteriosEvaluacion CT on CTALP.idC = CT.id where CTALP.cod = ? and CTALP.Estado = 'true'");
			ps.setLong(1, solicitudNUm);
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
	
	public static CriterioEvaluacionDTO getCriterioOpcionByidSolicitudIdCD(long idSolicitud, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select CEOPCION.idCD, CD.NombreCriterioDetalle  from [dbo].[CriterioEvaluacionOpcionVaciadoRecomendacionALP] CEOPCION \r\n"
					+ "INNER JOIN [dbo].[CriteriosEvaluacionDetalle]  CD ON CEOPCION.idCD = CD.id where idSolicitud=? and idCD = ?");
			ps.setLong(1, idSolicitud);
			ps.setInt(2, IdC);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {		
				System.out.println(rs.getInt(1) + " id query");
				List.setId(rs.getInt(1));						
				List.setNombreCriterioDetalle(rs.getString(2));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}

	
	public static ArrayList<CriterioEvaluacionDTO> getCriteriosOpcionesByIdCrt(int idCriterio) {
		ArrayList<CriterioEvaluacionDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select id,NombreCriterioDetalle from CriteriosEvaluacionDetalle where idCE = ?");
			ps.setLong(1, idCriterio);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacionDTO dc = new CriterioEvaluacionDTO();
				dc.setId(rs.getInt(1));
				dc.setNombreCriterioDetalle(rs.getString(2));
				List.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	
	public static int updateCriterioOpcionesByIdSolicitud(int idSolicitudDisponibilidad) {
		int status = 0;		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionOpcionVaciadoRecomendacionALP SET Estado=? WHERE idSolicitud=?");
			ps.setBoolean(1, false);			
			ps.setLong(2, idSolicitudDisponibilidad);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int saveCriterioOpcionsByIdS(CriterioEvaluacionDTO p, int idPadre) {
		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO dbo.CriterioEvaluacionOpcionVaciadoRecomendacionALP(idSolicitud, idC, idCD, idPadre) values(?, ?, ?, ?)");
			//ps.setInt(1, p.getid());
			ps.setLong(1, p.getidSolicitud());
			ps.setInt(2, p.getidC());
			ps.setInt(3, p.getidCD());
			ps.setInt(4, idPadre);
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ArrayList<Integer> getIdByidSolicitudOpciones(int idsolicitud) {
		ArrayList<Integer> ListCri = new ArrayList<Integer>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CALP.idC FROM CriterioEvaluacionOpcionVaciadoRecomendacionALP AS CALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CE.id = CALP.idC WHERE CALP.idSolicitud = ? ");
			ps.setLong(1, idsolicitud);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				ListCri.add(rs.getInt(1));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return ListCri;
	}
	
	public static int updateCriterioOpcion(CriterioEvaluacionDTO p, int idPadre) {
		int status = 0;	
		
		System.out.println(p.getEstado() +" "+  p.getidSolicitud() +" "+ p.getidC());
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionOpcionVaciadoRecomendacionALP SET Estado=?, idCD=?, idPadre=?  WHERE idSolicitud=? and idC=?"
					+ "");
			ps.setBoolean(1, p.getEstado());
			ps.setLong(2, p.getidCD());
			ps.setInt(3, idPadre);
			ps.setLong(4, p.getidSolicitud());
			ps.setLong(5, p.getidC());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status update");
		return status;
	}
	
	public static int getIdSolicitudCompra(long idSolicitudCompra) {
		int cod= 0;
		int count = 0;
		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT sD.idSolicitudCompra  FROM listaRequerimientoSolicitudDisponibilidadALP as listR\r\n"
					+ "inner join solicitudDisponibilidadALP as sD on listR.idSolicitudDisponibilidad = sD.id where listR.id =?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cod = rs.getInt(1);
			}		
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return cod;
	}
	
	
	public static ArrayList<CriterioEvaluacionDTO> getIdBynoOfertaCriteriosOpciones(int noOferta) {	
			ArrayList<CriterioEvaluacionDTO> List = new ArrayList<>();
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement("select ce.NombreCriterio, ced.NombreCriterioDetalle  \r\n"
						+ "from [dbo].[CriterioEvaluacionDetalleALP] as cedalp \r\n"
						+ "inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio \r\n"
						+ "inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK \r\n"
						+ "inner join [dbo].[CriterioEvaluacionALP] as cealp on cedalp.idCriterio = cealp.idC \r\n"
						+ "where cedalp.noOferta =? and cealp.Estado = 'true'\r\n"
						+ "group by ce.NombreCriterio, ced.NombreCriterioDetalle");
				ps.setLong(1, noOferta);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					CriterioEvaluacionDTO dc = new CriterioEvaluacionDTO();
					dc.setNombreCriterio(rs.getString(1));
					dc.setNombreCriterioDetalle(rs.getString(2));
					List.add(dc);
				}
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}

			return List;
		}
	
	public static ArrayList<CriterioEvaluacionDTO> getIdBynoOfertaCriteriosOpcionesHeader(String noProceso) {	
		ArrayList<CriterioEvaluacionDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select ce.NombreCriterio\r\n"
					+ "from [dbo].[CriterioEvaluacionDetalleALP] as cedalp \r\n"
					+ "inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio \r\n"
					+ "inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK \r\n"
					+ "inner join [dbo].[CriterioEvaluacionALP] as cealp on cedalp.idCriterio = cealp.idC \r\n"
					+ "inner join [dbo].[ofertaALP]  as o on o.noOferta = cedalp.noOferta\r\n"
					+ "where o.procesoCompra = ? and cealp.Estado = 'true'\r\n"
					+ "group by ce.NombreCriterio");
			ps.setString(1, noProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacionDTO dc = new CriterioEvaluacionDTO();
				dc.setNombreCriterio(rs.getString(1));
				List.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}

	
	public static ArrayList<CriterioEvaluacionDTO> getIdBynoOfertaCriteriosOpcionesRecomendacion(int id) {	
		ArrayList<CriterioEvaluacionDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT ce.NombreCriterio, ced.NombreCriterioDetalle \r\n"
					+ "FROM CriterioEvaluacionOpcionVaciadoRecomendacionALP as ceovalp\r\n"
					+ "inner join CriteriosEvaluacion as ce on ceovalp.idC = ce.id\r\n"
					+ "inner join CriteriosEvaluacionDetalle as ced on ceovalp.idCD = ced.id\r\n"
					+ "where ceovalp.idSolicitud = ? \r\n"
					+ "group by ce.NombreCriterio, ced.NombreCriterioDetalle ");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacionDTO dc = new CriterioEvaluacionDTO();
				dc.setNombreCriterio(rs.getString(1));
				dc.setNombreCriterioDetalle(rs.getString(2));
				List.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	
	
	public static String getCriteriosOpcionesVaciado(int noOferta) {
		String reqList = "";
		System.out.println(" este " + noOferta );
		try {
			
			
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select cedALP.id, cedALP.idCriterio, ce.NombreCriterio , cedALP.idCDFK, ced.NombreCriterioDetalle \r\n"
					+ "from CriterioEvaluacionDetalleALP  as cedALP\r\n"
					+ "inner join CriteriosEvaluacionDetalle as ced on cedALP.idCDFK = ced.id \r\n"
					+ "inner join CriteriosEvaluacion as ce on ce.id = ced.idCE\r\n"
					+ "where noOferta =?");
			ps.setInt(1, noOferta);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int idCriterio =  rs.getInt(2);
				String criterio = rs.getString(3);
				int idCriterioDetalle = rs.getInt(4);	
				String criterioDetalle = rs.getString(5);
				
				String opciones;	
				String op = "";				
				
				ArrayList<CriterioEvaluacionDTO> opcioneslist = CriterioEvaluacionAndOpcionesALPDao.getCriteriosOpcionesByIdCrt(idCriterio);
				
				opciones = "<select name='opcion' id='opcion' class='form-control'>";				
				for(CriterioEvaluacionDTO opcion : opcioneslist){
					
					 if (opcion.getNombreCriterioDetalle() != null && opcion.getNombreCriterioDetalle().equalsIgnoreCase(criterioDetalle)) {
						
						 opciones += "<option value=" + idCriterioDetalle +" selected>"+criterioDetalle+" </option>";
					}else {
						 System.out.println("iguales");
						 opciones += "<option value=" + opcion.getId() +">"+opcion.getNombreCriterioDetalle()+" </option>";
						
					}					
				}				
				opciones += "</select>";				
				op = opciones;
				
				j += "[" + "\"" + "<input type='text' style=' border: 0; background-color:transparent;' name='idCriterio' id='idCriterio' value='" + idCriterio + "'/>" + "\"," + "\"" + criterio + "\"," + "\"" + op  +  "\"],";
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
	
	public static CriterioEvaluacionDTO getCriterioOpcionByOrden(long noOrden, int idCriterio) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select CEOPCION.idCD, CD.NombreCriterioDetalle  from [dbo].[CriterioEvaluacionOpcionVaciadoRecomendacionALP] CEOPCION \r\n"
					+ "INNER JOIN [dbo].[CriteriosEvaluacionDetalle]  CD ON CEOPCION.idCD = CD.id where idSolicitud=? and idCD = ?");
			ps.setLong(1, noOrden);
			ps.setInt(2, idCriterio);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {		
				System.out.println(rs.getInt(1) + " id query");
				List.setId(rs.getInt(1));						
				List.setNombreCriterioDetalle(rs.getString(2));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}

	
}
