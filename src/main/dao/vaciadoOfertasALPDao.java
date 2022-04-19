package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class vaciadoOfertasALPDao {

	public static int save(vaciadoOfertasALP v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.vaciadoOfertasALP (procesoCompra, fecha, productosConOfertas, productosRecomendados, productosEstimados, productosCompletados, productosAnulados, productosDesiertos) values (?,?,?,?,?,?,?,?)");
			ps.setString(1, v.getProcesoCompra());
			ps.setString(2, v.getFecha());
			ps.setInt(3, v.getProductosConOfertas());
			ps.setInt(4, v.getProductosRecomendados());
			ps.setInt(5, v.getProductosEstimados());
			ps.setInt(6, v.getProductosCompletados());
			ps.setInt(7, v.getProductosAnulados());
			ps.setInt(8, v.getProductosDesiertos());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static vaciadoOfertasALP getOne(int cod) {
		vaciadoOfertasALP item = new vaciadoOfertasALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.
					prepareStatement("select distinct cod, procesoCompra, fecha, productosConOfertas, productosRecomendados, productosEstimados, productosCompletados, productosAnulados, proveedorAutorizado FROM dbo.vaciadoOfertasALP where cod = ?");
			ps.setInt(1, cod);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				item.setCod(rs.getInt(1));
				item.setProcesoCompra(rs.getString(2));
				item.setFecha(rs.getString(3));
				item.setProductosConOfertas(rs.getInt(4));
				item.setProductosRecomendados(rs.getInt(5));
				item.setProductosEstimados(rs.getInt(6));
				item.setProductosCompletados(rs.getInt(7));
				item.setProductosAnulados(rs.getInt(8));
				item.setProveedorAutorizado(rs.getString(9));
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return item;
	}

	public static ArrayList<vaciadoOfertasALP> getAll() {
		ArrayList<vaciadoOfertasALP> purchaseActiveList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select procesoCompra from dbo.vaciadoOfertasALP");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				vaciadoOfertasALP p = new vaciadoOfertasALP();
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
					.prepareStatement("update dbo.vaciadoOfertasALP set productosRecomendados= ? where cod = ?");
			ps.setInt(1, cant);
			ps.setInt(2, cod);
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status");
		return status;
	}

	public static void updateOffersReceivedByALPNumber(int newCant, String ALPNumber) {
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("update dbo.vaciadoOfertasALP set productosConOfertas= ? where procesoCompra= ?");
			ps.setInt(1, newCant);
			ps.setString(2, ALPNumber);
			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	public static int updateAutorizedProvider(vaciadoOfertasALP v) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set proveedorAutorizado = ? where procesoCompra = ? or procesoCompra = ?");
			ps.setString(1, v.getProveedorAutorizado());
			ps.setString(2, v.getProcesoCompra().toLowerCase());
			ps.setString(3, v.getProcesoCompra().toUpperCase());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateOfferControlByALPNumber(String ALPnumber, int total, int provCant) {
		int status = 0;
		System.out.println("cantidadProveedores " + provCant);
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosConOfertas = ?, canProveedores=? where procesoCompra = ? ");
			ps.setInt(1, total);			
			ps.setInt(2,provCant);
			ps.setString(3, ALPnumber);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateOfferControlConteo(String ALPnumber, int total, int provCant) {
		int status = 0;
		System.out.println("cantidadProveedores " + provCant);
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set canProveedores=? where procesoCompra = ? ");
			//ps.setInt(1, total);			
			ps.setInt(1,provCant);
			ps.setString(2, ALPnumber);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	

	public static int updateCompletadosPlus(String proc) {
		int status = 0;
		System.out.println("llegando");
		try {
			Connection con = Database.connect();
			int cant = 0;
			PreparedStatement ps1 = con
					.prepareStatement("select productosCompletados from dbo.vaciadoOfertasALP where procesoCompra = ?");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosCompletados = ? where procesoCompra = ?");
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
					.prepareStatement("select productosCompletados from dbo.vaciadoOfertasALP where procesoCompra = ?");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosCompletados = ? where procesoCompra = ?");
			ps.setInt(1, cant - 1);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int getCompletadosByALPNumber(String ALPNumber) {
		int cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select productosCompletados from dbo.vaciadoOfertasALP where procesoCompra = '" + ALPNumber + "'");
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
					.prepareStatement("select count(*) from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ?");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM procesoCompraALP pca where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasALP set productosEstimados = ? where procesocompra = ?");
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
					"select count(*) from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and estado = 'INACTIVO'");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM dbo.procesoCompraALP where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasALP set productosAnulados = ? where procesocompra = ?");
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
					"select count(*) from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps.setInt(1, cod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				conteo = rs.getInt(1);
			}
			System.out.println(conteo);
			PreparedStatement cs = con
					.prepareStatement("select noProcesoCompra FROM dbo.procesoCompraALP where cod = ?");
			cs.setInt(1, cod);
			ResultSet rs1 = cs.executeQuery();
			while (rs1.next()) {
				PreparedStatement ps1 = con.prepareStatement(
						"update dbo.vaciadoOfertasALP set productosEstimados = ? where procesocompra = ?");
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
	
	public static String getBuyPurchaseDescriptionByALPNumber(String ALPNumber) {
		String description = "-";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select descripcionCompra from dbo.procesoCompraALP where noProcesoCompra = '" + ALPNumber + "'");
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
	
	public static int updateOfferControlByALPNumber(String ALPnumber, int total) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosConOfertas = ? where procesoCompra = ?");
			ps.setInt(1, total);
			ps.setString(2, ALPnumber);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateDesertedOfferByALPNumber(String ALPnumber, int total) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosDesiertos = ? where procesoCompra = ?");
			ps.setInt(1, total);
			ps.setString(2, ALPnumber);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	
	public static int productoConOfertas(String proc) {
		int status = 0;
		try {
			Connection con = Database.connect();
			int cant = 0;
			PreparedStatement ps1 = con
					.prepareStatement("select count(*) as cantidadesConOferta from dbo.ofertaALP where  procesoCompra = ? group by medicamentoEstimado");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant++;
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosConOfertas = ? where procesoCompra = ?");
			ps.setInt(1, cant);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int productoCompletados(String proc) {
		int status = 0;
		
		
		int productosCompletados = 0;
		int idProceso = 0;
		try {
			Connection con = Database.connect();
			
			PreparedStatement ps1 = con
					.prepareStatement("select cod from dbo.procesoCompraALP where noProcesoCompra = ?");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				
				idProceso = rs.getInt(1);
			}
			
			PreparedStatement ps2 = con
					.prepareStatement("select nombreProducto, noOfertasRecibidas from dbo.listaRequerimientoConsolidadaALP where procesoCompra = ? and (estado = 'ACTIVO' or estado IS NULL)");
			ps2.setInt(1, idProceso);
			ResultSet rs2 = ps2.executeQuery();
			
			
			while (rs2.next()) {
				
				
			
				PreparedStatement ps3 = con
						.prepareStatement("select count(medicamentoEstimado) from ofertaALP where procesoCompra = ? and medicamentoEstimado= ? and estado = 'FINALIZADO' ");
				ps3.setString(1, proc);
				ps3.setString(2, rs2.getString(1));
				ResultSet rs3 = ps3.executeQuery();
				
				while (rs3.next()) {
					
					 if(rs2.getInt(2) == rs3.getInt(1)) {
						 productosCompletados++;
					 }
					
				}
			}
			
			
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosCompletados = ? where procesoCompra = ?");
			ps.setInt(1, productosCompletados);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int productoConRecomendacion(String proc) {
		int status = 0;
		try {
			Connection con = Database.connect();
			int cant = 0;
			PreparedStatement ps1 = con
					.prepareStatement("select medicamentoEstimado from ofertaALP where procesoCompra = ? and recomendacionComite = 'SI' group by medicamentoEstimado");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				cant++;
			}
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosRecomendados = ? where procesoCompra = ?");
			ps.setInt(1, cant);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		productoFracasados(proc);
		return status;
	}
	
	public static int productoFracasados(String proc) {
		int status = 0;
		
		ArrayList<ofertaALP> o = new ArrayList<ofertaALP>();
		int fracasados = 0;
		
		try {
			Connection con = Database.connect();
			
			PreparedStatement ps1 = con
					.prepareStatement("select medicamentoEstimado from ofertaALP where procesoCompra = ? and recomendacionComite = 'NO' group by medicamentoEstimado");
			ps1.setString(1, proc);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				
				ofertaALP ofer = new ofertaALP();
				ofer.setMedicamentoEstimado(rs.getString(1));
				
				o.add(ofer);
			}
			
			
			PreparedStatement ps2 = con
					.prepareStatement("select medicamentoEstimado from ofertaALP where procesoCompra = ? and recomendacionComite = 'SI' group by medicamentoEstimado");
			ps2.setString(1, proc);
			ResultSet rs2 = ps2.executeQuery();
			
			int logitud = o.size();
			while (rs2.next()) {
				
				 for(ofertaALP os : o){
					 
					 if(os.getMedicamentoEstimado().contentEquals(rs2.getString(1))) {
						 logitud = logitud-1;
					 }
					 
				 }
				
			}
			
			
			fracasados = logitud;
			
			PreparedStatement ps = con.prepareStatement(
					"update dbo.vaciadoOfertasALP set productosFracasados = ? where procesoCompra = ?");
			ps.setInt(1, fracasados);
			ps.setString(2, proc);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static String obtenerProcesoCompra(int noOferta) {
		int status = 0;
		String proceso = "";
		try {
			Connection con = Database.connect();
			
			PreparedStatement ps1 = con
					.prepareStatement("select procesoCompra from ofertaALP where noOferta = ?");
			ps1.setInt(1, noOferta);
			ResultSet rs = ps1.executeQuery();
			while (rs.next()) {
				proceso = rs.getString(1);
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return proceso;
	}
	
	
	
}
