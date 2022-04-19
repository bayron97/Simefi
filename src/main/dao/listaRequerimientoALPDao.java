package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class listaRequerimientoALPDao {

	public static String getTable(int noCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select * from dbo.listaRequerimientoALP where procesoCompra=? and esEnmienda = 'false'");
			ps.setInt(1, noCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int IdIncremental = rs.getInt(10);
				String NoOficio = rs.getString(2);
				String Benef = rs.getString(8);
				String codATC = rs.getString(3);
				String nombremedi = rs.getString(4);
				String descrptecni = rs.getString(5);
				String unidadpre = rs.getString(6);
				//int cant = rs.getInt(7);				
				String cant = String.format("%,d", rs.getInt(7));
				String codSesal = rs.getString(11);
				

				j += "[" + "\"" + IdIncremental + "\"," + "\"" + NoOficio + "\"," + "\"" + Benef + "\"," + "\"" + codATC
						+ "\"," + "\"" + codSesal + "\"," + "\"" + nombremedi + "\"," + "\"" + descrptecni + "\"," + "\"" + unidadpre + "\","
						+ "\"" + cant + "\"],";
			}
			
			if(count == 0)
			{
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty
						+ "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"],";
			}
			
			j = j.substring(0, j.length() - 1);
			j += "]}";
			reqList = j;
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
					"SELECT codigoATC,nombreMedicamento,descripcionTecnica,unidadPresentacion, SUM(cantidadRequerida) FROM dbo.listaRequerimientoALP WHERE procesoCompra = ? GROUP BY unidadPresentacion, nombreMedicamento,codigoATC,descripcionTecnica ");
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

	public static int checkIfMedIsUnique(listaRequerimientoALP l) {
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					//"select codigoATC, nombreMedicamento, unidadPresentacion from dbo.listaRequerimientoALP where noOficio = ? and beneficiario = ?");
					"select noOficio from dbo.listaRequerimientoALP where noOficio = ?");
			ps.setString(1, l.getNoOficio());
			//ps.setString(2, l.getBeneficiario());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				System.out.println(rs.getString(1));
				//System.out.println(rs.getString(2));
				//System.out.println(rs.getString(3));
				
				if (rs.getString(1).contentEquals(l.getNoOficio()))
						//&& rs.getString(2).contentEquals(l.getNombreMedicamento())
						//&& rs.getString(3).contentEquals(l.getUnidadPresentacion()))
				{
						return 0;
				}
				
