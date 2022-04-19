package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class viaAdminDao {

	public static int save(viaAdmin v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.viaAdmin(viaAdmin, abreviacion, estado, observacion) values(?,?,?,?)");
			ps.setString(1, v.getViaAdmin());
			ps.setString(2, v.getAbreviacion());
			ps.setString(3, "INACTIVO");
			ps.setString(4, v.getObservacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}

	public static int update(viaAdmin v, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.viaAdmin set viaAdmin = ?, abreviacion = ?, observacion = ? where id = ?");
			ps.setString(1, v.getViaAdmin());
			ps.setString(2, v.getAbreviacion());
			ps.setString(3, v.getObservacion());
			ps.setInt(4, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateState(String newState, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("update dbo.viaAdmin set estado = ? where id = ?");
			ps.setString(1, newState);
			ps.setInt(2, id);
			status = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int validarViaAdminNew(String overlayNombre, String overlayAbrv) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[viaAdmin] where viaAdmin = ? and abreviacion = ?");		
			 ps.setString(1, overlayNombre);
			 ps.setString(2, overlayAbrv);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}
			
			existe = count;
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;
	}
	
	public static int validarViaAdminUpdate(int modifId,String overlayNombre, String overlayAbrv) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[viaAdmin] where viaAdmin = ? and abreviacion = ? and id !=?");		    
			 ps.setString(1, overlayNombre);
			 ps.setString(2, overlayAbrv);	
			 ps.setInt(3, modifId);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}			
			existe = count;
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;	
	}
	
	
}
