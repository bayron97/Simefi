package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class digDocSolicitudCompALPDao {

	public static int save(digitizedDocumentALP d) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.digitizedDocumentsForALP (buyProcessID, documentName,documentDescription) values (?,?,?)");
			ps.setInt(1, d.getBuyProcessID());
			ps.setString(2, d.getDocumentName());
			ps.setString(3, d.getDocumentDescription());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(String newDocumentName, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.digitizedDocumentsForALP set documentName = ?,documentDescription=? where Id = ?");
			ps.setString(1, newDocumentName);
			ps.setString(2, newDocumentName);
			ps.setInt(3, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("delete dbo.digitizedDocumentsForALP where Id = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}