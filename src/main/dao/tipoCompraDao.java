package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class tipoCompraDao {

	public static int save(tipoCompra t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.tipoCompra(tipoCompra, estado, observaciones,abreviatura) values(?,?,?,?)");
			ps.setString(1, t.getTipoCompra());
			ps.setString(2, t.getEstado());
			ps.setString(3, t.getObservaciones());
			ps.setString(4, t.getabreviatura());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int activar(tipoCompra t) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.tipoCompra set estado = ?, observaciones = ?, abreviatura=? , motivo = ? where tipoCompra = ?");
			ps.setString(1, t.getEstado());
			ps.setString(2, t.getObservaciones());
			ps.setString(3, t.getabreviatura());
			ps.setString(4, t.getmotivo());
			ps.setString(5, t.getTipoCompra());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
