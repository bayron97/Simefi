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

public class contratoSuministroDao {

	public static int save(contratoSuministro l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO BancOcci.dbo.ContratoSuministro(buyProcessId, buyOrderId, distribuidor, buyProcessCod, fecha, observaciones, documentName) VALUES(?, ?, ?, ?, ?, ?, ?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyOrderId());
			ps.setString(3, l.getDistribuidor());
			ps.setString(4, l.getBuyProcessCod());
			ps.setString(5, l.getFecha());
			ps.setString(6, l.getObservaciones());
			ps.setString(7, "-");
			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			        status = generatedKeys.getInt(1);
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int savedocument(contratosuministrodocumento l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO [dbo].[contratosuministrodocumento] (idContrato, idDocumentos ,nombresArchivos , descripcionesArchivos) VALUES (?, ?, ?, ?)");
			ps.setInt(1, l.getidContrato());
			ps.setString(2, l.getidDocumentos());
			ps.setString(3, l.getnombresArchivos());
			ps.setString(4, l.getdescripcionesArchivos());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status);
		return status;
	}
	
	public static int updatedocument(contratosuministrodocumento l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE [dbo].[contratosuministrodocumento] SET idContrato=?, idDocumentos=? ,nombresArchivos=? , descripcionesArchivos=? where id=?");
			ps.setInt(1, l.getidContrato());
			ps.setString(2, l.getidDocumentos());
			ps.setString(3, l.getnombresArchivos());
			ps.setString(4, l.getdescripcionesArchivos());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status);
		return status;
	}

	public static int update(contratoSuministro l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.ContratoSuministro SET  fecha=?, observaciones=? WHERE buyOrderId=?");
			
			ps.setString(1, l.getFecha());
			ps.setString(2, l.getObservaciones());
			ps.setString(3,l.getBuyOrderId());
			System.out.println("id que viene " + l.getBuyOrderId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static contratoSuministro getById(int id) {
		contratoSuministro p = new contratoSuministro();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM contratoSuministro where Id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setBuyProcessId(rs.getInt(2));
				p.setBuyOrderId(rs.getString(3));
				p.setDistribuidor(rs.getString(4));
				p.setBuyProcessCod(rs.getString(5));
				p.setFecha(rs.getString(6));
				p.setObservaciones(rs.getString(7));
				p.setDocumentName(rs.getString(8));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static String getOrdenCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT id, noOrdenCompra FROM contrataciones WHERE procesoCompra =?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String id = rs.getString(1);
				String orden = rs.getString(2);
				
				String dropList = "<option value="+ id +" >" + orden + "</option>";

				j += dropList + ",";
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
	
	public static String getDatosOrdenCompra(int idDetalleOrdenCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select proveedor, sum(valorTotalCompra), moneda from contratacionDetalle where id =? group by proveedor, moneda");
			ps.setInt(1, idDetalleOrdenCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String proveedor = rs.getString(1);
				String valorTotalCompra = rs.getString(2);
				String moneda = rs.getString(3);
				
				
				j += proveedor + ";" + valorTotalCompra + ";" + moneda+ ";";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		System.out.println("datos: " + reqList);
		return reqList;
	}
	
	public static String getTable() {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT Id, buyProcessId, buyOrderId, distribuidor, buyProcessCod, fecha, observaciones, documentName FROM BancOcci.dbo.ContratoSuministro");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int Id = rs.getInt(1);
				int buyProcessId = rs.getInt(2);
				String buyOrderId = rs.getString(3);
				String distribuidor = rs.getString(4);
				String buyProcessCod = rs.getString(5);
				String fecha = rs.getString(6);
				String observaciones = rs.getString(7);
				String documentName = rs.getString(8);

				j += "[" + "\"" + Id + "\"," + "\"" + buyProcessId + "\"," + "\"" + buyOrderId + "\"," + "\"" + distribuidor
						+ "\"," + "\"" + buyProcessCod + "\"," + "\"" + fecha + "\"," + "\"" + observaciones + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			System.out.print("Dao");
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}

	public static String getProveedores(String procesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT distribuidor FROM ofertaalp where procesoCompra = ? and recomendacionComite = 'si' group by distribuidor");
			ps.setString(1, procesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String proveedor = "<option>"+rs.getString(1)+"</option>";

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
	
	public static String validarNoContrato(int  buyProcessId, String buyOrderId) {
		
		System.out.println("buyProcessId "+buyProcessId);
		System.out.println("buyOrderId "+buyOrderId);
		String existe = "0";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT count(buyOrderId) existen FROM ContratoSuministro where buyProcessId =?  and buyOrderId  =?");
			ps.setInt(1, buyProcessId);
			ps.setString(2,buyOrderId);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+",";
			}			
			j = j.substring(0, j.length() - 1);
			existe = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return existe;
	}
	
}
