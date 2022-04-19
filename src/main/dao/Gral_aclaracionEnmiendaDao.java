package main.dao;

import main.model.*;
import main.Database;

import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Gral_aclaracionEnmiendaDao {

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

	public static int save(Gral_aclaracionEnmienda aclaracionEnmienda) {
		int idAclaracionEnmienda = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into Gral.aclaracionEnmienda (idAperturaProceso, fecha, aclaracionEnmienda, horaLimite, diaLimite, horaApertura, diaApertura, lugarApertura, documento, observaciones, correlativoEnmienda, oficio) values (?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, aclaracionEnmienda.getIdAperturaProceso());
			ps.setString(2, aclaracionEnmienda.getFecha());
			ps.setString(3, aclaracionEnmienda.getAclaracionEnmienda());
			ps.setString(4, aclaracionEnmienda.getHoraLimite());
			ps.setString(5, aclaracionEnmienda.getDiaLimite());
			ps.setString(6, aclaracionEnmienda.getHoraApertura());
			ps.setString(7, aclaracionEnmienda.getDiaApertura());
			ps.setString(8, aclaracionEnmienda.getLugarApertura());
			ps.setString(9, aclaracionEnmienda.getDocumento());
			ps.setString(10, aclaracionEnmienda.getObservaciones());
			ps.setInt(11, aclaracionEnmienda.getCorrelativoEnmienda());
			ps.setInt(12, aclaracionEnmienda.getOficio());
			idAclaracionEnmienda = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {idAclaracionEnmienda = generatedKeys.getInt(1);}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("id aclaracion" + idAclaracionEnmienda);
		return idAclaracionEnmienda;
		
	}
	

	public static int update(Gral_aclaracionEnmienda aclaracionEnmienda) {
		int idAclaracionEnmienda = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.aclaracionEnmienda set fecha=?, aclaracionEnmienda=?, horaLimite=?, diaLimite=?, horaApertura=?, diaApertura=?, lugarApertura=?, documento=?, observaciones=? where idAclaracionEnmienda =?");
			ps.setString(1, aclaracionEnmienda.getFecha());
			ps.setString(2, aclaracionEnmienda.getAclaracionEnmienda());
			ps.setString(3, aclaracionEnmienda.getHoraLimite());
			ps.setString(4, aclaracionEnmienda.getDiaLimite());
			ps.setString(5, aclaracionEnmienda.getHoraApertura());
			ps.setString(6, aclaracionEnmienda.getDiaApertura());
			ps.setString(7, aclaracionEnmienda.getLugarApertura());
			ps.setString(8, aclaracionEnmienda.getDocumento());
			ps.setString(9, aclaracionEnmienda.getObservaciones());
			ps.setInt(10, aclaracionEnmienda.getIdAclaracionEnmienda());
			idAclaracionEnmienda = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAclaracionEnmienda;
	}
	
	public static int updateRutaArchivo(Gral_aclaracionEnmienda aclaracionEnmienda) {
		int idAclaracionEnmienda = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.aclaracionEnmienda set documento=? where idAclaracionEnmienda =?");
			ps.setString(1, aclaracionEnmienda.getDocumento());
			ps.setInt(2, aclaracionEnmienda.getIdAclaracionEnmienda());
			idAclaracionEnmienda = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAclaracionEnmienda;
	}
	
	public static int updatewithoutdocument(Gral_aclaracionEnmienda aclaracionEnmienda) {
		int idAclaracionEnmienda = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.aclaracionEnmienda set fecha=?, aclaracionEnmienda=?, horaLimite=?, diaLimite=?, horaApertura=?, diaApertura=?, lugarApertura=?, observaciones=? where idAclaracionEnmienda =?");
			ps.setString(1, aclaracionEnmienda.getFecha());
			ps.setString(2, aclaracionEnmienda.getAclaracionEnmienda());
			ps.setString(3, aclaracionEnmienda.getHoraLimite());
			ps.setString(4, aclaracionEnmienda.getDiaLimite());
			ps.setString(5, aclaracionEnmienda.getHoraApertura());
			ps.setString(6, aclaracionEnmienda.getDiaApertura());
			ps.setString(7, aclaracionEnmienda.getLugarApertura());
			ps.setString(8, aclaracionEnmienda.getObservaciones());
			ps.setInt(9, aclaracionEnmienda.getIdAclaracionEnmienda());
			idAclaracionEnmienda = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAclaracionEnmienda;
	}
	
	public static Gral_aclaracionEnmiendaDTO GetAclaracionEnmienda(int idAclaracionEnmienda) {		
		Gral_aclaracionEnmiendaDTO aclaracionEnmienda = new Gral_aclaracionEnmiendaDTO();		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select  AE.idAperturaProceso, AP.numProcesoCompra, AE.fecha, AE.aclaracionEnmienda, AE.horaLimite, AE.diaLimite, AE.horaApertura,  AE.diaApertura, AE.lugarApertura, AE.documento, AE.observaciones, AE.correlativoEnmienda, AE.oficio, AP.beneficiario from Gral.aclaracionEnmienda AE inner join Gral.aperturaProceso AP on AE.idAperturaProceso = AP.idAperturaProceso where idAclaracionEnmienda = ?");		
				ps.setInt(1, idAclaracionEnmienda);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				aclaracionEnmienda.setIdAperturaProceso(rs.getInt(1));
				aclaracionEnmienda.setNumProcesoCompra(rs.getString(2));
				aclaracionEnmienda.setFecha(rs.getString(3));
				aclaracionEnmienda.setAclaracionEnmienda(rs.getString(4));
				aclaracionEnmienda.setHoraLimite(rs.getString(5));
				aclaracionEnmienda.setDiaLimite(rs.getString(6));
				aclaracionEnmienda.setHoraApertura(rs.getString(7));
				aclaracionEnmienda.setDiaApertura(rs.getString(8));
				aclaracionEnmienda.setLugarApertura(rs.getString(9));
				aclaracionEnmienda.setDocumento(rs.getString(10));
				aclaracionEnmienda.setObservaciones(rs.getString(11));
				aclaracionEnmienda.setCorrelativoEnmienda(rs.getInt(12));
				aclaracionEnmienda.setOficio(rs.getInt(13));
				aclaracionEnmienda.setBeneficiario(rs.getString(14));
				
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return aclaracionEnmienda;
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

	public static int getNewCorrelative(String type, int purchaseNumber) {
		int count = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select correlativoEnmienda from Gral.aclaracionEnmienda where aclaracionEnmienda = ? and idAperturaProceso = ?");
			ps.setString(1, type);
			ps.setInt(2, purchaseNumber);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return (count + 1);
	}
}

