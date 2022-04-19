package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;

public class solicitudDisponibilidadALPDao {

	public static int save(solicitudDisponibilidadALP s) {
		int status = 0;
	
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.solicitudDisponibilidadALP(idSolicitudCompra, codSolicitudDisponibilidad, fechaEmision, fechaMaximaRespuesta, proveedor, nota, nombreReporte, estadoVaciados) values(?,?,?,?,?,?,?,?)");
			ps.setLong(1, s.getIdSolicitudCompra());
			ps.setString(2, s.getCodSolicitudDisponibilidad());
			ps.setString(3, s.getFechaEmision());
			ps.setString(4, s.getFechaMaximaRespuesta());
			ps.setString(5, s.getProveedor());
			ps.setString(6, s.getNota());
			ps.setString(7, s.getNombreReporte());
			ps.setString(8, s.getEstadoVaciados());

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int updateEmptyingStatus(long id, String estado) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.solicitudDisponibilidadALP set estadoVaciados = ? where id = ?");
			ps.setString(1, estado);

			ps.setLong(2, id);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ArrayList<solicitudDisponibilidadALP> getAllBySCIDAndEmptyingState(Long idSolicitudCompra, String state) {
		ArrayList<solicitudDisponibilidadALP> SDList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			
			String reqState = "and estadoVaciados = ? or estadoVaciados IS NULL";
			if (state.equalsIgnoreCase("SI"))
			{
				reqState = "and estadoVaciados = ?";
			}

			PreparedStatement ps = con.prepareStatement(
					"select id, codSolicitudDisponibilidad, proveedor from dbo.solicitudDisponibilidadALP where idSolicitudCompra = ?" + " " + reqState);
			ps.setLong(1, idSolicitudCompra);
			ps.setString(2, state);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				solicitudDisponibilidadALP s = new solicitudDisponibilidadALP();
				s.setId(rs.getInt(1));
				s.setCodSolicitudDisponibilidad(rs.getString(2));
				s.setProveedor(rs.getString(3));

				SDList.add(s);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return SDList;
	}
	
	public static String getNewCod(long idSolicitudCompra) {
		String cod;
		int count = 0;
		String lastCode = null;
		int nowYear = Calendar.getInstance().get(Calendar.YEAR);

		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select TOP(1) codSolicitudDisponibilidad from dbo.solicitudDisponibilidadALP where idSolicitudCompra = ? order by id DESC");
			ps.setLong(1, idSolicitudCompra);
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

		cod = "SD" + nowYear + "-" + (count + 1);

		return cod;
	}
	
	public static long getCountByBuyRequestId(long idSolicitudCompra) {
		long count = 0;

		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select count(*) from dbo.solicitudDisponibilidadALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				count = rs.getLong(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}

		return count;
	}

	public static solicitudDisponibilidadALP getLastOneByBuyRequestId(long idSolicitudCompra) {
		solicitudDisponibilidadALP sd = new solicitudDisponibilidadALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select TOP(1) id, idSolicitudCompra, codSolicitudDisponibilidad, fechaEmision, fechaMaximaRespuesta, proveedor, nota, nombreReporte, estadoVaciados from dbo.solicitudDisponibilidadALP where idSolicitudCompra = ? order by id DESC");
			ps.setLong(1, idSolicitudCompra);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				sd.setId(rs.getLong(1));
				sd.setIdSolicitudCompra(rs.getLong(2));
				sd.setCodSolicitudDisponibilidad(rs.getString(3));
				sd.setFechaEmision(rs.getString(4));
				sd.setFechaMaximaRespuesta(rs.getString(5));
				sd.setProveedor(rs.getString(6));
				sd.setNota(rs.getString(7));
				sd.setNombreReporte(rs.getString(8));
				sd.setEstadoVaciados(rs.getString(9));
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return sd;
	}
	
	public static solicitudDisponibilidadALP getOneBySDID(long idSolicitudDisponibilidad) {
		solicitudDisponibilidadALP ARSelected = new solicitudDisponibilidadALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct id, idSolicitudCompra, codSolicitudDisponibilidad, fechaEmision, fechaMaximaRespuesta, proveedor, nota, nombreReporte, estadoVaciados from dbo.solicitudDisponibilidadALP where id = ?");
			ps.setLong(1, idSolicitudDisponibilidad);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				ARSelected.setId(rs.getLong(1));
				ARSelected.setIdSolicitudCompra(rs.getLong(2));
				ARSelected.setCodSolicitudDisponibilidad(rs.getString(3));
				ARSelected.setFechaEmision(rs.getString(4));
				ARSelected.setFechaMaximaRespuesta(rs.getString(5));
				ARSelected.setProveedor(rs.getString(6));
				ARSelected.setNota(rs.getString(7));
				if (rs.getString(7) == null || rs.getString(7).isEmpty())
				{
					ARSelected.setNota("-");
				}
				ARSelected.setEstadoVaciados(rs.getString(8));
				if (rs.getString(8) == null || rs.getString(8).isEmpty())
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
	
	public static long getIdBySDCod(String SDCod) {
		long idSelected = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct id from dbo.solicitudDisponibilidadALP where codSolicitudDisponibilidad = ?");
			ps.setString(1, SDCod);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				idSelected = rs.getLong(1);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return idSelected;
	}
	
	public static String getARListByBuyRequestIdJSON(long idSolicitudCompra) {
		String arList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select codSolicitudDisponibilidad, nombreReporte from dbo.solicitudDisponibilidadALP where idSolicitudCompra = ?");
			ps.setLong(1, idSolicitudCompra);
			solicitudCompraALP SCData = solicitudCompraALPDao.getOneByID(idSolicitudCompra);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String codSolicitudDisponibilidad = rs.getString(1);
				String nombreReporte = rs.getString(2);

				j += "[" + "\"" + count + "\"," + "\"" + codSolicitudDisponibilidad + "\"," + "\"" + "<a class='btn btn-sm btn-success ml-2' href='assets/files/purchaseRequestALPFiles/" + SCData.getCodSolicitudCompra()  + "/availabilityRequestReports/" + nombreReporte + "' target='_blank\' >DESCARGAR REPORTE <i class='material-icons md-18'>picture_as_pdf</i></a>" + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			arList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return arList;
	}
}
