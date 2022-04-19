package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class otrosDao {

	public static String getAll() {
		String j = "VACIO";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.otros");
			j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				int cod = rs.getInt(12);
				String nombre = rs.getString(4);
				String desc = rs.getString(5);

				j += "[" + "\"" + count + "\"," + "\"" + nombre + "\"," + "\"" + desc + "\"," + "\"" + cod + "\"],";

				count += 1;
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
		} catch (Exception e) {
			System.out.println(e);
		}
		return j;
	}

	public static String getByName(String name) {
		String j = "VACIO";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.otros where nombre = ?");
			ps.setString(1, name);
			j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				int cod = rs.getInt(12);
				String nombre = rs.getString(4);
				String desc = rs.getString(5);

				j += "[" + "\"" + count + "\"," + "\"" + nombre + "\"," + "\"" + desc + "\"," + "\"" + cod + "\"]";

				count += 1;
			}
			j += "]}";
		} catch (Exception e) {
			System.out.println(e);
		}
		return j;
	}

	public static int revisar(otros o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.otros set estado1 = ?, estado2 = ?, motivo1 = ?, motivo2 = ?, observacion = ? where num = ?");
			ps.setString(1, o.getEstado1());
			ps.setString(2, o.getEstado2());
			ps.setString(3, o.getMotivo1());
			ps.setString(4, o.getMotivo2());
			ps.setString(5, o.getObservacion());
			ps.setInt(6, o.getNum());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static otros getOne(int codigo) {
		otros o = new otros();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.otros where num = ?");
			ps.setInt(1, codigo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o.setCodigo(rs.getString(1));
				o.setCategoria(rs.getString(2));
				o.setUp(rs.getString(3));
				o.setNombre(rs.getString(4));
				o.setDescripcion(rs.getString(5));
				o.setArticulo(rs.getString(6));
				o.setEstado1(rs.getString(7));
				o.setMotivo1(rs.getString(8));
				o.setEstado2(rs.getString(9));
				o.setMotivo2(rs.getString(10));
				o.setObservacion(rs.getString(11));
				o.setNum(rs.getInt(12));
				;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return o;
	}

	public static int update(otros v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.otros set codigo = ?, categoria = ?, up = ?, nombre = ?, descripcion = ?, articulo = ?, estado1 = ?, motivo1 = ?, estado2 = ?, motivo2 = ?, observacion = ? where num = ?");
			ps.setString(1, v.getCodigo());
			ps.setString(2, v.getCategoria());
			ps.setString(3, v.getUp());
			ps.setString(4, v.getNombre());
			ps.setString(5, v.getDescripcion());
			ps.setString(6, v.getArticulo());
			ps.setString(7, v.getEstado1());
			ps.setString(8, v.getMotivo1());
			ps.setString(9, v.getEstado2());
			ps.setString(10, v.getMotivo2());
			ps.setString(11, v.getObservacion());
			ps.setInt(12, v.getNum());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(otros v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.otros(codigo, categoria, up, nombre, descripcion, articulo, estado1, motivo1, estado2, motivo2, observacion) values(?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, v.getCodigo());
			ps.setString(2, v.getCategoria());
			ps.setString(3, v.getUp());
			ps.setString(4, v.getNombre().toUpperCase());
			ps.setString(5, v.getDescripcion());
			ps.setString(6, v.getArticulo());
			ps.setString(7, v.getEstado1());
			ps.setString(8, v.getMotivo1());
			ps.setString(9, v.getEstado2());
			ps.setString(10, v.getMotivo2());
			ps.setString(11, v.getObservacion());
			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			        status = generatedKeys.getInt(1);
			}
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		System.out.println(status);
		return status;
	}
	
	public static int updateEstado(int modifId) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.otros set estado1 = ? where num = ?");
			ps.setString(1, "PENDIENTE DE APROBAR");
			ps.setInt(2, modifId);
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int validarExistOtroupdate(int modifId, String nombre)  {
		System.out.println(modifId +  " " + nombre);
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = null;
			ps	 = con.prepareStatement("select * from otros where nombre = ? and num != ?");	
			ps.setString(1, nombre );
			ps.setInt(2, modifId);		    		
			 
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}			
			existe = count;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(existe + " existe");
		return existe;	
	}
	
	public static int validarExistNew( String nombre)  {
		
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = null;
			ps	 = con.prepareStatement("select * from otros where nombre = ? ");	
			ps.setString(1, nombre );			    		
			 
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}			
			existe = count;
			
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(existe + " existe");
		return existe;	
	}
	
}