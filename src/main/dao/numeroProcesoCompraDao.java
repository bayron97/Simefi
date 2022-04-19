package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class numeroProcesoCompraDao {

	public static int update(numeroProcesoCompra p, String cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.numeroProcesoCompra set idProc = ?, cod = ?, estado = ? where cod = ?");
			ps.setInt(1, p.getIdProc());
			ps.setString(2, p.getCod());
			ps.setString(3, p.getEstado());
			ps.setString(4, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int save(numeroProcesoCompra p) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.numeroProcesoCompra(idProc, cod, estado,idincremental) values(?,?,?,?)");
			ps.setInt(1, p.getIdProc());
			ps.setString(2, p.getCod());
			ps.setString(3, "DISPONIBLE");
			ps.setInt(4, p.getIdIncremental());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int count(String cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select count(cod) FROM numeroProcesoCompra");
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int procesoEstado(String numProceso) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT COUNT(cod) FROM [dbo].[numeroProcesoCompra] where cod =? and estado ='DISPONIBLE'");
			ps.setString(1, numProceso);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				status = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ArrayList<numeroProcesoCompra> numsProcesoCompra(){
		ArrayList<numeroProcesoCompra> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select cod from dbo.numeroProcesoCompra where cod not like 'ALP%' and estado = 'DISPONIBLE'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				numeroProcesoCompra npc = new numeroProcesoCompra();				
				npc.setCod(rs.getString(1));
				List.add(npc);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static int updateNumProcesoGral(String numProcesoCompra) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.numeroProcesoCompra set estado = ? where cod = ?");
			ps.setString(1, "NO DISPONIBLE");
			ps.setString(2, numProcesoCompra);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

}
