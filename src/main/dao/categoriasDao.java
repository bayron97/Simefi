package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class categoriasDao {

	public static int update(categorias v, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.categorias set categorias = ?, descripcion = ?, estado = ?, observacion = ? where id = ?");
			ps.setString(1, v.getCategorias());
			ps.setString(2, v.getDescripcion());
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

	public static int save(categorias v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.categorias(categorias, descripcion, estado, observacion) values(?,?,?,?)");
			ps.setString(1, v.getCategorias());
			ps.setString(2, v.getDescripcion());
			ps.setString(3, "INACTIVO");
			ps.setString(4, v.getObservacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}
	
	public static int validarCategoriasNew(String overlayCat) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[categorias] where categorias = ? ");		
			 ps.setString(1, overlayCat);
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
	
	public static int validarCategoriasUpdate(int modifId,String overlayCat)  {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from [dbo].[categorias] where categorias = ? and id !=?");		    
			 ps.setString(1, overlayCat );	
			 ps.setInt(2, modifId);
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
