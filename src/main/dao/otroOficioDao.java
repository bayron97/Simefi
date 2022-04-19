package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class otroOficioDao {

	public static int save(otroOficio l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO otroOficios (Idotro,oficio,nombreDocumento) VALUES(?,?,?)");
			ps.setInt(1, l.getIdotro());
			ps.setString(2, l.getOficio());
			ps.setString(3, l.getNombreDocumento());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}



}
