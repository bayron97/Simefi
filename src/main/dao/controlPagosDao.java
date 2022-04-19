package main.dao;

import main.model.*;
import main.Database;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class controlPagosDao {

	public static int save(controlPagos l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO ControlPagos(buyProcessId,buyProcessCod,buyOrderId,proveedor,cuentaBancaria,banco,noItem,noFactura,fechaLimiteEntrega,fechaSolicitudCita,diasAtraso,totalPagado,multa,pagoTotal,estado,actaRecepcion,informeCalidad)\r\n"
					+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyProcessCod());
			ps.setString(3, l.getBuyOrderId());
			ps.setString(4, l.getProveedor());
			ps.setString(5, l.getCuentaBancaria());
			ps.setString(6, l.getBanco());
			ps.setInt(7, l.getNoItem());
			ps.setString(8, l.getNoFactura());
			ps.setString(9, l.getFechaLimiteEntrega());
			ps.setString(10, l.getFechaSolicitudCita());
			ps.setInt(11, l.getDiasAtraso());
			ps.setFloat(12, l.getTotalPagado());
			ps.setFloat(13, l.getMulta());
			ps.setFloat(14, l.getPagoTotal());
			ps.setString(15, l.getEstado());
			ps.setString(16, l.getactaRecepcion());
			ps.setString(17, l.getinformeCalidad());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(controlPagos l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE BancOcci.dbo.ControlPagos\r\n"
					+ "SET buyProcessId=?,buyProcessCod=?,buyOrderId=?,proveedor=?,cuentaBancaria=?,banco=?,noItem=?,noFactura=?,fechaLimiteEntrega=?,fechaSolicitudCita=?,diasAtraso=?,totalPagado=?,multa=?,pagoTotal=?,estado=?,noReferencia=?,fecha=?,informeCalidad=?,actaRecepcion=?\r\n"
					+ "WHERE Id=?");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyProcessCod());
			ps.setString(3, l.getBuyOrderId());
			ps.setString(4, l.getProveedor());
			ps.setString(5, l.getCuentaBancaria());
			ps.setString(6, l.getBanco());
			ps.setInt(7, l.getNoItem());
			ps.setString(8, l.getNoFactura());
			ps.setString(9, l.getFechaLimiteEntrega());
			ps.setString(10, l.getFechaSolicitudCita());
			ps.setInt(11, l.getDiasAtraso());
			ps.setFloat(12, l.getTotalPagado());
			ps.setFloat(13, l.getMulta());
			ps.setFloat(14, l.getPagoTotal());
			ps.setString(15, l.getEstado());
			ps.setString(16, l.getNoReferencia());
			ps.setString(17, l.getFecha());
			ps.setString(18, l.getinformeCalidad());
			ps.setString(19, l.getactaRecepcion());			
			ps.setInt(20, l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static controlPagos getById(int id) {
		controlPagos p = new controlPagos();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ControlPagos WHERE Id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setBuyProcessId(rs.getInt(2));
				p.setBuyProcessCod(rs.getString(3));
				p.setBuyOrderId(rs.getString(4));
				p.setProveedor(rs.getString(5));
				p.setCuentaBancaria(rs.getString(6));
				p.setBanco(rs.getString(7));
				p.setNoItem(rs.getInt(8));
				p.setNoFactura(rs.getString(9));
				p.setFechaLimiteEntrega(rs.getString(10));
				p.setFechaSolicitudCita(rs.getString(11));
				p.setDiasAtraso(rs.getInt(12));
				p.setTotalPagado(rs.getFloat(13));
				p.setMulta(rs.getFloat(14));
				p.setPagoTotal(rs.getFloat(15));
				p.setEstado(rs.getString(16));
				p.setNoReferencia(rs.getString(17));
				p.setFecha(rs.getString(18));
				p.setinformeCalidad(rs.getString(19));
				p.setactaRecepcion(rs.getString(20));
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
					.prepareStatement("SELECT noOrdenCompra FROM contrataciones WHERE procesoCompra =?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String orden = rs.getString(3);

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
	
	public static String getInfDistribuidor(String ordencompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT d.denominacion,d.noCuenta,d.banco FROM contrataciones c inner join distribuidor d\r\n"
							+ "on c.proveedor = d.denominacion\r\n"
							+ "WHERE c.noOrdenCompra=?");
			ps.setString(1, ordencompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String denominacion = rs.getString(1);
				String noCuenta = rs.getString(2);
				String banco = rs.getString(3);

				j += denominacion + ","+noCuenta + ","+banco+",";
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
	
	public static String getTable(String ordencompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT noItem,noFactura,fechaLimiteEntrega,fechaSolicitudCita,diasAtraso,totalPagado,multa,pagoTotal FROM ControlPagos Where buyOrderId LIKE '%"+ordencompra+"%'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				
				int noItem = rs.getInt(1);
				String noFactura = rs.getString(2);
				String fechaLimiteEntrega = rs.getString(3);
				String fechaSolicitudCita = rs.getString(4);
				int diasAtraso = rs.getInt(5);
				float totalPagado = rs.getFloat(6);
				float multa = rs.getFloat(7);
				float PagoTotal = rs.getFloat(8);

				j += "[" + "\"" + noItem + "\"," +"\"" + noFactura + "\"," +"\"" + fechaLimiteEntrega + "\"," +"\"" + fechaSolicitudCita + "\"," +"\"" + diasAtraso + "\"," +"\"" + totalPagado + "\"," +"\"" + multa + "\"," + "\"" + PagoTotal + "\"],";
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

}
