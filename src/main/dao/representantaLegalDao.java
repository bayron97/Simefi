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

public class representantaLegalDao {

	public static int setActiv(String padre, representanteLegal r) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.distribuidor set representanteLegal = ? where denominacion = ?");
			ps.setString(1, r.getNombre());
			ps.setString(2, padre);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return status;
	}

	public static representanteLegal getActiv(String padre) {
		representanteLegal r = new representanteLegal();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.representanteLegal where estado = 'ACTIVO' and matricula = ?");
			ps.setString(1, padre);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				r.setNombre(rs.getString(1));
				r.setTipoId(rs.getString(2));
				r.setNacionalidad(rs.getString(3));
				r.setNoId(rs.getString(4));
				r.setCorreo(rs.getString(5));
				r.setTelefono(rs.getString(6));
				r.setFecha(rs.getString(7));
				r.setEstado(rs.getString(8));
				r.setObservacion(rs.getString(9));
				r.setMatricula(rs.getString(10));
				r.setExtension(rs.getString(11));
			}

			System.out.println(r.getNombre());
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return r;
	}

	public static int update(representanteLegal r) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.representanteLegal set nombre = ?, tipoId = ?, nacionalidad = ?, correo = ?, telefono = ?, estado = ?, observacion = ?, fecha = ?, extension = ?, telefono2 = ?, correo2 = ? where noId = ? and matricula = ?");
			ps.setString(1, r.getNombre());
			ps.setString(2, r.getTipoId());
			ps.setString(3, r.getNacionalidad());
			ps.setString(4, r.getCorreo());
			ps.setString(5, r.getTelefono());
			ps.setString(6, r.getEstado());
			ps.setString(7, r.getObservacion());
			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);
			ps.setString(8, d);
			ps.setString(9, r.getExtension());
			ps.setString(10, r.getTelefono2());
			ps.setString(11, r.getCorreo2());
			ps.setString(12, r.getNoId());
			ps.setString(13, r.getMatricula());
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateEstado(representanteLegal r) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.representanteLegal set estado = ?, observacion = ? where noId = ? and matricula = ?");
			ps.setString(1, r.getEstado());
			ps.setString(2, r.getObservacion());
			ps.setString(3, r.getNoId());
			ps.setString(4, r.getMatricula());
			status = ps.executeUpdate();
			con.close();
			System.out.println("Representante Legal: " + r.getNoId());
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int getRepresentanteLegal(String matricula, String noId) {
		int s = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM REPRESENTANTELEGAL WHERE MATRICULA = ? AND NOID = ?");
			ps.setString(1, matricula);
			ps.setString(2, noId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	public static int save(representanteLegal r) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.representanteLegal (nombre, tipoId, nacionalidad, noId, correo, telefono, fecha, estado, observacion, matricula, extension, telefono2, correo2) values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, r.getNombre());
			ps.setString(2, r.getTipoId());
			ps.setString(3, r.getNacionalidad());
			ps.setString(4, r.getNoId());
			ps.setString(5, r.getCorreo());
			ps.setString(6, r.getTelefono());

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(7, d);
			ps.setString(8, r.getEstado());
			ps.setString(9, r.getObservacion());
			ps.setString(10, r.getMatricula());
			ps.setString(11, r.getExtension());
			ps.setString(12, r.getTelefono2());
			ps.setString(13, r.getCorreo2());
			status = ps.executeUpdate();
			con.close();
			System.out.println("Representante Legal: " + r.getNoId());
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
