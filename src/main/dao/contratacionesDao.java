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

public class contratacionesDao {

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
	
	public static listaRequerimientoSolicitudDisponibilidadALP getByItem(int IdRequelimintoList) {
		listaRequerimientoSolicitudDisponibilidadALP p = new listaRequerimientoSolicitudDisponibilidadALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT codigoATC,descripcionTecnicaOfertada,unidadPresentacionOfertada,origenFP,observaciones,precioUnitarioAcordado,precioTotal,moneda FROM listaRequerimientoSolicitudDisponibilidadALP WHERE id =?");
			ps.setInt(1, IdRequelimintoList);
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
				
				System.out.println("l.getMoneda() " + p.getMoneda());
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
				
				
				System.out.println(cantidadRequerida + " Re");

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
	
	public static String getOrdenCompra(String procesocompra, String beneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			//PreparedStatement ps = con.prepareStatement("SELECT 'OC'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) +'-'+ CAST(id+2 AS varchar(10)) from contrataciones where procesoCompra = '"+procesocompra+"' and beneficiario = '"+beneficiario+"'  ORDER BY id");
			PreparedStatement ps = con.prepareStatement("SELECT 'OC'+CAST(YEAR(GETDATE()) AS VARCHAR(4)) +'-'+ CAST(count(id+1) AS varchar(10)) from contrataciones where procesoCompra = '"+procesocompra+"' and beneficiario = '"+beneficiario+"' ");
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
					//.prepareStatement("SELECT bf.beneficiarioFinal FROM beneFinalOficioCompraALP bfoca INNER JOIN  oficioProcesoCompraALP opca ON opca.oficio = bfoca.oficio INNER JOIN beneficiarioFinal bf ON bfoca.beneF = bf.no WHERE opca.procesoCompra = ? GROUP BY bf.beneficiarioFinal ORDER BY bf.beneficiarioFinal");
			.prepareStatement("SELECT bf.beneficiarioFinal FROM beneFinalOficioCompraALP bfoca \r\n"
					+ "--INNER JOIN  oficioProcesoCompraALP opca ON opca.oficio = bfoca.oficio \r\n"
					+ "INNER JOIN beneficiarioFinal bf ON bfoca.beneF = bf.no \r\n"
					+ "WHERE bfoca.idProcesoCompALP = ? \r\n"
					+ "GROUP BY bf.beneficiarioFinal ORDER BY bf.beneficiarioFinal");
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
					"SELECT idDetalle,noItem,nombreProducto,tiempoEntrega,cantidadComprado,cantidadEntregaPlazos,fechaLimiteEntrega, idListarequerimientoSolicitudDisponibilidad FROM contratacionDetalle WHERE id =?");
			ps.setLong(1, id);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				Long idDetalle = rs.getLong(1);
				int noItem = rs.getInt(2);
				String nombreproducto = rs.getString(3);
				String tiempoEntrega = rs.getString(4);
				Long cantidadComprado = rs.getLong(5);
				int cantidadEntrega = rs.getInt(6);
				String fechalimite = rs.getString(7);
				String idListarequerimientoSolicitudDisponibilidad = rs.getString(8);
				
				

//				j +=  idDetalle + "," +  noItem + "," + nombreproducto + "," + tiempoEntrega
//						+"," + cantidadComprado + "," +  cantidadEntrega + ","  + fechalimite + ";";
			
				j += "[" + "\"" + noItem + "\"," + "\"" + 						  
						  nombreproducto + "\"," + "\"" + 
						  tiempoEntrega + "\"," + "\"" + 
						  cantidadComprado + "\"," + "\"" + 
						  cantidadEntrega + "\"," + "\"" + 
						  fechalimite + "\"," + "\"" + 
						  idDetalle + "\"," + "\"" + 
						  idListarequerimientoSolicitudDisponibilidad + "\"],";
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
	
	
	public static String getItemsContrataciones(int ordenCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();						
			PreparedStatement ps = con
					.prepareStatement("SELECT noItem FROM contratacionDetalle where id =? GROUP BY noItem");
			ps.setInt(1, ordenCompra);			
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String item = rs.getString(1);			

				j += item + ";";
			}
			System.out.println(j);
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println( "reqList "+ reqList);
		return reqList;
	}
	
