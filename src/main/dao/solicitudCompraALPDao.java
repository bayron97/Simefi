package main.dao;

import main.model.*;
import main.Database;

import java.util.Calendar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class solicitudCompraALPDao {

	public static int save(solicitudCompraALP s) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.solicitudCompraALP(fecha, noProcesoCompra, codSolicitudCompra, beneficiario, descripcionCompra, estado) values(?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, s.getFecha());
			ps.setString(2, s.getNoProcesoCompra());
			ps.setString(3, s.getCodSolicitudCompra());
			ps.setString(4, s.getBeneficiario());
			ps.setString(5, s.getDescripcionCompra());
			ps.setString(6, s.getEstado());

			status = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {
			        status = generatedKeys.getInt(1);
			}
			con.close();
		} catch (Exception e) {

			System.out.println(e);
		}
		return status;
	}

	public static int updateGeneralData(solicitudCompraALP s) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.solicitudCompraALP set fecha = ?, noProcesoCompra = ?, beneficiario = ?, descripcionCompra = ? where id = ?");
			ps.setString(1, s.getFecha());
			ps.setString(2, s.getNoProcesoCompra());
			ps.setString(3, s.getBeneficiario());
			ps.setString(4, s.getDescripcionCompra());

			ps.setLong(5, s.getId());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateCriteriaData(solicitudCompraALP s) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.solicitudCompraALP set cantCriterio = ?, regSanCriterio = ?, certBPMCriterio = ?, tiempoEntregaCriterio = ?, vidaUtilCriterio = ? where id = ?");
			ps.setString(1, s.getCantCriterio());
			ps.setString(2, s.getRegSanCriterio());
			ps.setString(3, s.getCertBPMCriterio());
			ps.setString(4, s.getTiempoEntregaCriterio());
			ps.setString(5, s.getVidaUtilCriterio());

			ps.setLong(6, s.getId());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateNoItemsRequestedById(Long id, int newCount) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.solicitudCompraALP set noItemsSolicitados = ? where id = ?");
			ps.setInt(1, newCount);

			ps.setLong(2, id);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getNewCod() {
		String cod;
		String lastCode = null;
		int count = 0;
		int nowYear = Calendar.getInstance().get(Calendar.YEAR);

		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select TOP(1) codSolicitudCompra from dbo.solicitudCompraALP order by id DESC");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				lastCode = rs.getString(1);
			}
			
			if (lastCode != null)
			{
				String code = lastCode.split("-")[1];
				count = Integer.parseInt(code);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}

		cod = "SC" + nowYear + "-" + (count + 1);

		return cod;
	}

	public static long getIDByPurchaseRequestCod(String codSolicitudCompra) {
		long id = -1;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select id from dbo.solicitudCompraALP where codSolicitudCompra = ?");
			ps.setString(1, codSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				id = rs.getLong(1);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return id;
	}

	public static solicitudCompraALP getOneByID(long id) {
		solicitudCompraALP s = new solicitudCompraALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct id, fecha, noProcesoCompra, codSolicitudCompra, beneficiario, descripcionCompra, cantCriterio, regSanCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, noItemsSolicitados, estado, observaciones from dbo.solicitudCompraALP where id = ?");
			ps.setLong(1, id);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setId(rs.getLong(1));
				s.setFecha(rs.getString(2));
				s.setNoProcesoCompra(rs.getString(3));
				s.setCodSolicitudCompra(rs.getString(4));
				s.setBeneficiario(rs.getString(5));
				s.setDescripcionCompra(rs.getString(6));

				s.setCantCriterio(rs.getString(7));
				if (rs.getString(7) == null) {
					s.setCantCriterio("NO APLICA");
				}

				s.setRegSanCriterio(rs.getString(8));
				if (rs.getString(8) == null) {
					s.setRegSanCriterio("NO APLICA");
				}

				s.setCertBPMCriterio(rs.getString(9));
				if (rs.getString(9) == null) {
					s.setCertBPMCriterio("NO APLICA");
				}

				s.setTiempoEntregaCriterio(rs.getString(10));
				if (rs.getString(10) == null) {
					s.setTiempoEntregaCriterio("NO APLICA");
				}

				s.setVidaUtilCriterio(rs.getString(11));
				if (rs.getString(11) == null) {
					s.setVidaUtilCriterio("NO APLICA");
				}

				s.setNoItemsSolicitados(rs.getInt(12));
				s.setEstado(rs.getString(13));

				if (rs.getString(14) == null) {
					s.setObservaciones("");
				} else {
					s.setObservaciones(rs.getString(14));
				}
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return s;
	}
	
	public static solicitudCompraALP getOneBySCID(String codSolicitudCompra) {
		solicitudCompraALP s = new solicitudCompraALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct id, fecha, noProcesoCompra, codSolicitudCompra, beneficiario, descripcionCompra, cantCriterio, regSanCriterio, certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, noItemsSolicitados, estado, observaciones from dbo.solicitudCompraALP where codSolicitudCompra = ?");
			ps.setString(1, codSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				s.setId(rs.getLong(1));
				s.setFecha(rs.getString(2));
				s.setNoProcesoCompra(rs.getString(3));
				s.setCodSolicitudCompra(rs.getString(4));
				s.setBeneficiario(rs.getString(5));
				s.setDescripcionCompra(rs.getString(6));

				s.setCantCriterio(rs.getString(7));
				if (rs.getString(7) == null) {
					s.setCantCriterio("NO APLICA");
				}

				s.setRegSanCriterio(rs.getString(8));
				if (rs.getString(8) == null) {
					s.setRegSanCriterio("NO APLICA");
				}

				s.setCertBPMCriterio(rs.getString(9));
				if (rs.getString(9) == null) {
					s.setCertBPMCriterio("NO APLICA");
				}

				s.setTiempoEntregaCriterio(rs.getString(10));
				if (rs.getString(10) == null) {
					s.setTiempoEntregaCriterio("NO APLICA");
				}

				s.setVidaUtilCriterio(rs.getString(11));
				if (rs.getString(11) == null) {
					s.setVidaUtilCriterio("NO APLICA");
				}

				s.setNoItemsSolicitados(rs.getInt(12));
				s.setEstado(rs.getString(13));

				if (rs.getString(14) == null) {
					s.setObservaciones("");
				} else {
					s.setObservaciones(rs.getString(14));
				}
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return s;
	}
	
	public static int getcantidadEstadoSolicitud(long idSolicitudCompra) {
		int cod= 0;		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select COUNT(idSolicitudDisponibilidad) from [dbo].[listaRequerimientoSolicitudDisponibilidadALP] where estadoCompra != 'EVALUACION REALIZADA' and idSolicitudDisponibilidad =?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cod = rs.getInt(1);
			}		
			
		} catch (Exception e) {
			System.out.println(e);
		}

		return cod;
	}
	
	public static String VerificarNoSolicitud(String noCorrelativoSolicitud, String noProcesoCompraRecomendado) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select count(codSolicitudCompra) from [dbo].[solicitudCompraALP] where codSolicitudCompra = ? and noProcesoCompra = ?");
			ps.setString(1, noCorrelativoSolicitud);
			ps.setString(2, noProcesoCompraRecomendado);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				reqList = rs.getString(1);
			}
			
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return reqList;
		
	}
	
	public static String VerificarNoSolicitudDisponibilidad(int idSolicitudCompra, String proveedor, String codSolicitudDisponibilidad) {
		String reqList = "";
		
		System.out.println("idSolicitudCompra "+ idSolicitudCompra);
		System.out.println("proveedor "+ proveedor);
		System.out.println("codSolicitudDisponibilidad "+ codSolicitudDisponibilidad);
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select count(codSolicitudDisponibilidad) from listaRequerimientoSolicitudCompraALP where idSolicitudCompra= ? and proveedor = ? and codSolicitudDisponibilidad = ?");
			ps.setInt(1, idSolicitudCompra);
			ps.setString(2, proveedor);
			ps.setString(3, codSolicitudDisponibilidad);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				reqList = rs.getString(1);
			}
			
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return reqList;
		
	}
	
	public static int anularSolicitudCompra(int id) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update solicitudCompraALP  set estado =? where id = ?");
			ps.setString(1, "ANULADO");
			ps.setInt(2, id);
		

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	
	public static int getItemSolicitados(Long idSolicitudCompra) {
		int cantidad = 0;
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select count(distinct lrsc.nombreProducto) as cantidadSolicitada from solicitudDisponibilidadALP as sd\r\n"
					+ "inner join listaRequerimientoSolicitudCompraALP as lrsc on sd.idSolicitudCompra = lrsc.idSolicitudCompra\r\n"
					+ "inner join listaRequerimientoSolicitudDisponibilidadALP as lrsd on sd.id = lrsd.idSolicitudDisponibilidad\r\n"
					+ "where  lrsc.idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
		
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {				
				cantidad = rs.getInt(1);
			}
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cantidad;
	}

	
}
