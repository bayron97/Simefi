package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class ordenCompraALPDao {
	public static int save(ordenCompraALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.ordenCompraALP(procesoCompra, fecha, ordenCompra, distribuidorCompra, nombreProducto, descTecnica, up, cantSolicitada, precioUnitario, precioTotal, tiempoEntrega, vidaUtil, observaciones) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setString(1, o.getProcesoCompra());
			ps.setString(2, o.getFecha());
			ps.setString(3, o.getOrdenCompra());
			ps.setString(4, o.getDistribuidorFabricante());
			ps.setString(5, o.getNombreProducto());
			ps.setString(6, o.getDescTecnica());
			ps.setString(7, o.getUp());
			ps.setInt(8, o.getCantSolicitada());
			ps.setFloat(9, o.getPrecioUnitario());
			ps.setFloat(10, o.getPrecioTotal());
			ps.setString(11, o.getTiempoEntrega());
			ps.setString(12, o.getVidaUtil());
			ps.setString(13, o.getObservaciones());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
