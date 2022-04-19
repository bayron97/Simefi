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

public class Gral_controlGarantiasDao {
	

	public static int save(Gral_controlGarantias controlGarantias) {
		int idControlGarantias = 0;
		
		try {
			
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"INSERT INTO Gral.ControlGarantias(idcontratoOrdenCompra,tipoGarantia,tipoDocumento,monedaCompra,fechaFirma,precioTotal,nombreInstitucionFinanciera,numGarantia,numGarantiaEnmienda,monedaGarantia,tasaCambio,valorGarantia,usuarioResponsable,fechaemision,fechaInicioValidez,fechaFinValidez,horaVencimiento,diasanticipacion,correo1,correo2,correo3,correo4,correo5,correo6,nombreDocumento,estado1,estado2, observaciones)VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			
			ps.setInt(1, controlGarantias.getIdcontratoOrdenCompra());
			ps.setString(2, controlGarantias.getTipoGarantia());
			ps.setString(3, controlGarantias.getTipoDocumento());
			ps.setString(4, controlGarantias.getMonedaCompra());
			ps.setString(5, controlGarantias.getFechaFirma());
			ps.setFloat(6, controlGarantias.getPrecioTotal());
			ps.setString(7, controlGarantias.getNombreInstitucionFinanciera());
			ps.setString(8, controlGarantias.getNumGarantia());
			ps.setString(9, controlGarantias.getNumGarantiaEnmienda());
			ps.setString(10, controlGarantias.getMonedaGarantia());
			ps.setFloat(11, controlGarantias.getTasaCambio());
			ps.setString(12, controlGarantias.getValorGarantia());
			ps.setString(13, controlGarantias.getUsuarioResponsable());
			ps.setString(14, controlGarantias.getFechaEmision());
			ps.setString(15, controlGarantias.getFechaInicioValidez());
			ps.setString(16, controlGarantias.getFechaFinValidez());
			ps.setString(17, controlGarantias.getHoraVencimiento());
			ps.setInt(18, controlGarantias.getDiasAnticipacion());
			ps.setString(19, controlGarantias.getCorreo1());
			ps.setString(20, controlGarantias.getCorreo2());
			ps.setString(21, controlGarantias. getCorreo3());
			ps.setString(22, controlGarantias.getCorreo4());
			ps.setString(23, controlGarantias.getCorreo5());
			ps.setString(24, controlGarantias.getCorreo6());
			ps.setString(25, controlGarantias.getNombreDocumento());
			ps.setString(26, controlGarantias.getEstado1());
			ps.setString(27, controlGarantias.getEstado2());
			ps.setString(28, controlGarantias.getObservaciones());
			idControlGarantias = ps.executeUpdate();
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {idControlGarantias = generatedKeys.getInt(1);}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idControlGarantias;
	}

	public static int update(controlGarantiasGeneral l) {
		int status = 0;
		System.out.println( l.getId() + " UPDATE TEST");
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"UPDATE ControlGarantiasGeneral SET buyProcessId=?,buyProcessCod=?,buyOrderId=?,warrantytype=?,warrantyNo=?,fechaemision=?,fechacaducidad=?,estado=?,fecha=?,diasanticipacion=?,documentName=?,beneficiario=?,tipoProcesoCompra=?,valorGarantia=?,correo1=?,correo2=?,correo3=? where Id=?");
			ps.setInt(1, l.getBuyProcessId());
			ps.setString(2, l.getBuyProcessCod());
			ps.setString(3, l.getBuyOrderId());
			ps.setString(4, l.getWarrantytype());
			ps.setString(5, l.getWarrantyNo());
			ps.setString(6, l.getFechaemision());
			ps.setString(7, l.getFechacaducidad());
			ps.setString(8, l.getEstado());
			ps.setString(9, l.getFecha());
			ps.setInt(10, l.getDiasanticipacion());
			ps.setString(11, l.getDocumentName());
			ps.setString(12, l.getbeneficiario());
			ps.setString(13, l.gettipoProcesoCompra());
			ps.setString(14, l.getvalorGarantia());
			ps.setString(15, l.getcorreo1());
			ps.setString(16, l.getcorreo2());
			ps.setString(17, l.getcorreo3());
			ps.setInt(18,l.getId());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status");
		return status;
	}

