package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class fechaSuscripcionDao {

	public static int insertSus(suscripcionContratos s) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.suscripcionContratos (fechaSubs, fechaVenc, observacion, padre) values (?,?,?,?)");
			ps.setString(1, s.getFechaSubs());
			ps.setString(2, s.getFechaVenc());
			ps.setString(3, s.getObservacion());
			ps.setString(4, s.getPadre());
			status = ps.executeUpdate();
			con.close();
			System.out.println("Contrato ingresado");
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int deleteSus(String padre) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"delete from dbo.suscripcionContratos where padre = ?");
			ps.setString(1,padre);
			status = ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
