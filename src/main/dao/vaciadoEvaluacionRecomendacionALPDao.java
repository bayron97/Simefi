package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

public class vaciadoEvaluacionRecomendacionALPDao {

	public static int save(vaciadoEvaluacionRecomendacionALP v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.vaciadoEvaluacionRecomendacionALP(noProcesoCompra, codSolicitudCompra, fecha, beneficiario, estado) values(?,?,?,?,?)");
			ps.setString(1, v.getNoProcesoCompra());
			ps.setString(2, v.getCodSolicitudCompra());
			ps.setString(3, v.getFecha());
			ps.setString(4, v.getBeneficiario());
			ps.setString(5, v.getEstado());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateNumberRequiredItemsByPurchaseRequestCod(String codSolicitudCompra, int noItemsRequeridos) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoEvaluacionRecomendacionALP set noItemsRequeridos = ? where codSolicitudCompra = ?");
			ps.setInt(1, noItemsRequeridos);

			ps.setString(2, codSolicitudCompra);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
