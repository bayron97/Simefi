package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class aclaracionEnmiendaGeneralDao {

	public static aclaracionEnmiendaGeneral getById(int id) {
		aclaracionEnmiendaGeneral a = new aclaracionEnmiendaGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.aclaracionEnmiendaGeneral where cod = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.setCod(id);
				a.setProcesoCompra(rs.getString(2));
				a.setFecha(rs.getString(3));
				a.setTipo(rs.getString(4));
				a.setHoraLimite(rs.getString(5));
				a.setDiaLimite(rs.getString(6));
				a.setHoraApertura(rs.getString(7));
				a.setDiaApertura(rs.getString(8));
				a.setLugarApertura(rs.getString(9));
				a.setDocumento(rs.getString(10));
				a.setObservaciones(rs.getString(11));
				a.setCorrelativoDocumento(rs.getLong(12));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	public static int save(aclaracionEnmiendaGeneral a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.aclaracionEnmiendaGeneral (procesoCompra, fecha, tipo, horaLimite, diaLimite, horaApertura, diaApertura, lugarApertura, documento, observaciones, correlativoDocumento) values (?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, a.getProcesoCompra());
			ps.setString(2, a.getFecha());
			ps.setString(3, a.getTipo());
			ps.setString(4, a.getHoraLimite());
			ps.setString(5, a.getDiaLimite());
			ps.setString(6, a.getHoraApertura());
			ps.setString(7, a.getDiaApertura());
			ps.setString(8, a.getLugarApertura());
			ps.setString(9, a.getDocumento());
			ps.setString(10, a.getObservaciones());
			ps.setLong(11, a.getCorrelativoDocumento());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status);
		return status;
		
	}

	public static int updateWithDocument(long id, aclaracionEnmiendaGeneral a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.aclaracionEnmiendaGeneral set procesoCompra = ?, fecha = ?, horaLimite = ?, diaLimite = ?, horaApertura = ?, diaApertura = ?, lugarApertura = ?, documento = ?, observaciones = ? where cod = ?");
			ps.setString(1, a.getProcesoCompra());
			ps.setString(2, a.getFecha());
			ps.setString(3, a.getHoraLimite());
			ps.setString(4, a.getDiaLimite());
			ps.setString(5, a.getHoraApertura());
			ps.setString(6, a.getDiaApertura());
			ps.setString(7, a.getLugarApertura());
			ps.setString(8, a.getDocumento());
			ps.setString(9, a.getObservaciones());

			ps.setLong(10, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateWithOutDocument(long id, aclaracionEnmiendaGeneral a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.aclaracionEnmiendaGeneral set procesoCompra = ?, fecha = ?, horaLimite = ?, diaLimite = ?, horaApertura = ?, diaApertura = ?, lugarApertura = ?, observaciones = ? where cod = ?");
			ps.setString(1, a.getProcesoCompra());
			ps.setString(2, a.getFecha());
			ps.setString(3, a.getHoraLimite());
			ps.setString(4, a.getDiaLimite());
			ps.setString(5, a.getHoraApertura());
			ps.setString(6, a.getDiaApertura());
			ps.setString(7, a.getLugarApertura());
			ps.setString(8, a.getObservaciones());

			ps.setLong(9, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static long getNewCorrelative(String type, String purchaseNumber) {
		long count = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select correlativoDocumento from dbo.aclaracionEnmiendaGeneral where tipo = ? and procesoCompra = ?");
			ps.setString(1, type);
			ps.setString(2, purchaseNumber);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getLong(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return (count + 1);
	}
}

