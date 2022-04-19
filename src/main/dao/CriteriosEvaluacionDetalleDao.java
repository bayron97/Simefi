package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CriteriosEvaluacionDetalleDao {

	public static int update(CriteriosEvaluacionDetalle p, String cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.CriteriosEvaluacionDetalle set NombreCriterioDetalle = ? where id = ? and idCE = ?");
			ps.setString(1, p.getNombreCriterioDetalle());
			ps.setInt(2, p.getId());
			ps.setInt(3, p.getIdCE());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(CriteriosEvaluacionDetalle p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.CriteriosEvaluacionDetalle( idCE, NombreCriterioDetalle,NombreCriterio) values(?,?,?)");
			ps.setInt(1, p.getIdCE());
			ps.setString(2, p.getNombreCriterioDetalle());
			ps.setString(3, p.getNombreCriterio());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
