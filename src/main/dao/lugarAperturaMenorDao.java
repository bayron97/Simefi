package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class lugarAperturaMenorDao {

	public static int save(lugarAperturaMenor l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.lugarAperturaMenor(lugarApertura, estado, observaciones) values(?,?,?)");
			ps.setString(1, l.getLugarApertura());
			ps.setString(2, l.getEstado());
			ps.setString(3, l.getObservaciones());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int activar(lugarAperturaMenor l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.lugarAperturaMenor set estado = ? , observaciones = ? where lugarApertura = ?");
			ps.setString(1, l.getEstado());
			ps.setString(2, l.getObservaciones());
			ps.setString(3, l.getLugarApertura());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
