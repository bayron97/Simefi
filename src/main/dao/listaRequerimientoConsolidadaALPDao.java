package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.itextpdf.svg.renderers.impl.SymbolSvgNodeRenderer;

public class listaRequerimientoConsolidadaALPDao {

	public static int save(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoConsolidadaALP(IdListRequirement, procesoCompra, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, estado, noOficio, beneficiario, codSesal, esEnmienda) values(?,?,?,?,?,?,?,?,?,?,?,?)");
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
			ps.setString(11, l.getcodSesal());
			ps.setBoolean(12, true);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int saveRequerimientoApertura(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.listaRequerimientoConsolidadaALP(IdListRequirement, procesoCompra, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, cantidadRequerida, estado, noOficio, beneficiario, codSesal, esEnmienda, esApertura) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			ps.setString(11, l.getcodSesal());
			ps.setBoolean(12, false);
			ps.setBoolean(13, true);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int updateconsolidado(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaALP set IdListRequirement=?, procesoCompra=?, codigoATC=?, nombreProducto=?, descripcionTecnica=?, unidadPresentacion=?, cantidadRequerida=?, noOficio=?, beneficiario=?, codSesal=? where procesocompra='"+l.getProcesoCompra()+"' and nombreProducto='"+l.getNombreProducto()+"'");
			ps.setInt(1, l.getIdListRequirement());
			ps.setInt(2, l.getProcesoCompra());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getNombreProducto());
			ps.setString(5, l.getDescripcionTecnica());
			ps.setString(6, l.getUnidadPresentacion());
			ps.setFloat(7, l.getCantidadRequerida());			
			ps.setString(8, l.getNoOficio());
			ps.setString(9, l.getBeneficiario());
			ps.setString(10, l.getcodSesal());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int updateconsolidadoAclaracionesEmiendas(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaALP set unidadPresentacion=?, cantidadRequerida=?, estado=?  where procesocompra=? and codigoATC=?");
			
			ps.setString(1, l.getUnidadPresentacion());
			ps.setFloat(2, l.getCantidadRequerida());
			ps.setString(3, l.getEstado());
			ps.setInt(4, l.getProcesoCompra());
			ps.setString(5, l.getCodigoATC());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int update(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaALP set nombreProducto = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, estado = ? where procesoCompra = ? and IdListRequirement = ?");
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
	
	public static int updateConsolidado(listaRequerimientoConsolidadaALP l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.listaRequerimientoConsolidadaALP set cantidadRequerida = ?, estado = ? where procesoCompra = ? and IdListRequirement = ?");
			ps.setFloat(1, l.getCantidadRequerida());
			ps.setString(2, l.getEstado());
			ps.setInt(3, l.getProcesoCompra());
			ps.setInt(4, l.getIdListRequirement());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int savelistacon(int cod) {
		int status = 0;
//		delete(cod);
		listaRequerimientoConsolidadaALP l = new listaRequerimientoConsolidadaALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT codigoATC,nombreMedicamento,descripcionTecnica,unidadPresentacion, SUM(cantidadRequerida), codSesal FROM dbo.listaRequerimientoALP WHERE procesoCompra = ? GROUP BY unidadPresentacion, nombreMedicamento,codigoATC,descripcionTecnica, codSesal ");
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
				l.setcodSesal(rs.getString(6));
				
				ps = con.prepareStatement("select nombreProducto from listaRequerimientoConsolidadaALP where procesoCompra ='"+cod+"' and nombreProducto ='"+rs.getString(2)+"' and codigoATC ='"+rs.getString(1)+"' and codSesal ='"+rs.getString(6)+"'");
				ResultSet rs2 = ps.executeQuery();
				int count2 = 0;
				while (rs2.next()) {
					count2++;
				}
				if(count2 == 0) {
					saveRequerimientoApertura(l);
				}else {
					updateconsolidado(l);
				}					
			}
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	

	public static int newRequerimientoEnmienda(listaRequerimientoALP l) {
		int status = 0;
//		delete(cod);
		listaRequerimientoConsolidadaALP ls = new listaRequerimientoConsolidadaALP();
		
		ls.setIdListRequirement(l.getIdListRequirement());
		ls.setProcesoCompra(l.getProcesoCompra());
		ls.setCodigoATC(l.getCodigoATC());
		ls.setNombreProducto(l.getNombreMedicamento());
		ls.setDescripcionTecnica(l.getDescripcionTecnica());
		ls.setUnidadPresentacion(l.getUnidadPresentacion());
		ls.setCantidadRequerida(l.getCantidadRequerida());	
		//ls.setEstado(l.getEstado());
		ls.setNoOficio(l.getNoOficio());
		ls.setBeneficiario(l.getBeneficiario());
		ls.setcodSesal(l.getcodSesal());
			
		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select IdListRequirement, nombreProducto from listaRequerimientoConsolidadaALP \r\n"
					+ "where  procesoCompra = ? and nombreProducto = ?");
			ps.setInt(1, l.getProcesoCompra());
			ps.setString(2, l.getNombreMedicamento());
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				ls.setIdListRequirement(rs.getInt(1));
				count++;									
			}
			if(count == 0) {
				ps = con.prepareStatement("select max(IdListRequirement)+1 from listaRequerimientoConsolidadaALP where procesoCompra = ?");
				ps.setInt(1, l.getProcesoCompra());
				ResultSet rs2 = ps.executeQuery();				
				while (rs2.next()) {
					ls.setIdListRequirement(rs2.getInt(1));				
					}
				
				save(ls);
			}else{
				
				PreparedStatement ps3 = con.prepareStatement(
						"SELECT codigoATC,nombreMedicamento,descripcionTecnica,unidadPresentacion, SUM(cantidadRequerida), codSesal \r\n"
						+ "FROM dbo.listaRequerimientoALP \r\n"
						+ "WHERE procesoCompra = ? and nombreMedicamento = ?\r\n"
						+ "GROUP BY unidadPresentacion, nombreMedicamento,codigoATC,descripcionTecnica, codSesal");
				ps3.setInt(1, l.getProcesoCompra());
				ps3.setString(2, l.getNombreMedicamento());
				ResultSet rs3 = ps3.executeQuery();
				
				while (rs3.next()) {
					ls.setCantidadRequerida(rs3.getFloat(5));
					count++;									
				}
				
				updateconsolidado(ls);
			}
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	
	public static int savelistConsolidadaAclarcionEnmienda(listaRequerimientoConsolidadaALP l) {
		int status = 0;
//		delete(cod);
		listaRequerimientoConsolidadaALP medicamento = new listaRequerimientoConsolidadaALP();
		medicamento = l;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select nombreProducto, cantidadRequerida from listaRequerimientoConsolidadaALP where procesoCompra =? and codigoATC =?");
			ps.setInt(1, medicamento.getProcesoCompra());
			ps.setString(2, medicamento.getCodigoATC());
			ResultSet rs = ps.executeQuery();
			int count = 0;
			float cantidadCOnsolidada = 0.0f;
			while (rs.next()) {
				count++;
				cantidadCOnsolidada = rs.getFloat(2);
				}
			
			System.out.println("medicamento.getProcesoCompra() "+ medicamento.getProcesoCompra());
			System.out.println("medicamento.getNombreProducto() "+ medicamento.getNombreProducto());
			System.out.println("medicamento.getCodigoATC() "+ medicamento.getCodigoATC());
			System.out.println("count "+ count);
			
			l.setIdListRequirement(medicamento.getIdListRequirement());
			l.setProcesoCompra(medicamento.getProcesoCompra());
			l.setCodigoATC(medicamento.getCodigoATC());
			l.setNombreProducto(medicamento.getNombreProducto());
			l.setDescripcionTecnica(medicamento.getDescripcionTecnica());
			l.setUnidadPresentacion(medicamento.getUnidadPresentacion());
			
			l.setcodSesal(medicamento.getcodSesal());
			
			if(count == 0) {	
				l.setCantidadRequerida(medicamento.getCantidadRequerida());
				l.setcodSesal(medicamento.getcodSesal());
				System.out.println("nuevo ");
				l.setEstado("ACTIVO");
				save(l);
			}else {		
				
				//l.setCantidadRequerida((medicamento.getCantidadRequerida()+cantidadCOnsolidada));
				
				l.setCantidadRequerida(medicamento.getCantidadRequerida());
				System.out.println("Actualizar ");
				l.setEstado(medicamento.getEstado());
				updateconsolidadoAclaracionesEmiendas(l);
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
					.prepareStatement("delete from listaRequerimientoConsolidadaALP where procesoCompra=?");
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
					.prepareStatement("SELECT * FROM dbo.listaRequerimientoConsolidadaALP WHERE procesoCompra = ?");
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

	public static ArrayList<listaRequerimientoConsolidadaALP> getConsolidatedListByBuyProcessNumber(String ALPNumber) {
		ArrayList<listaRequerimientoConsolidadaALP> list = new ArrayList<listaRequerimientoConsolidadaALP>();
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select distinct cod from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
			ResultSet rs1 = ps1.executeQuery();
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			PreparedStatement ps2 = con2.prepareStatement(
					"select nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "'");
			ResultSet rs2 = ps2.executeQuery();
			while (rs2.next()) {
				String productName = rs2.getString(1);
				int cant = rs2.getInt(2);
				listaRequerimientoConsolidadaALP l = new listaRequerimientoConsolidadaALP();
				l.setNombreProducto(productName);
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

	public static ArrayList<listaRequerimientoConsolidadaALP> getActiveConsolidatedListByBuyProcessNumber(String ALPNumber) {
		ArrayList<listaRequerimientoConsolidadaALP> list = new ArrayList<listaRequerimientoConsolidadaALP>();
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select distinct cod from dbo.procesoCompraALP where noProcesoCompra = ?");
			ps1.setString(1, ALPNumber);
			ResultSet rs1 = ps1.executeQuery();
			
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps2.setString(1, ALPIdNumber);
			ResultSet rs2 = ps2.executeQuery();
			
			while (rs2.next()) {
				listaRequerimientoConsolidadaALP l = new listaRequerimientoConsolidadaALP();
				l.setIdListRequirement(rs2.getInt(1));
				l.setNombreProducto(rs2.getString(2));
				l.setNoOfertasRecibidas(rs2.getInt(3));
				list.add(l);
			}

			con1.close();
			con2.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}

	public static int updateNoOfferReceived(String ALPNumber, String IDcod, String offerNumber) {
		int status = 0;
		int newOfferNumber;
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
					"update dbo.listaRequerimientoConsolidadaALP set noOfertasRecibidas = ? where procesoCompra = ? and IdListRequirement = ?");
			if (offerNumber == null) {
				newOfferNumber = 0;
			} else {
				newOfferNumber = Integer.parseInt(offerNumber);
			}
			ps2.setInt(1, newOfferNumber);
			ps2.setString(2, ALPIdNumber);
			ps2.setString(3, IDcod);

			status = ps2.executeUpdate();
			con2.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getNoOfferReceivedForOne(String ALPNumber, String reqID) {
		int count = 0;
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
					"select noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "' and IdListRequirement = '" + reqID
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
	
	public static String getConsolidatedListByBuyProcessNumberForOfferControlJSON(String ALPNumber) {
		String consolidatedList = "";
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
					"select IdListRequirement, nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '"
							+ ALPIdNumber + "' and (estado = 'ACTIVO' or estado IS NULL)");
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
	
	
	public static ArrayList<listaRequerimientoConsolidadaALP> getActiveConsolidatedListByBuyProcessNumberBy(String ALPNumber) {
		ArrayList<listaRequerimientoConsolidadaALP> list = new ArrayList<listaRequerimientoConsolidadaALP>();
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			String ALPIdNumber = "";
			PreparedStatement ps1 = con1.prepareStatement(
					"select distinct cod from dbo.procesoCompraALP where noProcesoCompra = ?");
			ps1.setString(1, ALPNumber);
			ResultSet rs1 = ps1.executeQuery();
			
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}
			
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps2.setString(1, ALPIdNumber);
			ResultSet rs2 = ps2.executeQuery();
			
			while (rs2.next()) {
				listaRequerimientoConsolidadaALP l = new listaRequerimientoConsolidadaALP();
				l.setIdListRequirement(rs2.getInt(1));
				l.setNombreProducto(rs2.getString(2));
				l.setNoOfertasRecibidas(rs2.getInt(3));
				list.add(l);
			}

			con1.close();
			con2.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return list;
	}
	
	
	public static String getActiveConsolidatedListByBuyProcessNumberByPrveedor(String ALPNumber, String proveedor) {
		String consolidatedList = "";
		try {
			Connection con1 = Database.connect();
			Connection con2 = Database.connect();
			Connection con3 = Database.connect();
			String ALPIdNumber = "";
			
			PreparedStatement ps1 = con1.prepareStatement(
					"select distinct cod from dbo.procesoCompraALP where noProcesoCompra = ?");
			ps1.setString(1, ALPNumber);
			ResultSet rs1 = ps1.executeQuery();
			
			while (rs1.next()) {
				ALPIdNumber = rs1.getString(1);
			}			
			
			PreparedStatement ps2 = con2.prepareStatement(
					"select IdListRequirement, nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps2.setString(1, ALPIdNumber);
			
			String j = "{ \"data\":[";
			ResultSet rs2 = ps2.executeQuery();
			int count = 0;
			while (rs2.next()) {
				count++;
				String item = rs2.getString(1);
				String nombreProducto = rs2.getString(2);
				String noOfertas = "";
				
				PreparedStatement ps3 = con3.prepareStatement(
						"select ofertasRecividas from actaApertura where procesoCompra =? and denominacion =? and idListRequirement =? ");
				ps3.setString(1, ALPNumber);
				ps3.setString(2, proveedor);
				ps3.setString(3, item);
				ResultSet rs3 = ps3.executeQuery();
				
				while (rs3.next()) {
					noOfertas = rs3.getString(1);
				}				
								
				j += "[" + "\"" + "<input type='text' readonly class='sinborde'  name='productId' value='" + item + "'>"  + "\"," + "\"" 
								+ nombreProducto + "\"," + "\""
								+ "<input type='number' class='form-control' required name='recOffer' value='" + noOfertas + "'>" + "\"],";
			}
			
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";}
			
			j = j.substring(0, j.length() - 1);
			j += "]}";
			consolidatedList = j;
			con1.close();
			con2.close();
			con3.close();
		} catch (Exception e) {
			System.out.println(e);
		}
System.out.println(consolidatedList);
		return consolidatedList;
	}
	
	public static String getNoOfertadorByProcesoAndProveedor(String noProceso, String proveedor) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select noOfertador, denominacion, procesoCompra from actaApertura where denominacion = ? and procesoCompra = ? \r\n"
							+ "group by noOfertador, denominacion, procesoCompra");
			ps.setString(2, noProceso);
			ps.setString(1, proveedor); 
			String j = "";
			ResultSet rs = ps.executeQuery();			
			while (rs.next()) {				
				j =  rs.getString(1);
			}
			
			j = j.substring(0, j.length());
			
			if(j.isEmpty()) {
				j = "0";
			}
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return reqList;
	}
	
	
}
