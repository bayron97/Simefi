package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class distribuidorDao {

	public static String getByIdApi(String id) {
		String dist = "VACIO";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select  * from dbo.distribuidor where denominacion Like '" + id + "%'");
			// ps.setString(1, name);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String denominacion = rs.getString(1);
				String distribuidor = rs.getString(5);
				String repLegal = rs.getString(4);
				String dir = rs.getString(3);
				j += "[" + "\"0\"," + "\"" + denominacion + "\"," + "\"" + distribuidor + "\"," + "\"" + repLegal + "\""
						+ "\"," + dir + "\"]";
			}
			j += "]}";
			dist = j;
		} catch (Exception e) {
			System.out.println();
		}
		return dist;
	}
	
	public static ArrayList<distribuidor> getAllBasic() {
		ArrayList<distribuidor> distList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT denominacion, distribuidor FROM dbo.distribuidor \r\n"
					+ "WHERE distribuidor IN (SELECT distribuidor FROM dbo.distribuidor  WHERE distribuidor = 'DISTRIBUIDOR' or distribuidor  = 'DISTRIBUIDOR/FABRICANTE')\r\n"
					+ "AND (estado1 = 'APROBADO' and estado2 ='ACTIVO')");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				distribuidor item = new distribuidor();
				item.setDenominacion(rs.getString(1));
				item.setDistribuidor(rs.getString(2));
				distList.add(item);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return distList;
	}
	
	public static String getAllApi() {

		String dist = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where distribuidor != 'BENEFICIARIO'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				String denominacion = rs.getString(1);
				String distribuidor = rs.getString(5);
				j += "[\"" + denominacion + "\"," + "\"" + distribuidor + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			dist = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return dist;
	}

	public static distribuidor getById(String id) {
		distribuidor d = new distribuidor();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("Select * from dbo.distribuidor where denominacion = ?");
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				d.setDenominacion(rs.getString(1));
				d.setRtn(rs.getString(2));
				d.setDireccion(rs.getString(3));
				d.setRepresentanteLegal(rs.getString(4));
				d.setDistribuidor(rs.getString(5));
				d.setEstado1(rs.getString(6));
				d.setMotivo1(rs.getString(7));
				d.setEstado2(rs.getString(8));
				d.setMotivo2(rs.getString(9));
				d.setFecha(rs.getString(10));
				d.setMatricula(rs.getString(11));
				d.setPais(rs.getString(12));
				d.setFideicomiso(rs.getString(13));
				d.setTipoPago(rs.getString(14));
				d.setBanco(rs.getString(15));
				d.setNoCuenta(rs.getString(16));
				d.setFechaSubs(rs.getString(17));
				d.setFechaCump(rs.getString(18));
				d.setBeneficiarioFinal(rs.getString(19));
				d.setPersoneria(rs.getString(20));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}

	public static int updateBenef(distribuidor d, String id) {
		int status = 0;
		try {
			Connection con = Database.connect();

			PreparedStatement ps = con.prepareStatement(
					"update dbo.distribuidor set denominacion = ?, direccion = ?, rtn = ?, fecha = ?, matricula = ?, distribuidor = ?, pais = ?, fideicomiso = ?, tipoPago = ?, banco = ?, noCuenta = ?, FechaSubs = ?, FechaCump = ?, beneficiarioFinal = ? where denominacion = ? and distribuidor = 'BENEFICIARIO'");

			ps.setString(1, d.getDenominacion());
			ps.setString(2, d.getDireccion());
			ps.setString(3, d.getRtn());
			ps.setString(4, d.getFecha());
			ps.setString(5, d.getMatricula());
			ps.setString(6, d.getDistribuidor());
			ps.setString(7, d.getPais());
			ps.setString(8, d.getFideicomiso());
			ps.setString(9, d.getTipoPago());
			ps.setString(10, d.getBanco());
			ps.setString(11, d.getNoCuenta());
			ps.setString(12, d.getFechaSubs());
			ps.setString(13, d.getFechaCump());
			ps.setString(14, d.getBeneficiarioFinal());
			ps.setString(15, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static boolean existsD(String id, String tipo) {
		boolean exists = false;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where denominacion = ? and distribuidor = ?");
			ps.setString(1, id);
			ps.setString(2, tipo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return exists;
	}

	public static boolean exists(String id, String tipo) {
		boolean exists = false;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where denominacion = ? and distribuidor = ?");
			ps.setString(1, id);
			ps.setString(2, tipo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return exists;
	}

	public static distribuidor getBenef(String id, String tipo) {
		distribuidor d = new distribuidor();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where denominacion = ? and distribuidor = ?");
			ps.setString(1, id);
			ps.setString(2, tipo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				d.setDenominacion(rs.getString(1));
				d.setRtn(rs.getString(2));
				d.setDireccion(rs.getString(3));
				d.setRepresentanteLegal(rs.getString(4));
				d.setDistribuidor(rs.getString(5));
				d.setEstado1(rs.getString(6));
				d.setMotivo1(rs.getString(7));
				d.setEstado2(rs.getString(8));
				d.setMotivo2(rs.getString(9));
				d.setFecha(rs.getString(10));
				d.setMatricula(rs.getString(11));
				d.setPais(rs.getString(12));
				d.setFideicomiso(rs.getString(13));
				d.setTipoPago(rs.getString(14));
				d.setBanco(rs.getString(15));
				d.setNoCuenta(rs.getString(16));
				d.setFechaSubs(rs.getString(17));
				d.setFechaCump(rs.getString(18));
				d.setBeneficiarioFinal(rs.getString(19));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}

	public static distribuidor getOne(String id, String tipo) {
		distribuidor d = new distribuidor();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where denominacion = ? and distribuidor = ?");
			ps.setString(1, id);
			ps.setString(2, tipo);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				d.setDenominacion(rs.getString(1));
				d.setRtn(rs.getString(2));
				d.setDireccion(rs.getString(3));
				d.setRepresentanteLegal(rs.getString(4));
				d.setDistribuidor(rs.getString(5));
				d.setEstado1(rs.getString(6));
				d.setMotivo1(rs.getString(7));
				d.setEstado2(rs.getString(8));
				d.setMotivo2(rs.getString(9));
				d.setFecha(rs.getString(10));
				d.setMatricula(rs.getString(11));
				d.setPais(rs.getString(12));
				d.setFideicomiso(rs.getString(13));
				d.setTipoPago(rs.getString(14));
				d.setBanco(rs.getString(15));
				d.setNoCuenta(rs.getString(16));
				d.setFechaSubs(rs.getString(17));
				d.setFechaCump(rs.getString(18));
				d.setBeneficiarioFinal(rs.getString(19));
				d.setPersoneria(rs.getString(20));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return d;
	}

	public static int update(distribuidor d, String id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.distribuidor set denominacion = ?, direccion = ?, rtn = ?, fecha = ?, matricula = ?, distribuidor = ?, pais = ?, fideicomiso = ?, tipoPago = ?, banco = ?, noCuenta = ?, FechaSubs = ?, FechaCump = ?, beneficiarioFinal = ?, personeria = ? where denominacion = ?");
			ps.setString(1, d.getDenominacion());
			ps.setString(2, d.getDireccion());
			ps.setString(3, d.getRtn());
			ps.setString(4, d.getFecha());
			ps.setString(5, d.getMatricula());
			ps.setString(6, d.getDistribuidor());
			ps.setString(7, d.getPais());
			ps.setString(8, d.getFideicomiso());
			ps.setString(9, d.getTipoPago());
			ps.setString(10, d.getBanco());
			ps.setString(11, d.getNoCuenta());
			ps.setString(12, d.getFechaSubs());
			ps.setString(13, d.getFechaCump());
			ps.setString(14, d.getBeneficiarioFinal());
			ps.setString(15, d.getPersoneria());
			ps.setString(16, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int aprobarBenef(distribuidor d) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.distribuidor set estado1 = ?, motivo1 = ?, estado2 = ?, motivo2 = ? where denominacion = ? and distribuidor = 'BENEFICIARIO'");
			ps.setString(1, d.getEstado1());
			ps.setString(2, d.getMotivo1());
			ps.setString(3, d.getEstado2());
			ps.setString(4, d.getMotivo2());
			ps.setString(5, d.getDenominacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int aprobar(distribuidor d) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.distribuidor set estado1 = ?, motivo1 = ?, estado2 = ?, motivo2 = ? where denominacion = ?");
			ps.setString(1, d.getEstado1());
			ps.setString(2, d.getMotivo1());
			ps.setString(3, d.getEstado2());
			ps.setString(4, d.getMotivo2());
			ps.setString(5, d.getDenominacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return status;
	}

	public static int save(distribuidor d) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.distribuidor (denominacion, rtn, direccion, representanteLegal, distribuidor, estado1, motivo1, estado2, motivo2, fecha, matricula, pais, fideicomiso, tipoPago, banco, noCuenta, FechaSubs, FechaCump, beneficiarioFinal, personeria) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, d.getDenominacion());
			ps.setString(2, d.getRtn());
			ps.setString(3, d.getDireccion());
			ps.setString(4, d.getRepresentanteLegal());
			ps.setString(5, d.getDistribuidor());
			ps.setString(6, d.getEstado1());
			ps.setString(7, d.getMotivo1());
			ps.setString(8, d.getEstado2());
			ps.setString(9, d.getMotivo2());
			ps.setString(10, d.getFecha());
			ps.setString(11, d.getMatricula());
			ps.setString(12, d.getPais());
			ps.setString(13, d.getFideicomiso());
			ps.setString(14, d.getTipoPago());
			ps.setString(15, d.getBanco());
			ps.setString(16, d.getNoCuenta());
			ps.setString(17, d.getFechaSubs());
			ps.setString(18, d.getFechaCump());
			ps.setString(19, d.getBeneficiarioFinal());
			ps.setString(20, d.getPersoneria());
			status = ps.executeUpdate();
			System.out.println("Nueva denominacion: " + d.getDenominacion());
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateEstado(String modifId) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.distribuidor set estado1 = ? where denominacion = ?");
			ps.setString(1, "PENDIENTE DE APROBAR");
			ps.setString(2, modifId);
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static boolean ValidarRTN(String RTN, String tipo) {
		boolean exists = false;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where rtn = ?");
			ps.setString(1, RTN);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return exists;
	}
	
	public static ArrayList<distribuidor> beneficiarios(){
		ArrayList<distribuidor> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select id, denominacion from distribuidor where distribuidor = 'BENEFICIARIO' and estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				distribuidor beneficiario = new distribuidor();				
				beneficiario.setId(rs.getInt(1));
				beneficiario.setDenominacion(rs.getString(2));
				List.add(beneficiario);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static ArrayList<distribuidor> proveedorList(){
		ArrayList<distribuidor> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select id, denominacion from distribuidor where distribuidor = 'DISTRIBUIDOR' and estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				distribuidor beneficiario = new distribuidor();				
				beneficiario.setId(rs.getInt(1));
				beneficiario.setDenominacion(rs.getString(2));
				List.add(beneficiario);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static ArrayList<distribuidor> fabricante(){
		ArrayList<distribuidor> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select denominacion from distribuidor where distribuidor = 'FABRICANTE' and estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				distribuidor beneficiario = new distribuidor();	
				beneficiario.setDenominacion(rs.getString(1));
				List.add(beneficiario);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static String GetCuentaBanco(int  idProveedor) {
		String proveedor = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select nocuenta, banco, tipoPago from distribuidor where id = ?");
			ps.setLong(1, idProveedor);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+";"+rs.getString(2)+";"+rs.getString(3)+";";
			}			
			j = j.substring(0, j.length() - 1);
			proveedor = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return proveedor;
	}
	
	public static boolean ValidarDenominacionSocial(String denominacion, String tipo) {
		boolean exists = false;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.distribuidor where denominacion = ?");
			ps.setString(1, denominacion);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				exists = true;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return exists;
	}
	
	
}