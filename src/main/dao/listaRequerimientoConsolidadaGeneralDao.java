package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class listaRequerimientoConsolidadaGeneralDao {

	public static int save(listaRequerimientoConsolidadaGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoConsolidadaGeneral(IdListRequirement, procesoCompra, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, estado, noOficio, beneficiario) values(?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getIdListRequirement());
			ps.setInt(2, l.getProcesoCompra());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreProducto());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());
			ps.setString(8, l.getEstado());
			ps.setString(9, l.getNoOficio());
			ps.setString(10, l.getBeneficiario());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(listaRequerimientoConsolidadaGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaGeneral set nombreProducto = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, estado = ? where procesoCompra = ? and IdListRequirement = ?");
			ps.setString(1, l.getNombreProducto());
			ps.setString(2, l.getDescripcionTecnica());
			ps.setString(3, l.getUnidadPresentacion());
			ps.setFloat(4, l.getCantidadRequerida());
			ps.setString(5, l.getEstado());

			ps.setInt(6, l.getProcesoCompra());
			ps.setInt(7, l.getIdListRequirement());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int savelistacon(int cod) {
		int status = 0;
		delete(cod);
		listaRequerimientoConsolidadaGeneral l = new listaRequerimientoConsolidadaGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT codigoATC,nombreMedicamento,descripcionTecnica,unidadPresentacion, SUM(cantidadRequerida),beneficiario FROM dbo.listaRequerimientoGeneral WHERE procesoCompra = ? GROUP BY unidadPresentacion, nombreMedicamento,codigoATC,descripcionTecnica,beneficiario ");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				l.setIdListRequirement(count);
				l.setProcesoCompra(cod);
				l.setCodigoATC(rs.getString(1));
				l.setNombreProducto(rs.getString(2));
				l.setDescripcionTecnica(rs.getString(3));
				l.setUnidadPresentacion(rs.getString(4));
				l.setCantidadRequerida(rs.getFloat(5));
				l.setBeneficiario(rs.getString(6));
				save(l);
			}
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(int cod) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from listaRequerimientoConsolidadaGeneral where procesoCompra=?");
			ps.setInt(1, cod);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getConsolidatedDBListSizeByPurchaseCod(int cod) {
		int count = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT * FROM dbo.listaRequerimientoConsolidadaGeneral WHERE procesoCompra = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count++;
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return count;
	}

	public static List<listaRequerimientoConsolidadaGeneral> getConsolidatedListByBuyProcessNumberForOfferControl(
			String GeneralNumber) {
		List<listaRequerimientoConsolidadaGeneral> list = new ArrayList<listaRequerimientoConsolidadaGeneral>();
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String GeneralIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraGeneral where noProcesoCompra = '" + GeneralNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				GeneralNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra Like '"
							+ GeneralIdNumber + "%'");
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				String productID = rs2.getString(1);
				int cant = rs2.getInt(2);
				listaRequerimientoConsolidadaGeneral l = new listaRequerimientoConsolidadaGeneral();
				l.setNombreProducto(productID);
				l.setNoOfertasRecibidas(cant);
				list.add(l);
			}

			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static String getConsolidatedListByBuyProcessNumberForOfferControlJSON(String GeneralNumber) {
		String consolidatedList = "";
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String GeneralIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraGeneral where noProcesoCompra = '" + GeneralNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				GeneralIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = '"
							+ GeneralIdNumber + "' and (estado = 'ACTIVO' or estado IS NULL)");
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				String productID = String.valueOf(rs2.getInt(1));
				;
				String nombre = rs2.getString(2);
				String noOfertasRecibidas = String.valueOf(rs2.getInt(3));
				if (noOfertasRecibidas == null) {
					noOfertasRecibidas = "0";
				}

				j += "[" + "\"" + productID + "\"," + "\"" + nombre + "\"," + "\""
						+ "<input type='number' name='recOffer' value='" + noOfertasRecibidas + "'>" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			consolidatedList = j;
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return consolidatedList;
	}

	public static int updateNoOfferReceived(String GeneralNumber, String IDcod, String offerNumber) {
		int status = 0;
		int newOfferNumber;
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String GeneralIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraGeneral where noProcesoCompra = '" + GeneralNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				GeneralIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaGeneral set noOfertasRecibidas = ? where procesoCompra = ? and IdListRequirement = ?");
			if (offerNumber == null) {
				newOfferNumber = 0;
			} else {
				newOfferNumber = Integer.parseInt(offerNumber);
			}
			ps2.setInt(1, newOfferNumber);
			ps2.setString(2, GeneralIdNumber);
			ps2.setString(3, IDcod);

			status = ps2.executeUpdate();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("pase por");
		return status;
	}

	public static int getNoOfferReceivedForOne(String GeneralNumber, String reqID) {
		int count = 0;
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String GeneralIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraGeneral where noProcesoCompra = '" + GeneralNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				GeneralIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select noOfertasRecibidas from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = '"
							+ GeneralIdNumber + "' and IdListRequirement = '" + reqID
							+ "' and (estado = 'ACTIVO' or estado IS NULL)");
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				count = rs2.getInt(1);
			}
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
			count = -1;
		}
		return count;
	}
	
	public static solicitudDisponibilidadALP getOneBySDCod(String SDCod) {
		solicitudDisponibilidadALP ARSelected = new solicitudDisponibilidadALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct id, idSolicitudCompra, fechaEmision, fechaMaximaRespuesta, proveedor, nota, nombreReporte, estadoVaciados from dbo.solicitudDisponibilidadALP where codSolicitudDisponibilidad = ?");
			ps.setString(1, SDCod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ARSelected.setId(rs.getLong(1));
				ARSelected.setIdSolicitudCompra(rs.getLong(2));
				ARSelected.setFechaEmision(rs.getString(3));
				ARSelected.setFechaMaximaRespuesta(rs.getString(4));
				ARSelected.setProveedor(rs.getString(5));
				ARSelected.setNota(rs.getString(6));
				if (rs.getString(6) == null || rs.getString(6).isEmpty())
				{
					ARSelected.setNota("-");
				}
				ARSelected.setEstadoVaciados(rs.getString(7));
				if (rs.getString(7) == null || rs.getString(7).isEmpty())
				{
					ARSelected.setEstadoVaciados("NO");
				}
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return ARSelected;
	}
	
	
}
