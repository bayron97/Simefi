package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class beneficiarioFinalDao {

	public static int save(beneficiarioFinal b) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.beneficiarioFinal(beneficiarioFinal, direccion, estado, observaciones) values(?,?,?,?)");
			ps.setString(1, b.getBeneficiarioFinal());
			ps.setString(2, b.getDireccion());
			ps.setString(3, b.getEstado());
			ps.setString(4, b.getObservaciones());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getBenefs(String c) {
		String s = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT bf.beneficiarioFinal FROM beneFinalOficioCompraALP bfoca INNER JOIN  oficioProcesoCompraALP opca ON opca.oficio = bfoca.oficio INNER JOIN beneficiarioFinal bf ON bfoca.beneF = bf.no WHERE opca.procesoCompra = ?");
			ps.setString(1, c);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				s = s + rs.getString(1) + ",";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return s;
	}

	public static int activar(beneficiarioFinal b) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.beneficiarioFinal set estado = ?, observaciones = ? where beneficiarioFinal = ?");
			ps.setString(1, b.getEstado());
			ps.setString(2, b.getObservaciones());
			ps.setString(3, b.getBeneficiarioFinal());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<beneficiarioFinal> getAllActive() {
		ArrayList<beneficiarioFinal> beneficiarioList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select no, beneficiarioFinal from dbo.beneficiarioFinal where estado='ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				beneficiarioFinal b = new beneficiarioFinal();
				b.setNo(rs.getInt(1));
				b.setBeneficiarioFinal(rs.getString(2));

				beneficiarioList.add(b);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return beneficiarioList;
	}
	
	public static int update(beneficiarioFinal v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.beneficiarioFinal set beneficiarioFinal = ?, estado = ? where beneficiarioFinal = ?");
			ps.setString(1, v.getBeneficiarioFinal());
			ps.setString(2, v.getEstado());
			ps.setString(3, v.getBeneficiarioFinal());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}		return status;
	}
}
