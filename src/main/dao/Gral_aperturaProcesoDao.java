package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_aperturaProcesoDao {

	public static int save(Gral_aperturaProceso aperturaProceso) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into Gral.aperturaProceso(numProcesoCompra, fechaPublicacion, fechaLimite, fechaApertura, lugar, periodoValidez, descripcionCompra, idBeneficiario, beneficiario) values(?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, aperturaProceso.getNumProcesoCompra());
			ps.setString(2, aperturaProceso.getFechaPublicacion());
			ps.setString(3, aperturaProceso.getFechaLimite());
			ps.setString(4, aperturaProceso.getFechaApertura());
			ps.setString(5, aperturaProceso.getLugar());
			ps.setString(6, aperturaProceso.getPeriodoValidez());
			ps.setString(7, aperturaProceso.getDescripcionCompra());
			ps.setInt(8, aperturaProceso.getIdBeneficiario());
			ps.setString(9, aperturaProceso.getbeneficiario());
			idAperturaProceso = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {idAperturaProceso = generatedKeys.getInt(1);}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}

	public static int update(Gral_aperturaProceso aperturaProceso) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.aperturaProceso set fechaPublicacion=?, fechaLimite=?, fechaApertura=?, lugar=?, periodoValidez=?, descripcionCompra=? where idAperturaProceso =?");
			ps.setString(1, aperturaProceso.getFechaPublicacion());
			ps.setString(2, aperturaProceso.getFechaLimite());
			ps.setString(3, aperturaProceso.getFechaApertura());
			ps.setString(4, aperturaProceso.getLugar());
			ps.setString(5, aperturaProceso.getPeriodoValidez());
			ps.setString(6, aperturaProceso.getDescripcionCompra());
			ps.setInt(7, aperturaProceso.getIdAperturaProceso());
			idAperturaProceso = ps.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}
	
	public static Gral_aperturaProceso GetAperturaProceso(int idAperturaProceso) {		
		Gral_aperturaProceso aperturaProceso = new Gral_aperturaProceso();		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select  numProcesoCompra, fechaPublicacion, fechaLimite, fechaApertura, lugar, periodoValidez,  estado, observaciones, descripcionCompra, idBeneficiario, beneficiario from Gral.aperturaProceso where idAperturaProceso = ?");		
				ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				aperturaProceso.setNumProcesoCompra(rs.getString(1));
				aperturaProceso.setFechaPublicacion(rs.getString(2));
				aperturaProceso.setFechaLimite(rs.getString(3));
				aperturaProceso.setFechaApertura(rs.getString(4));
				aperturaProceso.setLugar(rs.getString(5));
				aperturaProceso.setPeriodoValidez(rs.getString(6));
				aperturaProceso.setEstado(rs.getString(7));
				aperturaProceso.setObservaciones(rs.getString(8));
				aperturaProceso.setDescripcionCompra(rs.getString(9));
				aperturaProceso.setIdBeneficiario(rs.getInt(10));
				aperturaProceso.setbeneficiario(rs.getString(11));
				
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return aperturaProceso;
	}

	public static int updateEstado(Gral_aperturaProceso aperturaProceso) {
		int idAperturaProceso = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE  Gral.aperturaProceso set estado =?, observaciones=? where idAperturaProceso =?");
			ps.setString(1, aperturaProceso.getEstado());
			ps.setString(2, aperturaProceso.getObservaciones());
			ps.setInt(3, aperturaProceso.getIdAperturaProceso());
			idAperturaProceso = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idAperturaProceso;
	}

	public static ArrayList<Gral_aperturaProceso> GetListNumerosProcesos(){
		ArrayList<Gral_aperturaProceso> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idAperturaProceso, numProcesoCompra  from Gral.aperturaProceso where estado = 'APROBADO'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_aperturaProceso apertura = new Gral_aperturaProceso();				
				apertura.setIdAperturaProceso(rs.getInt(1));
				apertura.setNumProcesoCompra(rs.getString(2));	
				List.add(apertura);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String getBeneficiarioXidApertura(int  idAperturaProceso) {
		String beneficiario = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select beneficiario  from Gral.aperturaProceso where idAperturaProceso =?");
			ps.setLong(1, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+",";
			}			
			j = j.substring(0, j.length() - 1);
			beneficiario = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return beneficiario;
	}

	public static ArrayList<Gral_aperturaProceso> listAperturaProceso(){
		ArrayList<Gral_aperturaProceso> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idAperturaProceso, numProcesoCompra, fechaApertura, beneficiario from gral.aperturaproceso where estado = 'aprobado'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_aperturaProceso procesoCompraGeneral = new Gral_aperturaProceso();				
				procesoCompraGeneral.setIdAperturaProceso(rs.getInt(1));
				procesoCompraGeneral.setNumProcesoCompra(rs.getString(2));
				procesoCompraGeneral.setFechaApertura(rs.getString(3));
				procesoCompraGeneral.setbeneficiario(rs.getString(4));
				List.add(procesoCompraGeneral);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String GetDatosByidcontratoOrdenCompra(int  idcontratoOrdenCompra) {
		String contratoOrdenCompra = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select tipoDocuemnto, fechaSuscripcion, documento from Gral.contratoOrdenCompra where idcontratoOrdenCompra =?");
			ps.setLong(1, idcontratoOrdenCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+",";
			}			
			j = j.substring(0, j.length() - 1);
			contratoOrdenCompra = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return contratoOrdenCompra;
	}
	
	public static String getTipoCompra(int  idcontratoOrdenCompra) {
		String tipoCompra = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select ap.descripcioncompra from Gral.aperturaProceso as ap\r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on coc.idAperturaProceso = ap.idAperturaProceso\r\n"
					+ "where coc.idcontratoOrdenCompra =?");
			ps.setLong(1, idcontratoOrdenCompra);
			
			ResultSet rs = ps.executeQuery();			
			while (rs.next()) {				
				tipoCompra = rs.getString(1);
			}			
			
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return tipoCompra;
	}
	
	public static String getNumProcesoCompraXidApertura(int  idAperturaProceso) {
		String numProcesoCompra = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select numProcesoCompra  from Gral.aperturaProceso where idAperturaProceso =?");
			ps.setLong(1, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+",";
			}			
			j = j.substring(0, j.length() - 1);
			numProcesoCompra = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return numProcesoCompra;
	}
	
	
	public static ArrayList<Gral_aperturaProceso> GetListBeneficiarios(){
		ArrayList<Gral_aperturaProceso> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idBeneficiario, beneficiario  from Gral.aperturaProceso where estado = 'APROBADO' group by idBeneficiario ,beneficiario");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_aperturaProceso apertura = new Gral_aperturaProceso();				
				apertura.setIdBeneficiario(rs.getInt(1));
				apertura.setbeneficiario(rs.getString(2));	
				List.add(apertura);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	
	public static String procesoCompraCompraByBeneficiario(int idBeneficiario) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select C.idAperturaProceso, A.numProcesoCompra  from Gral.aperturaProceso A inner join Gral.contratoOrdenCompra C on A.idAperturaProceso = C.idAperturaProceso where A.idBeneficiario =? and A.estado = 'APROBADO' group by C.idAperturaProceso, A.numProcesoCompra");
			ps.setInt(1, idBeneficiario);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String procesoCompra =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += procesoCompra + ",";
			}
			j = j.substring(0, j.length() - 1);
			reqList = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return reqList;
		
	}
	
	public static String getBeneficiario(int idAperturaProceso) {
		String beneficiario = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select beneficiario from Gral.aperturaProceso where idAperturaProceso = ?");
			ps.setInt(1, idAperturaProceso);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String procesoCompra =  rs.getString(1);
				j += procesoCompra + ",";
			}
			j = j.substring(0, j.length() - 1);
			beneficiario = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return beneficiario;
		
	}

}


