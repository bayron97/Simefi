package main.dao;

import main.model.*;
import main.Database;

import java.util.Date;
import java.sql.*;
import java.text.SimpleDateFormat;

public class UserDao {

	public static boolean checkRst(User u) {
		boolean re = false;
		try {
			Connection con = Database.connect();

			u = UserDao.getUserById(u.getUsuario().toUpperCase());

			PreparedStatement ps = con.prepareStatement(
					"select dbo.resetPass.estado1, dbo.resetPass.estadoReseteo from dbo.resetPass where codigoEmpleado = "
							+ u.getCodEmp());
			String es1 = "";
			String er = "";
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				es1 = rs.getString(1);
				er = rs.getString(2);
			}
			if (es1.contentEquals("APROBADO") && er.contentEquals("PENDIENTE")) {
				con.close();
				return true;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return re;
	}

	public static int updatePass(User u) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.Usuario set password = ? where codigoEmpleado = " + u.getCodEmp());
			ps.setString(1, u.getPassword());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateUsr(User u) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.Usuario set codigoEmpleado = ?, usuario = ?, correo = ?, puesto = ?, nombre = ?, identidad = ?, funcion = ?, observacion = ?, estado1 = ?, estado2 = ?, fechaCreacion = ?, fechaModificacion = ? where codigoEmpleado = "
							+ u.getCodEmp());
			ps.setInt(1, u.getCodEmp());
			ps.setString(2, u.getUsuario().toUpperCase());
			ps.setString(3, u.getCorreo().toUpperCase());
			ps.setString(4, u.getPuesto().toUpperCase());
			ps.setString(5, u.getNombre().toUpperCase());
			ps.setString(6, u.getIdentidad().toUpperCase());
			ps.setString(7, u.getFuncion().toUpperCase());
			ps.setString(8, u.getObs().toUpperCase());
			ps.setString(9, "PENDIENTE APROBAR");
			ps.setString(10, "INACTIVO");
			ps.setString(11, u.getFechaCreacion());

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(12, d);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int rev(User u) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.Usuario set estado1 = ?, estado2 = ?, observacion = ? where codigoEmpleado = ?");
			ps.setString(1, u.getEstado1());
			ps.setString(2, u.getEstado2());
			ps.setString(3, u.getObs());
			ps.setInt(4, u.getCodEmp());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(User u) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.Usuario set codigoEmpleado = ?, usuario = ?, correo = ?, password = ?, puesto = ?, nombre = ?, identidad = ?, funcion = ?, observacion = ?, estado1 = ?, estado2 = ?, fechaCreacion = ?, fechaModificacion = ? where codigoEmpleado = "
							+ u.getCodEmp());
			ps.setInt(1, u.getCodEmp());
			ps.setString(2, u.getUsuario().toUpperCase());
			ps.setString(3, u.getCorreo());
			ps.setString(4, u.getPassword().toUpperCase());
			ps.setString(5, u.getPuesto().toUpperCase());
			ps.setString(6, u.getNombre().toUpperCase());
			ps.setString(7, u.getIdentidad().toUpperCase());
			ps.setString(8, u.getFuncion().toUpperCase());
			ps.setString(9, u.getObs().toUpperCase());
			ps.setString(10, "PENDIENTE APROBAR");
			ps.setString(11, "INACTIVO");
			ps.setString(12, u.getFechaCreacion());

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(13, d);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(User u) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.Usuario(codigoEmpleado, usuario, correo, password, puesto, nombre, identidad, funcion, observacion, estado1, estado2, fechaCreacion, fechaModificacion, tieneAccesos) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, u.getCodEmp());
			ps.setString(2, u.getUsuario().toUpperCase());
			ps.setString(3, u.getCorreo());
			ps.setString(4, u.getPassword().toUpperCase());
			ps.setString(5, u.getPuesto().toUpperCase());
			ps.setString(6, u.getNombre().toUpperCase());
			ps.setString(7, u.getIdentidad().toUpperCase());
			ps.setString(8, u.getFuncion().toUpperCase());
			ps.setString(9, u.getObs().toUpperCase());
			ps.setString(10, "PENDIENTE APROBAR");
			ps.setString(11, "INACTIVO");

			SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			Date date = new Date();
			String d = formatter.format(date);

			ps.setString(12, d);
			ps.setString(13, d);
			ps.setString(14, "SIN ACCESOS");
			status = ps.executeUpdate();

			PreparedStatement ur = con.prepareStatement(
					"insert into dbo.usuariorol (usuario,rol,fechaCreacion,fechaModificacion) values (?,?,?,?)");
			ur.setString(1, u.getUsuario().toUpperCase());
			ur.setString(2, "usuario");
			ur.setString(3, d);
			ur.setString(4, d);

			status = ur.executeUpdate();

			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}

	public static boolean Login(String u, String p) {
		boolean status = false;

		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from dbo.Usuario where usuario = ? COLLATE SQL_Latin1_General_CP1_CS_AS and password = ? COLLATE SQL_Latin1_General_CP1_CS_AS");
			ps.setString(1, u.toUpperCase());
			ps.setString(2, p.toUpperCase());
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			User tmp = new User();
			tmp.setCodEmp(rs.getInt(1));
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static User getUserById(String id) {
		User u = new User();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.Usuario where usuario=? COLLATE SQL_Latin1_General_CP1_CS_AS");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				u.setCodEmp(rs.getInt(1));
				u.setUsuario(rs.getString(2));
				u.setCorreo(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setPuesto(rs.getString(5));
				u.setNombre(rs.getString(6));
				u.setIdentidad(rs.getString(7));
				u.setFuncion(rs.getString(8));
				u.setObs(rs.getString(9));
				u.setEstado1(rs.getString(10));
				u.setEstado2(rs.getString(11));
				u.setFechaCreacion(rs.getString(12));
				u.setFechaModificacion(rs.getString(13));
				u.setTieneAccesos(rs.getString(14));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return u;
	}

}