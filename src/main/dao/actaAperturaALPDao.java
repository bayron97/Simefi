package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import api.ActaAperturaAPI;

public class actaAperturaALPDao {

	

	public static int update(actaAperturaALP a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.actaApertura set ofertasRecividas = ?, estado = ? where idListRequirement = ? and procesoCompra = ? and denominacion=? ");			
			ps.setInt(1, a.getofertasRecividas());
			ps.setBoolean(2, a.getestado());
			ps.setInt(3, a.getidListRequirement());
			ps.setString(4, a.getprocesoCompra());		
			ps.setString(5, a.getdenominacion());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(actaAperturaALP a) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.actaApertura (idListRequirement, denominacion, ofertasRecividas, estado, procesoCompra, noOfertador) values (?,?,?,?,?,?);");
			ps.setInt(1, a.getidListRequirement());
			ps.setString(2, a.getdenominacion());
			ps.setInt(3, a.getofertasRecividas());
			ps.setBoolean(4, a.getestado());
			ps.setString(5, a.getprocesoCompra());	
			ps.setInt(6, a.getnoOfertador());	
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int validarExistencia(actaAperturaALP a) {
		int existe = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select count(procesoCompra) as existes from actaApertura where procesoCompra =? and denominacion = ? and idListRequirement = ?");		
			ps.setString(1, a.getprocesoCompra());	
			ps.setString(2, a.getdenominacion());
			ps.setInt(3, a.getidListRequirement());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				existe = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return existe;
	}
	
	public static int cantidadOfertada(actaAperturaALP a) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select sum(ofertasRecividas) as cantidadOertadaPro from actaApertura where procesoCompra =? and idListRequirement = ?");		
			ps.setString(1, a.getprocesoCompra());
			ps.setInt(2, a.getidListRequirement());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cantidad = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	
	public static int productosConOfertas(String noProcesoCompra) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select sum(ofertasRecividas), idListRequirement from  actaApertura where procesoCompra = ? and noOfertador > 0 group by idListRequirement");		
			ps.setString(1, noProcesoCompra);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getInt(1) > 0) {
					cantidad++;
				}
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	
	public static int productosSinOfertas(String noProcesoCompra) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select sum(ofertasRecividas), idListRequirement from  actaApertura where procesoCompra = ? and noOfertador > 0 group by idListRequirement");		
			ps.setString(1, noProcesoCompra);			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				if(rs.getInt(1) <= 0) {
					cantidad++;
				}
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	
	public static int cantidadProveedores(actaAperturaALP a) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select denominacion from actaApertura where procesoCompra =? GROUP by  denominacion");		
			ps.setString(1, a.getprocesoCompra());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cantidad++;
				
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	

	public static String getDistribuidorByProcesoApi(String noProceso) {

		String dist = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select denominacion, noOfertador from actaApertura where procesoCompra =? group by denominacion, noOfertador");
			String j = "{ \"data\":[";
			ps.setString(1, noProceso);
			ResultSet rs = ps.executeQuery();
			int  count = 0;
			while (rs.next()) {
				count++;
				String denominacion = rs.getString(1);
				String distribuidor = "DISTRIBUIDOR";
				String noOfertador = rs.getString(2);
				j += "[\"" + denominacion + "\"," + "\"" + distribuidor + "\"," + "\"" + noOfertador + "\"],";
			}
			
			if(count == 0) {
				j += "[\"" + "-" + "\"," +"\"" + "-" + "\","+ "\"" + "-" + "\"],";
			}
			
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			dist = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return dist;
	}
	
	public static int cantidadOfertadaByProcessoAndItem(String noProceso , String Proveedor, int item) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select ofertasRecividas from actaApertura where procesoCompra =?  AND denominacion =? AND idListRequirement =?");		
			ps.setString(1, noProceso);
			ps.setString(2, Proveedor);
			ps.setInt(3, item);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cantidad = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	
	//Conteo par actualiszar la lista de requerimientos consolidada
	public static int cantidadOfertadaByProcessoUPdateparaConsolidado(String noProceso , String Proveedor, int item) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select ofertasRecividas from actaApertura where procesoCompra =?  AND idListRequirement =?");		
			ps.setString(1, noProceso);
			ps.setString(2, Proveedor);
			ps.setInt(3, item);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cantidad = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}
	
	//Conteo de productos por proceso de compra
		public static int cantidadProductosByProceso(String noProceso ) {
			int cantidad = 0;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con
						.prepareStatement("select idListRequirement from actaApertura where procesoCompra = ? GROUP by  idListRequirement");		
				ps.setString(1, noProceso);				
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					
					
					int canOfertaItem = ofertaALPDao.ValidaSihayOfertaPorProducto(noProceso, rs.getInt(1));
					
					if(canOfertaItem > 0) {
						cantidad ++;
					}
					
					
				}
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}
			return cantidad;
		}
	
		public static String VerificarNumeroOfertador(String procesoCompra, int noOfertador) {
			String reqList = "";
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con
						.prepareStatement("select noOfertador from [dbo].[actaApertura] where procesoCompra = ? and noOfertador = ?\r\n"
								+ "group by noOfertador");
				ps.setInt(2, noOfertador);
				ps.setString(1, procesoCompra); 
				String j = "";
				ResultSet rs = ps.executeQuery();			
				while (rs.next()) {				
					j =  rs.getString(1);
				}
				
				j = j.substring(0, j.length());
				
				if(j.isEmpty()) {
					j = "0";
				}
				reqList = j;
				con.close();
			}
			catch(Exception e) {
				System.out.println(e);
			}
			return reqList;
			
		}
}
