package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_oficioBeneficiarioDao {

	public static int save(Gral_oficioBeneficiario d) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into Gral.oficioBeneficiario (Oficio, nombreArchivo, idAperturaProceso) values (?,?,?)");
			ps.setString(1, d.getOficio());
			ps.setString(2, d.getnombreArchivo());
			ps.setInt(3, d.getIdAperturaProceso());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(String newDocumentName, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.digitizedDocumentsForGeneral set documentName = ?,documentDescription=? where Id = ?");
			ps.setString(1, newDocumentName);
			ps.setString(2, newDocumentName);
			ps.setInt(3, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("delete dbo.digitizedDocumentsForGeneral where Id = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<Gral_oficioBeneficiario> oficiosXprocesoXbeneficiario(){
		ArrayList<Gral_oficioBeneficiario> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idOficioBeneficiario, Oficio, nombreArchivo from  Gral.oficioBeneficiario where idAperturaProceso = ? and estado = 'true'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_oficioBeneficiario oficio = new Gral_oficioBeneficiario();				
				oficio.setIdOficioBeneficiario(rs.getInt(1));
				oficio.setOficio(rs.getString(2));
				oficio.setnombreArchivo(rs.getString(3));
				List.add(oficio);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static ArrayList<Gral_oficioBeneficiario> GetOficioByApertura(int idAperturaProceso){
		ArrayList<Gral_oficioBeneficiario> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idOficioBeneficiario, Oficio from  Gral.oficioBeneficiario where idAperturaProceso = ? and estado = 'true'");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_oficioBeneficiario oficio = new Gral_oficioBeneficiario();				
				oficio.setIdOficioBeneficiario(rs.getInt(1));
				oficio.setOficio(rs.getString(2));				
				List.add(oficio);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static ArrayList<Gral_oficioBeneficiario> GetListOficioByApertura(int idAperturaProceso){
		ArrayList<Gral_oficioBeneficiario> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idOficioBeneficiario, Oficio, nombreArchivo from  Gral.oficioBeneficiario where idAperturaProceso = ? and estado = 'true'");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_oficioBeneficiario oficio = new Gral_oficioBeneficiario();				
				oficio.setIdOficioBeneficiario(rs.getInt(1));
				oficio.setOficio(rs.getString(2));	
				oficio.setnombreArchivo(rs.getString(3));	
				List.add(oficio);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	
	
	
}