//				if (rs.getString(1).contentEquals(l.getCodigoATC())
//						&& rs.getString(2).contentEquals(l.getNombreMedicamento())
//						&& rs.getString(3).contentEquals(l.getUnidadPresentacion())) {
//						return 0;
//				}
				
			}
		
		} catch (Exception e) {
			System.out.println(e);

		}
		return 1;
	}

	public static int save(listaRequerimientoALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoALP(procesoCompra, noOficio, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida, beneficiario, noOfertasRecibidas, codSesal, esEnmienda) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getProcesoCompra());
			ps.setString(2, l.getNoOficio());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreMedicamento());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());
			ps.setString(8, l.getBeneficiario());
			ps.setInt(9, l.getNoOfertasRecibidas());
			ps.setString(10, l.getcodSesal());
			ps.setBoolean(11, false);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int saveRequerimeintoEnmienda(listaRequerimientoALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoALP(procesoCompra, noOficio, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida, beneficiario, noOfertasRecibidas, codSesal, esEnmienda) values(?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getProcesoCompra());
			ps.setString(2, l.getNoOficio());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreMedicamento());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());
			ps.setString(8, l.getBeneficiario());
			ps.setInt(9, l.getNoOfertasRecibidas());
			ps.setString(10, l.getcodSesal());
			ps.setBoolean(11, true);
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
					"select benfFinal.beneficiarioFinal  \r\n"
					+ "from beneFinalOficioCompraALP as benfOficio \r\n"
					+ "inner join beneficiarioFinal as  benfFinal on benfOficio.beneF = benfFinal.no \r\n"
					+ "where benfOficio.idProcesoCompALP = '"+co+"' and benfOficio.oficio ='"+oficio+"'");

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

	public static int update(listaRequerimientoALP l, int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoALP set procesoCompra = ?, noOficio = ?, codigoATC = ?, nombreMedicamento = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, beneficiario = ?, noOfertasRecibidas = ? where IdListRequirement = ?");
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
		System.out.println("----------eliminar " + id);
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from listaRequerimientoALP where IdListRequirement = ?");
			ps.setInt(1, id);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int deleteProductConsolidado(int proceso, String producto) {
		
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from listaRequerimientoConsolidadaALP where procesoCompra = ? and nombreProducto = ?");
			ps.setInt(1, proceso);
			ps.setString(2, producto);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	

	public static String getReqListByBuyProcessNumberForNewOfferJSON(String ALPNumber) {
		String reqList = "";
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, descripcionTecnica, codigoATC, noOfertasRecibidas, codSesal, cantidadRequerida from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "' and (estado = 'ACTIVO' or estado IS NULL)");
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			int count = 0;
			while (rs2.next()) {
				int noOfertasRecibidas = rs2.getInt(5);
				if (noOfertasRecibidas > 0) {
					String idItem = rs2.getString(1);
					int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqID(Long.parseLong(idItem), ALPNumber);
					String estadoOfertas = "PENDIENTE";
					if (nuevoNumeroOfertasIngresadasPorMedicamento >= noOfertasRecibidas) {
						estadoOfertas = "COMPLETADO";
					}
					String nombre = rs2.getString(2);
					String descripcionTecnica = rs2.getString(3);
					String codATC = rs2.getString(4);
					String codSesal = rs2.getString(6);
					String cantidadRequerida = rs2.getString(7);

					j += "[" + "\"" + idItem + "\"," + "\"" + codATC + "\"," + "\"" + codSesal + "\"," + "\""
							+ nombre + "\"," + "\"" + descripcionTecnica + "\"," + "\"" + cantidadRequerida + "\"," + "\"" 
							+ noOfertasRecibidas + "\"," + "\"" + estadoOfertas + "\"],";
					count++;
				}
			}
			if (count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-" +"\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\""
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
	
	public static listaRequerimientoALP getOneConsolidatedReqForALP(long reqID, String ALPNumber) {
		listaRequerimientoALP req = new listaRequerimientoALP();
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select distinct nombreProducto, descripcionTecnica, codigoATC, unidadPresentacion, codSesal, cantidadRequerida from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "' and IdListRequirement ='" + reqID + "'");
			ResultSet rs2 = ps2.executeQuery();
			if (rs2.next()) {
				req.setNombreMedicamento(rs2.getString(1));
				req.setDescripcionTecnica(rs2.getString(2));
				req.setCodigoATC(rs2.getString(3));
				req.setUnidadPresentacion(rs2.getString(4));
				req.setcodSesal(rs2.getString(5));
				req.setCantidadRequerida(rs2.getInt(6));
			}
			con1.close();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return req;
	}
	
	
	public static int validarMedicamentoBycodSesal(listaRequerimientoALP l) {
		
		int existe = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select * from listaRequerimientoALP where beneficiario =? and codSesal =? and procesoCompra =? ");		
			 ps.setString(1, l.getBeneficiario());
			 ps.setString(2, l.getcodSesal());
			 ps.setInt(3, l.getProcesoCompra());
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {
				count += 1;
			}
			
			existe = count;
			
		} catch (Exception e) {
			System.out.println();
		}
		return existe;
	}
	
	public static String getReqListByBuyProcessNumberForNewOfferJSONByProveedor(String ALPNumber, String proveedor) {
		String reqList = "";
		
		String nomeroProceso = ALPNumber;
		
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select cod from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, descripcionTecnica, codigoATC, noOfertasRecibidas, codSesal, cantidadRequerida from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "' and (estado = 'ACTIVO' or estado IS NULL)");
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			int count = 0;
			while (rs2.next()) {
				int noOfertasRecibidas = rs2.getInt(5);
				if (noOfertasRecibidas > 0) {
					String idItem = rs2.getString(1);
					int cantidadOfert = actaAperturaALPDao.cantidadOfertadaByProcessoAndItem(nomeroProceso, proveedor, Integer.parseInt(idItem));
					
					System.out.println(cantidadOfert + " cantidadOfert");
					String estadoOfertas = "PENDIENTE";					
					if(cantidadOfert == 0) {
						
					}else {
						
						int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqIDByProveedor(Long.parseLong(idItem), nomeroProceso, proveedor);
						
						
						
						if (nuevoNumeroOfertasIngresadasPorMedicamento >= noOfertasRecibidas) {
							estadoOfertas = "COMPLETADO";
						}
						
						
						
						
						
						
						String nombre = rs2.getString(2);
						String descripcionTecnica = rs2.getString(3);
						String codATC = rs2.getString(4);
						String codSesal = rs2.getString(6);
						String cantidadRequerida = rs2.getString(7);

						j += "[" + "\"" + idItem + "\"," + "\"" + codATC + "\"," + "\"" + codSesal + "\"," + "\""
								+ nombre + "\"," + "\"" + descripcionTecnica + "\"," + "\"" + cantidadRequerida + "\"," + "\"" 
								+ noOfertasRecibidas + "\"," + "\"" + estadoOfertas + "\"],";
						count++;
					}
				}
			}
			if (count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\"" + "-" +"\"," + "\"" + "-" + "\"," + "\"" + "-" + "\"," + "\""
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
	
	
	public static int validarEliminarConsolidado(int procesoCompra, String medicamento) {		
		int count = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select count(nombreMedicamento) from listaRequerimientoALP where procesoCompra = ? and nombreMedicamento =? ");		
			 ps.setInt(1, procesoCompra);
			 ps.setString(2, medicamento);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				
				count = rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			System.out.println();
		}
		return count;
	}
	
	
}
