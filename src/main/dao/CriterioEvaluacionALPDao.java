package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CriterioEvaluacionALPDao {

	public static int save(CriterioEvaluacionALP p) {
		System.out.print(p.getCod() + "----"+ p.getidC() );
		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO dbo.CriterioEvaluacionALP(cod, idC) values(?, ?)");
			//ps.setInt(1, p.getid());
			ps.setInt(1, p.getCod());
			ps.setInt(2, p.getidC());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(int id, CriterioEvaluacionALP p) {
		int status = 0;
		System.out.println(p.getEstado());
		System.out.println(p.getid());
		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.CriterioEvaluacionALP SET Estado=? WHERE id=?");
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
			PreparedStatement ps = con.prepareStatement("select * from dbo.CriterioEvaluacionALP where cod = ?");
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
	
	public static int validarOpcionCriterioNew(String CrEvaluacion, String CrEvaluacionDetalle) {
		
		System.out.println(CrEvaluacion + " " + CrEvaluacionDetalle);
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from CriteriosEvaluacionDetalle where NombreCriterio =? and NombreCriterioDetalle =? ");		
			 ps.setString(1, CrEvaluacion);
			 ps.setString(2, CrEvaluacionDetalle);
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
	
public static int validarCriterioNew(String CrEvaluacion) {
		
		System.out.println(CrEvaluacion );
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from CriteriosEvaluacion where NombreCriterio =?");		
			 ps.setString(1, CrEvaluacion);
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

}
