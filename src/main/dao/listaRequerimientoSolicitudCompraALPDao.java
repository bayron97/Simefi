package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class listaRequerimientoSolicitudCompraALPDao {

	public static int save(listaRequerimientoSolicitudCompraALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoSolicitudCompraALP(idSolicitudCompra, noItem, noOficio, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, tiempoEntrega, vidaUtil, proveedor, observaciones, numCertRegSan, certBPM, origenFP, precioUnitario, moneda, fechaOferta, nombreProductoRequerido, descripcionTecnicaRequerida, unidadPresentacionRequerida, recomendacionesBeneficiarios, regSanVenc, certBPMVenc, prelacionRALP, recomendacionComite, noOferta, codigoSesal, fechaVencimientoRegSan, fechaEmisionRegSan, fechaVencimientoBPM, fechaEmisionBPM) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, l.getIdSolicitudCompra());
			ps.setLong(2, l.getNoItem());
			ps.setString(3, l.getNoOficio());
			ps.setString(4, l.getCodigoATC());
			ps.setString(5, l.getNombreProducto());
			ps.setString(6, l.getDescripcionTecnica());
			ps.setString(7, l.getUnidadPresentacion());
			ps.setFloat(8, l.getCantidadRequerida());
			ps.setString(9, l.getTiempoEntrega());
			ps.setString(10, l.getVidaUtil());
			ps.setString(11, l.getProveedor());
			ps.setString(12, l.getObservaciones());
			ps.setString(13, l.getNumCertRegSan());
			ps.setString(14, l.getCertBPM());
			ps.setString(15, l.getOrigenFP());
			ps.setString(16, l.getPrecioUnitario());
			ps.setString(17, l.getMoneda());
			ps.setString(18, l.getFechaOferta());
			ps.setString(19, l.getNombreProductoRequerido());
			ps.setString(20, l.getDescripcionTecnicaRequerida());
			ps.setString(21, l.getUnidadPresentacionRequerida());
			ps.setString(22, l.getRecomendacionesBeneficiarios());
			ps.setString(23, l.getRegSanVenc());
			ps.setString(24, l.getCertBPMVenc());
			ps.setInt(25, l.getprelacionRALP());
			ps.setString(26, l.getrecomendacionComite());
			ps.setInt(27, l.getnoOferta());
			ps.setString(28, l.getcodigoSesal());			
			ps.setString(29, l.getfechaEmisionRegSan());			
			ps.setString(30, l.getfechaVencimientoRegSan());
			ps.setString(31, l.getfechaEmisionBPM());
			ps.setString(32, l.getfechaVencimientoBPM());
			
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(listaRequerimientoSolicitudCompraALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudCompraALP set noOficio = ?, codigoATC = ?, nombreProducto = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, tiempoEntrega = ?, vidaUtil = ?, proveedor = ?, observaciones = ?, numCertRegSan = ?, certBPM = ?, origenFP = ?, precioUnitario = ?, moneda = ?, fechaOferta = ?, nombreProductoRequerido = ?, descripcionTecnicaRequerida = ?, unidadPresentacionRequerida = ?, recomendacionesBeneficiarios = ?, regSanVenc = ?, certBPMVenc = ? where id = ?");
			ps.setString(1, l.getNoOficio());
			ps.setString(2, l.getCodigoATC());
			ps.setString(3, l.getNombreProducto());
			ps.setString(4, l.getDescripcionTecnica());
			ps.setString(5, l.getUnidadPresentacion());
			ps.setFloat(6, l.getCantidadRequerida());
			ps.setString(7, l.getTiempoEntrega());
			ps.setString(8, l.getVidaUtil());
			ps.setString(9, l.getProveedor());
			ps.setString(10, l.getObservaciones());
			ps.setString(11, l.getNumCertRegSan());
			ps.setString(12, l.getCertBPM());
			ps.setString(13, l.getOrigenFP());
			ps.setString(14, l.getPrecioUnitario());
			ps.setString(15, l.getMoneda());
			ps.setString(16, l.getFechaOferta());
			ps.setString(17, l.getNombreProductoRequerido());
			ps.setString(18, l.getDescripcionTecnicaRequerida());
			ps.setString(19, l.getUnidadPresentacionRequerida());
			ps.setString(20, l.getRecomendacionesBeneficiarios());
			ps.setString(21, l.getRegSanVenc());
			ps.setString(22, l.getCertBPMVenc());

			ps.setLong(23, l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static listaRequerimientoSolicitudCompraALP getOneByBuyRequestIdAndNoItem(long idSolicitudCompra, int id) {
		listaRequerimientoSolicitudCompraALP rl = new listaRequerimientoSolicitudCompraALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select id, noOficio, noItem, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, tiempoEntrega, vidaUtil, proveedor, observaciones, numCertRegSan, certBPM, origenFP, precioUnitario, moneda, fechaOferta, codSolicitudDisponibilidad, nombreProductoRequerido, descripcionTecnicaRequerida, unidadPresentacionRequerida, recomendacionesBeneficiarios, regSanVenc, certBPMVenc, noOferta, registroSanitario, codigoSesal from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and id = ?");
			ps.setLong(1, idSolicitudCompra);
			ps.setInt(2, id);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				rl.setId(rs.getLong(1));
				rl.setNoOficio(rs.getString(2));
				rl.setNoItem(rs.getInt(3));
				rl.setCodigoATC(rs.getString(4));
				rl.setNombreProducto(rs.getString(5));
				rl.setDescripcionTecnica(rs.getString(6));
				rl.setUnidadPresentacion(rs.getString(7));
				rl.setCantidadRequerida(rs.getFloat(8));
				rl.setTiempoEntrega(rs.getString(9));
				rl.setVidaUtil(rs.getString(10));
				rl.setProveedor(rs.getString(11));
				rl.setObservaciones(rs.getString(12));
				rl.setNumCertRegSan(rs.getString(13));
				rl.setCertBPM(rs.getString(14));
				rl.setOrigenFP(rs.getString(15));
				rl.setPrecioUnitario(rs.getString(16));
				rl.setMoneda(rs.getString(17));
				rl.setFechaOferta(rs.getString(18));
				rl.setCodSolicitudDisponibilidad(rs.getString(19));
				rl.setNombreProductoRequerido(rs.getString(20));
				rl.setDescripcionTecnicaRequerida(rs.getString(21));
				rl.setUnidadPresentacionRequerida(rs.getString(22));
				rl.setRecomendacionesBeneficiarios(rs.getString(23));
				rl.setRegSanVenc(rs.getString(24));
				rl.setCertBPMVenc(rs.getString(25));
				rl.setnoOferta(rs.getInt(26));
				rl.setregistroSanitario(rs.getString(27));
				rl.setcodigoSesal(rs.getString(28));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return rl;
	}
	
	public static int updateAvailabilityRequestNoOrState(long idSolicitudCompra, long id, String noOrState) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoSolicitudCompraALP set codSolicitudDisponibilidad = ? where idSolicitudCompra = ? and id = ?");
			ps.setString(1, noOrState);
			ps.setLong(2, idSolicitudCompra);
			ps.setLong(3, id);
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ArrayList<listaRequerimientoSolicitudCompraALP> getReqListStatesOrSCCodsByBuyRequestId(long idSolicitudCompra) {
		ArrayList<listaRequerimientoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noItem, codSolicitudDisponibilidad from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudCompraALP rl = new listaRequerimientoSolicitudCompraALP();

				rl.setNoItem(rs.getInt(1));
				rl.setCodSolicitudDisponibilidad(rs.getString(2));

				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static int delete(long idSolicitudCompra, int noItem) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and noItem = ?");
			ps.setLong(1, idSolicitudCompra);
			ps.setInt(2, noItem);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getReqLastNoItemByBuyRequestId(long idSolicitudCompra) {
		int count = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select TOP(1) noItem from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? order by noItem DESC");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}

	public static ArrayList<listaRequerimientoSolicitudCompraALP> getReqListByBuyRequestId(long idSolicitudCompra) {
		ArrayList<listaRequerimientoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noOficio, noItem, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, tiempoEntrega, vidaUtil, proveedor, observaciones, numCertRegSan, certBPM, fechaOferta, codSolicitudDisponibilidad from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudCompraALP rl = new listaRequerimientoSolicitudCompraALP();

				rl.setNoOficio(rs.getString(1));
				rl.setNoItem(rs.getInt(2));
				rl.setCodigoATC(rs.getString(3));
				rl.setNombreProducto(rs.getString(4));
				rl.setDescripcionTecnica(rs.getString(5));
				rl.setUnidadPresentacion(rs.getString(6));
				rl.setCantidadRequerida(rs.getFloat(7));
				rl.setTiempoEntrega(rs.getString(8));
				rl.setVidaUtil(rs.getString(9));
				rl.setProveedor(rs.getString(10));
				rl.setObservaciones(rs.getString(11));
				rl.setNumCertRegSan(rs.getString(12));
				rl.setCertBPM(rs.getString(13));
				rl.setFechaOferta(rs.getString(14));
				rl.setCodSolicitudDisponibilidad(rs.getString(15));

				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static ArrayList<listaRequerimientoSolicitudCompraALP> getReqNamesByBuyRequestIdForFilter(long idSolicitudCompra) {
		ArrayList<listaRequerimientoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct nombreProducto from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudCompraALP rl = new listaRequerimientoSolicitudCompraALP();

				rl.setNombreProducto(rs.getString(1));

				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	public static ArrayList<listaRequerimientoSolicitudCompraALP> getReqSuppliersPreselectedByBuyRequestIdForFilter(long idSolicitudCompra) {
		ArrayList<listaRequerimientoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
			///		"select distinct proveedor from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and codSolicitudDisponibilidad = 'PRE SELECCIONADO' and recomendacionComite='SI'");
					"select distinct proveedor from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ?  and recomendacionComite='SI'");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				listaRequerimientoSolicitudCompraALP rl = new listaRequerimientoSolicitudCompraALP();

				rl.setProveedor(rs.getString(1));

				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static String getReqListByBuyRequestIdJSON(long idSolicitudCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noOficio, noItem, codigoATC, proveedor, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, tiempoEntrega, vidaUtil, observaciones from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String noOficio = rs.getString(1);
				String noItem = String.valueOf(rs.getInt(2));
				String codigoATC = rs.getString(3);
				String proveedor = rs.getString(4);
				String nombreProducto = rs.getString(5);
				String descripcionTecnica = rs.getString(6);
				String unidadPresentacion = rs.getString(7);
				String cantidadRequerida = String.valueOf(rs.getFloat(8));
				String tiempoEntrega = rs.getString(9);
				String vidaUtil = rs.getString(10);

				String observaciones = rs.getString(11);
				if (observaciones == null) {
					observaciones = "-";
				}

				j += "[" + "\"" + noOficio + "\"," + "\"" + noItem + "\"," + "\"" + codigoATC + "\"," + "\"" + proveedor
						+ "\"," + "\"" + nombreProducto + "\"," + "\"" + descripcionTecnica + "\"," + "\""
						+ unidadPresentacion + "\"," + "\"" + cantidadRequerida + "\"," + "\"" + tiempoEntrega + "\","
						+ "\"" + vidaUtil + "\"," + "\"" + observaciones + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + "-" + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	public static String getReqListByBuyRequestIdAndProductNameJSON(long idSolicitudCompra, String productName) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct L.noOficio, L.noItem, L.codigoATC, O.codSesal, L.nombreProducto, L.descripcionTecnica, L.unidadPresentacion, L.cantidadRequerida, L.tiempoEntrega, L.vidaUtil, codSolicitudDisponibilidad  from dbo.listaRequerimientoSolicitudCompraALP L inner join ofertaALP O ON L.codigoATC = O.codATC  where L.idSolicitudCompra = ? and L.nombreProducto = ? and L.recomendacionComite='SI' group by L.noOficio, L.noItem , L.codigoATC, O.codSesal, L.nombreProducto, L.descripcionTecnica, L.unidadPresentacion, L.cantidadRequerida, L.tiempoEntrega, L.vidaUtil, codSolicitudDisponibilidad \r\n");
//					+ "from dbo.listaRequerimientoSolicitudCompraALP \r\n"
//					+ "where idSolicitudCompra = ? and nombreProducto = ? and recomendacionComite='SI' \r\n"
//					+ "order by prelacionRALP asc");
			ps.setLong(1, idSolicitudCompra);
			ps.setString(2, productName);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
//				String proveedor = rs.getString(1);
				String noOficio = rs.getString(1);
				String noItem = rs.getString(2);
				String codigoATC = rs.getString(3);
				String codSesal = rs.getString(4);
				String nombreProducto = rs.getString(5);
				String descripcionTecnica = rs.getString(6);
				String unidadPresentacion = rs.getString(7);
//				String origenFP = rs.getString(7);
//				String numCertRegSan = rs.getString(8);
//				if (numCertRegSan == null) {
//					numCertRegSan = "NO AGREGADO";
//				}
//				String certBPM = rs.getString(9);
//				if (certBPM == null) {
//					certBPM = "NO AGREGADO";
//				}
//				String precioUnitario = rs.getString(10);
//				String moneda = rs.getString(11);
				String cantidadRequerida = String.valueOf(rs.getFloat(8));
				String tiempoEntrega = rs.getString(9);
				String vidaUtil = rs.getString(10);
//				String fechaOferta = rs.getString(15);
				String codSolicitudDisponibilidad = rs.getString(11);
//				String checkboxControl;
//				if (codSolicitudDisponibilidad == null || codSolicitudDisponibilidad.isEmpty() || codSolicitudDisponibilidad.equalsIgnoreCase("NINGUNO"))
//				{
//					codSolicitudDisponibilidad = "NINGUNO";
//					checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "'/>";
//				}
//				else if (codSolicitudDisponibilidad.equalsIgnoreCase("PRE SELECCIONADO")) 
//				{
//					checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "' checked/>";
//				}
//				else
//				{
//					checkboxControl = "YA ASOCIADO";
//				}

				j += "[" +  
						"\"" + noOficio + "\"," + 
						"\"" + noItem + "\"," + 
						"\""+ codigoATC + "\"," + 
						"\""+ codSesal + "\"," +
						"\"" + nombreProducto + "\"," +
						"\"" + descripcionTecnica + "\"," + 
						"\""+ unidadPresentacion + "\"," + 
						"\""+ cantidadRequerida + "\"," + 
						"\"" + tiempoEntrega + "\"," +
						"\"" + vidaUtil + "\"," +
						"\"" + "<input type='checkbox' name='reqReg' value='" + noItem + "'/>"+ "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + "-" + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	public static String getReqListByBuyRequestIdAndSupplierNameJSON(long idSolicitudCompra, String supplierName) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					//"select proveedor, noItem, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, origenFP, numCertRegSan, certBPM, precioUnitario, moneda, cantidadRequerida, tiempoEntrega, vidaUtil, fechaOferta, observaciones from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and proveedor = ? and codSolicitudDisponibilidad = ?");
					"select id,\r\n"
					+ "  	proveedor, \r\n"
					+ "     noItem, \r\n"
					+ "     codigoATC, \r\n"
					+ "     codigoSesal,\r\n"
					+ "     nombreProducto, \r\n"
					+ "     descripcionTecnica, \r\n"
					+ "     unidadPresentacion, \r\n"
					+ "     origenFP, \r\n"
					+ "     numCertRegSan, \r\n"
					+ "     fechaVencimientoRegSan,\r\n"
					+ "     fechaEmisionRegSan,\r\n"
					+ "     certBPM, \r\n"
					+ "     fechaVencimientoBPM,\r\n"
					+ "     fechaEmisionBPM,\r\n"
					+ "     ((CAST(precioUnitario AS DECIMAL(20, 4)))) as precioUnitario,\r\n"
					+ "     moneda, \r\n"
					+ "     cantidadRequerida, \r\n"
					+ "     tiempoEntrega,\r\n"
					+ "     vidaUtil, \r\n"
					+ "     observaciones "
					+ " from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and proveedor = ? and codSolicitudDisponibilidad = ?");
			ps.setLong(1, idSolicitudCompra);
			ps.setString(2, supplierName);
			ps.setString(3, "PRE SELECCIONADO");
			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String id = rs.getString(1);
				String proveedor = rs.getString(2);
				String noItem = rs.getString(3);
				String codigoATC = rs.getString(4);
				String codigoSesal = rs.getString(5);
				String nombreProducto = rs.getString(6);
				String descripcionTecnica = rs.getString(7);
				String unidadPresentacion = rs.getString(8);
				String origenFP = rs.getString(9);
				String numCertRegSan = rs.getString(10);if (numCertRegSan == null) {numCertRegSan = "NO AGREGADO";}
				String fechaVencimientoRegSan = rs.getString(11);
				String fechaEmisionRegSan = rs.getString(12);				
				String certBPM = rs.getString(13);if (certBPM == null) {certBPM = "NO AGREGADO";}
				String fechaVencimientoBPM = rs.getString(14);
				String fechaEmisionBPM = rs.getString(15);
				String precioUnitario = rs.getString(16);
				String moneda = rs.getString(17);
				String cantidadRequerida = String.valueOf(rs.getFloat(18));
				String tiempoEntrega = rs.getString(19);
				String vidaUtil = rs.getString(20);
				String observaciones = rs.getString(21);
				String checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "'/>";

				j += "[" + "\"" + id + "\"," 
						 + "\"" + proveedor + "\"," 
						 + "\"" + noItem + "\"," 
						 + "\"" + codigoATC + "\","
						 + "\"" + codigoSesal + "\","
						 + "\"" + nombreProducto + "\"," 
						 + "\"" + descripcionTecnica + "\"," 
						 + "\"" + unidadPresentacion + "\"," 
						 + "\"" + origenFP + "\"," 
						 + "\"" + numCertRegSan + "\"," 
						 + "\"" + fechaVencimientoRegSan + "\"," 
						 + "\"" + fechaEmisionRegSan + "\"," 
						 + "\"" + certBPM + "\"," 
						 + "\"" + fechaVencimientoBPM + "\"," 
						 + "\"" + fechaEmisionBPM + "\"," 
						 + "\"" + precioUnitario + "\"," 
						 + "\"" + moneda + "\"," 
						 + "\"" + cantidadRequerida + "\"," 
						 + "\"" + tiempoEntrega + "\"," 
						 + "\"" + vidaUtil + "\"," 
						 + "\"" + observaciones + "\"," 
						 + "\"" + checkboxControl
						+ "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	public static String getListaRequerimientoParaGenerarDisponibilidad(long idSolicitudCompra, String supplierName, String productos) {
		String reqList = "";
		try {
			
			String j = "{ \"data\":[";
			int count = 0;
			Connection con = Database.connect();
			
			String[] productosArray = productos.split("-");
			for (String producto : productosArray) {
				
				PreparedStatement ps = con.prepareStatement(
						"select id,\r\n"
						+ "  	proveedor, \r\n"
						+ "     noItem, \r\n"
						+ "     codigoATC, \r\n"
						+ "     codigoSesal,\r\n"
						+ "     nombreProducto, \r\n"
						+ "     descripcionTecnica, \r\n"
						+ "     unidadPresentacion, \r\n"
						+ "     origenFP, \r\n"
						+ "     numCertRegSan, \r\n"
						+ "     fechaVencimientoRegSan,\r\n"
						+ "     fechaEmisionRegSan,\r\n"
						+ "     certBPM, \r\n"
						+ "     fechaVencimientoBPM,\r\n"
						+ "     fechaEmisionBPM,\r\n"
						+ "     ((CAST(precioUnitario AS DECIMAL(20, 4)))) as precioUnitario,\r\n"
						+ "     moneda, \r\n"
						+ "     cantidadRequerida, \r\n"
						+ "     tiempoEntrega,\r\n"
						+ "     vidaUtil, \r\n"
						+ "     observaciones,"
						+ "		codSolicitudDisponibilidad "
						+ " from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and proveedor = ? and nombreProducto = ?");
				ps.setLong(1, idSolicitudCompra);
				ps.setString(2, supplierName);
				ps.setString(3, producto);
				
			
				ResultSet rs = ps.executeQuery();
		
				while (rs.next()) {
					count++;
					String id = rs.getString(1);
					String proveedor = rs.getString(2);
					String noItem = rs.getString(3);
					String codigoATC = rs.getString(4);
					String codigoSesal = rs.getString(5);
					String nombreProducto = rs.getString(6);
					String descripcionTecnica = rs.getString(7);
					String unidadPresentacion = rs.getString(8);
					String origenFP = rs.getString(9);
					String numCertRegSan = rs.getString(10);if (numCertRegSan == null) {numCertRegSan = "NO AGREGADO";}
					String fechaVencimientoRegSan = rs.getString(11);
					
					if(fechaVencimientoRegSan == null || fechaVencimientoRegSan.isEmpty())
					{ fechaVencimientoRegSan = "-"; }else {
						String[] fechaVencimientoRegSan1 = fechaVencimientoRegSan.split("-");
						fechaVencimientoRegSan = fechaVencimientoRegSan1[2]+"-"+fechaVencimientoRegSan1[1]+"-"+fechaVencimientoRegSan1[0];
					}
					
					String fechaEmisionRegSan = rs.getString(12);	
					
					if(fechaEmisionRegSan == null || fechaEmisionRegSan.isEmpty())
					{ fechaVencimientoRegSan = "-"; }else {
						String[] fechaEmisionRegSan1 = fechaEmisionRegSan.split("-");
						fechaEmisionRegSan = fechaEmisionRegSan1[2]+"-"+fechaEmisionRegSan1[1]+"-"+fechaEmisionRegSan1[0];
					}
					
					String certBPM = rs.getString(13);if (certBPM == null) {certBPM = "NO AGREGADO";}
					String fechaVencimientoBPM = rs.getString(14);
					
					if(fechaVencimientoBPM == null || fechaVencimientoBPM.isEmpty())
					{ fechaVencimientoBPM = "-"; }else {
						String[] fechaVencimientoBPM1 = fechaVencimientoBPM.split("-");
						fechaVencimientoBPM = fechaVencimientoBPM1[2]+"-"+fechaVencimientoBPM1[1]+"-"+fechaVencimientoBPM1[0];
					}
					
					String fechaEmisionBPM = rs.getString(15);
					
					if(fechaEmisionBPM == null || fechaEmisionBPM.isEmpty())
					{ fechaEmisionBPM = "-"; }else {
						String[] fechaEmisionBPM1 = fechaEmisionBPM.split("-");
						fechaEmisionBPM = fechaEmisionBPM1[2]+"-"+fechaEmisionBPM1[1]+"-"+fechaEmisionBPM1[0];
					}
					
					String precioUnitario = rs.getString(16);
					String moneda = rs.getString(17);
					String cantidadRequerida = String.valueOf(rs.getFloat(18));
					String tiempoEntrega = rs.getString(19);
					String vidaUtil = rs.getString(20);
					String observaciones = rs.getString(21);
					//String checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "'/>";
					
					String codSolicitudDisponibilidad = rs.getString(22);
					String checkboxControl;
					if (codSolicitudDisponibilidad == null || codSolicitudDisponibilidad.isEmpty() || codSolicitudDisponibilidad.equalsIgnoreCase("NINGUNO"))
					{
						//codSolicitudDisponibilidad = "NINGUNO";
						checkboxControl = "<input type='checkbox' name='reqReg' value='" + id + "'/>";
					}
//					else if (codSolicitudDisponibilidad.equalsIgnoreCase("PRE SELECCIONADO"))
//					{
//						checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "' checked/>";
//					}
					else
					{
						checkboxControl = "YA ASOCIADO";
					}

					j += "[" + "\"" + id + "\"," 
							 + "\"" + proveedor + "\"," 
							 + "\"" + noItem + "\"," 
							 + "\"" + codigoATC + "\","
							 + "\"" + codigoSesal + "\","
							 + "\"" + nombreProducto + "\"," 
							 + "\"" + descripcionTecnica + "\"," 
							 + "\"" + unidadPresentacion + "\"," 
							 + "\"" + origenFP + "\"," 
							 + "\"" + numCertRegSan + "\"," 
							 + "\"" + fechaVencimientoRegSan + "\"," 
							 + "\"" + fechaEmisionRegSan + "\"," 
							 + "\"" + certBPM + "\"," 
							 + "\"" + fechaVencimientoBPM + "\"," 
							 + "\"" + fechaEmisionBPM + "\"," 
							 + "\"" + moneda + " "+ precioUnitario + "\"," 
							 + "\"" + moneda + "\"," 
							 + "\"" + cantidadRequerida + "\"," 
							 + "\"" + tiempoEntrega + "\"," 
							 + "\"" + vidaUtil + "\"," 
							 + "\"" + observaciones + "\"," 
							 + "\"" + checkboxControl
							+ "\"],";
				}
			}
			
			
			
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	
	public static String getAllReqListByBuyRequestJSON(long idSolicitudCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct L.noOficio, L.noItem, L.codigoATC, O.codSesal, L.nombreProducto, L.descripcionTecnica, L.unidadPresentacion, L.cantidadRequerida, L.tiempoEntrega, L.vidaUtil, codSolicitudDisponibilidad  from dbo.listaRequerimientoSolicitudCompraALP L inner join ofertaALP O ON L.codigoATC = O.codATC  where L.idSolicitudCompra = ? and L.recomendacionComite='SI' group by L.noOficio, L.noItem , L.codigoATC, O.codSesal, L.nombreProducto, L.descripcionTecnica, L.unidadPresentacion, L.cantidadRequerida, L.tiempoEntrega, L.vidaUtil, codSolicitudDisponibilidad");
//		"select proveedor, noItem, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, origenFP, numCertRegSan, certBPM, precioUnitario, moneda, cantidadRequerida, tiempoEntrega, vidaUtil, fechaOferta, codSolicitudDisponibilidad from dbo.listaRequerimientoSolicitudCompraALP where idSolicitudCompra = ? and recomendacionComite='SI'");
			ps.setLong(1, idSolicitudCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
//				String proveedor = rs.getString(1);
				String noOficio = rs.getString(1);
				String noItem = rs.getString(2);
				String codigoATC = rs.getString(3);
				String codSesal = rs.getString(4);
				String nombreProducto = rs.getString(5);
				String descripcionTecnica = rs.getString(6);
				String unidadPresentacion = rs.getString(7);
//				String origenFP = rs.getString(7);
//				String numCertRegSan = rs.getString(8);
//				if (numCertRegSan == null) {
//					numCertRegSan = "NO AGREGADO";
//				}
//				String certBPM = rs.getString(9);
//				if (certBPM == null) {
//					certBPM = "NO AGREGADO";
//				}
//				String precioUnitario = rs.getString(10);
//				String moneda = rs.getString(11);
				String cantidadRequerida = String.valueOf(rs.getFloat(8));
				String tiempoEntrega = rs.getString(9);
				String vidaUtil = rs.getString(10);
//				String fechaOferta = rs.getString(15);
				String codSolicitudDisponibilidad = rs.getString(11);
//				String checkboxControl;
//				if (codSolicitudDisponibilidad == null || codSolicitudDisponibilidad.isEmpty() || codSolicitudDisponibilidad.equalsIgnoreCase("NINGUNO"))
//				{
//					codSolicitudDisponibilidad = "NINGUNO";
//					checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "'/>";
//				}
//				else if (codSolicitudDisponibilidad.equalsIgnoreCase("PRE SELECCIONADO"))
//				{
//					checkboxControl = "<input type='checkbox' name='reqReg' value='" + noItem + "' checked/>";
//				}
//				else
//				{
//					checkboxControl = "YA ASOCIADO";
//				}

				j += "[" +  
						"\"" + noOficio + "\"," + 
						"\"" + noItem + "\"," + 
						"\""+ codigoATC + "\"," + 
						"\""+ codSesal + "\"," +
						"\"" + nombreProducto + "\"," +
						"\"" + descripcionTecnica + "\"," + 
						"\""+ unidadPresentacion + "\"," + 
						"\""+ cantidadRequerida + "\"," + 
						"\"" + tiempoEntrega + "\"," +
						"\"" + vidaUtil + "\"," +
						"\"" + "<input type='checkbox' name='reqReg' value='" + noItem + "'/>" + "\"],";
				
				System.out.println(j);
				
//				TODOS LOS CAMPOS DE LA TABLA
//				j += "[" + "\"" + proveedor + "\"," + "\"" + noItem + "\"," + "\""
//						+ codigoATC + "\"," + "\"" + nombreProducto + "\"," + "\"" + descripcionTecnica + "\"," + "\""
//						+ unidadPresentacion + "\"," + "\"" + origenFP + "\"," + "\"" + numCertRegSan + "\"," + "\""
//						+ certBPM + "\"," + "\"" + precioUnitario + "\"," + "\"" + moneda + "\"," + "\""
//						+ cantidadRequerida + "\"," + "\"" + tiempoEntrega + "\"," + "\"" + vidaUtil + "\"," + "\""
//						+ fechaOferta + "\"," + "\"" + codSolicitudDisponibilidad + "\"," + "\"" + checkboxControl
//						+ "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + "-" + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
}
