package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class lugarAperturaDao {

	public static int save(lugarApertura l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.lugarApertura(lugarApertura, estado, observaciones) values(?,?,?)");
			ps.setString(1, l.getLugarApertura());
			ps.setString(2, l.getEstado());
			ps.setString(3, l.getObservaciones());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int activar(lugarApertura l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.lugarApertura set estado = ? , observaciones = ?, motivo = ? where lugarApertura = ?");
			ps.setString(1, l.getEstado());
			ps.setString(2, l.getObservaciones());
			ps.setString(3, l.getmotivo());
			ps.setString(4, l.getLugarApertura());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<lugarApertura> getAllActive() {
		ArrayList<lugarApertura> lugarList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select lugarApertura from lugarApertura where estado = 'ACTIVO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lugarApertura lugar = new lugarApertura();
				lugar.setLugarApertura(rs.getString(1));

				lugarList.add(lugar);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return lugarList;
	}

}