	public static String getFacturass(String item, int ordenCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();						
			PreparedStatement ps = con
					//.prepareStatement("SELECT noFactura FROM contratacionDetalle WHERE noItem = ? and id = ? and vidaUtil != null and noGarantia != null and informeResultadoAnalisis != null and noActaRecepcion != null and noLoteFabricacion != null");
			.prepareStatement("SELECT noFactura FROM contratacionDetalle WHERE noItem = ? and id = ? ");
			ps.setInt(1, Integer.parseInt(item));
			ps.setInt(2, ordenCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String facturas = rs.getString(1);			

				j += facturas + ";";
			}
			System.out.println(j);
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println( "reqList "+ reqList);
		return reqList;
	}
	
	public static String getCampos(String factura) {
		String reqList = "";
		try {
			Connection con = Database.connect();						
			PreparedStatement ps = con
					.prepareStatement("select fechaLimiteEntrega, fechaSolicitudCita, diasAtraso, cantidadEntregaPlazos, precioUnitario, multa   from contratacionDetalle where noFactura=?");
			
			ps.setString(1, factura);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String fechaLimiteEntrega = rs.getString(1);
				String fechaSolicitudCita = rs.getString(2);
				String diasAtraso = rs.getString(3);
				String cantidadEntregaPlazos = rs.getString(4);
				String precioUnitario = rs.getString(5);
				String multa = rs.getString(6);
				
				j += fechaLimiteEntrega.replaceAll("-", "/") + ";" + fechaSolicitudCita.replaceAll("-", "/") + ";" + diasAtraso + ";" + cantidadEntregaPlazos + ";" + precioUnitario + ";" + multa;
			}
			System.out.println(j);
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println( "reqList "+ reqList);
		return reqList;
	}
	
