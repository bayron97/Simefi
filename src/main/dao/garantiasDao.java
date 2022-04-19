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

public class garantiasDao {

	public static int save(garantias g) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.garantias(procesoCompra, tipoGarantia, tipoManifiesto, porcentaje, tiempo, unidadTiempo, tiempoManifiesto) values(?,?,?,?,?,?,?)");
			ps.setInt(1, g.getProcesoCompra());
			ps.setString(2, g.getTipoGarantia());
			ps.setString(3, g.getTipoManifiesto());
			ps.setString(4, g.getPorcentaje());
			ps.setInt(5, g.getTiempo());
			ps.setString(6, g.getUnidadTiempo());
			ps.setInt(7, g.getTiempoManifiesto());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteAll(int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("delete from dbo.garantias where procesoCompra = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static List<garantias> getById(int id) {
		List<garantias> g = new ArrayList<garantias>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.garantias where procesoCompra = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				garantias ng = new garantias();
				ng.setProcesoCompra(id);
				ng.setTipoGarantia(rs.getString(2));
				ng.setTipoManifiesto(rs.getString(3));
				ng.setPorcentaje(rs.getString(4));
				ng.setTiempo(rs.getInt(5));
				ng.setUnidadTiempo(rs.getString(6));
				ng.setTiempoManifiesto(rs.getInt(7));
				g.add(ng);
			}

			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return g;
	}
}
