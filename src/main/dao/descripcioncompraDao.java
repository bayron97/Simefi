package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class descripcioncompraDao {

	public static int save(descripcioncompra t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.descripcioncompra(nombrecompra, estado) values(?,?)");
			ps.setString(1, t.getNombreCompra());
			ps.setString(2, t.getEstado());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int activar(descripcioncompra t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.descripcioncompra set estado = ?, motivo = ? where no = ?");
			ps.setString(1, t.getEstado());
			ps.setString(2, t.getmotivo());
			ps.setInt(3, t.getNo());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	

	public static ArrayList<descripcioncompra> getAllActive() {
		ArrayList<descripcioncompra> descripcionCompraList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select nombrecompra from dbo.descripcioncompra where estado = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				descripcioncompra dc = new descripcioncompra();
				dc.setNombreCompra(rs.getString(1));

				descripcionCompraList.add(dc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return descripcionCompraList;
	}
}
