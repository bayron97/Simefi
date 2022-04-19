package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class evaluacionRecomendacionOfertaALPDao {

	public static int save(evaluacionRecomendacionOfertaALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO BancOcci.dbo.EvaluacionRecomendacionOfertasALP\r\n"
					+ "(fechaVaciado, noProcesoCompra, noSolicitudCompra, noSolicitudDisponibilidad, distribuidor, prelacion, noItem, codigoATC, productoRequerido, productoAcordado, descripcionTecnicaRequerido, descripcionTecnicaAcordado, unidadPresentacionRequerido, unidadPresentacionAcordada, nombreFabricante_paisOrigen, cerfRegSan, cerfBPM, cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal, tiempoEntregaOfertada, vidaUtilOfertada, cantidadiEmpaquePrimario, cantidadiEmpaqueSecundario, fechaEvaluacionRecomendacion, recomendacionComite, criterioRecomendacion, prelacionRecomendacionTecnica, observaciones, RecomendacionBeneficiarios, estatusCompra, observacionesEstadoOrdenCompra)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, o.getFechaVaciado());
			ps.setString(2, o.getNoProcesoCompra());
			ps.setLong(3, o.getNoSolicitudCompra());
			ps.setLong(4, o.getNoSolicitudDisponibilidad());
			ps.setString(5, o.getDistribuidor());
			ps.setString(6, o.getPrelacion());
			ps.setInt(7, o.getNoItem());
			ps.setString(8, o.getCodigoATC());
			ps.setString(9, o.getProductoRequerido());
			ps.setString(10, o.getProductoAcordado());
			ps.setString(11, o.getDescripcionTecnicaRequerido());
			ps.setString(12, o.getDescripcionTecnicaAcordado());
			ps.setString(13, o.getUnidadPresentacionRequerido());
			ps.setString(14, o.getUnidadPresentacionAcordada());
			ps.setString(15, o.getNombreFabricante_paisOrigen());
			ps.setString(16, o.getCerfRegSan());
			ps.setString(17, o.getCerfBPM());
			ps.setFloat(18, o.getCantidadRequerida());
			ps.setFloat(19, o.getCantidadOfertada());
			ps.setFloat(20, o.getPrecioUnitarioAcordado());
			ps.setString(21, o.getTiempoEntregaOfertada());
			ps.setString(22, o.getVidaUtilOfertada());
			ps.setString(23, o.getCantidadiEmpaquePrimario());
			ps.setString(24, o.getCantidadiEmpaqueSecundario());
			ps.setString(25, o.getFechaEvaluacionRecomendacion());
			ps.setString(26, o.getRecomendacionComite());
			ps.setString(27, o.getCriterioRecomendacion());
			ps.setString(28, o.getPrelacionRecomendacionTecnica());
			ps.setString(29, o.getObservaciones());
			ps.setString(30, o.getRecomendacionBeneficiarios());
			ps.setString(31, o.getEstatusCompra());
			ps.setString(31, o.getObservacionesEstadoOrdenCompra());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static String getSol(String noProcesoCompra, String benef) {
		String solList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT codSolicitudCompra FROM solicitudCompraALP where noProcesoCompra = ? AND beneficiario = ?");
			ps.setString(1, noProcesoCompra);
			ps.setString(2, benef);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				j += rs.getString(1) + ",";
			}
			j = j.substring(0, j.length() - 1);
			solList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return solList;
	}

	public static String getProd(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select id, fecha, noProcesoCompra, codSolicitudCompra, regSanCriterio, certBPMCriterio from dbo.solicitudCompraALP where noProcesoCompra=?");
			ps.setString(1, noProcesoCompra);
			int id = 0;
			String fecha = "";
			String procCompra = "";
			String solCompra = "";
			String regSant = "";
			String certBpm = "";
			
			String solDisp = "";
			
			String proveedor = "";
			int noItem = 0;
			String codAtc = "";
			String prod = "";
			String prodAcor = "";
			String desc = "";
			String descAcor = "";
			String up = "";
			String upAcor = "";
			String precUnitario = "";
			
			String prelacion = ""; 
			
			float cant = 0;
			
			String j = "{ \"data\":[";
			
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				id = rs.getInt(1);
				fecha = rs.getString(2);
				procCompra = rs.getString(3);
				solCompra = rs.getString(4);
				if(rs.getString(5) != null){
					regSant = rs.getString(5);
				}
				if(rs.getString(6) != null) {
					certBpm = rs.getString(6);
				}
			}
			
			ps = con.prepareStatement("select codSolicitudDisponibilidad from dbo.solicitudDisponibilidadALP where idSolicitudCompra = " + id);
			rs = ps.executeQuery();
			while(rs.next()) {
				solDisp = rs.getString(1);
			}
			
			ps = con.prepareStatement("select proveedor, noItem, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, precioUnitario, cantidadRequerida, prelacion from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = " + id);
		    rs = ps.executeQuery();
			while (rs.next()) {
				proveedor = rs.getString(1);
				noItem = rs.getInt(2);
				codAtc = rs.getString(3);
				prod = rs.getString(4);
				desc = rs.getString(5);
				up = rs.getString(6);
				precUnitario = rs.getString(7);
				cant = rs.getFloat(8);
				prelacion = rs.getString(9);
			}
			
			ps = con.prepareStatement("select medicamentoOfertado, descripcionTecnica, up from dbo.ofertaALP where procesoCompra = ?");
			ps.setString(1, noProcesoCompra);
			rs = ps.executeQuery();
			while(rs.next()) {
				prodAcor = rs.getString(1);
				descAcor = rs.getString(2);
				upAcor = rs.getString(3);
			}
			
			j += "[" + "\"" + fecha + "\"," + "\"" + procCompra + "\"," + "\"" + solCompra + "\"," + "\"" + solDisp
					+ "\"," + "\"" + proveedor + "\"," + "\"" + prelacion + "\"," + "\"" + noItem + "\"," + "\"" + codAtc + "\"," + "\"" + prod + "\","
					+ "\"" + prodAcor + "\"," + "\"" + desc + "\"," + "\"" + descAcor + "\"," + "\"" + up + "\","
					+ "\"" + upAcor + "\"," + "\"" + " " + "\"," + "\"" + regSant + "\"," + "\"" + certBpm + "\","
					+ "\"" + " " + "\"," + "\"" + cant + "\"," + "\"" + " " + "\"," + "\"" + " " + "\","
					+ "\"" + " " + "\"," + "\"" + " " + "\"," + "\"" + " " + "\"," + "\"" + " " + "\","
					+ "\"" + " " + "\"," + "\"" + " " + "\"," + "\"" + " " + "\","
					+ "\"" + " " + "\"," + "\"" + " " + "\"," + "\"" + " " + "\"," + "\"" + " " + "\","
					+ "\"" + " " + "\"],";
			
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
	public static int delete(long id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("DELETE FROM BancOcci.dbo.EvaluacionRecomendacionOfertasALP WHERE id=?");
			ps.setLong(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static String getBeneficiariosSolicitudCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT beneficiario FROM solicitudCompraALP where noProcesoCompra = ?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String benef = rs.getString(1);

				j += benef + ",";
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

	public static String getSolicitudesComprabyProcesoCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT id,codSolicitudCompra FROM solicitudCompraALP where noProcesoCompra = ?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int IdIncremental = rs.getInt(1);
				String codSolicitudCompra = rs.getString(2);

				j += IdIncremental + ";" + codSolicitudCompra + ",";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static String getSolicitudesDisponibilidadbySolicitudCompra(Long solicitudCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT orsda.distribuidor,orsda.nombreFabricante FROM solicitudDisponibilidadALP sda INNER JOIN ofertaSolicitudDisponibilidadALP orsda \r\n"
							+ "ON sda.id = orsda.idSolicitudDisponibilidad where sda.idSolicitudCompra= ?");
			ps.setLong(1, solicitudCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String beneficiario = rs.getString(1);
				String fabricante = rs.getString(2);

				j += beneficiario + ";" + fabricante + ",";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static String getProductosbySolicitudCompra(Long solicitudCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT orsda.id,orsda.nombreProductoAcordado FROM solicitudDisponibilidadALP sda INNER JOIN ofertaSolicitudDisponibilidadALP orsda \r\n"
							+ "ON sda.id = orsda.idSolicitudDisponibilidad where sda.idSolicitudCompra=?");
			ps.setLong(1, solicitudCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Long id = rs.getLong(1);
				String producto = rs.getString(2);

				j += id + ";" + producto + ",";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static String getProductosInfbySolicitudCompra(Long id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT orsda.distribuidor,orsda.unidadPresentacionAcordada,orsda.cantidadRequerida, orsda.tiempoEntrega ,orsda.prelacion,orsda.noItem ,orsda.codigoATC ,orsda.vidaUtil ,orsda.certRegSan ,orsda.certBPM FROM solicitudDisponibilidadALP sda INNER JOIN ofertaSolicitudDisponibilidadALP orsda \r\n"
							+ "ON sda.id = orsda.idSolicitudDisponibilidad where orsda.id =?");
			ps.setLong(1, id);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String distribuidor = rs.getString(1);
				String unidadpresentacion = rs.getString(2);
				Float cantidadrequerida = rs.getFloat(3);
				String tiempoEntrega = rs.getString(4);
				String prelacion = rs.getString(5);
				int noItem = rs.getInt(6);
				String codigoATC = rs.getString(7);
				String vidaUtil = rs.getString(8);
				String cerfRegSan = rs.getString(9);
				String cerfBPM = rs.getString(10);

				j += distribuidor + "," + unidadpresentacion + "," + cantidadrequerida + "," + tiempoEntrega + ","
						+ prelacion + "," + noItem + "," + codigoATC + "," + vidaUtil + "," + cerfRegSan + ","
						+ cerfBPM;
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	// public static ArrayList<evaluacionRecomendacionOfertaALP>
	// getOfferListByAvailabilityRequestID(long availabilityRequestID) {
	// ArrayList<ofertaSolicitudDisponibilidadALP> offerList = new ArrayList<>();
	// try {
	// Connection con = Database.connect();
	// PreparedStatement ps = con.prepareStatement(
	// "select noItem, distribuidor, prelacion, codigoATC, nombreProductoAcordado,
	// unidadPresentacionAcordada, nombreFabricante, paisOrigen, cerfRegSan,
	// cerfBPM, precioUnitarioAcordado, cantidadRequerida, tiempoEntrega, vidaUtil,
	// noSolicitudDisponibilidad, fecha, observaciones from
	// dbo.ofertaSolicitudDisponibilidadALP where idSolicitudDisponibilidad = ?");
	// ps.setLong(1, availabilityRequestID);
	// ResultSet rs = ps.executeQuery();
	// while(rs.next()) {
	// ofertaSolicitudDisponibilidadALP o = new ofertaSolicitudDisponibilidadALP();
	//
	// o.setNoItem(rs.getInt(1));
	// o.setDistribuidor(rs.getString(2));
	// o.setPrelacion(rs.getString(3));
	// o.setCodigoATC(rs.getString(4));
	// o.setNombreProductoAcordado(rs.getString(5));
	// o.setUnidadPresentacionAcordada(rs.getString(6));
	// o.setNombreFabricante(rs.getString(7));
	// o.setPaisOrigen(rs.getString(8));
	// o.setCerfRegSan(rs.getString(9));
	// o.setCerfBPM(rs.getString(10));
	// o.setPrecioUnitarioAcordado(rs.getFloat(11));
	// o.setCantidadRequerida(rs.getFloat(12));
	// o.setTiempoEntrega(rs.getString(13));
	// o.setVidaUtil(rs.getString(14));
	// o.setNoSolicitudDisponibilidad(rs.getString(15));
	// o.setFecha(rs.getString(16));
	// o.setObservaciones(rs.getString(17));
	//
	// offerList.add(o);
	// }
	// con.close();
	//
	// }catch(Exception e) {
	// System.out.println(e);
	// }
	//
	// return offerList;
	// }
}
