package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class contratacionesDetalleGeneralDao {

	public static int save(contratacionesDetalleGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO contratacionDetalleGeneral\r\n"
					+ "(id,noItem,codigoATC,nombreProducto,descripcionTecnica,unidadPresentacion,proveedor,fabricante_PaisOrigen,observaciones,tiempoEntrega,cantidadComprado,precioUnitario,valorTotalCompra,numeroOdenCompra,fechaSuscripcion,cantidadEntregaPlazos,fechaLimiteEntrega,moneda)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, l.getId());
			ps.setInt(2, l.getNoItem());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreProducto());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setString(7, l.getProveedor());
			ps.setString(8, l.getFabricante_PaisOrigen());
			ps.setString(9, l.getObservaciones());
			ps.setString(10, "0"); //tIEMPO eNTREGA
			ps.setFloat(11, l.getCantidadComprado());
			ps.setFloat(12, l.getPrecioUnitario());
			ps.setFloat(13, l.getValorTotalCompra());
			ps.setString(14, l.getNumeroOdenCompra());
			ps.setString(15, l.getFechaSuscripcion());
			ps.setInt(16, l.getCantidadEntregaPlazos());
			ps.setString(17, l.getFechaLimiteEntrega());
			ps.setString(18, l.getMoneda());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(contratacionesDetalleGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.contratacionDetalleGeneral\r\n"
					+ "SET id=?, noItem=?, nombreProducto=?, tiempoEntrega=?, cantidadComprado=?,cantidadEntregaPlazos=?, fechaLimiteEntrega=? WHERE idDetalle=?");
			ps.setLong(1, l.getId());
			ps.setInt(2, l.getNoItem());
			ps.setString(3, l.getNombreProducto());
			ps.setString(4, l.getTiempoEntrega());
			ps.setFloat(5, l.getCantidadComprado());
			ps.setInt(6, l.getCantidadEntregaPlazos());
			ps.setString(7, l.getFechaLimiteEntrega());
			ps.setLong(8,l.getIdDetalle());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int saveall(contratacionesDetalleGeneral l) {		
		int status = 0;					
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO contratacionDetalleGeneral\r\n"
					+ "(id,noItem,codigoATC,nombreProducto,descripcionTecnica,unidadPresentacion,proveedor,fabricante_PaisOrigen,observaciones,tiempoEntrega,cantidadComprado,precioUnitario,valorTotalCompra,numeroOdenCompra,fechaSuscripcion,cantidadEntregaPlazos, fechaLimiteEntrega, fechaSolicitudCita, fechaRecepcion, lugarRecepcion, noFactura, cantidadEntrega, totalEntrega, diasAtraso, multa, valorNetoPagar, vidaUtil, informeResultadoAnalisis, noInformeResultadoAnalisis, noLoteFabricacion, noGarantia, noActaRecepcion, statusPago, aprobacionComite, moneda, EstadoEntrega)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setLong(1,l.getId());
			ps.setInt(2, l.getNoItem());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreProducto());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setString(7, l.getProveedor());
			ps.setString(8, l.getFabricante_PaisOrigen());
			ps.setString(9, l.getObservaciones());
			ps.setString(10, l.getTiempoEntrega());
			ps.setFloat(11, l.getCantidadComprado());
			ps.setFloat(12, l.getPrecioUnitario());
			ps.setFloat(13, l.getValorTotalCompra());
			ps.setString(14, l.getNumeroOdenCompra());
			ps.setString(15, l.getFechaSuscripcion());
			ps.setInt(16, l.getCantidadEntregaPlazos());
			ps.setString(17, l.getFechaLimiteEntrega());
			ps.setString(18, l.getFechaSolicitudCita());
			ps.setString(19, l.getFechaRecepcion());
			ps.setString(20, l.getLugarRecepcion());
			ps.setString(21, l.getNoActaRecepcion());
			ps.setInt(22, l.getCantidadEntrega());
			ps.setString(23, l.getTotalEntrega());			
			ps.setFloat(24, l.getDiasAtraso());
			ps.setFloat(25,l.getMulta());
			ps.setFloat(26, l.getValorNetoPagar());
			ps.setString(27, l.getVidaUtil());
			ps.setString(28, l.getInformeResultadoAnalisis());
			ps.setString(29, l.getNoInformeResultadoAnalisis());
			ps.setString(30, l.getNoLoteFabricacion());
			ps.setString(31, l.getNoGarantia());
			ps.setString(32, l.getNoActaRecepcion());
			ps.setString(33,l.getStatusPago());
			ps.setString(34,l.getAprobacionComite());
			ps.setString(35,l.getMoneda());
			ps.setBoolean(36,l.getEstadoEntrega());
			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			      status = generatedKeys.getInt(1);
			}
			System.out.println(status + " Id Generado");
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static contratacionesDetalle getByItem(int item) {
		contratacionesDetalle p = new contratacionesDetalle();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM contratacionDetalle where noItem = ?");
			ps.setInt(1, item);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(rs.getLong(2));
				p.setCodigoATC(rs.getString(4));
				p.setNombreProducto(rs.getString(5));
				p.setDescripcionTecnica(rs.getString(6));
				p.setUnidadPresentacion(rs.getString(7));
				p.setProveedor(rs.getString(8));
				p.setFabricante_PaisOrigen(rs.getString(9));
				p.setObservaciones(rs.getString(10));
				p.setTiempoEntrega(rs.getString(11));
				p.setCantidadComprado(rs.getFloat(12));
				p.setPrecioUnitario(rs.getFloat(13));
				p.setValorTotalCompra(rs.getFloat(14));
				p.setNumeroOdenCompra(rs.getString(15));
				p.setFechaSuscripcion(rs.getString(16));
				p.setCantidadEntregaPlazos(rs.getInt(17));
				p.setFechaLimiteEntrega(rs.getString(18));
				p.setMoneda(rs.getString(36));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}

	
	public static int updateRecepcion(contratacionesDetalleGeneral l) {
		System.out.println(l.getEstadoEntrega());
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.contratacionDetalleGeneral\r\n"
					+ "SET  fechaSolicitudCita=?,fechaRecepcion=?,lugarRecepcion=?, noFactura=?,cantidadEntrega=?,totalEntrega=?,diasAtraso=?,multa=?,valorNetoPagar=?,vidaUtil=?,informeResultadoAnalisis=?,noInformeResultadoAnalisis=?,noLoteFabricacion=?,noGarantia=?,noActaRecepcion=?,statusPago=?,aprobacionComite=?, EstadoEntrega=? WHERE idDetalle =?");
			ps.setString(1, l.getFechaSolicitudCita());
			ps.setString(2, l.getFechaRecepcion());
			ps.setString(3, l.getLugarRecepcion());
			ps.setString(4, l.getNoFactura());
			ps.setInt(5, l.getCantidadEntrega());
			ps.setString(6, l.getTotalEntrega());
			ps.setFloat(7, l.getDiasAtraso());
			ps.setFloat(8,l.getMulta());
			ps.setFloat(9, l.getValorNetoPagar());
			ps.setString(10, l.getVidaUtil());
			ps.setString(11, l.getInformeResultadoAnalisis());
			ps.setString(12, l.getNoInformeResultadoAnalisis());
			ps.setString(13, l.getNoLoteFabricacion());
			ps.setString(14, l.getNoGarantia());
			ps.setString(15, l.getNoActaRecepcion());
			ps.setString(16,l.getStatusPago());
			ps.setString(17,l.getAprobacionComite());
			ps.setBoolean(18,l.getEstadoEntrega());
			ps.setLong(19,l.getIdDetalle());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getTable(int id) {
		System.out.println("grid");
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM dbo.contratacionDetalleGeneral WHERE id = ? and cancelado='False'");
			ps.setLong(1, id);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				long idDetalle=rs.getInt(1); 
				//long id1=rs.getInt(2);
				int noItem= rs.getInt(3);
				String codigoATC= rs.getString(4);
				String nombreProducto= rs.getString(5);
				String descripcionTecnica= rs.getString(6);
				String unidadPresentacion= rs.getString(7);
				String proveedor= rs.getString(8);
				String fabricante_PaisOrigen= rs.getString(9);
				String observaciones= rs.getString(10);
				if(rs.getString(10)==null) {observaciones="";}
				String tiempoEntrega= rs.getString(11);
				float cantidadComprado= rs.getFloat(12);
				float precioUnitario= rs.getFloat(13);
				float valorTotalCompra= rs.getFloat(14);
				String numeroOdenCompra= rs.getString(15);
				String fechaSuscripcion= rs.getString(16);
				int cantidadEntregaPlazos= rs.getInt(17);
				String fechaLimiteEntrega= rs.getString(18);
				String fechaSolicitudCita= rs.getString(19);
				if(rs.getString(19)==null) {fechaSolicitudCita="";}
				String fechaRecepcion= rs.getString(20);
				if(rs.getString(20)==null) {fechaRecepcion="";}
				String lugarRecepcion= rs.getString(21);
				if(rs.getString(21)==null) {lugarRecepcion="";}
				String noFactura= rs.getString(22);
				if(rs.getString(22)==null) {noFactura="";}
				int cantidadEntrega= rs.getInt(23);
				if(rs.getString(23)==null) {cantidadEntrega=0;}
				String totalEntrega= rs.getString(24);
				if(rs.getString(24)==null) {totalEntrega="";}
				float diasAtraso= rs.getFloat(25);
				if(rs.getString(25)==null) {diasAtraso=0;}
				float multa= rs.getFloat(26);
				if(rs.getString(26)==null) {multa=0;}
				float valorNetoPagar= rs.getFloat(27);
				if(rs.getString(27)==null) {valorNetoPagar=0;}
				String vidaUtil= rs.getString(28);
				if(rs.getString(28)==null) {vidaUtil="";}
				String informeResultadoAnalisis= rs.getString(29);
				if(rs.getString(29)==null) {informeResultadoAnalisis="";}
				String noInformeResultadoAnalisis= rs.getString(30);
				if(rs.getString(30)==null) {noInformeResultadoAnalisis="";}
				String noLoteFabricacion= rs.getString(31);
				if(rs.getString(31)==null) {noLoteFabricacion="";}
				String noGarantia= rs.getString(32);
				if(rs.getString(32)==null) {noGarantia="";}
				String noActaRecepcion= rs.getString(33);
				if(rs.getString(33)==null) {noActaRecepcion="";}
				String statusPago= rs.getString(34);
				if(rs.getString(34)==null) {statusPago="";}
				String aprobacionComite= rs.getString(35);
				if(rs.getString(35)==null) {aprobacionComite="";}
				String moneda= rs.getString(36);
				if(rs.getString(36)==null) {moneda="";}
				String estadoentrega= rs.getString(37);
				
				
				j += "[" + "\"" + idDetalle + "\"," + "\"" + 
								  noItem + "\"," + "\"" + 
							      codigoATC + "\"," + "\"" + 
								  nombreProducto + "\"," + "\"" + 
							      descripcionTecnica + "\"," + "\"" + 
								  unidadPresentacion + "\"," + "\"" + 
							      proveedor + "\"," + "\"" + 
								  fabricante_PaisOrigen + "\"," + "\"" + 
							      observaciones + "\","+ "\"" + 
								  tiempoEntrega + "\"," + "\"" + 
							      cantidadComprado + "\"," + "\"" + 
								  precioUnitario + "\"," + "\"" + 
							      valorTotalCompra + "\"," + "\"" + 
								  numeroOdenCompra + "\"," + "\"" + 
							      fechaSuscripcion + "\","+ "\"" + 
								  cantidadEntregaPlazos + "\"," + "\"" + 
							      fechaLimiteEntrega + "\","+ "\"" + 
								  moneda + "\"," + "\"" + 
							      fechaSolicitudCita + "\"," + "\"" + 
								  fechaRecepcion + "\"," + "\"" + 
							      lugarRecepcion + "\"," + "\"" + 
								  noFactura + "\","+ "\"" + 
							      cantidadEntrega + "\"," + "\"" + 
								  totalEntrega + "\"," + "\"" + 
							      diasAtraso + "\"," + "\"" + 
								  multa + "\"," + "\"" + 
							      valorNetoPagar + "\"," + "\"" + 
								  vidaUtil + "\","+ "\"" + 
							      informeResultadoAnalisis + "\"," + "\"" + 
								  noInformeResultadoAnalisis + "\"," + "\"" + 
							      noLoteFabricacion + "\"," + "\"" + 
								  noGarantia + "\"," + "\"" + 
							      noActaRecepcion + "\"," + "\"" + 
								  statusPago + "\"," + "\"" + 
								  aprobacionComite + "\"," + "\"" + 
								  estadoentrega + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" +
								  empty + "\"," + "\"" +
								  empty + "\"],";
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
	
	public static int updateRecepcionCancelado(contratacionesDetalle l) {
		System.out.println(l.getEstadoEntrega());
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.contratacionDetalle\r\n"
					+ "SET  cancelado=? WHERE idDetalle =?");
			ps.setBoolean(1, true);			
			ps.setLong(2,l.getIdDetalle());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static String getTableCancelados(int id) {
		System.out.println("grid");
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM dbo.contratacionDetalleGeneral WHERE id = ? and cancelado='true'");
			ps.setLong(1, id);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				long idDetalle=rs.getInt(1); 
				//long id1=rs.getInt(2);
				int noItem= rs.getInt(3);
				String codigoATC= rs.getString(4);
				String nombreProducto= rs.getString(5);
				String descripcionTecnica= rs.getString(6);
				String unidadPresentacion= rs.getString(7);
				String proveedor= rs.getString(8);
				String fabricante_PaisOrigen= rs.getString(9);
				String observaciones= rs.getString(10);
				if(rs.getString(10)==null) {observaciones="";}
				String tiempoEntrega= rs.getString(11);
				float cantidadComprado= rs.getFloat(12);
				float precioUnitario= rs.getFloat(13);
				float valorTotalCompra= rs.getFloat(14);
				String numeroOdenCompra= rs.getString(15);
				String fechaSuscripcion= rs.getString(16);
				int cantidadEntregaPlazos= rs.getInt(17);
				String fechaLimiteEntrega= rs.getString(18);
				String fechaSolicitudCita= rs.getString(19);
				if(rs.getString(19)==null) {fechaSolicitudCita="";}
				String fechaRecepcion= rs.getString(20);
				if(rs.getString(20)==null) {fechaRecepcion="";}
				String lugarRecepcion= rs.getString(21);
				if(rs.getString(21)==null) {lugarRecepcion="";}
				String noFactura= rs.getString(22);
				if(rs.getString(22)==null) {noFactura="";}
				int cantidadEntrega= rs.getInt(23);
				if(rs.getString(23)==null) {cantidadEntrega=0;}
				String totalEntrega= rs.getString(24);
				if(rs.getString(24)==null) {totalEntrega="";}
				float diasAtraso= rs.getFloat(25);
				if(rs.getString(25)==null) {diasAtraso=0;}
				float multa= rs.getFloat(26);
				if(rs.getString(26)==null) {multa=0;}
				float valorNetoPagar= rs.getFloat(27);
				if(rs.getString(27)==null) {valorNetoPagar=0;}
				String vidaUtil= rs.getString(28);
				if(rs.getString(28)==null) {vidaUtil="";}
				String informeResultadoAnalisis= rs.getString(29);
				if(rs.getString(29)==null) {informeResultadoAnalisis="";}
				String noInformeResultadoAnalisis= rs.getString(30);
				if(rs.getString(30)==null) {noInformeResultadoAnalisis="";}
				String noLoteFabricacion= rs.getString(31);
				if(rs.getString(31)==null) {noLoteFabricacion="";}
				String noGarantia= rs.getString(32);
				if(rs.getString(32)==null) {noGarantia="";}
				String noActaRecepcion= rs.getString(33);
				if(rs.getString(33)==null) {noActaRecepcion="";}
				String statusPago= rs.getString(34);
				if(rs.getString(34)==null) {statusPago="";}
				String aprobacionComite= rs.getString(35);
				if(rs.getString(35)==null) {aprobacionComite="";}
				String moneda= rs.getString(36);
				if(rs.getString(36)==null) {moneda="";}
				String estadoentrega= rs.getString(37);
				
				
				j += "[" + "\"" + idDetalle + "\"," + "\"" + 
								  noItem + "\"," + "\"" + 
							      codigoATC + "\"," + "\"" + 
								  nombreProducto + "\"," + "\"" + 
							      descripcionTecnica + "\"," + "\"" + 
								  unidadPresentacion + "\"," + "\"" + 
							      proveedor + "\"," + "\"" + 
								  fabricante_PaisOrigen + "\"," + "\"" + 
							      observaciones + "\","+ "\"" + 
								  tiempoEntrega + "\"," + "\"" + 
							      cantidadComprado + "\"," + "\"" + 
								  precioUnitario + "\"," + "\"" + 
							      valorTotalCompra + "\"," + "\"" + 
								  numeroOdenCompra + "\"," + "\"" + 
							      fechaSuscripcion + "\","+ "\"" + 
								  cantidadEntregaPlazos + "\"," + "\"" + 
							      fechaLimiteEntrega + "\","+ "\"" + 
								  moneda + "\"," + "\"" + 
							      fechaSolicitudCita + "\"," + "\"" + 
								  fechaRecepcion + "\"," + "\"" + 
							      lugarRecepcion + "\"," + "\"" + 
								  noFactura + "\","+ "\"" + 
							      cantidadEntrega + "\"," + "\"" + 
								  totalEntrega + "\"," + "\"" + 
							      diasAtraso + "\"," + "\"" + 
								  multa + "\"," + "\"" + 
							      valorNetoPagar + "\"," + "\"" + 
								  vidaUtil + "\","+ "\"" + 
							      informeResultadoAnalisis + "\"," + "\"" + 
								  noInformeResultadoAnalisis + "\"," + "\"" + 
							      noLoteFabricacion + "\"," + "\"" + 
								  noGarantia + "\"," + "\"" + 
							      noActaRecepcion + "\"," + "\"" + 
								  statusPago + "\"," + "\"" + 
								  aprobacionComite + "\"," + "\"" + 
								  estadoentrega + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" + 
								  empty + "\"," + "\"" +
								  empty + "\"," + "\"" +
								  empty + "\"],";
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
