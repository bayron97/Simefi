package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class accesosDao {

	public static int save(accesos a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.accesos (Usuario, SubModulo, TipoAcceso, estado1, estado2) values(?,?,?,?,?)");
			ps.setString(1, a.getUsuario());
			ps.setString(2, a.getSubModulo());
			ps.setString(3, a.getTipoAcceso());
			ps.setString(4, a.getEstado1());
			ps.setString(5, a.getEstado2());
			status = ps.executeUpdate();
			System.out.println(status);

			ps = con.prepareStatement("update dbo.Usuario set tieneAccesos = ? where usuario = ?");
			ps.setString(1, "CON ACCESOS");
			ps.setString(2, a.getUsuario());
			ps.executeUpdate();

			con.close();
		} catch (Exception e) {
			System.out.println("In accesosDao: " + e);
		}
		return status;
	}

	public static int update(accesos a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.accesos set TipoAcceso = ? , estado1 = ?, estado2= ? where Usuario = ? and SubModulo = ?");
			ps.setString(1, a.getTipoAcceso());
			ps.setString(2, a.getEstado1());
			ps.setString(3, a.getEstado2());
			ps.setString(4, a.getUsuario());
			ps.setString(5, a.getSubModulo());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int aprove(accesos a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.accesos set estado1 = ?, motivo1 = ?, estado2 = ?, motivo2 = ? where Usuario = ?");
			ps.setString(1, a.getEstado1());
			ps.setString(2, a.getMotivo1());
			ps.setString(3, a.getEstado2());
			ps.setString(4, a.getMotivo2());
			ps.setString(5, a.getUsuario());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int validarPermisosUsuario(String usuario,String subModulo)  {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select Usuario from [dbo].[accesos] where Usuario = ? and SubModulo =?");		    
			 ps.setString(1, usuario );	
			 ps.setString(2, subModulo);
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

	public static int isAproved(String user) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.accesos where Usuario = ? and estado1='APROBADO'");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				status = 1;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static accesos getMotivos(String user) {
		accesos a = new accesos();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select motivo1, motivo2 from dbo.accesos where Usuario = ?");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.setMotivo1(rs.getString(1));
				a.setMotivo2(rs.getString(2));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	public static int isActive(String user) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.accesos where Usuario = ? and estado2='ACTIVO'");
			ps.setString(1, user);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				status = 1;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static accesos getAproved(String user, String subMod) {
		accesos a = new accesos();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select TipoAcceso from dbo.accesos where Usuario = ? and SubModulo = ? and estado2='ACTIVO'");
			ps.setString(1, user);
			ps.setString(2, subMod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.setUsuario(user);
				a.setSubModulo(subMod);
				a.setTipoAcceso(rs.getString(1));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	public static accesos getAccess(String user, String subMod) {
		accesos a = new accesos();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select TipoAcceso from dbo.accesos where Usuario = ? and SubModulo = ?");
			ps.setString(1, user);
			ps.setString(2, subMod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				a.setUsuario(user);
				a.setSubModulo(subMod);
				a.setTipoAcceso(rs.getString(1));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return a;
	}

	public static boolean hasAccess(String user, String submod) {
		boolean access = false;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from dbo.accesos where Usuario = ? and SubModulo = ? and estado2 = 'ACTIVO'");
			ps.setString(1, user);
			ps.setString(2, submod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				access = true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return access;
	}
}
