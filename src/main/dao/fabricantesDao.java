package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class fabricantesDao {

	public static int save(fabricantes t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into dbo.fabricantes(nombrefabricante) values(?)");
			ps.setString(1, t.getNombreFabricante());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int activar(fabricantes t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.fabricantes set estado = ?, motivo = ? where no = ?");
			ps.setString(1, t.getestado());
			ps.setString(2, t.getmotivo());
			ps.setInt(3, t.getNo());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
