package main.dao;

import main.model.*;
import main.servlet.logout;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class productoSolicitudCompraALPDao {

	public static int save(productoSolicitudCompraALP psc) {
		System.out.println("LLege");
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.productoSolicitudCompraALP(idSolicitudCompra, nOficio, codigoATC, nombreProductoSegunCatalogo, UnidadPresentacion, cantidadRequerida, tiempoEntregaRequerido, vidaUtilRequerida, observacionBeneficiario, codigoSesal, item, descripcionTecnica) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setLong(1, psc.getidSolicitudCompra());
			ps.setString(2, psc.getnOficio());
			ps.setString(3, psc.getcodigoATC());
			ps.setString(4, psc.getnombreProductoSegunCatalogo());
			ps.setString(5, psc.getUnidadPresentacion());
			ps.setInt(6, psc.getcantidadRequerida());
			ps.setString(7, psc.gettiempoEntregaRequerido());
			ps.setString(8, psc.getvidaUtilRequerida());
			ps.setString(9, psc.getobservacionBeneficiario());
			ps.setString(10, psc.getcodigoSesal());
			ps.setInt(11, psc.getitem());
			ps.setString(12, psc.getdescripcionTecnicaAcordada());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}		
		return status;
	}
	
	public static int update(productoSolicitudCompraALP psc) {
		System.out.println("LLege");
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE dbo.productoSolicitudCompraALP SET idSolicitudCompra =?, nOficio=?, codigoATC=?, nombreProductoSegunCatalogo=?, UnidadPresentacion=?, cantidadRequerida=?, tiempoEntregaRequerido=?, vidaUtilRequerida=?, observacionBeneficiario=? WHERE id =?");
			ps.setLong(1, psc.getidSolicitudCompra());
			ps.setString(2, psc.getnOficio());
			ps.setString(3, psc.getcodigoATC());
			ps.setString(4, psc.getnombreProductoSegunCatalogo());
			ps.setString(5, psc.getUnidadPresentacion());
			ps.setInt(6, psc.getcantidadRequerida());
			ps.setString(7, psc.gettiempoEntregaRequerido());
			ps.setString(8, psc.getvidaUtilRequerida());
			ps.setString(9, psc.getobservacionBeneficiario());
			ps.setInt(10, psc.getid());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}		
		return status;
	}
	
	
	public static String getListProductoSolicitubCompraJSON(long idSolicitudCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select id, nOficio, item, codigoATC, codigoSesal, nombreProductoSegunCatalogo, UnidadPresentacion, cantidadRequerida, tiempoEntregaRequerido, vidaUtilRequerida, observacionBeneficiario, descripcionTecnica from dbo.productoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				
				
				
				String id =  rs.getString(1);
				String nOficio =  rs.getString(2);
				String item =  rs.getString(3);
				String codigoATC =  rs.getString(4);
				String codigoSesal =  rs.getString(5);
				String nombreProductoSegunCatalogo =  rs.getString(6);
				String UnidadPresentacion =  rs.getString(7);
				String cantidadRequerida =  String.valueOf(String.format("%,d", rs.getInt(8)));
				String tiempoEntregaRequerido =  rs.getString(9);
				String vidaUtilRequerida =  rs.getString(10);
				String observacionBeneficiario =  rs.getString(11);
				String descripcionTecnica =  rs.getString(12);
				
				if (observacionBeneficiario == null) {
					observacionBeneficiario = "-";
				}
				
				if (descripcionTecnica == null) {
					descripcionTecnica = "-";
				}

				j += "[" + "\"" + id + "\"," 
				         + "\"" + nOficio + "\"," 
						 + "\"" + item + "\"," 
				         + "\"" + codigoATC + "\","  
						 + "\"" + codigoSesal + "\"," 
				         + "\"" + nombreProductoSegunCatalogo + "\"," 
						 + "\"" + UnidadPresentacion.toUpperCase() + "\","
						 + "\"" + cantidadRequerida + "\"," 
						 + "\"" + tiempoEntregaRequerido.toUpperCase() + "\","
						 + "\"" + vidaUtilRequerida.toUpperCase() + "\","
						 + "\"" + observacionBeneficiario.toUpperCase() + "\","
						 + "\"" + descripcionTecnica.toUpperCase() + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," 
						 + "\"" + empty + "\"," 
						 + "\"" + empty + "\"," 
						 + "\"" + empty + "\","
						 + "\"" + empty + "\","
						 + "\"" + empty + "\"," 
						 + "\"" + empty + "\"," 
						 + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty +  "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(reqList);
		return reqList;
	}
	
	
	public static ArrayList<productoSolicitudCompraALP> getReqListByBuyRequestId(long idSolicitudCompra) {
		ArrayList<productoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					//"select nOficio, codigoATC, nombreProductoSegunCatalogo, UnidadPresentacion, cantidadRequerida, tiempoEntregaRequerido, vidaUtilRequerida, observacionBeneficiario from dbo.productoSolicitudCompraALP where idSolicitudCompra = ?");
					"select nOficio, codigoATC, nombreProductoSegunCatalogo, UnidadPresentacion, cantidadRequerida, tiempoEntregaRequerido, vidaUtilRequerida, observacionBeneficiario, id from dbo.productoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				productoSolicitudCompraALP rl = new productoSolicitudCompraALP();
				rl.setnOficio(rs.getString(1));
				rl.setcodigoATC(rs.getString(2));
				rl.setnombreProductoSegunCatalogo(rs.getString(3));
				rl.setUnidadPresentacion(rs.getString(4));
				rl.setcantidadRequerida(rs.getInt(5));
				rl.settiempoEntregaRequerido(rs.getString(6));
				rl.setvidaUtilRequerida(rs.getString(7));
				rl.setobservacionBeneficiario(rs.getString(8));			
				rl.setid(rs.getInt(9));
				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	
	public static ArrayList<productoSolicitudCompraALP> getReqNamesByBuyRequestIdForFilter(long idSolicitudCompra) {
		ArrayList<productoSolicitudCompraALP> reqList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct nombreProductoSegunCatalogo from dbo.productoSolicitudCompraALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				productoSolicitudCompraALP rl = new productoSolicitudCompraALP();

				rl.setnombreProductoSegunCatalogo(rs.getString(1));

				reqList.add(rl);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	
	public static int verificarRequerimiento(Long idSolicitudCompra, String nombreProductoSegunCatalogo) {
		
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select nombreProductoSegunCatalogo from productoSolicitudCompraALP where idSolicitudCompra = ? and nombreProductoSegunCatalogo  = ?");		
			 ps.setLong(1, idSolicitudCompra);
			 ps.setString(2, nombreProductoSegunCatalogo);
			ResultSet rs = ps.executeQuery();
	
			if (rs.next()) {
				existe = 1;
			}				
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;
	}
	
}
