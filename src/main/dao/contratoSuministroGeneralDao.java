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

public class contratoSuministroGeneralDao {

	public static int save(contratoSuministroGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO ContratoSuministroGeneral(buyProcessId, buyOrderId, distribuidor, buyProcessCod, fecha, observaciones, documentName) VALUES(?, ?, ?, ?, ?, ?, ?)");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyOrderId());
			ps.setString(3, l.getDistribuidor());
			ps.setString(4, l.getBuyProcessCod());
			ps.setString(5, l.getFecha());
			ps.setString(6, l.getObservaciones());
			ps.setString(7, l.getDocumentName());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status");
		return status;
	}

	public static int update(contratoSuministroGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.ContratoSuministroGeneral SET buyProcessId=?, buyOrderId=?, distribuidor=?, buyProcessCod=?, fecha=?, observaciones=?, documentName=? WHERE Id=?");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyOrderId());
			ps.setString(3, l.getDistribuidor());
			ps.setString(4, l.getBuyProcessCod());
			ps.setString(5, l.getFecha());
			ps.setString(6, l.getObservaciones());
			ps.setString(7, l.getDocumentName());
			ps.setInt(8,l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static contratoSuministroGeneral getById(int id) {
		contratoSuministroGeneral p = new contratoSuministroGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM contratoSuministroGeneral where Id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setBuyProcessId(rs.getInt(2));
				p.setBuyOrderId(rs.getString(3));
				p.setDistribuidor(rs.getString(4));
				p.setBuyProcessCod(rs.getString(5));
				p.setFecha(rs.getString(6));
				p.setObservaciones(rs.getString(7));
				p.setDocumentName(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static String getOrdenCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT noOrdenCompra FROM contratacionesGenerales WHERE procesoCompra =?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String orden = rs.getString(1);

				j += orden + ",";
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
	
	public static String getTable() {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT Id, buyProcessId, buyOrderId, distribuidor, buyProcessCod, fecha, observaciones, documentName FROM BancOcci.dbo.ContratoSuministro");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt(1);
				int buyProcessId = rs.getInt(2);
				String buyOrderId = rs.getString(3);
				String distribuidor = rs.getString(4);
				String buyProcessCod = rs.getString(5);
				String fecha = rs.getString(6);
				String observaciones = rs.getString(7);
				String documentName = rs.getString(8);

				j += "[" + "\"" + Id + "\"," + "\"" + buyProcessId + "\"," + "\"" + buyOrderId + "\"," + "\"" + distribuidor
						+ "\"," + "\"" + buyProcessCod + "\"," + "\"" + fecha + "\"," + "\"" + observaciones + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			System.out.print("Dao");
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}

}
