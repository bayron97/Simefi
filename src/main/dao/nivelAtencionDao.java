package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class nivelAtencionDao {

	public static int update(nivelAtencion v, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.nivelAtencion set nivel = ?, nombre = ?, observacion = ?, abreviacion = ? where id = ?");
			ps.setString(1, v.getNivel());
			ps.setString(2, v.getNombre());
			ps.setString(3, v.getObservacion());
			ps.setString(4, v.getAbreviacion());
			ps.setInt(5, id);
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
			PreparedStatement ps = con.prepareStatement("update dbo.nivelAtencion set estado = ? where id = ?");
			ps.setString(1, newState);
			ps.setInt(2, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(nivelAtencion v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.nivelAtencion(nivel, nombre, estado, observacion, abreviacion) values(?,?,?,?,?)");
			ps.setString(1, v.getNivel());
			ps.setString(2, v.getNombre());
			ps.setString(3, "INACTIVO");
			ps.setString(4, v.getObservacion());
			ps.setString(5, v.getAbreviacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int validarNivelAtencionNew(String overlayNivel, String overlayNombre) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[nivelAtencion] where nivel = ? and nombre = ? ");		
			 ps.setString(1, overlayNivel);
			 ps.setString(2, overlayNombre);
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
	
	public static int validarNivelAtencionUpdate(int modifId,String overlayNivel,  String overlayNombre)  {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[nivelAtencion] where nivel = ? and nombre = ? and id !=?");		    
			 ps.setString(1, overlayNivel );
			 ps.setString(2, overlayNombre);	
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
