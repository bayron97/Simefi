package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class numeroProcesoMenorDao {

	public static int update(numeroProcesoMenor p, String cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.numeroProcesoMenor set idProc = ?, cod = ?, estado = ? where cod = ?");
			ps.setInt(1, p.getIdProc());
			ps.setString(2, p.getCod());
			ps.setString(3, p.getEstado());
			ps.setString(4, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(numeroProcesoMenor p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("insert into dbo.numeroProcesoMenor(idProc, cod, estado) values(?,?,?)");
			ps.setInt(1, p.getIdProc());
			ps.setString(2, p.getCod());
			ps.setString(3, "DISPONIBLE");
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int count(String cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select count(cod) FROM numeroProcesoMenor where cod like '" + cod + "%'");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
