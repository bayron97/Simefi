package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class beneficiarioDao {

	public static int save(beneficiario b) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.beneficiario (denominacion, direccion, pais, representanteLegal) values (?,?,?,?)");
			ps.setString(1, b.getDenominacion());
			ps.setString(2, b.getDireccion());
			ps.setString(3, b.getPais());
			ps.setString(4, b.getRepresentanteLegal());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static String getProveedoresbyprocompraandsoli(String solicitudCompra, String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			
//			PreparedStatement psS = con
//					.prepareStatement("select id from solicitudCompraALP where noProcesoCompra =?");
//			psS.setString(1, noProcesoCompra);
//			ResultSet rsS = psS.executeQuery();
//			int codigoSolicitud = 0;
//			while (rsS.next()) {
//				codigoSolicitud = rsS.getInt(1);
//			}			
			PreparedStatement ps = con
					//.prepareStatement("select proveedor from listaRequerimientoSolicitudCompraALP where idSolicitudCompra =? group by proveedor");
			.prepareStatement("SELECT sdalp.proveedor  FROM procesoCompraALP AS pcalp \r\n"
					+ "inner join  solicitudCompraALP as scalp on pcalp.noProcesoCompra = scalp.noProcesoCompra \r\n"
					+ "inner join solicitudDisponibilidadALP as sdalp on sdalp.idSolicitudCompra = scalp.id \r\n"
					+ "inner join listaRequerimientoSolicitudDisponibilidadALP as lrsdalp on lrsdalp.idSolicitudDisponibilidad = sdalp.id \r\n"
					+ "where  pcalp.noProcesoCompra = ? and  lrsdalp.ratificacionCT = 'RATIFICADO' group by sdalp.proveedor");
			ps.setString(1, noProcesoCompra);			
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String beneficiario = rs.getString(1);
				

				j += beneficiario + ";";
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
	
	
}
