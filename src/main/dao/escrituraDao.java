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

public class escrituraDao {

	public static int rev(escritura a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.escrituras set estado1 = ?, estado2 = ? where num = ?");

			ps.setString(1, a.getEstado1());
			ps.setString(2, a.getEstado2());
			ps.setInt(3, a.getNum());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(escritura a, String id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.escrituras set naturalN = ?, nombre = ?, matricula = ?, tipoId = ?, noId = ?, fecha = ?, nacionalidad = ?, paisResidencia = ?, participacion = ?, tipoAccionista = ?, cantidadAcciones = ?, telefono = ?, estado1 = ?, estado2 = ? where num = ?");

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(1, a.getNaturalN());
			ps.setString(2, a.getNombre());
			ps.setString(3, a.getMatricula());
			ps.setString(4, a.getTipoId());
			ps.setString(5, a.getNoId());
			ps.setString(6, d);
			ps.setString(7, a.getNacionalidad());
			ps.setString(8, a.getPaisResidencia());
			ps.setInt(9, a.getParticipacion());
			ps.setString(10, a.getTipoAccionista());
			ps.setInt(11, a.getCantidadAcciones());
			ps.setString(12, a.getTelefono());
			ps.setString(13, "NO APROBADO");
			ps.setString(14, "INACTIVO");
			ps.setInt(15, Integer.parseInt(id));
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int getAccionista(String nombre, String padre, String tipoAccionista) {
		int s = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM escrituras WHERE NOMBRE = ? AND PADRE = ? AND TIPOACCIONISTA = ? ");
			ps.setString(1, nombre);
			ps.setString(2, padre);
			ps.setString(3, tipoAccionista);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}


	public static int save(escritura a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.escrituras (naturalN, nombre, matricula, tipoId, noId, fecha, padre, nacionalidad, paisResidencia, participacion, tipoAccionista, cantidadAcciones, telefono, estado1, estado2) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(1, a.getNaturalN());
			ps.setString(2, a.getNombre());
			ps.setString(3, a.getMatricula());
			ps.setString(4, a.getTipoId());
			ps.setString(5, a.getNoId());
			ps.setString(6, d);
			ps.setString(7, a.getPadre());
			ps.setString(8, a.getNacionalidad());
			ps.setString(9, a.getPaisResidencia());
			ps.setInt(10, a.getParticipacion());
			ps.setString(11, a.getTipoAccionista());
			ps.setInt(12, a.getCantidadAcciones());
			ps.setString(13, a.getTelefono());
			ps.setString(14, "NO APROBADO");
			ps.setString(15, "INACTIVO");
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}
}