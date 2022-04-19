package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class vaciadoOfertasGeneralDao {

	public static int save(vaciadoOfertasGeneral v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.vaciadoOfertasGeneral (procesoCompra, fecha, productosConOfertas, productosRecomendados, productosEstimados, productosCompletados, productosAnulados) values (?,?,?,?,?,?,?)");
			ps.setString(1, v.getProcesoCompra());
			ps.setString(2, v.getFecha());
			ps.setInt(3, v.getProductosConOfertas());
			ps.setInt(4, v.getProductosRecomendados());
			ps.setInt(5, v.getProductosEstimados());
			ps.setInt(6, v.getProductosCompletados());
			ps.setInt(7, v.getProductosAnulados());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ArrayList<vaciadoOfertasGeneral> getAll() {
		ArrayList<vaciadoOfertasGeneral> purchaseActiveList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select procesoCompra from dbo.vaciadoOfertasGeneral");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				vaciadoOfertasGeneral p = new vaciadoOfertasGeneral();
				p.setProcesoCompra(rs.getString(1));

				purchaseActiveList.add(p);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return purchaseActiveList;
	}

	public static int updateCantRec(int cod, int cant) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.vaciadoOfertasGeneral set productosRecomendados= ? where cod = ?");
			ps.setInt(1, cant);
			ps.setInt(2, cod);
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static void updateOffersReceivedByGeneralNumber(int newCant, String GeneralNumber) {
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.vaciadoOfertasGeneral set productosConOfertas= ? where procesoCompra= ?");
			ps.setInt(1, newCant);
			ps.setString(2, GeneralNumber);
			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public static int update(vaciadoOfertasGeneral v, int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasGeneral set procesoCompra = ?, fecha = ?, productosConOfertas= ?, productosRecomendados= ? where cod = ?");
			ps.setString(1, v.getProcesoCompra());
			ps.setString(2, v.getFecha());
			ps.setInt(3, v.getProductosConOfertas());
			ps.setInt(4, v.getProductosRecomendados());
			ps.setInt(5, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateOfferControlByGeneralNumber(String Generalnumber, int total) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasGeneral set productosConOfertas = ? where procesoCompra = ?");
			ps.setInt(1, total);
			ps.setString(2, Generalnumber);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getBuyPurchaseDescriptionByGeneralNumber(String GeneralNumber) {
		String description = "-";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select descripcionCompra from dbo.procesoCompraGeneral where noProcesoCompra = '" + GeneralNumber + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String nombre = rs.getString(1);
				description = nombre;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return description;
	}

	public static int updateCompletadosPlus(String proc) {
		int status = 0;
		try {
			Connection con = Database.connect();
			int cant = 0;
			PreparedStatement ps1 = con
					.prepareStatement("select productosCompletados from dbo.vaciadoOfertasGeneral where procesoCompra = ?");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasGeneral set productosCompletados = ? where procesoCompra = ?");
			ps.setInt(1, cant + 1);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateCompletadosMinus(String proc) {
		int status = 0;
		try {
			Connection con = Database.connect();
			int cant = 0;
			PreparedStatement ps1 = con
					.prepareStatement("select productosCompletados from dbo.vaciadoOfertasGeneral where procesoCompra = ?");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasGeneral set productosCompletados = ? where procesoCompra = ?");
			ps.setInt(1, cant - 1);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getCompletadosByGeneralNumber(String ALPNumber) {
		int cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select productosCompletados from dbo.vaciadoOfertasGeneral where procesoCompra = '" + ALPNumber + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cant;
	}

	public static int updateProductEstimate(int cod) {
		int status = 0;
		int conteo = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select count(*) from dbo.listaRequerimientoGeneral where procesoCompra = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM procesoCompraGeneral pca where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasGeneral set productosEstimados = ? where procesocompra = ?");
				ps1.setInt(1, conteo);
				ps1.setString(2, rs1.getString(1));
				status = ps1.executeUpdate();
			}
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateConsolidatedAnulatedProductsCount(int cod) {
		int status = 0;
		int conteo = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select count(*) from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = ? and estado = 'INACTIVO'");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM dbo.procesoCompraGeneral where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasGeneral set productosAnulados = ? where procesocompra = ?");
				ps1.setInt(1, conteo);
				ps1.setString(2, rs1.getString(1));
				status = ps1.executeUpdate();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateConsolidatedEstimatedProductsCount(int cod) {
		int status = 0;
		int conteo = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select count(*) from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			System.out.println(conteo);
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM dbo.procesoCompraGeneral where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasGeneral set productosEstimados = ? where procesocompra = ?");
				ps1.setInt(1, conteo);
				ps1.setString(2, rs1.getString(1));
				status = ps1.executeUpdate();
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
}
