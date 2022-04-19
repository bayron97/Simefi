package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class accionistaDao {

	public static float totalAcciones(String id) {
		float total = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select sum(participacion) from dbo.accionista where padre = ?");
			ps.setInt(1, Integer.parseInt(id));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return total;
	}

	public static int aprov(accionista a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.accionista set estado1 = ?, estado2 = ?, motivo = ? where nombre= ?");
			ps.setString(1, a.getEstado1());
			ps.setString(2, a.getEstado2());
			ps.setString(3, a.getMotivo());
			ps.setString(4, a.getNombre());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(accionista a, String id) {
		int status = 0;
		
		System.out.println("Tests" + a.getid());
		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.accionista set nacionalidad = ?, tipoId = ?, pais = ?, participacion = ?, telefono = ?, noId = ?, tipo = ?, acciones = ?, padre = ?, nombre = ?, estado1 = ?, estado2 = ?, motivo = ?, cargo = ?, correo1 = ?, correo2 = ?, tipoIntegrante = ? where id = ?");
			ps.setString(1, a.getNacionalidad());
			ps.setString(2, a.getTipoId());
			ps.setString(3, a.getPais());
			ps.setFloat(4, a.getParticipacion());
			ps.setString(5, a.getTelefono());
			ps.setString(6, a.getNoId());
			ps.setString(7, a.getTipo());
			ps.setString(8, a.getAcciones());
			ps.setString(9, a.getPadre());
			ps.setString(10, a.getNombre());
			ps.setString(11, "PENDIENTE APROBAR");
			ps.setString(12, "INACTIVO");
			ps.setString(13, a.getMotivo());
			ps.setString(14, a.getCargo());
			ps.setString(15, a.getCorreo1());
			ps.setString(16, a.getCorreo2());
			ps.setString(17, a.getTipoIntegrante());
			//ps.setString(18, id);
			ps.setInt(18, a.getid());
			System.out.println("v " + a.getid());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int getAccionista(String nombre, String noId, String tipo) {
		int s = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM ACCIONISTA WHERE NOMBRE = ? AND NOID = ?  AND TIPO = ? ");
			ps.setString(1, nombre);
			ps.setString(2, noId);
			ps.setString(3, tipo);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	public static int save(accionista a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.accionista (nacionalidad, tipoId, pais, participacion, telefono, noId, tipo, acciones, padre, nombre, estado1, estado2, motivo, cargo, correo1, correo2, tipoIntegrante) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
			ps.setString(1, a.getNacionalidad());
			ps.setString(2, a.getTipoId());
			ps.setString(3, a.getPais());
			ps.setFloat(4, a.getParticipacion());
			ps.setString(5, a.getTelefono());
			ps.setString(6, a.getNoId());
			ps.setString(7, a.getTipo());
			ps.setString(8, a.getAcciones());
			ps.setString(9, a.getPadre());
			ps.setString(10, a.getNombre());
			ps.setString(11, "PENDIENTE APROBAR");
			ps.setString(12, "INACTIVO");
			ps.setString(13, a.getMotivo());
			ps.setString(14, a.getCargo());
			ps.setString(15, a.getCorreo1());
			ps.setString(16, a.getCorreo2());
			ps.setString(17, a.getTipoIntegrante());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
