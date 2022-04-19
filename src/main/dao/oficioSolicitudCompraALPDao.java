package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class oficioSolicitudCompraALPDao {

	public static int save(oficioSolicitudCompraALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.oficioSolicitudCompraALP(idSolicitudCompra, noItem, noOficio, nombreDocumento) values(?,?,?,?)");
			ps.setLong(1, o.getIdSolicitudCompra());
			ps.setInt(2, o.getNoItem());
			ps.setString(3, o.getNoOficio());
			ps.setString(4, o.getNombreDocumento());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}

	public static int update(oficioSolicitudCompraALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.oficioSolicitudCompraALP set idSolicitudCompra = ?, noOficio = ?, nombreDocumento = ? where id = ?");
			ps.setLong(1, o.getIdSolicitudCompra());
			ps.setString(2, o.getNoOficio());
			ps.setString(3, o.getNombreDocumento());
			ps.setLong(4, o.getId());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<oficioSolicitudCompraALP> getAllBySCID(Long scid) {
		ArrayList<oficioSolicitudCompraALP> oficioList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noItem, noOficio, nombreDocumento from dbo.oficioSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, scid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				oficioSolicitudCompraALP o = new oficioSolicitudCompraALP();
				o.setNoItem(rs.getInt(1));
				o.setNoOficio(rs.getString(2));
				o.setNombreDocumento(rs.getString(3));

				oficioList.add(o);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return oficioList;
	}
}
