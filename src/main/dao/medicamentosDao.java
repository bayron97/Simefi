package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class medicamentosDao {

	public static String getAll() {
		String meds = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.medicamentos where estado1 ='APROBADO' and estado2 ='ACTIVO'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				String cod = rs.getString(2);
				String nombre = rs.getString(4);
				String desc = rs.getString(8);
				String up = rs.getString(6);
				String codSesal = rs.getString(3);

				j += "[" + "\"" + count + "\"," + "\"" + nombre + "\"," + "\"" + desc + "\","  + "\"" + cod + "\"," + "\"" + up + "\",\""
						+ codSesal + "\"],";

				count += 1;
			}
			if(count==0) {
				j += "[" + "\"0\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-"  + "\"," + "\"" + "-" + "\",\""
						+ "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			meds = j;
		} catch (Exception e) {
			System.out.println(e);
		}
		return meds;
	}

	public static String getByName(String name) {
		String meds = "VACIO";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from dbo.medicamentos where estado1 ='APROBADO' and estado2 ='ACTIVO' and nombre Like '%"+name+"%'");
							
			// ps.setString(1, name);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String cod = rs.getString(2);
				String nombre = rs.getString(4);
				String desc = rs.getString(8);
				String up = rs.getString(6);
				String codSesal = rs.getString(3);
				j += "[" + "\"0\"," + "\"" + nombre + "\"," + "\"" + desc + "\"," + "\"" + cod  + "\"," + "\"" + up + "\",\""
					+ codSesal + "\"],";
			}
			if(count==0) {
				j += "[" + "\"0\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-"  + "\"," + "\"" + "-" + "\",\""
						+ "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			meds = j;
			System.out.println("test " + meds);
		} catch (Exception e) {
			System.out.println();
		}
		return meds;
	}

	public static int aprov(medicamentos m) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.medicamentos set estado1 = ?, movimiento1 = ?, estado2 = ?, movimiento2 = ? where codSist = ?");
			ps.setString(1, m.getEstado1());
			ps.setString(2, m.getMovimiento1());
			ps.setString(3, m.getEstado2());
			ps.setString(4, m.getMovimiento2());
			ps.setInt(5, m.getCodSist());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(medicamentos m) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.medicamentos (codAtc, codSesal, nombre, viaAdmin, up, atencion, descripcion, estado1, movimiento1, estado2, movimiento2, grupoTerapeutico, subGrupo, observacion, beneficiario, listado) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, m.getCodAtc());
			ps.setString(2, m.getCodSesal());
			ps.setString(3, m.getNombre().toUpperCase());
			ps.setString(4, m.getViaAdmin());
			ps.setString(5, m.getUp());
			ps.setString(6, m.getAtencion());
			ps.setString(7, m.getDescripcion());
			ps.setString(8, m.getEstado1());
			ps.setString(9, m.getMovimiento1());
			ps.setString(10, m.getEstado2());
			ps.setString(11, m.getMovimiento2());
			ps.setString(12, m.getGrupo());
			ps.setString(13, m.getSubGrupo());
			ps.setString(14, m.getObservacion());
			ps.setString(15, m.getBeneficiario());
			ps.setString(16, m.getListado());
			status = ps.executeUpdate();
			System.out.println(m.getCodSist());
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			        status = generatedKeys.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return status;
	}

	public static int update(medicamentos m, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.medicamentos set codAtc = ?, codSesal = ?, nombre = ?, viaAdmin = ?, up = ?, atencion = ?, descripcion = ?, estado1 = ?, movimiento1 = ?, estado2 = ?, movimiento2 = ?, grupoTerapeutico = ?, subGrupo = ?, observacion = ?, beneficiario = ?, listado = ? where codSist = ?");
			ps.setString(1, m.getCodAtc());
			ps.setString(2, m.getCodSesal());
			ps.setString(3, m.getNombre());
			ps.setString(4, m.getViaAdmin());
			ps.setString(5, m.getUp());
			ps.setString(6, m.getAtencion());
			ps.setString(7, m.getDescripcion());
			ps.setString(8, m.getEstado1());
			ps.setString(9, m.getMovimiento1());
			ps.setString(10, m.getEstado2());
			ps.setString(11, m.getMovimiento2());
			ps.setString(12, m.getGrupo());
			ps.setString(13, m.getSubGrupo());
			ps.setString(14, m.getObservacion());
			ps.setString(15, m.getBeneficiario());
			ps.setString(16, m.getListado());
			ps.setInt(17, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getCant() {
		int cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select count(*) from dbo.medicamentos");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				cant = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return cant;
	}

	public static medicamentos getById(int id) {
		medicamentos m = new medicamentos();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.medicamentos where codSist = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				m.setCodSist(id);
				m.setCodAtc(rs.getString(2));
				m.setCodSesal(rs.getString(3));
				m.setNombre(rs.getString(4));
				m.setViaAdmin(rs.getString(5));
				m.setUp(rs.getString(6));
				m.setAtencion(rs.getString(7));
				m.setDescripcion(rs.getString(8));
				m.setEstado1(rs.getString(9));
				m.setMovimiento1(rs.getString(10));
				m.setEstado2(rs.getString(11));
				m.setMovimiento2(rs.getString(12));
				m.setGrupo(rs.getString(13));
				m.setSubGrupo(rs.getString(14));
				m.setObservacion(rs.getString(15));
				m.setBeneficiario(rs.getString(16));
				m.setListado(rs.getString(17));
				System.out.println("hay id" +id);
			}
			con.close();

		} catch (Exception e) {
			System.out.println("hay id" +id);
		}
		return m;
	}
	
	public static String getMedicamento() {
		String meds = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.medicamentos where estado1 ='APROBADO' and estado2 ='ACTIVO'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				int cod = rs.getInt(1);
				String nombre = rs.getString(4);
			
			

				j +=  "\"" + nombre 
						+ "\",";

				count += 1;
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			meds = j;
			System.out.print(meds);
		} catch (Exception e) {
			System.out.println(e);
		}
		return meds;
	}
	
	public static String getProductoSeleccionado(String medicamento) {	
		
		
		String medi = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select descripcion, up, codAtc, codSesal from [dbo].[medicamentos] where nombre =?");
			ps.setString(1, medicamento);
			String j = "";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {				
				String descripcion = rs.getString(1);
				String up = rs.getString(2);
				String codAtc = rs.getString(3);	
				String codSesal = rs.getString(4);
				j +=  "\"" + descripcion + "\";" + "\"" + up + "\";" + "\"" + codAtc + "\";" + "\"" + codSesal + "\";";				
				count += 1;
			}
			j = j.substring(0, j.length() - 1);
			j += "";
			medi = j;
			
			System.out.println(medi);
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return medi;
	}
	
	
	public static int validarSESALNew(String codSesalparam) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from dbo.medicamentos where codSesal =?");
			 ps.setString(1, codSesalparam);
		
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
	
	public static int validarSESALUpdate(String codSesalparam, String id) {
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from dbo.medicamentos where codSesal =? and codSist != ?");
			 ps.setString(1, codSesalparam);
			 ps.setString(2, id);		
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
	
	public static int updateEstado(String modifId) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.medicamentos set estado1 = ? where codSist = ?");
			ps.setString(1, "PENDIENTE DE APROBAR");
			ps.setString(2, modifId);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<medicamentos> GeMedicamentos(){
		ArrayList<medicamentos> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select codSist as idMedicamento, nombre, descripcion, codAtc, codSesal, up from medicamentos  where estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				medicamentos medicamento = new medicamentos();				
				medicamento.setCodSist(rs.getInt(1));
				medicamento.setNombre(rs.getString(2));	
				medicamento.setDescripcion(rs.getString(3));	
				medicamento.setCodAtc(rs.getString(4));	
				medicamento.setCodSesal(rs.getString(5));	
				medicamento.setUp(rs.getString(6));	
				List.add(medicamento);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	
}
