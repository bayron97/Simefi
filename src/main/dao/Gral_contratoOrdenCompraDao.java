package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_contratoOrdenCompraDao {

	public static int save(Gral_contratoOrdenCompra contratoOrdenCompra) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.contratoOrdenCompra(idAperturaProceso, idProveedor, nombreProveedor, tipoDocuemnto, numDocumento, fechaSuscripcion, observaciones, documento) values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, contratoOrdenCompra.getIdAperturaProceso());
			ps.setInt(2, contratoOrdenCompra.getIdProveedor());
			ps.setString(3, contratoOrdenCompra.getNombreProveedor());	
			ps.setString(4, contratoOrdenCompra.getTipoDocuemnto());	
			ps.setString(5, contratoOrdenCompra.getNumDocumento());	
			ps.setString(6, contratoOrdenCompra.getFechaSuscripcion());	
			ps.setString(7, contratoOrdenCompra.getObservaciones());	
			ps.setString(8, contratoOrdenCompra.getDocumento());	
			contrato = ps.executeUpdate();		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}

	public static int update(Gral_contratoOrdenCompra contratoOrdenCompra) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.contratoOrdenCompra set idAperturaProceso =?, idProveedor =?, nombreProveedor =?, tipoDocuemnto =?, numDocumento =?, fechaSuscripcion =?, observaciones =?, documento =? where idcontratoOrdenCompra =?");
			ps.setInt(1, contratoOrdenCompra.getIdAperturaProceso());
			ps.setInt(2, contratoOrdenCompra.getIdProveedor());
			ps.setString(3, contratoOrdenCompra.getNombreProveedor());
			ps.setString(4, contratoOrdenCompra.getTipoDocuemnto());
			ps.setString(5, contratoOrdenCompra.getNumDocumento());
			ps.setString(6, contratoOrdenCompra.getFechaSuscripcion());
			ps.setString(7, contratoOrdenCompra.getObservaciones());
			ps.setString(8, contratoOrdenCompra.getDocumento());
			ps.setInt(9, contratoOrdenCompra.getIdcontratoOrdenCompra());
			idAperturaProceso = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}
	
	public static int updateNoDocumwnto(Gral_contratoOrdenCompra contratoOrdenCompra) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.contratoOrdenCompra set idAperturaProceso =?, idProveedor =?, nombreProveedor =?, tipoDocuemnto =?, numDocumento =?, fechaSuscripcion =?, observaciones =? where idcontratoOrdenCompra =?");
			ps.setInt(1, contratoOrdenCompra.getIdAperturaProceso());
			ps.setInt(2, contratoOrdenCompra.getIdProveedor());
			ps.setString(3, contratoOrdenCompra.getNombreProveedor());
			ps.setString(4, contratoOrdenCompra.getTipoDocuemnto());
			ps.setString(5, contratoOrdenCompra.getNumDocumento());
			ps.setString(6, contratoOrdenCompra.getFechaSuscripcion());
			ps.setString(7, contratoOrdenCompra.getObservaciones());			
			ps.setInt(8, contratoOrdenCompra.getIdcontratoOrdenCompra());
			idAperturaProceso = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}
	
	public static Gral_contratoOrdenCompraDTO GetContratoOrdenCompra(int idcontratoOrdenCompra) {		
		Gral_contratoOrdenCompraDTO contratoOrdenCompra = new Gral_contratoOrdenCompraDTO();		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select coc.idAperturaProceso, coc.idProveedor, coc.nombreProveedor, coc.tipoDocuemnto, coc.numDocumento, coc.fechaSuscripcion, coc.observaciones, coc.documento, ap.beneficiario from Gral.contratoOrdenCompra as coc inner join Gral.aperturaProceso as ap on ap.idAperturaProceso = coc.idAperturaProceso where idcontratoOrdenCompra=?");		
			ps.setInt(1, idcontratoOrdenCompra);
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {
				contratoOrdenCompra.setIdAperturaProceso(rs.getInt(1));
				contratoOrdenCompra.setIdProveedor(rs.getInt(2));
				contratoOrdenCompra.setNombreProveedor(rs.getString(3));
				contratoOrdenCompra.setTipoDocuemnto(rs.getString(4));
				contratoOrdenCompra.setNumDocumento(rs.getString(5));
				contratoOrdenCompra.setFechaSuscripcion(rs.getString(6));
				contratoOrdenCompra.setObservaciones(rs.getString(7));
				contratoOrdenCompra.setDocumento(rs.getString(8));	
				contratoOrdenCompra.setBeneficiario(rs.getString(9));
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return contratoOrdenCompra;
	}

	public static ArrayList<Gral_contratoOrdenCompraDTO> procesosWhitcontratoOrdenCompraList(){
		ArrayList<Gral_contratoOrdenCompraDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select coc.idAperturaProceso, ap.numProcesoCompra from Gral.contratoOrdenCompra as coc inner join Gral.aperturaProceso as ap on coc.idAperturaProceso = ap.idAperturaProceso group by coc.idAperturaProceso, ap.numProcesoCompra");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_contratoOrdenCompraDTO procesoCompraGeneral = new Gral_contratoOrdenCompraDTO();				
				procesoCompraGeneral.setIdAperturaProceso(rs.getInt(1));
				procesoCompraGeneral.setNumProcesoCompra(rs.getString(2));
				List.add(procesoCompraGeneral);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String proveedotOrdenContratoByIdsAperturaProceso(int idAperturaProceso) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select idProveedor, nombreProveedor from Gral.contratoOrdenCompra where idAperturaProceso = ? group by idProveedor, nombreProveedor");
			ps.setInt(1, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String proveedor =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += proveedor + ",";
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

	public static String contratoOrdenCompraByProveedor(int idProveedor,int idAperturaProceso) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select idcontratoOrdenCompra, numDocumento from Gral.contratoOrdenCompra where idProveedor = ? and idAperturaProceso = ?");
			ps.setInt(1, idProveedor);
			ps.setInt(2, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String contratoOrden =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += contratoOrden + ",";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println("ordecontrato: "+reqList);
		return reqList;
		
	}
	
	public static String getnumDocumentoXidAperturaProceso(int idAperturaProceso) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select idcontratoOrdenCompra, numDocumento FROM Gral.contratoOrdenCompra where idAperturaProceso = ?");
			ps.setInt(1, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String procesoCompra =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += procesoCompra + ",";
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
	
	public static String getProveedorXidcontratoOrdenCompra(int  idcontratoOrdenCompra) {
		String proveedor = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select nombreProveedor from Gral.contratoOrdenCompra where idcontratoOrdenCompra = ?");
			ps.setLong(1, idcontratoOrdenCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+",";
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

	public static ArrayList<Gral_contratoOrdenCompra> Getproveedores(int  idAperturaProceso){
		ArrayList<Gral_contratoOrdenCompra> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select coc.idProveedor, coc.nombreProveedor from Gral.aperturaProceso as ap\r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on coc.idAperturaProceso = ap.idAperturaProceso\r\n"
					+ "where coc.idAperturaProceso = ?\r\n"
					+ "group by coc.idProveedor, coc.nombreProveedor");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_contratoOrdenCompra contratoOrden = new Gral_contratoOrdenCompra();				
				contratoOrden.setIdProveedor(rs.getInt(1));
				contratoOrden.setNombreProveedor(rs.getString(2));	
				List.add(contratoOrden);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static String getnumDocumentoXproveedor(int idProveedor) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select c.idContratacion, coc.numDocumento from Gral.contratacion as c\r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on c.idcontratoOrdenCompra = coc.idcontratoOrdenCompra\r\n"
					+ "where coc.idProveedor = ?");
			ps.setInt(1, idProveedor);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String proveedor =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += proveedor + ";";
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
	
	public static String validarNumDocumento(String  numDocumento, String tipoDocuemnto) {
		String existe = "no";
		try {
			Connection con = Database.connect();
			
			PreparedStatement ps = con.prepareStatement("");
			if(tipoDocuemnto.contentEquals("ORDEN DE COMPRA")) {
				 ps = con.prepareStatement("select count(numDocumento) from [Gral].[contratoOrdenCompra] where numDocumento = ? and tipoDocuemnto = 'ORDEN DE COMPRA'");
			}else {
				ps = con.prepareStatement("select count(numDocumento) from [Gral].[contratoOrdenCompra] where numDocumento = ? and tipoDocuemnto != 'ORDEN DE COMPRA'");
			}
			ps.setString(1, numDocumento);
			
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				existe = rs.getString(1);
			}			
			
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return existe;
	}
	
}

