package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class procesoCompraGeneralDao {

	public static int save(procesoCompraGeneral p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.procesoCompraGeneral(noProcesoCompra, fechaLimite, fechaApertura, lugar, periodoValidez, fechaPublicacion, idioma, tipoMoneda, estado1, observaciones,descripcioncompra) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, p.getNoProcesoCompra());
			ps.setString(2, p.getFechaLimite());
			ps.setString(3, p.getFechaApertura());
			ps.setString(4, p.getLugar());
			ps.setString(5, p.getPeriodoValidez());
			ps.setString(6, p.getFechaPublicacion());
			ps.setString(7, p.getIdioma());
			ps.setString(8, p.getTipoMoneda());
			//ps.setInt(8, p.getNoItemsRequeridos());
			ps.setString(9, p.getEstado1());
			ps.setString(10, p.getObservaciones());
			ps.setString(11, p.getDescripcionCompra());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	// Funciones para General comienzan aqui

	public static int addOficio(String oficio, int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("insert into dbo.oficioProcesoCompraGeneral (oficio, procesoCompra) values (?,?)");
			ps.setString(1, oficio);
			ps.setInt(2, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int hayOficio(int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.oficioProcesoCompraGeneral where procesoCompra = ?");
			ps.setInt(1, cod);
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

	public static int addBenefGeneral(String oficio, int no, String nombreArchivo) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.beneFinalOficioCompraGeneral (beneF, oficio, nombreArchivo) values (?,?,?)");
			ps.setInt(1, no);
			ps.setString(2, oficio);
			ps.setString(3, nombreArchivo);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	// Funciones para General terminan aqui

	public static int addBenef(int no, int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("insert into dbo.beneFinalProcesoC (beneF, procesoCompra) values (?,?)");
			ps.setInt(1, no);
			ps.setInt(2, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(int id, procesoCompraGeneral p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.procesoCompraGeneral set noProcesoCompra = ?, fechaLimite = ?, fechaApertura = ?, lugar = ?, periodoValidez = ?, fechaPublicacion = ?, idioma = ?, tipoMoneda = ? where idProcesoCompraGeneral = ?");
			ps.setString(1, p.getNoProcesoCompra());
			ps.setString(2, p.getFechaLimite());
			ps.setString(3, p.getFechaApertura());
			ps.setString(4, p.getLugar());
			ps.setString(5, p.getPeriodoValidez());
			ps.setString(6, p.getFechaPublicacion());
			ps.setString(7, p.getIdioma());
			ps.setString(8, p.getTipoMoneda());
			//ps.setInt(8, p.getNoItemsRequeridos());
			ps.setInt(9, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateEstado(String Estado, int cod, String observaciones) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.procesoCompraGeneral set estado1 = ?, observaciones=? where  idProcesoCompraGeneral= ?");
			ps.setString(1, Estado);
			ps.setString(2, observaciones);
			ps.setInt(3, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int revisar(procesoCompraGeneral p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.procesoCompraGeneral set estado1 = ?, observaciones = ? where idProcesoCompraGeneral = ?");
			ps.setString(1, p.getEstado1());
			ps.setString(2, p.getObservaciones());
			ps.setInt(3, p.getidProcesoCompraGeneral());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static procesoCompraGeneral getById(int id) {
		procesoCompraGeneral p = new procesoCompraGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.procesoCompraGeneral where idProcesoCompraGeneral = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setidProcesoCompraGeneral(id);
				p.setNoProcesoCompra(rs.getString(2));
				p.setFechaPublicacion(rs.getString(3));
				p.setFechaLimite(rs.getString(4));
				p.setFechaApertura(rs.getString(5));
				p.setLugar(rs.getString(6));
				p.setPeriodoValidez(rs.getString(7));
				
				p.setIdioma(rs.getString(8));
				p.setTipoMoneda(rs.getString(9));
				//p.setNoItemsRequeridos(rs.getInt(9));
				p.setEstado1(rs.getString(10));
				p.setObservaciones(rs.getString(11));
				p.setDescripcionCompra(rs.getString(12));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	public static String getEstado(int cod) {
		String estado = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select estado1 from dbo.procesoCompraGeneral where idProcesoCompraGeneral = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				estado = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return estado;
	}

	public static String getObservacions(int cod) {
		String obs = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select observaciones from dbo.procesoCompraGeneral where idProcesoCompraGeneral = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				obs = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {

		}
		return obs;
	}

	public static String getProcesoCompra(int cod) {
		String noPC = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select noProcesoCompra from dbo.procesoCompraGeneral where idProcesoCompraGeneral = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				noPC = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {

		}
		return noPC;
	}

	public static int getCodProcesoCompra(String no) {
		int cod = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select idProcesoCompraGeneral from dbo.procesoCompraGeneral where noProcesoCompra = ?");
			ps.setString(1, no);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cod = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cod;
	}

	public static String getAll() {
		String procs = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select idProcesoCompraGeneral, noProcesoCompra, fechaApertura  from dbo.procesoCompraGeneral order by noProcesoCompra");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int cod = rs.getInt(1);
				String proc = rs.getString(2);
				String fechaApertura = rs.getString(3);

				j += "[" + "\"" + cod + "\"," + "\"" + proc.toUpperCase() + "\"," + "\"" + fechaApertura + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			procs = j;
		} catch (Exception e) {
			System.out.println(e);
		}
		return procs;
	}

	public static String getByNo(String name) {
		String proc = "VACIO";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select idProcesoCompraGeneral, noProcesoCompra, fechaApertura from dbo.procesoCompraGeneral where noProcesoCompra Like '"
							+ name + "%'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int cod = rs.getInt(1);
				String noproc = rs.getString(2);
				String fechaApertura = rs.getString(3);

				j += "[" + "\"" + cod + "\"," + "\"" + noproc.toUpperCase() + "\"," + "\"" + fechaApertura + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			proc = j;
		} catch (Exception e) {
			System.out.println();
		}
		return proc;
	}
	
	public static String getProcesosCompraGeneral(String beneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
			.prepareStatement("select pcg.idProcesoCompraGeneral, pcg.noProcesoCompra from  listaRequerimientoGeneral as lrcg inner join procesoCompraGeneral pcg on lrcg.procesoCompra = pcg.idProcesoCompraGeneral where beneficiario = ? and estado1='APROBADO'  GROUP BY pcg.idProcesoCompraGeneral, pcg.noProcesoCompra  ");
			ps.setString(1, beneficiario);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int cod = rs.getInt(1);
				String procesoCompra = rs.getString(2);

				j += "<option value=" + cod + ">" + procesoCompra + "</option>" + "SEPARAR";
				System.out.println(j );
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
}

