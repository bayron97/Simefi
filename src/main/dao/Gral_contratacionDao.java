package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_contratacionDao {

	public static int save(Gral_contratacion contratacion) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.contratacion(idcontratoOrdenCompra, observacion, monedaCompra) values(?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setInt(1, contratacion.getIdcontratoOrdenCompra());			
			ps.setString(2, contratacion.getObservacion());		
			ps.setString(3, contratacion.getMonedaCompra());
			contrato = ps.executeUpdate();		
			ResultSet generatedKeys = ps.getGeneratedKeys();
			if (generatedKeys.next()) {contrato = generatedKeys.getInt(1);}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}

	public static int update(Gral_contratacion contratacion) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacion set observacion =? where idContratacion=?");
			ps.setString(1, contratacion.getObservacion());				
			ps.setInt(2, contratacion.getIdContratacion());
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}
	
	public static Gral_contratacionDTO Getcontratacion(int idContratacion) {		
		Gral_contratacionDTO contratacion = new Gral_contratacionDTO();		
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select ap.numProcesoCompra, c.monedaCompra, ap.beneficiario, coc.nombreProveedor, coc.tipoDocuemnto, coc.numDocumento, coc.fechaSuscripcion, c.observacion, coc.documento, coc.idcontratoOrdenCompra \r\n"
					+ "from Gral.contratacion as c \r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on coc.idcontratoOrdenCompra = c.idcontratoOrdenCompra \r\n"
					+ "inner join Gral.aperturaProceso as ap on ap.idAperturaProceso = coc.idAperturaProceso\r\n"
					+ "where c.idContratacion = ?");		
				ps.setInt(1, idContratacion);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				contratacion.setNumProcesoCompra(rs.getString(1));
				contratacion.setMonedaCompra(rs.getString(2));
				contratacion.setBeneficiario(rs.getString(3));
				contratacion.setNombreProveedor(rs.getString(4));
				contratacion.setTipoDocuemnto(rs.getString(5));
				contratacion.setNumDocumento(rs.getString(6));
				contratacion.setFechaSuscripcion(rs.getString(7));
				contratacion.setObservacion(rs.getString(8));
				contratacion.setDocumento(rs.getString(9));
				contratacion.setIdcontratoOrdenCompra(rs.getInt(10));
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return contratacion;
	}

	
	
	//Vaciado Contratacion
	public static int saveVaciado(Gral_contratacionVaciado contratacionVaciado) {
		int contratoVaciado = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.contratacionVaciado(idContratacion, numItem , nombreMedicamento, codigoATC, codigoSesal, descripcionTecnica, unidadPresentacion, nombreFabricante, paisOrigen, marca, modelo, cantidadComprada, precioUnitario, tiemposEntrega, vidaUtil, observaciones) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, contratacionVaciado.getIdContratacion());			
			ps.setInt(2, contratacionVaciado.getNumItem());		
			ps.setString(3, contratacionVaciado.getNombreMedicamento());
			ps.setString(4, contratacionVaciado.getCodigoATC());
			ps.setString(5, contratacionVaciado.getCodigoSesal());
			ps.setString(6, contratacionVaciado.getDescripcionTecnica());
			ps.setString(7, contratacionVaciado.getUnidadPresentacion());
			ps.setString(8, contratacionVaciado.getNombreFabricante());
			ps.setString(9, contratacionVaciado.getPaisOrigen());
			ps.setString(10, contratacionVaciado.getMarca());
			ps.setString(11, contratacionVaciado.getModelo());
			ps.setInt(12, contratacionVaciado.getCantidadComprada());
			ps.setString(13, contratacionVaciado.getPrecioUnitario());
			ps.setString(14, contratacionVaciado.getTiemposEntrega());
			ps.setString(15, contratacionVaciado.getVidaUtil());
			ps.setString(16, contratacionVaciado.getObservaciones());			
			contratoVaciado = ps.executeUpdate();					
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("guarda "+ contratoVaciado);
		return contratoVaciado;
	}

	public static int updateVaciado(Gral_contratacionVaciado contratacionVaciado) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacionVaciado  set nombreMedicamento=?, codigoATC=?, codigoSesal=?, descripcionTecnica=?, unidadPresentacion=?, nombreFabricante=?, paisOrigen=?, marca=?, modelo=?, cantidadComprada=?, precioUnitario=?, tiemposEntrega=?, vidaUtil=?, observaciones=? where idContratacionVaciado=?");
			ps.setString(1, contratacionVaciado.getNombreMedicamento());
			ps.setString(2, contratacionVaciado.getCodigoATC());
			ps.setString(3, contratacionVaciado.getCodigoSesal());
			ps.setString(4, contratacionVaciado.getDescripcionTecnica());
			ps.setString(5, contratacionVaciado.getUnidadPresentacion());
			ps.setString(6, contratacionVaciado.getNombreFabricante());
			ps.setString(7, contratacionVaciado.getPaisOrigen());
			ps.setString(8, contratacionVaciado.getMarca());
			ps.setString(9, contratacionVaciado.getModelo());
			ps.setInt(10, contratacionVaciado.getCantidadComprada());
			ps.setString(11, contratacionVaciado.getPrecioUnitario());
			ps.setString(12, contratacionVaciado.getTiemposEntrega());
			ps.setString(13, contratacionVaciado.getVidaUtil());
			ps.setString(14, contratacionVaciado.getObservaciones());
			ps.setInt(15, contratacionVaciado.getIdContratacionVaciado());	
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("actualiza "+ contrato);
		return contrato;
	}
	
	public static int anularItem(Gral_contratacionVaciado contratacionVaciado) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacionVaciado  set estado=? where idContratacionVaciado=?");
			ps.setBoolean(1, false);	
			ps.setInt(2, contratacionVaciado.getIdContratacionVaciado());	
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("actualiza "+ contrato);
		return contrato;
	}
	
	public static ArrayList<Gral_contratacionVaciado> getVaciadoXContratacion(int idContratacion){
		ArrayList<Gral_contratacionVaciado> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			//PreparedStatement ps = con.prepareStatement("SELECT idContratacionVaciado, numItem, nombreMedicamento, codigoATC, codigoSesal, descripcionTecnica, unidadPresentacion, nombreFabricante, paisOrigen, marca, modelo, cantidadComprada, CAST(precioUnitario AS DECIMAL(20, 4)) as precioUnitario, tiemposEntrega, vidaUtil, observaciones, (CAST((CAST(precioUnitario AS DECIMAL(20, 4))*cantidadComprada) AS DECIMAL(20, 4))) as precioTotal FROM Gral.contratacionVaciado where idContratacion =? and estado = 'true'");
			PreparedStatement ps = con.prepareStatement("SELECT cv.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.codigoATC, cv.codigoSesal, cv.descripcionTecnica, cv.unidadPresentacion, \r\n"
					+ "cv.nombreFabricante, cv.paisOrigen, cv.marca, cv.modelo, cv.cantidadComprada, CAST(cv.precioUnitario AS DECIMAL(20, 4)) as precioUnitario, \r\n"
					+ "cv.tiemposEntrega, cv.vidaUtil, cv.observaciones, \r\n"
					+ "(CAST((CAST(cv.precioUnitario AS DECIMAL(20, 4))*cv.cantidadComprada) AS DECIMAL(20, 4))) as precioTotal, c.monedaCompra\r\n"
					+ "FROM Gral.contratacionVaciado as cv\r\n"
					+ "inner join [Gral].[contratacion] as c on c.idContratacion = cv.idContratacion\r\n"
					+ "where cv.idContratacion =? and cv.estado = 'true'");
			ps.setInt(1, idContratacion);
			ResultSet rs = ps.executeQuery();
			String moneda = "USD";
			while (rs.next()) {
				
				if(rs.getString(18).contentEquals("LEMPIRAS (LPS.)")) {
					moneda = "L";
				}
				
				Gral_contratacionVaciado vaciado = new Gral_contratacionVaciado();				
				vaciado.setIdContratacionVaciado(rs.getInt(1));
				vaciado.setNumItem(rs.getInt(2));
				vaciado.setNombreMedicamento(rs.getString(3));
				vaciado.setCodigoATC(rs.getString(4));
				vaciado.setCodigoSesal(rs.getString(5));
				vaciado.setDescripcionTecnica(rs.getString(6));
				vaciado.setUnidadPresentacion(rs.getString(7));
				vaciado.setNombreFabricante(rs.getString(8));
				vaciado.setPaisOrigen(rs.getString(9));
				vaciado.setMarca(rs.getString(10));
				vaciado.setModelo(rs.getString(11));
				vaciado.setCantidadComprada(rs.getInt(12));
				vaciado.setPrecioUnitario(moneda + " "+ rs.getString(13));
				vaciado.setTiemposEntrega(rs.getString(14));
				vaciado.setVidaUtil(rs.getString(15));
				vaciado.setObservaciones(rs.getString(16));	
				vaciado.setPrecioTotal(moneda + " "+ rs.getString(17));	
				List.add(vaciado);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String getVaciadoXContratacionJson(int idContratacion) {
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			//PreparedStatement ps = con.prepareStatement("SELECT idContratacionVaciado, numItem, nombreMedicamento, codigoATC, codigoSesal, descripcionTecnica, unidadPresentacion, nombreFabricante, paisOrigen, marca, modelo, cantidadComprada, precioUnitario, tiemposEntrega, vidaUtil, observaciones, (CAST((CAST(precioUnitario AS DECIMAL(20, 4))*cantidadComprada) AS DECIMAL(20, 4))) as precioTotal FROM Gral.contratacionVaciado where idContratacion =? and estado = 'true'");
			PreparedStatement ps = con.prepareStatement("SELECT cv.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.codigoATC, cv.codigoSesal, cv.descripcionTecnica, cv.unidadPresentacion, \r\n"
					+ "cv.nombreFabricante, cv.paisOrigen, cv.marca, cv.modelo, cv.cantidadComprada, CAST(cv.precioUnitario AS DECIMAL(20, 4)) as precioUnitario, \r\n"
					+ "cv.tiemposEntrega, cv.vidaUtil, cv.observaciones, \r\n"
					+ "(CAST((CAST(cv.precioUnitario AS DECIMAL(20, 4))*cv.cantidadComprada) AS DECIMAL(20, 4))) as precioTotal, c.monedaCompra\r\n"
					+ "FROM Gral.contratacionVaciado as cv\r\n"
					+ "inner join [Gral].[contratacion] as c on c.idContratacion = cv.idContratacion\r\n"
					+ "where cv.idContratacion =? and cv.estado = 'true'");
			ps.setInt(1, idContratacion);			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			String moneda = "USD";
			while (rs.next()) {
				count++;
				
				
				
					
					if(rs.getString(18).contentEquals("LEMPIRAS (LPS.)")) {
						moneda = "L";
					}
			
			j += "[" + "\"" + rs.getInt(1) + "\","+ "\"" 
		    + rs.getInt(2) + "\"," + "\""
		    + rs.getString(3) + "\"," + "\""
		    + rs.getString(4) + "\"," + "\""						    
		    + rs.getString(5) + "\"," + "\""
		    + rs.getString(6) + "\"," + "\""						   
		    + rs.getString(7) + "\"," + "\""
		    + rs.getString(8) + "\"," + "\""
		    + rs.getString(9) + "\"," + "\""						    
		    + rs.getString(10) + "\"," + "\""
		    + rs.getString(11) + "\"," + "\""						   
		    +  String.format("%,d", rs.getInt(12))  + "\"," + "\""
		    + moneda + " "+ rs.getString(13) + "\"," + "\""
		    + moneda + " "+ rs.getString(17) + "\"," + "\""
		    + rs.getString(14) + "\"," + "\""						   
		    + rs.getString(15) + "\"," + "\""
		    + rs.getString(16) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}

	public static ArrayList<Gral_contratacionVaciado> getVaciadoItemProducto(int idContratacion){
		ArrayList<Gral_contratacionVaciado> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("SELECT idContratacionVaciado, numItem, nombreMedicamento FROM Gral.contratacionVaciado where idContratacion =? and estado = 'true'");
			ps.setInt(1, idContratacion);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_contratacionVaciado vaciado = new Gral_contratacionVaciado();				
				vaciado.setIdContratacionVaciado(rs.getInt(1));				
				vaciado.setNombreMedicamento("Item: "+ rs.getInt(2) +" Producto: "+rs.getString(3));					
				List.add(vaciado);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String validarProductoXProveedor(int idContratacion, String nombreMedicamento, String nombreFabricante) {
		String existe = "0";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select count(nombreMedicamento) as existe from Gral.contratacionVaciado where idContratacion = ? and nombreMedicamento = ? and nombreFabricante = ? and estado = 'true'");
			ps.setInt(1, idContratacion);	
			ps.setString(2, nombreMedicamento);	
			ps.setString(3, nombreFabricante);	
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				existe = rs.getString(1);						
			}			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return existe;
	}

	public static String validarProductoXProveedorUpdate(int idContratacion, String nombreMedicamento, String nombreFabricante) {
		String existe = "0";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select count(nombreMedicamento) as existe from Gral.contratacionVaciado where idContratacion = ? and nombreMedicamento = ? and nombreFabricante = ? and estado = 'true' and idContratacionVaciado != ?");
			ps.setInt(1, idContratacion);	
			ps.setString(2, nombreMedicamento);	
			ps.setString(3, nombreFabricante);	
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				existe = rs.getString(1);						
			}			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return existe;
	}

	
  //Detalle
	
	public static int saveDetalle(Gral_contratacionDetalle contratacionDetalle) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.contratacionDetalle(idContratacionVaciado, cantidadEntregarSegunPlazos, fechaLimiteEntrega, numeroEntrega) values(?,?,?,?)");
			ps.setInt(1, contratacionDetalle.getIdContratacionVaciado());			
			ps.setInt(2, contratacionDetalle.getCantidadEntregarSegunPlazos());		
			ps.setString(3, contratacionDetalle.getFechaLimiteEntrega());
			ps.setString(4, contratacionDetalle.getNumeroEntrega());
			contrato = ps.executeUpdate();					
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}

	public static int updateDetalle(Gral_contratacionDetalle contratacionDetalle) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacionDetalle set cantidadEntregarSegunPlazos=?, fechaLimiteEntrega=?, numeroEntrega =? where idcontratacionDetalle=?");
			ps.setInt(1, contratacionDetalle.getCantidadEntregarSegunPlazos());		
			ps.setString(2, contratacionDetalle.getFechaLimiteEntrega());
			ps.setString(3, contratacionDetalle.getNumeroEntrega());
			ps.setInt(4, contratacionDetalle.getIdcontratacionDetalle());	
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}
	
	public static String getCantidades(int idContratacionVaciado) {
		String cantidades = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select cantidadComprada from Gral.contratacionVaciado where idContratacionVaciado =?");					
			ps.setInt(1, idContratacionVaciado);			
			String j = "";
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				String cantidadComprada = rs.getString(1);
				String cantidadEntregadaPlazos = "";
				ps = con.prepareStatement("select Sum(cantidadEntregarSegunPlazos) from Gral.contratacionDetalle where idContratacionVaciado =?");					
				ps.setInt(1, idContratacionVaciado);		
				rs = ps.executeQuery();
				if (rs.next()) {					
					if(rs.getString(1) == null) {
						cantidadEntregadaPlazos = "0";
					}else {
						cantidadEntregadaPlazos = rs.getString(1);
					}
				}		
				j += cantidadComprada +";"+ cantidadEntregadaPlazos+ ";";
			}
			
			j = j.substring(0, j.length() - 1);
			cantidades = j;
			con.close();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return cantidades;
	}
	
	public static ArrayList<Gral_contratacionDetalleDTO> getDetalleContratacion(int idContratacion){
		ArrayList<Gral_contratacionDetalleDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select cd.idcontratacionDetalle, cd.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.tiemposEntrega, cv.cantidadComprada, cd.cantidadEntregarSegunPlazos, cd.fechaLimiteEntrega, cd.numeroEntrega from Gral.contratacionDetalle as cd\r\n"
					+ "inner join Gral.contratacionVaciado as cv on cd.idContratacionVaciado = cv.idContratacionVaciado\r\n"
					+ "where cv.idContratacion = ? and cd.estado = 'true'\r\n"
					+ "group by cd.idcontratacionDetalle, cd.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.tiemposEntrega, cv.cantidadComprada, cd.cantidadEntregarSegunPlazos, cd.fechaLimiteEntrega, cd.numeroEntrega\r\n"
					+ "");
			ps.setInt(1, idContratacion);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_contratacionDetalleDTO detalle = new Gral_contratacionDetalleDTO();				
				detalle.setIdcontratacionDetalle(rs.getInt(1));	
				detalle.setIdContratacionVaciado(rs.getInt(2));			
				detalle.setNumItem(rs.getInt(3));	
				detalle.setNombreMedicamento(rs.getString(4));
				detalle.setTiemposEntrega(rs.getString(5));
				detalle.setCantidadComprada(rs.getInt(6));
				detalle.setCantidadEntregarSegunPlazos(rs.getInt(7));
				detalle.setFechaLimiteEntrega(rs.getString(8));
				detalle.setNumeroEntrega(rs.getString(9));
				List.add(detalle);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static String getDetalleContratacionJson(int idContratacion) {
		String detalle = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select cd.idcontratacionDetalle, cd.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.tiemposEntrega, cv.cantidadComprada, cd.cantidadEntregarSegunPlazos, cd.fechaLimiteEntrega, cd.numeroEntrega from Gral.contratacionDetalle as cd\r\n"
					+ "inner join Gral.contratacionVaciado as cv on cd.idContratacionVaciado = cv.idContratacionVaciado\r\n"
					+ "where cv.idContratacion = ? and cd.estado = 'true'\r\n"
					+ "group by cd.idcontratacionDetalle, cd.idContratacionVaciado, cv.numItem, cv.nombreMedicamento, cv.tiemposEntrega, cv.cantidadComprada, cd.cantidadEntregarSegunPlazos, cd.fechaLimiteEntrega,cd.numeroEntrega");
			ps.setInt(1, idContratacion);			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;			
			j += "[" + "\"" + rs.getInt(1) + "\","+ "\"" 
						    + rs.getInt(2) + "\"," + "\""
						    + rs.getInt(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""
						    + rs.getString(5) + "\"," + "\""						    
						    + rs.getString(6) + "\"," + "\""
						    + rs.getString(7) + "\"," + "\""						   
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			
			detalle = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return detalle;
	}

	public static String GetDatosApertura(int  idContratacion) {
		String contratoOrdenCompra = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select  a.beneficiario, c.monedaCompra from Gral.aperturaProceso as a\r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on coc.idAperturaProceso = a.idAperturaProceso\r\n"
					+ "inner join Gral.contratacion as c on c.idcontratoOrdenCompra = coc.idcontratoOrdenCompra\r\n"
					+ "where c.idContratacion = ?");
			ps.setLong(1, idContratacion);
			String j = "";
			ResultSet rs = ps.executeQuery();			
			if (rs.next()) {				
				j += rs.getString(1)+";"+rs.getString(2)+";";
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

	
	//Recepcion
	public static String GetContratacionDetalleRecepcion(int idContratacion) {
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select cd.idcontratacionDetalle, \r\n"
					+ "a.beneficiario, \r\n"
					+ "a.numProcesoCompra, \r\n"
					+ "coc.nombreProveedor, \r\n"
					+ "cv.numItem, \r\n"
					+ "cv.codigoATC, \r\n"
					+ "cv.codigoSesal, \r\n"
					+ "cv.nombreMedicamento, \r\n"
					+ "cv.descripcionTecnica,\r\n"
					+ "cv.unidadPresentacion, \r\n"
					+ "cv.nombreFabricante, \r\n"
					+ "cv.paisOrigen, \r\n"
					+ "cv.marca, \r\n"
					+ "cv.modelo, \r\n"
					+ "cv.cantidadComprada, \r\n"
					+ "cv.precioUnitario, \r\n"
					+ "(CAST((CAST(cv.precioUnitario AS DECIMAL(20, 4))*cv.cantidadComprada) AS DECIMAL(20, 4))) as precioTotal,\r\n"
					+ "cv.tiemposEntrega, \r\n"
					+ "cv.vidaUtil, \r\n"
					+ "cv.observaciones, \r\n"
					+ "coc.tipoDocuemnto, \r\n"
					+ "coc.numDocumento, \r\n"
					+ "coc.fechaSuscripcion, \r\n"
					+ "cd.fechaLimiteEntrega, \r\n"
					+ "cd.numeroEntrega, \r\n"
					+ "cd.cantidadEntregarSegunPlazos,\r\n"
					+ "cd.cantidadEntregada, \r\n"
					+ "(CAST((CAST(cv.precioUnitario AS DECIMAL(20, 4))*cd.cantidadEntregada) AS DECIMAL(20, 4))) as totalEntregado,\r\n"
					+ "cd.cantidadCancelada, \r\n"
					+ "(CAST((CAST(cv.precioUnitario AS DECIMAL(20, 4))*cd.cantidadCancelada) AS DECIMAL(20, 4))) as valorCancelado,\r\n"
					+ "cd.motivoCancelacion, \r\n"
					+ "cd.fechaSolicitudCita, \r\n"
					+ "cd.diasExoneradosMulta, \r\n"
					+ "cd.diasAtrasoEntrega, \r\n"
					+ "(CAST((CAST((CAST((CAST(cv.precioUnitario AS DECIMAL (20, 4))* cd.cantidadEntregada)*0.5 AS DECIMAL (20, 4))) *cd.diasAtrasoEntrega AS DECIMAL (20, 4)))/30 AS DECIMAL (20, 4) )) AS multaEntrega,\r\n"
					+ "(CAST(cv.precioUnitario AS DECIMAL (20, 4))*cd.cantidadEntregada) -   (CAST((CAST((CAST((CAST(cv.precioUnitario AS DECIMAL (20, 4))*cd.cantidadEntregada)*0.5 AS DECIMAL (20, 4))) *cd.diasAtrasoEntrega AS DECIMAL (20, 4)))/30 AS DECIMAL (20, 4)))AS valorNetoPagar,\r\n"
					+ "cd.cancelada,\r\n"
					+ "cd.entregada,\r\n"
					+ "cd.idContratacionVaciado\r\n"
					+ "from Gral.aperturaProceso as a \r\n"
					+ "inner join Gral.contratoOrdenCompra as coc on a.idAperturaProceso = coc.idAperturaProceso \r\n"
					+ "inner join Gral.contratacion as c on c.idcontratoOrdenCompra = coc.idcontratoOrdenCompra \r\n"
					+ "inner join Gral.contratacionVaciado as cv on cv.idContratacion = c.idContratacion \r\n"
					+ "inner join Gral.contratacionDetalle as cd on cd.idContratacionVaciado = cv.idContratacionVaciado \r\n"
					+ "where c.idContratacion = ?  and cd.estado = 'true' and cd.cancelada = 'false'");
			ps.setInt(1, idContratacion);			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getInt(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""						    
						    + rs.getString(5) + "\"," + "\""
						    + rs.getString(6) + "\"," + "\""						   
						    + rs.getString(7) + "\"," + "\""
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"," + "\""						    
						    + rs.getString(10) + "\"," + "\""
						    + rs.getString(11) + "\"," + "\""
						    + rs.getString(12) + "\"," + "\""
						    + rs.getString(13) + "\"," + "\""						   
						    + rs.getString(14) + "\"," + "\""
						    + rs.getString(15) + "\"," + "\""
						    + rs.getString(16) + "\"," + "\""
						    + rs.getString(17) + "\"," + "\""						    
						    + rs.getString(18) + "\"," + "\""
						    + rs.getString(19) + "\"," + "\""						   
						    + rs.getString(20) + "\"," + "\""
						    + rs.getString(21) + "\"," + "\""
						    + rs.getString(22) + "\"," + "\""						    
						    + rs.getString(23) + "\"," + "\""
						    + rs.getString(24) + "\"," + "\""
						    + rs.getString(25) + "\"," + "\""
						    + rs.getString(26) + "\"," + "\""						   
						    + rs.getString(27) + "\"," + "\""
						    + rs.getString(28) + "\"," + "\""
						    + rs.getString(29) + "\"," + "\""
						    + rs.getString(30) + "\"," + "\""
						    + rs.getString(31) + "\"," + "\""
						    + rs.getString(32) + "\"," + "\""
						    + rs.getString(33) + "\"," + "\""
						    + rs.getString(34) + "\"," + "\""
						    + rs.getString(35) + "\"," + "\""
						    + rs.getString(36) + "\"," + "\""
						    + rs.getString(37) + "\"," + "\""
						    + rs.getString(38) + "\"," + "\""
						    + rs.getString(39) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" +
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"," + "\"" + 
						  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}

	public static int updateDetalleRecepcion(Gral_contratacionDetalle recepcion) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacionDetalle set fechaSolicitudCita=?, fechaRecepcion=?, lugarRecepcion=?, numFactura=?, cantidadEntregada=?, diasAtrasoEntrega=?, diasExoneradosMulta=?, tiempoEntrega=?, vidaUtilAceptar=?, numActaRecepcion=?, numCagarantiaCumplimientoCalidad=?, entregada=? where idcontratacionDetalle=?");
			ps.setString(1, recepcion.getFechaSolicitudCita());		
			ps.setString(2, recepcion.getFechaRecepcion());
			ps.setString(3, recepcion.getLugarRecepcion());
			ps.setString(4, recepcion.getNumFactura());	
			ps.setInt(5, recepcion.getCantidadEntregada());
			ps.setInt(6, recepcion.getDiasAtrasoEntrega());
			ps.setInt(7, recepcion.getDiasExoneradosMulta());
			ps.setInt(8, recepcion.getTiempoEntrega());
			ps.setString(9, recepcion.getVidaUtilAceptar());
			ps.setString(10, recepcion.getNumActaRecepcion());
			ps.setString(11, recepcion.getNumCagarantiaCumplimientoCalidad());
			ps.setBoolean(12, recepcion.getEntregada());
			ps.setInt(13, recepcion.getIdcontratacionDetalle());
			
			
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}

	public static String GetContratacionDetalleRecepcionCanceladas(int idContratacion) {
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select  a.beneficiario,  \r\n"
					+ "	    a.numProcesoCompra,  \r\n"
					+ "	    coc.nombreProveedor,  \r\n"
					+ "	    cv.numItem,  \r\n"
					+ "	    cv.codigoATC,  \r\n"
					+ "	    cv.codigoSesal,  \r\n"
					+ "	    cv.nombreMedicamento,  \r\n"
					+ "	    cv.descripcionTecnica,  \r\n"
					+ "	    cv.unidadPresentacion,  \r\n"
					+ "	    cv.nombreFabricante,  \r\n"
					+ "	    cv.paisOrigen,  \r\n"
					+ "	    cv.marca,  \r\n"
					+ "	    cv.modelo,  \r\n"
					+ "	    cv.cantidadComprada,  \r\n"
					+ "	    cv.precioUnitario,  \r\n"
					+ "	    (cv.cantidadComprada *  CONVERT(float, cv.precioUnitario)) as precioTotal,  \r\n"
					+ "	    cv.tiemposEntrega,  \r\n"
					+ "	    cv.vidaUtil,  \r\n"
					+ "	    cv.observaciones,  \r\n"
					+ "	    coc.tipoDocuemnto,  \r\n"
					+ "	    coc.numDocumento,  \r\n"
					+ "	    coc.fechaSuscripcion,  \r\n"
					+ "	    cd.fechaLimiteEntrega,  \r\n"
					+ "	    cd.numeroEntrega,  \r\n"
					+ "	    cd.cantidadEntregarSegunPlazos, \r\n"
					+ "	    cd.cantidadEntregada,  \r\n"
					+ "	    ((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario)) as totalEntregado,  \r\n"
					+ "	    cd.cantidadCancelada,  \r\n"
					+ "	    (cd.cantidadCancelada*CONVERT(float, cv.precioUnitario)) as valorCancelado,  \r\n"
					+ "	    cd.motivoCancelacion,  \r\n"
					+ "	    cd.fechaSolicitudCita,  \r\n"
					+ "	    cd.diasExoneradosMulta,  \r\n"
					+ "	    cd.diasAtrasoEntrega,  \r\n"
					+ "	    (((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30 as multaEntrega,  \r\n"
					+ "	    ((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30) as  valorNetoPagar\r\n"
					+ "	    from Gral.aperturaProceso as a  \r\n"
					+ "	    inner join Gral.contratoOrdenCompra as coc on a.idAperturaProceso = coc.idAperturaProceso  \r\n"
					+ "	    inner join Gral.contratacion as c on c.idcontratoOrdenCompra = coc.idcontratoOrdenCompra  \r\n"
					+ "	    inner join Gral.contratacionVaciado as cv on cv.idContratacion = c.idContratacion  \r\n"
					+ "	    inner join Gral.contratacionDetalle as cd on cd.idContratacionVaciado = cv.idContratacionVaciado  \r\n"
					+ "	    where c.idContratacion = ?  and cd.estado = 'true' and cd.cancelada = 'true'");
			ps.setInt(1, idContratacion);			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getString(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""						    
						    + rs.getString(5) + "\"," + "\""
						    + rs.getString(6) + "\"," + "\""						   
						    + rs.getString(7) + "\"," + "\""
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"," + "\""						    
						    + rs.getString(10) + "\"," + "\""
						    + rs.getString(11) + "\"," + "\""
						    + rs.getString(12) + "\"," + "\""
						    + rs.getString(13) + "\"," + "\""						   
						    + rs.getString(14) + "\"," + "\""
						    + rs.getString(15) + "\"," + "\""
						    + rs.getString(16) + "\"," + "\""
						    + rs.getString(17) + "\"," + "\""						    
						    + rs.getString(18) + "\"," + "\""
						    + rs.getString(19) + "\"," + "\""						   
						    + rs.getString(20) + "\"," + "\""
						    + rs.getString(21) + "\"," + "\""
						    + rs.getString(22) + "\"," + "\""						    
						    + rs.getString(23) + "\"," + "\""
						    + rs.getString(24) + "\"," + "\""
						    + rs.getString(25) + "\"," + "\""
						    + rs.getString(26) + "\"," + "\""						   
						    + rs.getString(27) + "\"," + "\""
						    + rs.getString(28) + "\"," + "\""
						    + rs.getString(29) + "\"," + "\""
						    + rs.getString(30) + "\"," + "\""
						    + rs.getString(31) + "\"," + "\""
						    + rs.getString(32) + "\"," + "\""
						    + rs.getString(33) + "\"," + "\""
						    + rs.getString(34) + "\"," + "\""						
						    + rs.getString(35) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}

	
	//Resultado Calidad
	public static int saveresultadosCalidad(Gral_resultadoAnalisCalidad resultadoAnalisCalidad) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("insert into Gral.resultadoAnalisCalidad(idcontratacionDetalle, numInformeResultadoAnalisis, resultadoAnalisisCalidad, numLoteFabricanteAnalizado, observaciones) values(?,?,?,?,?)");
			ps.setInt(1, resultadoAnalisCalidad.getIdcontratacionDetalle());			
			ps.setString(2, resultadoAnalisCalidad.getnumInformeResultadoAnalisis());		
			ps.setString(3, resultadoAnalisCalidad.getResultadoAnalisisCalidad());
			ps.setString(4, resultadoAnalisCalidad.getNumLoteFabricanteAnalizado());
			ps.setString(5, resultadoAnalisCalidad.getObservaciones());
			contrato = ps.executeUpdate();					
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}

	public static String GetResultadoCalidadXDetalle(int idcontratacionDetalle) {
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select idResultadoAnalisCalidad, numInformeResultadoAnalisis, resultadoAnalisisCalidad, numLoteFabricanteAnalizado, observaciones from Gral.resultadoAnalisCalidad where idcontratacionDetalle =?");
			ps.setInt(1, idcontratacionDetalle);			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getInt(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""					    
						    + rs.getString(5) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" + 								 
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}
	
	public static int cancelarDetalleRecepcion(Gral_contratacionDetalle recepcion) {
		int cancelado = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE  Gral.contratacionDetalle set cantidadCancelada=?, cancelada=?, motivoCancelacion=? where idcontratacionDetalle=?");
			ps.setInt(1, recepcion.getCantidadCancelada());		
			ps.setBoolean(2, recepcion.getCancelada());
			ps.setString(3, recepcion.getMotivoCancelacion());
			ps.setInt(4, recepcion.getIdcontratacionDetalle());			
			cancelado = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cancelado;
	}
	
	///METODO DE CONTROL DE PAGOS
	public static String GetItemXidcontratacionDetalle(int idContratacion) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select CV.numItem, Concat('NO.ITEM:', CV.numItem, ' PRODUCTO:', CV.nombreMedicamento) from Gral.contratacionDetalle CD \r\n"
					+ "inner join Gral.contratacionVaciado CV ON CD.idContratacionVaciado = CV.idContratacionVaciado\r\n"
					+ "inner join Gral.contratacion C ON CV.idContratacion = C.idContratacion \r\n"
					+ "where C.idContratacion = ?   and entregada = 'True' \r\n"
					+ "group by CV.numItem ,CV.nombreMedicamento");
			ps.setInt(1, idContratacion);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String item =  "<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>";
				j += item + ",";
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
	
	public static String GetFacturasXContratacion(int idContratacion) {
		String reqList = "";
		try {
			Connection con = Database.connect();			
			PreparedStatement ps = con.prepareStatement("select cd.numFactura from Gral.contratacionDetalle as cd \r\n"
					+ "inner join Gral.contratacionVaciado as cv on cv.idContratacionVaciado = cd.idContratacionVaciado\r\n"
					+ "inner join Gral.contratacion as c on c.idContratacion = cv.idContratacion\r\n"
					+ "where c.idContratacion = ? and entregada = 'true'\r\n"
					+ "group by cd.numFactura");
			ps.setInt(1, idContratacion);
			String j = "";
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				String item =  "<option value="+rs.getString(1)+">"+rs.getString(1)+"</option>";
				j += item + ",";
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

	public static String GetPagosXFactura(int idContratacion, String numFactura) {
		System.out.println(idContratacion+" "+ numFactura);
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select cd.idcontratacionDetalle, \r\n"
													+ "	   cv.numItem, \r\n"
													+ "	   cv.nombreMedicamento, \r\n"
													+ "	   cd.fechaLimiteEntrega, \r\n"
													+ "	   cd.fechaRecepcion, \r\n"
													+ "	   cd.fechaSolicitudCita, \r\n"
													+ "	   cd.diasAtrasoEntrega,\r\n"
													+ "	   cd.diasExoneradosMulta,\r\n"
													+ "	   (((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30 as multaEntrega,\r\n"
													+ "	   ((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario)) as totalEntregado,\r\n"
													+ "	   ((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30) as  valorNetoPagar,\r\n"
													+ "	   cd.numActaRecepcion,\r\n"
													+ "	   cd.numCagarantiaCumplimientoCalidad,\r\n"
													+ "	   cd.pagada\r\n"
													+ "from Gral.contratacionDetalle as cd\r\n"
													+ "inner join Gral.contratacionVaciado as cv on cv.idContratacionVaciado = cd.idContratacionVaciado\r\n"
													+ "inner join Gral.contratacion as c on c.idContratacion = cv.idContratacion\r\n"
													+ "where c.idContratacion = ? and numFactura = ? and entregada = 'true' and pagada = 'false'");
			ps.setInt(1, idContratacion);	
			ps.setString(2, numFactura);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getInt(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""
						    + rs.getString(5) + "\"," + "\""
						    + rs.getString(6) + "\"," + "\""
						    + rs.getString(7) + "\"," + "\""
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"," + "\""
						    + rs.getString(10) + "\"," + "\""
						    + rs.getString(11) + "\"," + "\""
						    + rs.getString(12) + "\"," + "\""
						    + rs.getString(13) + "\"," + "\""
						    + rs.getString(14) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}

	public static int updatePago(Gral_contratacionDetalle contratacionPago) {
		int contrato = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("update Gral.contratacionDetalle set factorCambio =?, fechafactorCambio=?, pagada =?, cheque=?, banco=?, numCuenta=? where idcontratacionDetalle=?");
			ps.setFloat(1, contratacionPago.getFactorCambio());				
			ps.setString(2, contratacionPago.getFechafactorCambio());
			ps.setBoolean(3, true);
			ps.setString(4, contratacionPago.getCheque());
			ps.setString(5, contratacionPago.getBanco());
			ps.setString(6, contratacionPago.getNumCuenta());
			ps.setInt(7, contratacionPago.getIdcontratacionDetalle());
			contrato = ps.executeUpdate();			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return contrato;
	}
	
	public static String GetResumenPago(int idContratacion, String numFactura) {
		System.out.println(idContratacion+" "+ numFactura);
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select cv.numItem ,\r\n"
					+ "	   cd.numFactura,  \r\n"
					+ "	   cd.fechaLimiteEntrega,  \r\n"
					+ "	   cd.fechaRecepcion,  \r\n"
					+ "	   cd.fechaSolicitudCita,  \r\n"
					+ "	   cd.diasAtrasoEntrega, \r\n"
					+ "	   cd.diasExoneradosMulta, \r\n"
					+ "	   c.monedaCompra,\r\n"
					+ "	   ((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario)) as valorFactura, \r\n"
					+ "	   (((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30 as multaEntrega, 	  \r\n"
					+ "	   ((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30) as  valorNetoPagar, \r\n"
					+ "	   cd.factorCambio,\r\n"
					+ "	   cd.fechafactorCambio,\r\n"
					+ "	   (((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario))*cd.factorCambio) as valorFacturaLPS, \r\n"
					+ "	   (((((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30)*cd.factorCambio) as multaEntregaLPS,\r\n"
					+ "	   (((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30)*cd.factorCambio) as  valorNetoPagarLPS\r\n"
					+ "from Gral.contratacionDetalle as cd \r\n"
					+ "inner join Gral.contratacionVaciado as cv on cv.idContratacionVaciado = cd.idContratacionVaciado \r\n"
					+ "inner join Gral.contratacion as c on c.idContratacion = cv.idContratacion \r\n"
					+ "where c.idContratacion = ? and numFactura = ? and pagada = 'true'");
			ps.setInt(1, idContratacion);	
			ps.setString(2, numFactura);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getString(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""
						    + rs.getString(5) + "\"," + "\""
						    + rs.getString(6) + "\"," + "\""
						    + rs.getString(7) + "\"," + "\""
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"," + "\""
						    + rs.getString(10) + "\"," + "\""
						    + rs.getString(11) + "\"," + "\""
						    + rs.getString(12) + "\"," + "\""
						    + rs.getString(13) + "\"," + "\""
						    + rs.getString(14) + "\"," + "\""
						    + rs.getString(15) + "\"," + "\""
						    + rs.getString(16) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 								 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}
	
	public static String GetControlPago(int idContratacion, String numFactura) {
		System.out.println(idContratacion+" "+ numFactura);
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement("select ap.beneficiario,  \r\n"
					+ "	   ap.numProcesoCompra,    \r\n"
					+ "	   c.monedaCompra,    \r\n"
					+ "	   coc.nombreProveedor,    \r\n"
					+ "	   cd.numFactura,  \r\n"
					+ "	   ((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario)) as valorFactura,   \r\n"
					+ "	   (((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30 as multaEntrega,  \r\n"
					+ "	   ((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30) as  valorNetoPagar,  \r\n"
					+ "	   CASE  \r\n"
					+ "	       WHEN c.monedaCompra = 'DOLARES AMERICANOS (USD)' THEN   \r\n"
					+ "	   	cd.fechafactorCambio    \r\n"
					+ "	       ELSE 'NO APLICA'  \r\n"
					+ "	   END AS fechafactorCambio,  \r\n"
					+ "	   CASE  \r\n"
					+ "	       WHEN c.monedaCompra = 'DOLARES AMERICANOS (USD)' THEN   \r\n"
					+ "	   	CONVERT (VARCHAR(50),(((cd.cantidadEntregada )*CONVERT(float, cv.precioUnitario))*cd.factorCambio))    \r\n"
					+ "	       ELSE 'NO APLICA'  \r\n"
					+ "	   END AS valorFacturaLPS,  \r\n"
					+ "	   CASE  \r\n"
					+ "	       WHEN c.monedaCompra = 'DOLARES AMERICANOS (USD)' THEN   \r\n"
					+ "	   	CONVERT (VARCHAR(50),(((((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30)*cd.factorCambio))    \r\n"
					+ "	       ELSE 'NO APLICA'  \r\n"
					+ "	   END AS multaEntregaLPS,  \r\n"
					+ "	   CASE  \r\n"
					+ "	       WHEN c.monedaCompra = 'DOLARES AMERICANOS (USD)' THEN   \r\n"
					+ "	   	CONVERT (VARCHAR(50),(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))-(((cd.cantidadEntregada*CONVERT(float, cv.precioUnitario))*0.5)*cd.diasAtrasoEntrega)/30)*cd.factorCambio))   \r\n"
					+ "	       ELSE 'NO APLICA'  \r\n"
					+ "	   END AS valorNetoPagarLPS  \r\n"
					+ "	   from Gral.contratacionDetalle as cd   \r\n"
					+ "	   inner join Gral.contratacionVaciado as cv on cv.idContratacionVaciado = cd.idContratacionVaciado  \r\n"
					+ "	   inner join Gral.contratacion as c on c.idContratacion = cv.idContratacion   \r\n"
					+ "	   inner join Gral.contratoOrdenCompra as coc on coc.idcontratoOrdenCompra = c.idcontratoOrdenCompra  \r\n"
					+ "	   inner join Gral.aperturaProceso as ap on ap.idAperturaProceso = coc.idcontratoOrdenCompra  \r\n"
					+ "	   where c.idContratacion = ? and numFactura = ? and pagada = 'true'");
			ps.setInt(1, idContratacion);	
			ps.setString(2, numFactura);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
			
			j += "[" + "\"" + rs.getString(1) + "\","+ "\"" 
						    + rs.getString(2) + "\"," + "\""
						    + rs.getString(3) + "\"," + "\""
						    + rs.getString(4) + "\"," + "\""
						    + rs.getString(5) + "\"," + "\""
						    + rs.getString(6) + "\"," + "\""
						    + rs.getString(7) + "\"," + "\""
						    + rs.getString(8) + "\"," + "\""
						    + rs.getString(9) + "\"," + "\""
						    + rs.getString(10) + "\"," + "\""
						    + rs.getString(11) + "\"," + "\""
						    + rs.getString(12) +  "\"],";
}
			if(count == 0) {
				j += "[" + "\"" + "-" + "\"," + "\"" + 							 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" +
								  "-" + "\"," + "\"" + 
								  "-" + "\"," + "\"" +
								  "-" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			
			listaRequemiento = j;
		
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(listaRequemiento);
		return listaRequemiento;
	}

}