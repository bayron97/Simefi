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

public class ordenCompraGeneralDao {

	public static int save(contrataciones l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO contrataciones\r\n"
					+ "(idProcesoCompra, procesoCompra, idBeneficiario, beneficiario, idSolicitudCompra, solicitudCompra, idProveedor, proveedor, noOrdenCompra, fechaSuscripcion, observaciones, nombreDocumento)\r\n"
					+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, l.getIdProcesoCompra());
			ps.setString(2, l.getProcesoCompra());
			ps.setInt(3, l.getIdBeneficiario());
			ps.setString(4, l.getBeneficiario());
			ps.setInt(5, l.getIdSolicitudCompra());
			ps.setString(6, l.getSolicitudCompra());
			ps.setInt(7, l.getIdProveedor());
			ps.setString(8, l.getProveedor());
			ps.setString(9, l.getNoOrdenCompra());
			ps.setString(10, l.getFechaSuscripcion());
			ps.setString(11, l.getObservaciones());
			ps.setString(12, l.getNombreDocumento());
			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			        status = generatedKeys.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status);
		return status;
	}

	public static int update(contrataciones l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE contrataciones\r\n"
					+ "SET idProcesoCompra=?, procesoCompra=?, idBeneficiario=?, beneficiario=?, idSolicitudCompra=?, solicitudCompra=?, idProveedor=?, proveedor=?, noOrdenCompra=?, fechaSuscripcion=?, observaciones=?, nombreDocumento=?,montoTotalPagar=?, estados=?, fechaPago=?, noReferencia=? WHERE id=?");
			ps.setInt(1, l.getIdProcesoCompra());
			ps.setString(2, l.getProcesoCompra());
			ps.setInt(3, l.getIdBeneficiario());
			ps.setString(4, l.getBeneficiario());
			ps.setInt(5, l.getIdSolicitudCompra());
			ps.setString(6, l.getSolicitudCompra());
			ps.setInt(7, l.getIdProveedor());
			ps.setString(8, l.getProveedor());
			ps.setString(9, l.getNoOrdenCompra());
			ps.setString(10, l.getFechaSuscripcion());
			ps.setString(11, l.getObservaciones());
			ps.setString(12, l.getNombreDocumento());
			ps.setFloat(13, l.getMontoTotalPagar());
			ps.setString(14, l.getEstados());
			ps.setString(15, l.getFechaPago());
			ps.setString(16, l.getNoReferencia());
			ps.setInt(17,l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}


	public static contrataciones getById(int id) {
		contrataciones p = new contrataciones();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM contrataciones where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setIdProcesoCompra(rs.getInt(2));
				p.setProcesoCompra(rs.getString(3));
				p.setIdBeneficiario(rs.getInt(4));
				p.setBeneficiario(rs.getString(5));
				p.setIdSolicitudCompra(rs.getInt(6));
				p.setSolicitudCompra(rs.getString(7));
				p.setIdProveedor(rs.getInt(8));
				p.setProveedor(rs.getString(9));
				p.setNoOrdenCompra(rs.getString(10));
				p.setFechaSuscripcion(rs.getString(11));
				p.setObservaciones(rs.getString(12));
				p.setNombreDocumento(rs.getString(13));
				p.setMontoTotalPagar(rs.getFloat(14));
				p.setEstados(rs.getString(15));
				p.setFechaPago(rs.getString(16));
				p.setNoReferencia(rs.getString(17));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static listaRequerimientoSolicitudDisponibilidadALP getByItem(int item) {
		listaRequerimientoSolicitudDisponibilidadALP p = new listaRequerimientoSolicitudDisponibilidadALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT codigoATC,descripcionTecnicaOfertada,unidadPresentacionOfertada,origenFP,observaciones,precioUnitarioAcordado,precioTotal,moneda FROM listaRequerimientoSolicitudDisponibilidadALP WHERE noItem =?");
			ps.setInt(1, item);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setCodigoATC(rs.getString(1));
				p.setDescripcionTecnicaOfertada(rs.getString(2));
				p.setUnidadPresentacionOfertada(rs.getString(3));
				p.setOrigenFP(rs.getString(4));
				p.setObservaciones(rs.getString(5));
				p.setPrecioUnitarioAcordado(rs.getInt(6));
				p.setPrecioTotal(rs.getInt(7));
				p.setMoneda(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static String getItembyId(long id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT noItem,nombreProductoOfertado,tiempoEntregaOfertado,cantidadRequerida FROM listaRequerimientoSolicitudDisponibilidadALP\r\n"
							+ "WHERE id =?");
			ps.setLong(1, id);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String noItem = rs.getString(1);
				String nombreProductoOfertado = rs.getString(2);
				String tiempoOfertaOfertado = rs.getString(3);
				String cantidadRequerida = rs.getString(4);

				j += noItem + ","+nombreProductoOfertado +","+tiempoOfertaOfertado+ ","+cantidadRequerida+",";
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
	
	public static String getOrdenCompra() {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT 'OC'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) +'-'+ CAST(id+2 AS varchar(10)) from contrataciones ORDER BY id");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				reqList = rs.getString(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
	public static String getBeneficiarios(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con
					.prepareStatement("SELECT  lrg.beneficiario FROM listaRequerimientoGeneral as lrg inner join procesoCompraGeneral as pcg on pcg.cod = lrg.procesoCompra WHERE pcg.noProcesoCompra =? group by lrg.beneficiario");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String orden = rs.getString(1);

				j += orden + ",";
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
	
	public static String getSolicitudesCompra(String noProcesoCompra, String beneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM solicitudCompraALP WHERE noProcesoCompra=? AND beneficiario=?");
			ps.setString(1, noProcesoCompra);
			ps.setString(2, beneficiario);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String orden = rs.getString(4);

				j += orden + ",";
			}
			System.out.println(j);
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
	public static String getItemsbySolicitudCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select lrcg.IdListRequirement, lrcg.nombreProducto  from listaRequerimientoConsolidadaGeneral as lrcg\r\n"
							+ "inner join procesoCompraGeneral as pcg on lrcg.procesoCompra = pcg.cod \r\n"
							+ "where pcg.noProcesoCompra =?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String item = rs.getString(2);

				j += id +","+ item+ ";";
			}
			System.out.println(j);
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
	public static String getTableItems(Long id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT idDetalle,noItem,nombreProducto,tiempoEntrega,cantidadComprado,cantidadEntregaPlazos,fechaLimiteEntrega FROM contratacionDetalle WHERE id =?");
			ps.setLong(1, id);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Long idDetalle = rs.getLong(1);
				int noItem = rs.getInt(2);
				String nombreproducto = rs.getString(3);
				String tiempoEntrega = rs.getString(4);
				Long cantidadComprado = rs.getLong(5);
				int cantidadEntrega = rs.getInt(6);
				String fechalimite = rs.getString(7);
				

				j +=  idDetalle + "," +  noItem + "," + nombreproducto + "," + tiempoEntrega
						+"," + cantidadComprado + "," +  cantidadEntrega + ","  + fechalimite + ";";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			System.out.print("Dao");
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
}

