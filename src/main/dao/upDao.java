package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class upDao {

	public static int update(up v, int id) {
		int status = 0;
		System.out.println("aqui");
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.up set up = ?, abreviacion = ?, estado = ?, observacion = ? where id = ?");
			ps.setString(1, v.getUp());
			ps.setString(2, v.getAbreviacion());
			ps.setString(3, v.getEstado());
			ps.setString(4, v.getObservacion());
			ps.setInt(5, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(up v) {
		int status = 0;
		System.out.println("aQUI");
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("insert into dbo.up(up, abreviacion, estado, observacion) values(?,?,?,?)");
			ps.setString(1, v.getUp());
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
	
	public static int validarUnidadDePresentacionNew(String overlayUnd, String overlayAbrv) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[up] where up = ? and abreviacion =? ");		
			 ps.setString(1, overlayUnd);
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
	
	public static int validarUnidadDePresentacionUpdate(int modifId, String overlayUnd, String overlayAbrv)  {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[up] where up = ? and abreviacion =? and id !=?");		    
			 ps.setString(1, overlayUnd );
			 ps.setString(2, overlayAbrv );
			 ps.setInt(3, modifId);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}			
			existe = count;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return existe;	
	}
	
}
