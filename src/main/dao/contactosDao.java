package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class contactosDao {

	public static int update(contacto c) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.contactos set nombre = ?, cargo = ?, departamento = ?, telefono = ?, telefonoFijo = ?, extension = ?, correo = ?, observacion = ?, telefono2 = ?, correo2 = ? where id = ?");
			ps.setString(1, c.getNombre());
			ps.setString(2, c.getCargo());
			ps.setString(3, c.getDepartamento());
			ps.setString(4, c.getTelefono());
			ps.setString(5, c.getTelefonoFijo());
			ps.setString(6, c.getExtension());
			ps.setString(7, c.getCorreo());
			ps.setString(8, c.getObservacion());
			ps.setString(9, c.getTelefono2());
			ps.setString(10, c.getCorreo2());
			ps.setInt(11, c.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateEstado(contacto c) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.contactos set estado = ?, observacion = ? where id = ?");
			ps.setString(1, c.getEstado());
			ps.setString(2, c.getObservacion());
			ps.setInt(3, c.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int getContacto(String nombre, String padre) {
		int s = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM CONTACTOS WHERE NOMBRE = ? AND PADRE = ?  ");
			ps.setString(1, nombre);
			ps.setString(2, padre);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s++;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	public static int save(contacto c) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.contactos (nombre, cargo, departamento, telefono, telefonoFijo, extension, correo, estado, observacion, padre, telefono2, correo2) values (?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, c.getNombre());
			ps.setString(2, c.getCargo());
			ps.setString(3, c.getDepartamento());
			ps.setString(4, c.getTelefono());
			ps.setString(5, c.getTelefonoFijo());
			ps.setString(6, c.getExtension());
			ps.setString(7, c.getCorreo());
			ps.setString(8, c.getEstado());
			ps.setString(9, c.getObservacion());
			ps.setString(10, c.getPadre());
			ps.setString(11, c.getTelefono2());
			ps.setString(12, c.getCorreo2());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
