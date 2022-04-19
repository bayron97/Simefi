package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CriterioEvaluacionGeneralDao {

	public static int save(CriterioEvaluacionGeneral p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO dbo.CriterioEvaluacionGeneral(cod, idC ) VALUES(?, ?)");
			ps.setInt(1, p.getCod());
			ps.setInt(2, p.getidC());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(int id, CriterioEvaluacionGeneral p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionGeneral SET Estado=? WHERE id=?");
			ps.setBoolean(1, p.getEstado());
			ps.setInt(2, p.getid());	
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " aqui");
		return status;
	}

	public static String getById(int id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.CriterioEvaluacionGeneral where cod = ?");
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
			PreparedStatement ps = con.prepareStatement("SELECT CE.id, CE.NombreCriterio, CEG.Estado FROM CriterioEvaluacionGeneral AS CEG\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CEG.idC = CE.id WHERE CEG.cod = ? and CEG.idC = ? ");
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
	
	public static ArrayList<Integer> getIdDC(int cod) {
		ArrayList<Integer> List = new ArrayList<Integer>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CEG.idC FROM CriterioEvaluacionGeneral AS CEG\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CE.id = CEG.idC WHERE CEG.cod = ? ");
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
	
	public static CriterioEvaluacionDTO getCriteriosByCodAndIdCD(int cod, int IdC) {
		CriterioEvaluacionDTO List = new CriterioEvaluacionDTO();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT CEG.id, CE.NombreCriterio,  CEG.Estado FROM CriterioEvaluacionGeneral AS CEG\r\n"
					+ "INNER JOIN CriteriosEvaluacion AS CE ON CEG.idC = CE.id WHERE CEG.cod = ? and CEG.idC = ? ");
			ps.setInt(1, cod);
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

}
