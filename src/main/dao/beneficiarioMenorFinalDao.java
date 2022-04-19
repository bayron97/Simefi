package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class beneficiarioMenorFinalDao {

	public static int save(beneficiarioMenorFinal b) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.beneficiarioMenorFinal(beneficiarioFinal, direccion, estado, observaciones) values(?,?,?,?)");
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

	public static int activar(beneficiarioMenorFinal b) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.beneficiarioMenorFinal set estado = ?, observaciones = ? where beneficiarioFinal = ?");
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
}
