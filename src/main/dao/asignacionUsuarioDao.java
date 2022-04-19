package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class asignacionUsuarioDao {

	public static int updateSimple(asignacionUsuario a, String id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.asignacionUsuario set usuario = ?, empleadoSubModulo = ?, acceso = ?, modulo = ?, subModulo = ?, nivel = ? where empleadoSubModulo = ?");
			ps.setString(1, a.getUsuario());
			ps.setString(2, a.getEmpleadoSubModulo());
			ps.setString(3, a.getAccesso());
			ps.setString(4, a.getModulo());
			ps.setString(5, a.getSubModulo());
			ps.setString(6, a.getNivel());
			ps.setString(7, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(asignacionUsuario a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.asignacionUsuario set usuario = ?, empleadoSubModulo = ?, acceso = ?, modulo = ?, subModulo = ?, nivel = ?, descripcion = ?, estado1 = ?, motivo1 = ?, estado2 = ?, motivo2 = ? where empleadoSubModulo = ?");
			ps.setString(1, a.getUsuario());
			ps.setString(2, a.getEmpleadoSubModulo());
			ps.setString(3, a.getAccesso());
			ps.setString(4, a.getModulo());
			ps.setString(5, a.getSubModulo());
			ps.setString(6, a.getNivel());
			ps.setString(7, a.getDescripcion());
			ps.setString(8, a.getEstado1());
			ps.setString(9, a.getMotivo1());
			ps.setString(10, a.getEstado2());
			ps.setString(11, a.getMotivo2());
			ps.setString(12, a.getEmpleadoSubModulo());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(asignacionUsuario a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.asignacionUsuario(usuario, empleadoSubModulo, modulo, subModulo, acceso, nivel, descripcion, estado1, motivo1, estado2, motivo2) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, a.getUsuario());
			ps.setString(2, a.getEmpleadoSubModulo());
			ps.setString(3, a.getModulo());
			ps.setString(4, a.getSubModulo());
			ps.setString(5, a.getAccesso());
			ps.setString(6, a.getNivel());
			ps.setString(7, a.getDescripcion());
			ps.setString(8, a.getEstado1());
			ps.setString(9, a.getMotivo1());
			ps.setString(10, a.getEstado2());
			ps.setString(11, a.getMotivo2());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
