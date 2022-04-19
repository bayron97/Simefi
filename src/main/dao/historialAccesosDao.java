package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class historialAccesosDao {

	public static int save(historialAccesos h) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.reportesAccesos (fecha, modulo, submodulo, usuario, funcion) values (?,?,?,?,?)");

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss aa");
			Date date = new Date();
			formatter.setTimeZone(TimeZone.getTimeZone("GMT-6"));
			String d = formatter.format(date);

			ps.setString(1, d);
			ps.setString(2, h.getModulo());
			ps.setString(3, h.getSubmodulo());
			ps.setString(4, h.getUsuario());
			ps.setString(5, h.getFuncion());

			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