	public static controlGarantiasGeneral getById(int id) {
		controlGarantiasGeneral p = new controlGarantiasGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM ControlGarantiasGeneral where Id=?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p.setId(id);
				p.setBuyProcessId(rs.getInt(2));
				p.setBuyProcessCod(rs.getString(3));
				p.setBuyOrderId(rs.getString(4));
				p.setWarrantytype(rs.getString(5));
				p.setWarrantyNo(rs.getString(6));
				p.setFechaemision(rs.getString(7));
				p.setFechacaducidad(rs.getString(8));
				p.setEstado(rs.getString(9));
				p.setFecha(rs.getString(10));
				p.setDiasanticipacion(rs.getInt(11));
				p.setDocumentName(rs.getString(12));
				p.setbeneficiario(rs.getString(13));
				p.setcorreo1(rs.getString(14));
				p.setcorreo2(rs.getString(15));
				p.setcorreo3(rs.getString(16));
				p.settipoProcesoCompra(rs.getString(17));
				p.setvalorGarantia(rs.getString(18));
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return p;
	}
	
	public static String getOrdenCompra(String noProcesoCompra) {
		String reqList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("SELECT noOrdenCompra FROM contrataciones WHERE procesoCompra =?");
			ps.setString(1, noProcesoCompra);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String orden = rs.getString(3);

				j += orden + ",";
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
	
	public static ArrayList<Gral_controlGarantias> GetListGarantias(){
		ArrayList<Gral_controlGarantias> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select numGarantia from Gral.ControlGarantias");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_controlGarantias garantia = new Gral_controlGarantias();				
				garantia.setNumGarantia(rs.getString(1));	
				List.add(garantia);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	
	public static Gral_controlGarantiasDTO Getgarantia(int idControlGarantias) {		
		Gral_controlGarantiasDTO garantia = new Gral_controlGarantiasDTO();		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select CO.idcontratoOrdenCompra, CG.tipoGarantia,CG.tipoDocumento,CG.numGarantiaEnmienda, A.beneficiario, A.numProcesoCompra, CO.numDocumento, CG.monedaCompra, CG.fechaFirma, CG.precioTotal, CG.nombreInstitucionFinanciera, CG.numGarantia, CG.monedaGarantia, CG.tasaCambio, CG.valorGarantia, CO.nombreProveedor, CG.usuarioResponsable, CG.fechaEmision, CG.fechaInicioValidez, CG.fechaFinValidez, CG.horaVencimiento, CG.diasAnticipacion, CG.correo1, CG.correo2, CG.correo3, CG.correo4, CG.correo5, CG.correo6, CG.observaciones, CG.nombreDocumento from Gral.ControlGarantias CG inner join Gral.contratoOrdenCompra CO ON CG.idcontratoOrdenCompra = CO.idcontratoOrdenCompra  inner join Gral.aperturaProceso A ON  CO.idAperturaProceso = A.idAperturaProceso where idControlGarantias = ?");		
			ps.setInt(1, idControlGarantias);
			ResultSet rs = ps.executeQuery();	
			System.out.println("garantiadAO /"+ idControlGarantias);
			if (rs.next()) {
				garantia.setIdcontratoOrdenCompra(rs.getInt(1));
				garantia.setTipoGarantia(rs.getString(2));
				garantia.setTipoDocumento(rs.getString(3));
				garantia.setNumGarantiaEnmienda(rs.getString(4));
				garantia.setBeneficiario(rs.getString(5));
				garantia.setNumProcesoCompra(rs.getString(6));
				garantia.setNumDocumento(rs.getString(7));
				garantia.setMonedaCompra(rs.getString(8));
				garantia.setFechaFirma(rs.getString(9));
				garantia.setPrecioTotal(rs.getFloat(10));
				garantia.setNombreInstitucionFinanciera(rs.getString(11));
				garantia.setNumGarantia(rs.getString(12));
				garantia.setMonedaGarantia(rs.getString(13));
				garantia.setTasaCambio(rs.getFloat(14));
				garantia.setValorGarantia(rs.getString(15));
				garantia.setNombreProveedor(rs.getString(16));
				garantia.setUsuarioResponsable(rs.getString(17));
				garantia.setFechaEmision(rs.getString(18));
				garantia.setFechaInicioValidez(rs.getString(19));
				garantia.setFechaFinValidez(rs.getString(20));
				garantia.setHoraVencimiento(rs.getString(21));
				garantia.setDiasAnticipacion(rs.getInt(22));
				garantia.setCorreo1(rs.getString(23));
				garantia.setCorreo2(rs.getString(24));
				garantia.setCorreo3(rs.getString(25));
				garantia.setCorreo4(rs.getString(26));
				garantia.setCorreo5(rs.getString(27));
				garantia.setCorreo6(rs.getString(28));
				garantia.setObservaciones(rs.getString(29));
				garantia.setNombreDocumento(rs.getString(30));
				
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return garantia;
	}
	
}
