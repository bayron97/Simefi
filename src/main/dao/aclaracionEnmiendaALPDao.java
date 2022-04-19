package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class aclaracionEnmiendaALPDao {

	public static aclaracionEnmiendaALP getById(int id) {
		aclaracionEnmiendaALP a = new aclaracionEnmiendaALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.aclaracionEnmiendaALP where cod = ?");
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
				a.setModificacionProductos(rs.getString(13));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	public static int save(aclaracionEnmiendaALP a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.aclaracionEnmiendaALP (procesoCompra, fecha, tipo, horaLimite, diaLimite, horaApertura, diaApertura, lugarApertura, documento, observaciones, correlativoDocumento, modificacionProductos) values (?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
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
			ps.setString(12, a.getModificacionProductos());
			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {status = generatedKeys.getInt(1);}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int saveDocument(long id, String documento) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.aclaracionEnmiendaALP set  documento = ? where cod = ?");
			ps.setString(1, documento);
			ps.setLong(2, id);		

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}


	public static int updateWithDocument(long id, aclaracionEnmiendaALP a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.aclaracionEnmiendaALP set procesoCompra = ?, fecha = ?, horaLimite = ?, diaLimite = ?, horaApertura = ?, diaApertura = ?, lugarApertura = ?, documento = ?, observaciones = ?, modificacionProductos = ? where cod = ?");
			ps.setString(1, a.getProcesoCompra());
			ps.setString(2, a.getFecha());
			ps.setString(3, a.getHoraLimite());
			ps.setString(4, a.getDiaLimite());
			ps.setString(5, a.getHoraApertura());
			ps.setString(6, a.getDiaApertura());
			ps.setString(7, a.getLugarApertura());
			ps.setString(8, a.getDocumento());
			ps.setString(9, a.getObservaciones());
			ps.setString(10, a.getModificacionProductos());

			ps.setLong(11, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateWithOutDocument(long id, aclaracionEnmiendaALP a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.aclaracionEnmiendaALP set procesoCompra = ?, fecha = ?, horaLimite = ?, diaLimite = ?, horaApertura = ?, diaApertura = ?, lugarApertura = ?, observaciones = ?, modificacionProductos = ? where cod = ?");
			ps.setString(1, a.getProcesoCompra());
			ps.setString(2, a.getFecha());
			ps.setString(3, a.getHoraLimite());
			ps.setString(4, a.getDiaLimite());
			ps.setString(5, a.getHoraApertura());
			ps.setString(6, a.getDiaApertura());
			ps.setString(7, a.getLugarApertura());
			ps.setString(8, a.getObservaciones());
			ps.setString(9, a.getModificacionProductos());

			ps.setLong(10, id);
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
					"select correlativoDocumento from dbo.aclaracionEnmiendaALP where tipo = ? and procesoCompra = ?");
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

	public static String getCorrelativoXProceso(String procesoCompra, String tipo, int correlativoDocumento) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select correlativoDocumento  from aclaracionEnmiendaALP where procesoCompra =? and tipo =? and correlativoDocumento = ?");
			ps.setString(1, procesoCompra);
			ps.setString(2, tipo);
			ps.setInt(3, correlativoDocumento);
			String j = "0";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				j += rs.getInt(1) + ";";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return reqList;
		
	}

}
