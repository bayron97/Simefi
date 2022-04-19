package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CriterioEvalucionDao {

	public static int save(CriterioEvaluacion l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.CriteriosEvaluacion(NombreCriterio) values(?)");
			ps.setString(1, l.getNombreCriterio());			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static ArrayList<CriterioEvaluacionDTO> getCriteriosById(int id) {
		ArrayList<CriterioEvaluacionDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.CriteriosEvaluacionDetalle where idCE =?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacionDTO ce = new CriterioEvaluacionDTO();
				ce.setIdCE(rs.getInt(1));
				ce.setId(rs.getInt(2));							
				ce.setNombreCriterioDetalle(rs.getString(3));
				ce.setNombreCriterio(rs.getString(4));	
				List.add(ce);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	public static ArrayList<CriterioEvaluacion> getCriterios() {
		ArrayList<CriterioEvaluacion> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio  FROM CriteriosEvaluacion as CE INNER JOIN CriteriosEvaluacionDetalle as CED ON CE.id = CED.idCE where  CE.estado = 'ACTIVO' group by CE.id, CE.NombreCriterio");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacion dc = new CriterioEvaluacion();
				dc.setId(rs.getInt(1));
				dc.setNombreCriterio(rs.getString(2));
				List.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	public static ArrayList<CriterioEvaluacion> getCriteriosnEW() {
		ArrayList<CriterioEvaluacion> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio  FROM CriteriosEvaluacion as CE INNER JOIN CriteriosEvaluacionDetalle as CED ON CE.id = CED.idCE where  CE.estado = 'ACTIVO' group by CE.id, CE.NombreCriterio");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriterioEvaluacion dc = new CriterioEvaluacion();
				dc.setId(rs.getInt(1));
				dc.setNombreCriterio(rs.getString(2));
				List.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	public static CriterioEvaluacionDTO getCriteriosByNoCompraAndIdCD(long cod, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio, CEALP.Estado FROM CriterioEvaluacionALP AS CEALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CEALP.idC = CE.id WHERE CEALP.cod = ? and CEALP.idC = ? ");
			ps.setLong(1, cod);
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
	
	public static CriterioEvaluacionDTO getCriteriosByCodAndIdCD(int cod, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CEALP.id, CE.NombreCriterio,  CEALP.Estado, CEALP.idCD FROM CriterioEvaluacionALP AS CEALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CEALP.idC = CE.id WHERE CEALP.cod = ? and CEALP.idC = ? ");
			ps.setInt(1, cod);
			ps.setInt(2, IdC);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				List.setId(rs.getInt(1));
				List.setNombreCriterio(rs.getString(2));				
				List.setEstado(rs.getBoolean(3));
				List.setIdCE(rs.getInt(4));
			
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	
	public static ArrayList<Integer> getIdDC(int cod) {
		ArrayList<Integer> List = new ArrayList<Integer>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CEALP.idC FROM CriterioEvaluacionALP AS CEALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CE.id = CEALP.idC WHERE CEALP.cod = ? ");
			ps.setInt(1, cod);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				List.add(rs.getInt(1));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return List;
	}
	
	
	public static CriterioEvaluacionDTO getCriteriosByCDEstado(int cod, int IdC) {
		CriterioEvaluacionDTO criterio = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CEALP.idC, CE.NombreCriterio, CEALP.aplica FROM CriterioEvaluacionALP  AS CEALP	\r\n"
					+ "	  INNER JOIN CriteriosEvaluacion AS CE ON CEALP.idC = CE.id WHERE CEALP.cod = ? and CE.id = ? ");
			ps.setInt(1, cod);	
			ps.setInt(2, IdC);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				criterio.setidC(rs.getInt(1));
				criterio.setNombreCriterio(rs.getString(2));				
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return criterio;
	}	
	
	
	public static ArrayList<CriterioEvaluacionDTO> getCriteriosByproCompra(int cod) {
		ArrayList<CriterioEvaluacionDTO> ListAplica = new ArrayList<CriterioEvaluacionDTO>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select CEALP.idC, CED.NombreCriterio from [dbo].[CriterioEvaluacionALP] as CEALP\r\n"
					+ "INNER JOIN CriteriosEvaluacionDetalle AS CED ON CEALP.idC = CED.idCE  \r\n"
					+ "where CEALP.Estado = 'true' and CEALP.cod = ?\r\n"
					+ "group by CEALP.idC, CED.NombreCriterio");
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
	
	public static Integer getcodProcesoComALP(String noprocompra) {
		Integer cod = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM procesoCompraALP where noProcesoCompra =?");
			ps.setString(1, noprocompra);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				cod = rs.getInt(1);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return cod;
	}
	
	public static ArrayList<CriteriosEvaluacionDetalle> getLisOpcionesCriterio(int cri) {
		ArrayList<CriteriosEvaluacionDetalle> ListOpciones = new ArrayList<CriteriosEvaluacionDetalle>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select id, NombreCriterioDetalle from [dbo].[CriteriosEvaluacionDetalle] where idCE = ?");
			ps.setInt(1, cri);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				CriteriosEvaluacionDetalle dc = new CriteriosEvaluacionDetalle();
				dc.setId(rs.getInt(1));
				dc.setNombreCriterioDetalle(rs.getString(2));
				ListOpciones.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(cri);
		System.out.println(ListOpciones);
		
		return ListOpciones;
	}
	
	public static int activar(CriterioEvaluacion t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.CriteriosEvaluacion set estado = ?, motivo = ? where id = ?");
			ps.setString(1, t.getestado());
			ps.setString(2, t.getmotivo());
			ps.setInt(3, t.getId());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
}
