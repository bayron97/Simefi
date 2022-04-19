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

public class controlGarantiasGeneralDao {
	

	public static int save(controlGarantiasGeneral l) {
		int status = 0;
		
		try {
			
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO ControlGarantiasGeneral(buyProcessId,buyProcessCod,buyOrderId,warrantytype,warrantyNo,fechaemision,fechacaducidad,estado,fecha,diasanticipacion,documentName,beneficiario,tipoProcesoCompra,valorGarantia,correo1,correo2,correo3)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyProcessCod());
			ps.setString(3, l.getBuyOrderId());
			ps.setString(4, l.getWarrantytype());
			ps.setString(5, l.getWarrantyNo());
			ps.setString(6, l.getFechaemision());
			ps.setString(7, l.getFechacaducidad());
			ps.setString(8, l.getEstado());
			ps.setString(9, l.getFecha());
			ps.setInt(10, l.getDiasanticipacion());
			ps.setString(11, l.getDocumentName());
			ps.setString(12, l.getbeneficiario());
			ps.setString(13, l.gettipoProcesoCompra());
			ps.setString(14, l.getvalorGarantia());
			ps.setString(15, l.getcorreo1());
			ps.setString(16, l.getcorreo2());
			ps.setString(17, l.getcorreo3());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(controlGarantiasGeneral l) {
		int status = 0;
		System.out.println( l.getId() + " UPDATE TEST");
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE ControlGarantiasGeneral SET buyProcessId=?,buyProcessCod=?,buyOrderId=?,warrantytype=?,warrantyNo=?,fechaemision=?,fechacaducidad=?,estado=?,fecha=?,diasanticipacion=?,documentName=?,beneficiario=?,tipoProcesoCompra=?,valorGarantia=?,correo1=?,correo2=?,correo3=? where Id=?");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyProcessCod());
			ps.setString(3, l.getBuyOrderId());
			ps.setString(4, l.getWarrantytype());
			ps.setString(5, l.getWarrantyNo());
			ps.setString(6, l.getFechaemision());
			ps.setString(7, l.getFechacaducidad());
			ps.setString(8, l.getEstado());
			ps.setString(9, l.getFecha());
			ps.setInt(10, l.getDiasanticipacion());
			ps.setString(11, l.getDocumentName());
			ps.setString(12, l.getbeneficiario());
			ps.setString(13, l.gettipoProcesoCompra());
			ps.setString(14, l.getvalorGarantia());
			ps.setString(15, l.getcorreo1());
			ps.setString(16, l.getcorreo2());
			ps.setString(17, l.getcorreo3());
			ps.setInt(18,l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status");
		return status;
	}

	public static controlGarantiasGeneral getById(int id) {
		controlGarantiasGeneral p = new controlGarantiasGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ControlGarantiasGeneral where Id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setBuyProcessId(rs.getInt(2));
				p.setBuyProcessCod(rs.getString(3));
				p.setBuyOrderId(rs.getString(4));
				p.setWarrantytype(rs.getString(5));
				p.setWarrantyNo(rs.getString(6));
				p.setFechaemision(rs.getString(7));
				p.setFechacaducidad(rs.getString(8));
				p.setEstado(rs.getString(9));
				p.setFecha(rs.getString(10));
				p.setDiasanticipacion(rs.getInt(11));
				p.setDocumentName(rs.getString(12));
				p.setbeneficiario(rs.getString(13));
				p.setcorreo1(rs.getString(14));
				p.setcorreo2(rs.getString(15));
				p.setcorreo3(rs.getString(16));
				p.settipoProcesoCompra(rs.getString(17));
				p.setvalorGarantia(rs.getString(18));
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
	
}
