package main.dao;

import main.model.*;
import main.Database;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

public class resetDao {

	public static int update(resetP p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ss = con.prepareStatement("update dbo.Usuario set password = ? where codigoEmpleado = ?");
			ss.setString(1, "TEMPOCCI");
			ss.setInt(2, p.getCodigoEmpleado());
			ss.executeUpdate();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.resetPass set codigoEmpleado = ?, motivo = ?, fecha = ?, estado1 = ?, estadoReseteo = ?, observacion = ? where codigoEmpleado = "
							+ p.getCodigoEmpleado());
			ps.setInt(1, p.getCodigoEmpleado());
			ps.setString(2, p.getMotivo());
			ps.setString(3, p.getFecha());
			ps.setString(4, p.getEstado1());
			ps.setString(5, p.getEstadoReseteo());
			ps.setString(6, p.getObservacion());
			status = ps.executeUpdate();
			con.close();
			status = 1;
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static resetP getById(int id) {
		resetP p = new resetP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.resetPass where codigoEmpleado = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				p.setCodigoEmpleado(rs.getInt(1));
				p.setMotivo(rs.getString(2));
				p.setFecha(rs.getString(3));
				p.setEstado1(rs.getString(4));
				p.setEstadoReseteo(rs.getString(5));
				p.setObservacion(rs.getString(6));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	public static resetP getByUser(String user) {
		resetP p = new resetP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select codigoEmpleado from dbo.Usuario where usuario=? COLLATE SQL_Latin1_General_CP1_CS_AS");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				p.setCodigoEmpleado(rs.getInt(1));
			}
			ps = con.prepareStatement("select * from dbo.resetPass where codigoEmpleado = ?");
			ps.setInt(1, p.getCodigoEmpleado());
			rs = ps.executeQuery();
			if (rs.next()) {
				p.setCodigoEmpleado(rs.getInt(1));
				p.setMotivo(rs.getString(2));
				p.setFecha(rs.getString(3));
				p.setEstado1(rs.getString(4));
				p.setEstadoReseteo(rs.getString(5));
				p.setObservacion(rs.getString(6));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	public static int delete(resetP p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("delete from dbo.resetPass where codigoEmpleado = ?");
			ps.setInt(1, p.getCodigoEmpleado());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(resetP u) {
		int status = 0;
		System.out.println("INsert");
		try {
			Connection con = Database.connect();
//			PreparedStatement ss = con.prepareStatement("update dbo.Usuario set password = ? where codigoEmpleado = ?");
//			ss.setString(1, "TEMPOCCI");
//			ss.setInt(2, u.getCodigoEmpleado());
//			ss.executeUpdate();
			u.setEstado1("NO APROBADO");
			u.setEstadoReseteo("PENDIENTE");
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.resetPass(codigoEmpleado, motivo, fecha, estado1, estadoReseteo, observacion) values (?, ?, ?, ?, ?, ?)");
			ps.setInt(1, u.getCodigoEmpleado());
			ps.setString(2, u.getMotivo());
			ps.setString(3, u.getFecha());
			ps.setString(4, u.getEstado1());
			ps.setString(5, u.getEstadoReseteo());
			ps.setString(6, u.getObservacion());
			status = ps.executeUpdate();
			con.close();
			status = 1;
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}
}
