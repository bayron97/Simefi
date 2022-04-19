package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class listaRequerimientoGeneralDao {

	public static String getTable(int noCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.listaRequerimientoGeneral where procesoCompra=?");
			ps.setInt(1, noCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int IdIncremental = rs.getInt(14);
				String NoOficio = rs.getString(2);
				String Benef = rs.getString(8);
				String codATC = rs.getString(3);
				String nombremedi = rs.getString(4);
				String descrptecni = rs.getString(5);
				String unidadpre = rs.getString(6);
				String plazoEntreg = rs.getString(10);
				String vidautil = rs.getString(11);
				String observ = rs.getString(12);
				int cant = rs.getInt(7);

				j += "[" + "\"" + IdIncremental + "\"," + "\"" + NoOficio + "\"," + "\"" + Benef + "\"," + "\"" + codATC
						+ "\"," + "\"" + nombremedi + "\"," + "\"" + descrptecni + "\"," + "\"" + unidadpre + "\"," + "\"" + cant + "\","
						+ "\"" + plazoEntreg + "\"," + "\"" + vidautil + "\"," 
						+ "\"" + observ + "\"],";
			}
			
			if(count == 0)
			{
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty
						+ "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"],";
			}
			
			
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			System.out.print("Dao");
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}

	public static String getTableConsolidado(int noCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT codigoATC,nombreMedicamento,descripcionTecnica,unidadPresentacion, SUM(cantidadRequerida) FROM dbo.listaRequerimientoGeneral WHERE procesoCompra = ? GROUP BY unidadPresentacion, nombreMedicamento,codigoATC,descripcionTecnica ");
			ps.setInt(1, noCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String codATC = rs.getString(1);
				String nombremedi = rs.getString(2);
				String descrptecni = rs.getString(3);
				String unidadpre = rs.getString(4);
				int cant = rs.getInt(5);

				j += "[" + "\"" + count + "\"," + "\"" + codATC + "\"," + "\"" + nombremedi + "\"," + "\"" + descrptecni
						+ "\"," + "\"" + unidadpre + "\"," + "\"" + cant + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			System.out.print("Dao");
			System.out.print(reqList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return reqList;
	}

	public static int checkIfMedIsUnique(listaRequerimientoGeneral l) {
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select codigoATC, nombreMedicamento, unidadPresentacion from dbo.listaRequerimientoGeneral where noOficio = ? and beneficiario = ?");
			ps.setString(1, l.getNoOficio());
			ps.setString(2, l.getBeneficiario());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				if (rs.getString(1).contentEquals(l.getCodigoATC())
						&& rs.getString(2).contentEquals(l.getNombreMedicamento())
						&& rs.getString(3).contentEquals(l.getUnidadPresentacion())) {
					return 0;
				}
			}
		} catch (Exception e) {
			System.out.println(e);

		}
		return 1;
	}

	public static int save(listaRequerimientoGeneral l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoGeneral(procesoCompra, noOficio, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida, beneficiario, noOfertasRecibidas, cantidadEntregaPlazos, vidaUtil, observaciones, moneda) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getProcesoCompra());
			ps.setString(2, l.getNoOficio());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreMedicamento());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());
			ps.setString(8, l.getBeneficiario());
			ps.setInt(9, l.getNoOfertasRecibidas());
			ps.setString(10, l.getCantidadEntregaPlazos());
			ps.setString(11, l.getVidaUtil());
			ps.setString(12, l.getObservaciones());
			ps.setString(13, l.getMoneda());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getBenefsOficio(String oficio, int co) {
		String benef = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select beneficiarioFinal.beneficiarioFinal from(oficioProcesoCompraGeneral inner join beneFinalOficioCompraGeneral on beneFinalOficioCompraGeneral.oficio = '"
							+ oficio
							+ "' inner join beneficiarioFinal on beneFinalOficioCompraGeneral.beneF = beneficiarioFinal.no)where oficioProcesoCompraGeneral.procesoCompra = "
							+ co);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String nombre = rs.getString(1);
				benef = nombre;
				/*
				 * if(benef.isEmpty()) { benef = nombre; } else { benef += "," + nombre; }
				 */
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return benef;
	}

	public static int update(listaRequerimientoGeneral l, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoGeneral set procesoCompra = ?, noOficio = ?, codigoATC = ?, nombreMedicamento = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, beneficiario = ?, noOfertasRecibidas = ? where IdListRequirement = ?");
			ps.setInt(1, l.getProcesoCompra());
			ps.setString(2, l.getNoOficio());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreMedicamento());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());
			ps.setString(8, l.getBeneficiario());
			ps.setInt(9, l.getNoOfertasRecibidas());

			ps.setInt(10, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int delete(int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from listaRequerimientoGeneral where IdListRequirement = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getReqListByBuyProcessNumberForNewOfferJSON(String GeneralNumber) {
		String reqList = "";
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
					"select IdListRequirement, nombreProducto, descripcionTecnica, codigoATC, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = '"
							+ GeneralIdNumber + "' and (estado = 'ACTIVO' or estado IS NULL)");
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			int count = 0;
			while (rs2.next()) {
				int noOfertasRecibidas = rs2.getInt(5);
				if (noOfertasRecibidas > 0) {
					String idItem = rs2.getString(1);
					int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaGeneralDao.getCantMedsByProcAndReqID(Long.parseLong(idItem), GeneralNumber);
					String estadoOfertas = "PENDIENTE";
					if (nuevoNumeroOfertasIngresadasPorMedicamento >= noOfertasRecibidas) {
						estadoOfertas = "COMPLETADO";
					}
					String nombre = rs2.getString(2);
					String descripcionTecnica = rs2.getString(3);
					String codATC = rs2.getString(4);

					j += "[" + "\"" + idItem + "\"," + "\"" + nombre + "\"," + "\"" + descripcionTecnica + "\"," + "\""
							+ codATC + "\"," + "\"" + noOfertasRecibidas + "\"," + "\"" + estadoOfertas + "\"],";
					count++;
				}
			}
			if (count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\""
						+ "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}
	
	public static listaRequerimientoGeneral getOneConsolidatedReqForGeneral(long reqID, String GeneralNumber) {
		listaRequerimientoGeneral req = new listaRequerimientoGeneral();
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
					"select distinct nombreProducto, descripcionTecnica, codigoATC, unidadPresentacion from dbo.listaRequerimientoConsolidadaGeneral where procesoCompra = '"
							+ GeneralIdNumber + "' and IdListRequirement ='" + reqID + "'");
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next()) {
				req.setNombreMedicamento(rs2.getString(1));
				req.setDescripcionTecnica(rs2.getString(2));
				req.setCodigoATC(rs2.getString(3));
				req.setUnidadPresentacion(rs2.getString(4));
			}
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return req;
	}
	
	public static String getReqListByBuyProcessNumberForOfferControlJSON(String GeneralNumber) {
		String reqList = "";
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
					"select codigoATC, nombreMedicamento, noOfertasRecibidas from dbo.listaRequerimientoGeneral where procesoCompra Like '"
							+ GeneralIdNumber + "%'");
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			int count = 0;
			while (rs2.next()) {
				count++;
				String codATC = rs2.getString(1);
				String nombre = rs2.getString(2);
				String noOfertasRecibidas = String.valueOf(rs2.getInt(3));
				if (noOfertasRecibidas == null) {
					noOfertasRecibidas = "0";
				}

				j += "[" + "\"" + count + "\"," + "\"" + nombre + "\"," + "\"" + codATC + "\"," + "\""
						+ "<input type='number' name='recOffer' value='" + noOfertasRecibidas + "'>" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return reqList;
	}

	
}
	