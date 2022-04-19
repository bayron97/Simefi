package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class procesoCompraALPDao {

	public static int save(procesoCompraALP p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.procesoCompraALP(noProcesoCompra, fechaLimite, fechaApertura, lugar, periodoValidez, idioma, tipoMoneda, noItemsRequeridos, estado1, observaciones,descripcioncompra) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, p.getNoProcesoCompra());
			ps.setString(2, p.getFechaLimite());
			ps.setString(3, p.getFechaApertura());
			ps.setString(4, p.getLugar());
			ps.setString(5, p.getPeriodoValidez());
			ps.setString(6, p.getIdioma());
			ps.setString(7, p.getTipoMoneda());
			ps.setInt(8, p.getNoItemsRequeridos());
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

	// Funciones para ALP comienzan aqui

	public static int addOficio(String oficio, int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("insert into dbo.oficioProcesoCompraALP (oficio, procesoCompra) values (?,?)");
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
					.prepareStatement("select * from dbo.oficioProcesoCompraALP where procesoCompra = ?");
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

	public static int addBenefALP(String oficio, int no, String nombreArchivo, int idProcesoCompALP) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.beneFinalOficioCompraALP (beneF, oficio, nombreArchivo, idProcesoCompALP) values (?,?,?,?)");
			ps.setInt(1, no);
			ps.setString(2, oficio);
			ps.setString(3, nombreArchivo);
			ps.setInt(4, idProcesoCompALP);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	// Funciones para ALP terminan aqui

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

	public static int update(int id, procesoCompraALP p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.procesoCompraALP set noProcesoCompra = ?, fechaLimite = ?, fechaApertura = ?, lugar = ?, periodoValidez = ?, idioma = ?, tipoMoneda = ?, noItemsRequeridos = ? where cod = ?");
			ps.setString(1, p.getNoProcesoCompra());
			ps.setString(2, p.getFechaLimite());
			ps.setString(3, p.getFechaApertura());
			ps.setString(4, p.getLugar());
			ps.setString(5, p.getPeriodoValidez());
			ps.setString(6, p.getIdioma());
			ps.setString(7, p.getTipoMoneda());
			ps.setInt(8, p.getNoItemsRequeridos());
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
					.prepareStatement("update dbo.procesoCompraALP set estado1 = ?, observaciones=? where cod = ?");
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

	public static int revisar(procesoCompraALP p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.procesoCompraALP set estado1 = ?, observaciones = ? where cod = ?");
			ps.setString(1, p.getEstado1());
			ps.setString(2, p.getObservaciones());
			ps.setInt(3, p.getCod());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static procesoCompraALP getById(int id) {
		procesoCompraALP p = new procesoCompraALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.procesoCompraALP where cod = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setCod(id);
				p.setNoProcesoCompra(rs.getString(2));
				p.setFechaLimite(rs.getString(3));
				p.setFechaApertura(rs.getString(4));
				p.setLugar(rs.getString(5));
				p.setPeriodoValidez(rs.getString(6));
				p.setIdioma(rs.getString(7));
				p.setTipoMoneda(rs.getString(8));
				p.setNoItemsRequeridos(rs.getInt(9));
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
	
	public static procesoCompraALP getByCod(String cod) {
		procesoCompraALP p = new procesoCompraALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select * from dbo.procesoCompraALP where noProcesoCompra = ? or noProcesoCompra = ?");
			ps.setString(1, cod.toUpperCase());
			ps.setString(2, cod.toLowerCase());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setCod(rs.getInt(1));
				p.setNoProcesoCompra(rs.getString(2));
				p.setFechaLimite(rs.getString(3));
				p.setFechaApertura(rs.getString(4));
				p.setLugar(rs.getString(5));
				p.setPeriodoValidez(rs.getString(6));
				p.setIdioma(rs.getString(7));
				p.setTipoMoneda(rs.getString(8));
				p.setNoItemsRequeridos(rs.getInt(9));
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
			PreparedStatement ps = con.prepareStatement("select estado1 from dbo.procesoCompraALP where cod = ?");
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
			PreparedStatement ps = con.prepareStatement("select observaciones from dbo.procesoCompraALP where cod = ?");
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
					.prepareStatement("select noProcesoCompra from dbo.procesoCompraALP where cod = ?");
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
					.prepareStatement("select cod from dbo.procesoCompraALP where noProcesoCompra = ?");
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
//					"select cod, noProcesoCompra, fechaApertura,Cast(SUBSTRING(noProcesoCompra, 10,6) as Int) AS Orden  from dbo.procesoCompraALP where estado1 = 'APROBADO' order by Orden");
					"select cod, noProcesoCompra, fechaApertura  from dbo.procesoCompraALP where estado1 = 'APROBADO' ");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int cod = rs.getInt(1);
				String proc = rs.getString(2);
				String fechaApertura = rs.getString(3);

				j += "[" + "\"" + cod + "\"," + "\"" + proc.toUpperCase() + "\"," + "\"" + fechaApertura + "\"],";
			}
			
	         if(count == 0) {
				
				j += "[" + "\"" + "-" + "\"," + "\"" +  "-" + "\"," + "\"" +  "-" + "\"],";
				
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
					"select cod, noProcesoCompra, fechaApertura from dbo.procesoCompraALP where noProcesoCompra  Like '"
							+ name + "%' AND estado1 = 'APROBADO'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int cod = rs.getInt(1);
				String noproc = rs.getString(2);
				String fechaApertura = rs.getString(3);

				j += "[" + "\"" + cod + "\"," + "\"" + noproc.toUpperCase() + "\"," + "\"" + fechaApertura + "\"],";
			}
			if(count == 0) {
				
				j += "[" + "\"" + "-" + "\"," + "\"" +  "-" + "\"," + "\"" +  "-" + "\"],";
				
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			proc = j;
		} catch (Exception e) {
			System.out.println();
		}
		return proc;
	}
	
	public static String getBuyPurchaseDescriptionByALPNumber(String ALPNumber) {
		String description = "-";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select descripcionCompra from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				description = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return description;
	}
	
	public static String getProcesosCompra(String beneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
			.prepareStatement("SELECT pcALP.cod, pcALP.noProcesoCompra FROM procesoCompraALP as pcALP\r\n"
					+ "inner join solicitudCompraALP as scALP on pcALP.noProcesoCompra = scALP.noProcesoCompra\r\n"
					+ "where scALP.beneficiario =? and  pcALP.estado1='APROBADO' ");
			ps.setString(1, beneficiario);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String cod = rs.getString(1);
				String procesoCompra = rs.getString(2);

				j += "<option value=" + cod + ">" + procesoCompra + "</option>" + ",";
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
	
	public static String getProcesosCompraByCod(String beneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
			.prepareStatement("SELECT * from dbo.procesoCompraALP where cod =?");
			ps.setString(1, beneficiario);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String cod = rs.getString(1);
				String procesoCompra = rs.getString(2);

				j += "<option value=" + cod + ">" + procesoCompra + "</option>" + ",";
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