	public static String getItembyIdCantPlazos(int idItem, Long idContratacion) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select sum(cantidadEntregaPlazos)as cantidad from contratacionDetalle where id=? and noItem =?");
			ps.setInt(2, idItem);
			ps.setLong(1, idContratacion); 
			String j = "";
			ResultSet rs = ps.executeQuery();			
			while (rs.next()) {
				int cantidadEntregaPlazos = rs.getInt(1);				
				j += cantidadEntregaPlazos +",";
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

	
	public static String GetNumSanitario_BPM(int noOfertaCatalogo_Param) {
		String reqList = "";
		System.out.println(noOfertaCatalogo_Param);
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select numSanitario,fechaVencSan,numCertif,fechaVencManufactura, registroSanitario from ofertaALP where noOferta = ?");
			ps.setLong(1, noOfertaCatalogo_Param);
			String j = "";
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				String numSanitario = rs.getString(1);
				String fechaVencSan = rs.getString(2);				
				String numCertif = rs.getString(3);
				String fechaVencManufactura = rs.getString(4);
				String registroSanitario = rs.getString(5);
				
				j += numSanitario + ","+fechaVencSan +","+numCertif +","+fechaVencManufactura+"," + registroSanitario+",";
			}
			
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println("Testeando " + reqList);
		return reqList;
	}
	
	
	public static String getlisreqSDbyExportData(String codSolicitudCompraParam, String procesoCompraParam) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
     		"select lrSDADLP.id, oALP.distribuidor, lrSDADLP.noItem, lrSDADLP.codigoATC, oALP.codSesal, lrSDADLP.nombreProductoRequerido,\r\n"
     		+ "lrSDADLP.nombreProductoOfertado, lrSDADLP.descripcionTecnicaRequerida, lrSDADLP.descripcionTecnicaOfertada, \r\n"
     		+ "lrSDADLP.unidadPresentacionRequerida, lrSDADLP.unidadPresentacionOfertada, lrSDADLP.cantidadRequerida, \r\n"
     		+ "lrSDADLP.cantidadOfertada, lrSDADLP.moneda, lrSDADLP.precioUnitarioAcordado, lrSDADLP.precioTotal, oALP.noOfertasRecibidas,\r\n"
     		+ "oALP.paisOrigen, lrSDADLP.numRegSanitarioVen, lrSDADLP.fechaRegSanitarioVen, oALP.fechaEmisionSan, oALP.registroSanitario,\r\n"
     		+ "lrSDADLP.numCerBPMVen, lrSDADLP.fechaCerBPMVen, oALP.fechaEmisionManufactura, oALP.etiquetadoPrimario,\r\n"
     		+ "oALP.etiquetadoSecundario, oALP.etiquetadoTerciario, oALP.vidaUtil, lrSDADLP.vidaUtilOfertada, oALP.tiempoEntrega,\r\n"
     		+ "lrSDADLP.tiempoEntregaOfertado, SCalp.codSolicitudCompra, SDalp.codSolicitudDisponibilidad, oALP.prelacionRALP,\r\n"
     		+ "lrSDADLP.criterioRecomendacion, oALP.obsInformeRCC\r\n"
     		+ "from listaRequerimientoSolicitudDisponibilidadALP as lrSDADLP\r\n"
     		+ "INNER JOIN ofertaALP as oALP on lrSDADLP.noOferta = oALP.noOferta\r\n"
     		+ "INNER JOIN solicitudDisponibilidadALP AS SDalp ON SDalp.id = lrSDADLP.idSolicitudDisponibilidad\r\n"
     		+ "INNER JOIN solicitudCompraALP AS SCalp on SCalp.id = SDalp.idSolicitudCompra\r\n"
     		+ "where lrSDADLP.codSolicitudCompra = '"+ codSolicitudCompraParam +"' and oALP.procesoCompra = '"+ procesoCompraParam +"' ");	
					
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				
				String id = rs.getString(1);
				String distribuidor = rs.getString(2);  
				String noItem = rs.getString(3);
				String codigoATC = rs.getString(4);
				String codSesal  = rs.getString(5);
				String nombreProductoRequerido = rs.getString(6);
				String nombreProductoOfertado  = rs.getString(7);
				String descripcionTecnicaRequerida  = rs.getString(8);
				String descripcionTecnicaOfertada  = rs.getString(9);
				String unidadPresentacionRequerida  = rs.getString(10);
				String unidadPresentacionOfertada  = rs.getString(11);
				String cantidadRequerida = rs.getString(12);
				String cantidadOfertada  = rs.getString(13);
				String moneda = rs.getString(14);
				String precioUnitarioAcordado = rs.getString(15);
				String precioTotal = rs.getString(16);
				String noOfertasRecibidas = rs.getString(17);
				String paisOrigen = rs.getString(18);
				String numRegSanitarioVen = rs.getString(19);
				String fechaRegSanitarioVen  = rs.getString(20);
				String fechaEmisionSan = rs.getString(21);
				String registroSanitario = rs.getString(22);
				String numCerBPMVen = rs.getString(23);
				String fechaCerBPMVen  = rs.getString(24);
				String fechaEmisionManufactura  = rs.getString(25);
				String etiquetadoPrimario = rs.getString(26);
				String etiquetadoSecundario  = rs.getString(27);
				String etiquetadoTerciario  = rs.getString(28);
				String vidaUtil = rs.getString(29);
				String vidaUtilOfertada  = rs.getString(30);
				String tiempoEntrega = rs.getString(31);
				String tiempoEntregaOfertado  = rs.getString(32);
				String codSolicitudCompra = rs.getString(33);
				String codSolicitudDisponibilidad  = rs.getString(34);
				String prelacionRALP = rs.getString(35);
				String criterioRecomendacion  = rs.getString(36);
				String obsInformeRCC = rs.getString(37);
				

				j += "[" + "\"" + distribuidor + "\"," + "\"" 
								+ noItem + "\"," + "\""
								+ codigoATC + "\"," + "\""
								+ codSesal + "\"," + "\""
								+ nombreProductoRequerido + "\"," + "\""
								+ nombreProductoOfertado + "\"," + "\""
								+ descripcionTecnicaRequerida + "\"," + "\""
								+ descripcionTecnicaOfertada + "\"," + "\""
								+ unidadPresentacionRequerida + "\"," + "\""
								+ unidadPresentacionOfertada + "\"," + "\""
								+ cantidadRequerida + "\"," + "\""
								+ cantidadOfertada + "\"," + "\""
								+ moneda + "\"," + "\""
								+ precioUnitarioAcordado + "\"," + "\""
								+ precioTotal + "\"," + "\""
								+ noOfertasRecibidas + "\"," + "\""
								+ paisOrigen + "\"," + "\""
								+ numRegSanitarioVen + "\"," + "\""
								+ fechaRegSanitarioVen + "\"," + "\""
								+ fechaEmisionSan + "\"," + "\""
								+ registroSanitario + "\"," + "\""
								+ numCerBPMVen + "\"," + "\""
								+ fechaCerBPMVen + "\"," + "\""
								+ fechaEmisionManufactura + "\"," + "\""
								+ etiquetadoPrimario + "\"," + "\""
								+ etiquetadoSecundario + "\"," + "\""
								+ etiquetadoTerciario + "\"," + "\""
								+ vidaUtil + "\"," + "\""
								+ vidaUtilOfertada + "\"," + "\""
								+ tiempoEntrega + "\"," + "\""
								+ tiempoEntregaOfertado + "\"," + "\""
								+ codSolicitudCompra + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								+ prelacionRALP + "\"," + "\""
								+ criterioRecomendacion + "\"," + "\""
								+ obsInformeRCC + "\"],";
				
		}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"],";
			}
		
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(offerList);
		return offerList;
	}
	
	public static String getlisreqSDbyExportDataSegundaRCC(String codSolicitudCompraParam, String procesoCompraParam) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
     		"select lrSDADLP.id, oALP.distribuidor, lrSDADLP.noItem, lrSDADLP.codigoATC, oALP.codSesal, lrSDADLP.nombreProductoRequerido,\r\n"
     		+ "lrSDADLP.nombreProductoOfertado, lrSDADLP.descripcionTecnicaRequerida, lrSDADLP.descripcionTecnicaOfertada, \r\n"
     		+ "lrSDADLP.unidadPresentacionRequerida, lrSDADLP.unidadPresentacionOfertada, lrSDADLP.cantidadRequerida, \r\n"
     		+ "lrSDADLP.cantidadOfertada, lrSDADLP.moneda, lrSDADLP.precioUnitarioAcordado, lrSDADLP.precioTotal, oALP.noOfertasRecibidas,\r\n"
     		+ "oALP.paisOrigen, lrSDADLP.numRegSanitarioVen, lrSDADLP.fechaRegSanitarioVen, oALP.fechaEmisionSan, oALP.registroSanitario,\r\n"
     		+ "lrSDADLP.numCerBPMVen, lrSDADLP.fechaCerBPMVen, oALP.fechaEmisionManufactura, oALP.etiquetadoPrimario,\r\n"
     		+ "oALP.etiquetadoSecundario, oALP.etiquetadoTerciario, oALP.vidaUtil, lrSDADLP.vidaUtilOfertada, oALP.tiempoEntrega,\r\n"
     		+ "lrSDADLP.tiempoEntregaOfertado, SCalp.codSolicitudCompra, SDalp.codSolicitudDisponibilidad, oALP.prelacionRALP,\r\n"
     		+ "lrSDADLP.criterioRecomendacion, oALP.obsInformeRCC\r\n"
     		+ "from listaRequerimientoSolicitudDisponibilidadALP as lrSDADLP\r\n"
     		+ "INNER JOIN ofertaALP as oALP on lrSDADLP.noOferta = oALP.noOferta\r\n"
     		+ "INNER JOIN solicitudDisponibilidadALP AS SDalp ON SDalp.id = lrSDADLP.idSolicitudDisponibilidad\r\n"
     		+ "INNER JOIN solicitudCompraALP AS SCalp on SCalp.id = SDalp.idSolicitudCompra\r\n"
     		+ "where lrSDADLP.codSolicitudCompra = '"+ codSolicitudCompraParam +"' and oALP.procesoCompra = '"+ procesoCompraParam +"' and segundaRCC= 'REALIZADA' ");	
					
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				
				String id = rs.getString(1);
				String distribuidor = rs.getString(2);  
				String noItem = rs.getString(3);
				String codigoATC = rs.getString(4);
				String codSesal  = rs.getString(5);
				String nombreProductoRequerido = rs.getString(6);
				String nombreProductoOfertado  = rs.getString(7);
				String descripcionTecnicaRequerida  = rs.getString(8);
				String descripcionTecnicaOfertada  = rs.getString(9);
				String unidadPresentacionRequerida  = rs.getString(10);
				String unidadPresentacionOfertada  = rs.getString(11);
				String cantidadRequerida = rs.getString(12);
				String cantidadOfertada  = rs.getString(13);
				String moneda = rs.getString(14);
				String precioUnitarioAcordado = rs.getString(15);
				String precioTotal = rs.getString(16);
				String noOfertasRecibidas = rs.getString(17);
				String paisOrigen = rs.getString(18);
				String numRegSanitarioVen = rs.getString(19);
				String fechaRegSanitarioVen  = rs.getString(20);
				String fechaEmisionSan = rs.getString(21);
				String registroSanitario = rs.getString(22);
				String numCerBPMVen = rs.getString(23);
				String fechaCerBPMVen  = rs.getString(24);
				String fechaEmisionManufactura  = rs.getString(25);
				String etiquetadoPrimario = rs.getString(26);
				String etiquetadoSecundario  = rs.getString(27);
				String etiquetadoTerciario  = rs.getString(28);
				String vidaUtil = rs.getString(29);
				String vidaUtilOfertada  = rs.getString(30);
				String tiempoEntrega = rs.getString(31);
				String tiempoEntregaOfertado  = rs.getString(32);
				String codSolicitudCompra = rs.getString(33);
				String codSolicitudDisponibilidad  = rs.getString(34);
				String prelacionRALP = rs.getString(35);
				String criterioRecomendacion  = rs.getString(36);
				String obsInformeRCC = rs.getString(37);
				

				j += "[" + "\"" + distribuidor + "\"," + "\"" 
								+ noItem + "\"," + "\""
								+ codigoATC + "\"," + "\""
								+ codSesal + "\"," + "\""
								+ nombreProductoRequerido + "\"," + "\""
								+ nombreProductoOfertado + "\"," + "\""
								+ descripcionTecnicaRequerida + "\"," + "\""
								+ descripcionTecnicaOfertada + "\"," + "\""
								+ unidadPresentacionRequerida + "\"," + "\""
								+ unidadPresentacionOfertada + "\"," + "\""
								+ cantidadRequerida + "\"," + "\""
								+ cantidadOfertada + "\"," + "\""
								+ moneda + "\"," + "\""
								+ precioUnitarioAcordado + "\"," + "\""
								+ precioTotal + "\"," + "\""
								+ noOfertasRecibidas + "\"," + "\""
								+ paisOrigen + "\"," + "\""
								+ numRegSanitarioVen + "\"," + "\""
								+ fechaRegSanitarioVen + "\"," + "\""
								+ fechaEmisionSan + "\"," + "\""
								+ registroSanitario + "\"," + "\""
								+ numCerBPMVen + "\"," + "\""
								+ fechaCerBPMVen + "\"," + "\""
								+ fechaEmisionManufactura + "\"," + "\""
								+ etiquetadoPrimario + "\"," + "\""
								+ etiquetadoSecundario + "\"," + "\""
								+ etiquetadoTerciario + "\"," + "\""
								+ vidaUtil + "\"," + "\""
								+ vidaUtilOfertada + "\"," + "\""
								+ tiempoEntrega + "\"," + "\""
								+ tiempoEntregaOfertado + "\"," + "\""
								+ codSolicitudCompra + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								+ prelacionRALP + "\"," + "\""
								+ criterioRecomendacion + "\"," + "\""
								+ obsInformeRCC + "\"],";
				
		}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"],";
			}
		
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(offerList);
		return offerList;
	}
	
	
	public static String getRactificacionListExport(String codSolicitudCompraParam, String procesoCompraParam) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
     		"select lrSDADLP.id, oALP.distribuidor, lrSDADLP.noItem, lrSDADLP.codigoATC, oALP.codSesal, lrSDADLP.nombreProductoRequerido,\r\n"
     		+ "lrSDADLP.nombreProductoOfertado, lrSDADLP.descripcionTecnicaRequerida, lrSDADLP.descripcionTecnicaOfertada, \r\n"
     		+ "lrSDADLP.unidadPresentacionRequerida, lrSDADLP.unidadPresentacionOfertada, lrSDADLP.cantidadRequerida, \r\n"
     		+ "lrSDADLP.cantidadOfertada, lrSDADLP.moneda, lrSDADLP.precioUnitarioAcordado, lrSDADLP.precioTotal, oALP.noOfertasRecibidas,\r\n"
     		+ "oALP.paisOrigen, lrSDADLP.numRegSanitarioVen, lrSDADLP.fechaRegSanitarioVen, oALP.fechaEmisionSan, oALP.registroSanitario,\r\n"
     		+ "lrSDADLP.numCerBPMVen, lrSDADLP.fechaCerBPMVen, oALP.fechaEmisionManufactura, oALP.etiquetadoPrimario,\r\n"
     		+ "oALP.etiquetadoSecundario, oALP.etiquetadoTerciario, oALP.vidaUtil, lrSDADLP.vidaUtilOfertada, oALP.tiempoEntrega,\r\n"
     		+ "lrSDADLP.tiempoEntregaOfertado, SCalp.codSolicitudCompra, SDalp.codSolicitudDisponibilidad, oALP.prelacionRALP,\r\n"
     		+ "lrSDADLP.criterioRecomendacion, oALP.obsInformeRCC,\r\n"
     		+ "lrSDADLP.ratificacionCT, lrSDADLP.criterioResolucionCT, lrSDADLP.comentariosRatificacion, lrSDADLP.segundaRCC, lrSDADLP.estadoCompra, lrSDADLP.prelacionRT \r\n"
     		+ "from listaRequerimientoSolicitudDisponibilidadALP as lrSDADLP\r\n"
     		+ "INNER JOIN ofertaALP as oALP on lrSDADLP.noOferta = oALP.noOferta\r\n"
     		+ "INNER JOIN solicitudDisponibilidadALP AS SDalp ON SDalp.id = lrSDADLP.idSolicitudDisponibilidad\r\n"
     		+ "INNER JOIN solicitudCompraALP AS SCalp on SCalp.id = SDalp.idSolicitudCompra\r\n"
     		+ "where lrSDADLP.codSolicitudCompra = '"+ codSolicitudCompraParam +"' and oALP.procesoCompra = '"+ procesoCompraParam +"' ");	
					
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				
				String id = rs.getString(1);
				String distribuidor = rs.getString(2);  
				String noItem = rs.getString(3);
				String codigoATC = rs.getString(4);
				String codSesal  = rs.getString(5);
				String nombreProductoRequerido = rs.getString(6);
				String nombreProductoOfertado  = rs.getString(7);
				String descripcionTecnicaRequerida  = rs.getString(8);
				String descripcionTecnicaOfertada  = rs.getString(9);
				String unidadPresentacionRequerida  = rs.getString(10);
				String unidadPresentacionOfertada  = rs.getString(11);
				String cantidadRequerida = rs.getString(12);
				String cantidadOfertada  = rs.getString(13);
				String moneda = rs.getString(14);
				String precioUnitarioAcordado = rs.getString(15);
				String precioTotal = rs.getString(16);
				String noOfertasRecibidas = rs.getString(17);
				String paisOrigen = rs.getString(18);
				String numRegSanitarioVen = rs.getString(19);
				String fechaRegSanitarioVen  = rs.getString(20);
				String fechaEmisionSan = rs.getString(21);
				String registroSanitario = rs.getString(22);
				String numCerBPMVen = rs.getString(23);
				String fechaCerBPMVen  = rs.getString(24);
				String fechaEmisionManufactura  = rs.getString(25);
				String etiquetadoPrimario = rs.getString(26);
				String etiquetadoSecundario  = rs.getString(27);
				String etiquetadoTerciario  = rs.getString(28);
				String vidaUtil = rs.getString(29);
				String vidaUtilOfertada  = rs.getString(30);
				String tiempoEntrega = rs.getString(31);
				String tiempoEntregaOfertado  = rs.getString(32);
				String codSolicitudCompra = rs.getString(33);
				String codSolicitudDisponibilidad  = rs.getString(34);
				String prelacionRALP = rs.getString(35);
				String criterioRecomendacion  = rs.getString(36);
				String obsInformeRCC = rs.getString(37);
				
				
				String ratificacionCT = rs.getString(38);
				String criterioResolucionCT = rs.getString(39);
				String comentariosRatificacion = rs.getString(40);
				String segundaRCC = rs.getString(41);
				String estadoCompra = rs.getString(42); 
				String prelacionRT = rs.getString(43);
				

				j += "[" + "\"" + id + "\"," + "\"" 
								+ ratificacionCT + "\"," + "\""
								+ criterioResolucionCT + "\"," + "\""
								+ comentariosRatificacion + "\"," + "\""
								+ segundaRCC + "\"," + "\""
								+ estadoCompra + "\"," + "\""
								+ prelacionRT + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								
								+ distribuidor + "\"," + "\""
								+ noItem + "\"," + "\""
								+ codigoATC + "\"," + "\""
								+ codSesal + "\"," + "\""
								+ nombreProductoRequerido + "\"," + "\""
								+ nombreProductoOfertado + "\"," + "\""
								+ descripcionTecnicaRequerida + "\"," + "\""
								+ descripcionTecnicaOfertada + "\"," + "\""
								+ unidadPresentacionRequerida + "\"," + "\""
								+ unidadPresentacionOfertada + "\"," + "\""
								+ cantidadRequerida + "\"," + "\""
								+ cantidadOfertada + "\"," + "\""
								+ moneda + "\"," + "\""
								+ precioUnitarioAcordado + "\"," + "\""
								+ precioTotal + "\"," + "\""
								+ noOfertasRecibidas + "\"," + "\""
								+ paisOrigen + "\"," + "\""
								+ numRegSanitarioVen + "\"," + "\""
								+ fechaRegSanitarioVen + "\"," + "\""
								+ fechaEmisionSan + "\"," + "\""
								+ registroSanitario + "\"," + "\""
								+ numCerBPMVen + "\"," + "\""
								+ fechaCerBPMVen + "\"," + "\""
								+ fechaEmisionManufactura + "\"," + "\""
								+ etiquetadoPrimario + "\"," + "\""
								+ etiquetadoSecundario + "\"," + "\""
								+ etiquetadoTerciario + "\"," + "\""
								+ vidaUtil + "\"," + "\""
								+ vidaUtilOfertada + "\"," + "\""
								+ tiempoEntrega + "\"," + "\""
								+ tiempoEntregaOfertado + "\"," + "\""
								+ codSolicitudCompra + "\"," + "\""
								+ codSolicitudDisponibilidad + "\"," + "\""
								+ prelacionRALP + "\"," + "\""
								+ criterioRecomendacion + "\"," + "\""
								+ obsInformeRCC + "\"],";
				
		}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"," + "\""
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\""
								+ empty + "\"," + "\""
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"," + "\"" 
								+ empty + "\"],";
			}
		
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(offerList);
		return offerList;
	}
	
	
}
