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

import javax.print.DocFlavor.STRING;

public class contratacionesGeneralDao {

	public static int save(contratacionesGenerales l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO contratacionesGenerales\r\n"
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

	public static int update(contratacionesGenerales l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE contratacionesGenerales\r\n"
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


	public static contratacionesGenerales getById(int id) {
		contratacionesGenerales p = new contratacionesGenerales();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM contratacionesGenerales where id = ?");
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
	
	public static listaRequerimientoConsolidadaGeneral getByItem(int item) {
		listaRequerimientoConsolidadaGeneral p = new listaRequerimientoConsolidadaGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT codigoATC,descripcionTecnica FROM listaRequerimientoConsolidadaGeneral WHERE IdListRequirement =?");
			ps.setInt(1, item);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setDescripcionTecnica(rs.getString(1));
				p.setUnidadPresentacion(rs.getString(2));				
			
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
			PreparedStatement ps = con.prepareStatement("SELECT 'OC'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) +'-'+ CAST(id+2 AS varchar(10)) from contratacionesGenerales ORDER BY id");
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
			PreparedStatement psS = con
					.prepareStatement("select cod from procesoCompraALP where noProcesoCompra =?");
			psS.setString(1, noProcesoCompra);
			ResultSet rsS = psS.executeQuery();
			int codigoProceso = 0;
			while (rsS.next()) {
				 codigoProceso = rsS.getInt(1);
			}
			
			
			PreparedStatement ps = con
					.prepareStatement("SELECT bf.beneficiarioFinal FROM beneFinalOficioCompraALP bfoca INNER JOIN  oficioProcesoCompraALP opca ON opca.oficio = bfoca.oficio INNER JOIN beneficiarioFinal bf ON bfoca.beneF = bf.no WHERE opca.procesoCompra = ? GROUP BY bf.beneficiarioFinal ORDER BY bf.beneficiarioFinal");
			ps.setInt(1, codigoProceso);
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
					.prepareStatement("SELECT * FROM solicitudCompraALP WHERE noProcesoCompra=?");
			ps.setString(1, noProcesoCompra);
			//ps.setString(2, beneficiario);
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
	
	public static String getItemsbySolicitudCompra(String solicitudCompra, String proveedor) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			
			
			
			PreparedStatement ps = con
						.prepareStatement("SELECT lrsda.id,'ITEM NO.'+CAST(lrsda.noItem AS VARCHAR(50))+'-'+lrsda.nombreProductoOfertado \r\n"
								+ "from listaRequerimientoSolicitudDisponibilidadALP lrsda \r\n"
								+ "INNER JOIN solicitudDisponibilidadALP sda ON lrsda.idSolicitudDisponibilidad = sda.id \r\n"
								+ "INNER JOIN solicitudCompraALP sca ON sda.idSolicitudCompra = sca.id \r\n"
								+ "WHERE sca.codSolicitudCompra = ? and sda.proveedor = ?  and ratificacionCT = 'RATIFICADO'");
					
			ps.setString(1, solicitudCompra);
			ps.setString(2, proveedor);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String item = rs.getString(2);
				System.out.println("");
				j += id +","+ item+ ";";
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
	
	public static String getTableItems(Long id) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT idDetalle,noItem,nombreProducto,tiempoEntrega,cantidadComprado,cantidadEntregaPlazos,fechaLimiteEntrega FROM contratacionDetalleGeneral WHERE id =?");
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
