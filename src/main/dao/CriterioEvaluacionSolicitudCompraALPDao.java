package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CriterioEvaluacionSolicitudCompraALPDao {

	public static int save(CriterioEvaluacionSolicitudCompraALP p) {
		System.out.print(p.getCod() + "----"+ p.getidC() );
		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO dbo.CriterioEvaluacionSolicitudCompraALP(cod, idC) values(?, ?)");
			//ps.setInt(1, p.getid());
			ps.setLong(1, p.getCod());
			ps.setInt(2, p.getidC());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(Long id, CriterioEvaluacionSolicitudCompraALP p) {
		int status = 0;
		System.out.println(p.getEstado());
		System.out.println(p.getid());
		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionSolicitudCompraALP SET Estado=? WHERE id=?");
			ps.setBoolean(1, p.getEstado());			
			ps.setInt(2, p.getid());			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getById(int id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.CriterioEvaluacionSolicitudCompraALP where cod = ?");
			ps.setInt(1, id);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int idd = rs.getInt(1);
				String cod = rs.getString(2);
				String idCD = rs.getString(3);
				

				j += "[" + "\"" + idd + "\"," + "\"" + cod + "\"," + "\"" + idCD + "\"],";
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
	
	public static CriterioEvaluacionDTO getCriteriosByNoCompraAndIdCD(long cod, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio, CESCALP.Estado FROM CriterioEvaluacionSolicitudCompraALP AS CESCALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CESCALP.idC = CE.id WHERE CESCALP.cod = ? and CESCALP.idC = ? ");
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
	
	public static ArrayList<Integer> getIdDC(Long cod) {
		ArrayList<Integer> ListCri = new ArrayList<Integer>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CESPALP.idC FROM CriterioEvaluacionSolicitudCompraALP AS CESPALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CE.id = CESPALP.idC WHERE CESPALP.cod = ? ");
			ps.setLong(1, cod);			
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
	
	public static CriterioEvaluacionDTO getCriteriosByCodAndIdCD(Long cod, int IdC) {
		CriterioEvaluacionDTO Listcri = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CESCALP.id, CE.NombreCriterio,  CESCALP.Estado, CESCALP.idCD FROM CriterioEvaluacionSolicitudCompraALP AS CESCALP\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CESCALP.idC = CE.id WHERE CESCALP.cod = ? and CESCALP.idC = ? ");
			ps.setLong(1, cod);
			ps.setInt(2, IdC);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				Listcri.setId(rs.getInt(1));
				Listcri.setNombreCriterio(rs.getString(2));				
				Listcri.setEstado(rs.getBoolean(3));
				Listcri.setIdCE(rs.getInt(4));
			
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return Listcri;
	}

}
