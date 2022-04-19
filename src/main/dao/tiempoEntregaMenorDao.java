package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class tiempoEntregaMenorDao {

	public static int save(tiempoEntregaMenor t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.tiempoEntregaMenor(tiempoEntrega, estado, observaciones) values(?,?,?)");
			ps.setString(1, t.getTiempoEntrega());
			ps.setString(2, t.getEstado());
			ps.setString(3, t.getObservaciones());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int activar(tiempoEntregaMenor t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.tiempoEntregaMenor set estado = ?, observaciones = ? where tiempoEntrega = ?");
			ps.setString(1, t.getEstado());
			ps.setString(2, t.getObservaciones());
			ps.setString(3, t.getTiempoEntrega());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
