package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_terminosReferenciaDao {

	public static int save(Gral_terminosReferencia terminoReferencia) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.terminosReferencia(idAperturaProceso, nombreDocumento, descripcion) values(?,?,?)");
			ps.setInt(1, terminoReferencia.getIdAperturaProceso());
			ps.setString(2, terminoReferencia.getNombreDocumento());
			ps.setString(3, terminoReferencia.getDescripcion());			
			idAperturaProceso = ps.executeUpdate();		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}

	
	public static ArrayList<Gral_terminosReferencia> GerListTerminosReferencia(int idAperturaProceso){
		ArrayList<Gral_terminosReferencia> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idterminosReferencia, nombreDocumento, descripcion from Gral.terminosReferencia where idAperturaProceso = ?");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_terminosReferencia termino = new Gral_terminosReferencia();				
				termino.setIdterminosReferencia(rs.getInt(1));
				termino.setNombreDocumento(rs.getString(2));
				termino.setDescripcion(rs.getString(3));
				List.add(termino);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	
	
}

