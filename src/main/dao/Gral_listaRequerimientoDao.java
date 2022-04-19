package main.dao;

import main.model.*;
import main.model.Gral_listaRequerimientoDTO;
import main.Database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Gral_listaRequerimientoDao {


	public static int save(Gral_listaRequerimiento l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into Gral.listaRequerimiento(idOficioBeneficiario, codigoATC, codigoSesal, idMedicamento, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida, plazosEntrega, vidaUtil, observacionesBeneficiario, moneda) values(?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getIdOficioBeneficiario());
			ps.setString(2, l.getCodigoATC());
			ps.setString(3, l.getCodigoSesal());
			ps.setInt(4, l.getIdMedicamento());
			ps.setString(5, l.getNombreMedicamento());
			ps.setString(6, l.getDescripcionTecnica());
			ps.setString(7, l.getUnidadPresentacion());
			ps.setInt(8, l.getcantidadRequerida());
			ps.setString(9, l.getPlazosEntrega());
			ps.setString(10, l.getVidaUtil());
			ps.setString(11, l.getObservacionesBeneficiario());
			ps.setString(12, l.getMoneda());
			//ps.setInt(13, l.getNumItem());
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("GUARDO "+ status);
		return status;
	}

	public static String getListaRequerimientoXapertura(int idAperturaProceso) {
		String listaRequemiento = "";
		try {
			Connection con = Database.connect();	
			PreparedStatement ps = con.prepareStatement(
					"select lr.idlistaRequerimiento, ob.Oficio, ap.idBeneficiario, ap.beneficiario, lr.codigoATC, lr.codigoSesal, lr.idMedicamento, lr.nombreMedicamento,\r\n"
					+ "lr.descripcionTecnica, lr.unidadPresentacion, lr.cantidadRequerida, lr.plazosEntrega, lr.vidaUtil, lr.observacionesBeneficiario, lr.moneda\r\n"
					+ "from Gral.listaRequerimiento as lr\r\n"
					+ "inner join Gral.oficioBeneficiario as ob on lr.idOficioBeneficiario = ob.idOficioBeneficiario\r\n"
					+ "inner join Gral.aperturaProceso as ap on ap.idAperturaProceso = ob.idAperturaProceso\r\n"
					+ "where ob.idAperturaProceso = ? and lr.estado = 'true'");
			ps.setInt(1, idAperturaProceso);	
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				int idlistaRequerimiento = rs.getInt(1);
				String Oficio = rs.getString(2);
				int idBeneficiario = rs.getInt(3);
				String beneficiario = rs.getString(4);
				String codigoATC = rs.getString(5);
				String codigoSesal = rs.getString(6);
				int idMedicamento = rs.getInt(7);
				String nombreMedicamento = rs.getString(8);
				String descripcionTecnica = rs.getString(9);
				String unidadPresentacion = rs.getString(10);
				int cantidadRequerida = rs.getInt(11);
				String plazosEntrega = rs.getString(12);
				String vidaUtil = rs.getString(13);
				String observacionesBeneficiario = rs.getString(14);
				String moneda = rs.getString(15);

				j += "[" + "\"" + idlistaRequerimiento + "\","+ "\"" 
							    + Oficio + "\"," + "\""
							    + idBeneficiario + "\"," + "\""
							    + beneficiario + "\"," + "\""
							    + codigoATC + "\"," + "\""
							    + codigoSesal + "\"," + "\""
							    + idMedicamento + "\"," + "\""
							    + nombreMedicamento + "\"," + "\""
							    + descripcionTecnica + "\"," + "\""
							    + unidadPresentacion + "\"," + "\""
							    + String.format("%,d", cantidadRequerida) + "\"," + "\""
							    + plazosEntrega + "\"," + "\""
							    + vidaUtil + "\"," + "\""
							    + observacionesBeneficiario + "\"," + "\""
							    + moneda + "\"],";
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

		return listaRequemiento;
	}

	public static int GetNumItemXmedicamento(int idAperturaProceso, int idMedicamento) {
		
		int num_Item = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select numItem from Gral_View_listaRequerimiento where idAperturaProceso = ? and idMedicamento = ? group by numItem");		
				ps.setInt(1, idAperturaProceso);
				ps.setInt(2, idMedicamento);
			ResultSet rs = ps.executeQuery();
			
			if (rs.next()) {
				num_Item = rs.getInt(1);				
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println();
		}
		return num_Item;
	}

	public static int GetNumItemXapertura(int idAperturaProceso) {
	
	int num_Item = 0 ;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("select numItem from Gral_View_listaRequerimiento where idAperturaProceso = ? group by numItem");		
			ps.setInt(1, idAperturaProceso);			
		ResultSet rs = ps.executeQuery();		
		while (rs.next()) {
			num_Item++;		
		}			 
		con.close();
	} catch (Exception e) {
		System.out.println();
	}
	return num_Item;
}

	public static ArrayList<Gral_listaRequerimientoDTO> getListaRequerimiento(int idAperturaProceso){
		ArrayList<Gral_listaRequerimientoDTO> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select lr.idlistaRequerimiento, ob.Oficio, ap.idBeneficiario, ap.beneficiario, lr.codigoATC, lr.codigoSesal, lr.idMedicamento, lr.nombreMedicamento,\r\n"
					+ "lr.descripcionTecnica, lr.unidadPresentacion, lr.cantidadRequerida, lr.plazosEntrega, lr.vidaUtil, lr.observacionesBeneficiario, lr.moneda\r\n"
					+ "from Gral.listaRequerimiento as lr\r\n"
					+ "inner join Gral.oficioBeneficiario as ob on lr.idOficioBeneficiario = ob.idOficioBeneficiario\r\n"
					+ "inner join Gral.aperturaProceso as ap on ap.idAperturaProceso = ob.idAperturaProceso\r\n"
					+ "where ob.idAperturaProceso = ? and lr.estado = 'true'");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_listaRequerimientoDTO requerimiento = new Gral_listaRequerimientoDTO();				
				requerimiento.setIdlistaRequerimiento(rs.getInt(1));
				requerimiento.setOficio(rs.getString(2));
				requerimiento.setIdBeneficiario(rs.getInt(3));
				requerimiento.setBeneficiario(rs.getString(4));
				requerimiento.setCodigoATC(rs.getString(5));
				requerimiento.setCodigoSesal(rs.getString(6));	
				requerimiento.setIdMedicamento(rs.getInt(7));	
				requerimiento.setNombreMedicamento(rs.getString(8));	
				requerimiento.setDescripcionTecnica(rs.getString(9));	
				requerimiento.setUnidadPresentacion(rs.getString(10));	
				requerimiento.setCantidadRequerida(rs.getInt(11));	
				requerimiento.setPlazosEntrega(rs.getString(12));	
				requerimiento.setVidaUtil(rs.getString(13));	
				requerimiento.setObservacionesBeneficiario(rs.getString(14));	
				requerimiento.setMoneda(rs.getString(15));	
				List.add(requerimiento);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static int anularItem(int idlistaRequerimiento) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimiento SET  estado = ? WHERE idlistaRequerimiento = ?");
			ps.setBoolean(1, false);
			ps.setInt(2, idlistaRequerimiento);
						
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static int Update(int idlistaRequerimiento, int cantidadRequerida) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimiento SET  cantidadRequerida = ? WHERE idlistaRequerimiento = ?");
			ps.setInt(1, cantidadRequerida);
			ps.setInt(2, idlistaRequerimiento);
						
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	
	
	//Consolidado
	public static ArrayList<Gral_listaRequerimientoConsolidada> GeListaRequerimientoConsolidada(int idAperturaProceso){
		ArrayList<Gral_listaRequerimientoConsolidada> List = new ArrayList<>();
		try {
			
			//Iniciarmos primero ceteando el estado de las lista conslidado consolidado en false y numero de item 0 para asignar y hacer dinamico en caso que se quite un item que solo tenia un item	
				updateAllConsolidadoEstadoFalse(idAperturaProceso);
				Connection con = Database.connect();
				//En este query recolectamos toda la data lista de requerimientos solo que la agrupamos y la data se hala desde la vista 
				PreparedStatement ps = con.prepareStatement("SELECT idAperturaProceso, codigoATC, codigoSesal, idMedicamento, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida FROM Gral.View_listaRequerimientoConsolidada where idAperturaProceso = ?");
				ps.setInt(1, idAperturaProceso);
				ResultSet rs = ps.executeQuery();
				int numeroItem = 1;
				while (rs.next()) {
					Gral_listaRequerimientoConsolidada requerimiento = new Gral_listaRequerimientoConsolidada();				
					requerimiento.setIdAperturaProceso(rs.getInt(1));
					requerimiento.setCodigoATC(rs.getString(2));
					requerimiento.setCodigoSesal(rs.getString(3));
					requerimiento.setIdMedicamento(rs.getInt(4));
					requerimiento.setNombreMedicamento(rs.getString(5));
					requerimiento.setDescripcionTecnica(rs.getString(6));
					requerimiento.setUnidadPresentacion(rs.getString(7));	
					requerimiento.setCantidadRequerida(rs.getInt(8));
					requerimiento.setNumItem(numeroItem);
					requerimiento.setEstado(true);
					
					int idListaRequerimientoConsolidada = existeConsolidado(idAperturaProceso, requerimiento.getIdMedicamento());
					System.out.println("idListaRequerimientoConsolidada "+idListaRequerimientoConsolidada);
					if(idListaRequerimientoConsolidada == 0) {
						saveConsolidado(requerimiento);
					}else {
						requerimiento.setIdListaRequerimientoConsolidada(idListaRequerimientoConsolidada);
						updateConsolidado(requerimiento);
					}
					numeroItem++;
					//List.add(requerimiento);
				}
				
				List = getListConsolidada(idAperturaProceso);
				
				con.close();
					
			

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}

	public static int existeConsolidado(int idAperturaProceso, int idMedicamento) {		
		int idListaRequerimientoConsolidada = 0 ;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idListaRequerimientoConsolidada from Gral.listaRequerimientoConsolidada where idAperturaProceso = ? and idMedicamento = ?");		
				ps.setInt(1, idAperturaProceso);	
				ps.setInt(2, idMedicamento);
			ResultSet rs = ps.executeQuery();		
			if (rs.next()) {
				idListaRequerimientoConsolidada = rs.getInt(1);		
			}			 
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return idListaRequerimientoConsolidada;
	}

	public static int saveConsolidado(Gral_listaRequerimientoConsolidada l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("INSERT INTO Gral.listaRequerimientoConsolidada (idAperturaProceso, numItem, codigoATC, codigoSesal, idMedicamento, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida) VALUES (?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, l.getIdAperturaProceso());
			ps.setInt(2, l.getNumItem());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getCodigoSesal());
			ps.setInt(5, l.getIdMedicamento());
			ps.setString(6, l.getNombreMedicamento());
			ps.setString(7, l.getDescripcionTecnica());
			ps.setString(8, l.getUnidadPresentacion());
			ps.setInt(9, l.getCantidadRequerida());		
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateConsolidado(Gral_listaRequerimientoConsolidada l) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimientoConsolidada SET idAperturaProceso = ?, numItem = ?, codigoATC = ?, codigoSesal = ?, idMedicamento = ?, nombreMedicamento = ?, descripcionTecnica = ?, unidadPresentacion = ?, cantidadRequerida = ?, estado = ? WHERE idListaRequerimientoConsolidada =?");
			ps.setInt(1, l.getIdAperturaProceso());
			ps.setInt(2, l.getNumItem());
			ps.setString(3, l.getCodigoATC());
			ps.setString(4, l.getCodigoSesal());
			ps.setInt(5, l.getIdMedicamento());
			ps.setString(6, l.getNombreMedicamento());
			ps.setString(7, l.getDescripcionTecnica());
			ps.setString(8, l.getUnidadPresentacion());
			ps.setInt(9, l.getCantidadRequerida());		
			ps.setBoolean(10, l.getEstado());
			ps.setInt(11, l.getIdListaRequerimientoConsolidada());			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("status update " +status);
		return status;
	}

	public static ArrayList<Gral_listaRequerimientoConsolidada> getListConsolidada(int idAperturaProceso){
		ArrayList<Gral_listaRequerimientoConsolidada> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select numItem, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, cantidadRequerida  from Gral.listaRequerimientoConsolidada where idAperturaProceso =? and estado = 'true'");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_listaRequerimientoConsolidada requerimiento = new Gral_listaRequerimientoConsolidada();				
				requerimiento.setNumItem(rs.getInt(1));
				requerimiento.setCodigoATC(rs.getString(2));
				requerimiento.setNombreMedicamento(rs.getString(3));
				requerimiento.setDescripcionTecnica(rs.getString(4));
				requerimiento.setUnidadPresentacion(rs.getString(5));
				requerimiento.setCantidadRequerida(rs.getInt(6));								
				List.add(requerimiento);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static int updateAllConsolidadoEstadoFalse(int idAperturaProceso) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimientoConsolidada SET estado = ?, numItem = ? WHERE idAperturaProceso =?");
			ps.setBoolean(1, false);	
			ps.setInt(2, 0);
			ps.setInt(3, idAperturaProceso);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}
	
	public static ArrayList<Gral_listaRequerimientoConsolidada> getListConsolidadaAE(int idAperturaProceso){
		ArrayList<Gral_listaRequerimientoConsolidada> List = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idListaRequerimientoConsolidada, numItem,codigoATC, nombreMedicamento, descripcionTecnica,unidadPresentacion, cantidadRequerida,estado  from Gral.listaRequerimientoConsolidada where idAperturaProceso = ? and numItem  > 0");
			ps.setInt(1, idAperturaProceso);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Gral_listaRequerimientoConsolidada requerimiento = new Gral_listaRequerimientoConsolidada();				
				requerimiento.setIdListaRequerimientoConsolidada(rs.getInt(1));
				requerimiento.setNumItem(rs.getInt(2));
				requerimiento.setCodigoATC(rs.getString(3));
				requerimiento.setNombreMedicamento(rs.getString(4));
				requerimiento.setDescripcionTecnica(rs.getString(5));
				requerimiento.setUnidadPresentacion(rs.getString(6));
				requerimiento.setCantidadRequerida(rs.getInt(7));	
				requerimiento.setEstado(rs.getBoolean(8));
				List.add(requerimiento);
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return List;
	}
	
	public static String getMedicamentoLista(  ) {
		String meds = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("select  nombre from dbo.medicamentos where estado1 = 'APROBADO' and estado2 = 'ACTIVO'\r\n"
							+ "");
			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				
				String nombre = rs.getString(1);
			
			

				j +=  "\"" + nombre 
						+ "\",";


				count += 1;
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			meds = j;
			System.out.print(meds);
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println("medi " + meds);
		return meds;
	}
	
public static String getProductoSeleccionado( String nombreMedicamento) {	
		
		
		String medi = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select  codAtc, codSesal,  nombre, descripcion, up, codSist  from dbo.medicamentos where nombre =? and estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
			ps.setString(1, nombreMedicamento);
			String j = "";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			if (rs.next()) {	
				String codigoATC = rs.getString(1);	
				String codigoSesal = rs.getString(2);
				String medicamento = rs.getString(3);
				String descripcionTecnica = rs.getString(4);
				String unidadPresentacion = rs.getString(5);
				String codSist = rs.getString(6);
				j +=  "" + codigoATC + ";" 
						   + codigoSesal + ";" 
						   + medicamento + ";" 
						   + descripcionTecnica + ";" 
						   + unidadPresentacion + ";" 
						   + codSist + ";" ;				
				count += 1;
			}
			j = j.substring(0, j.length() - 1);
			j += "";
			medi = j;
			
			System.out.println(medi);
			
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return medi;
	}

public static int updatelistaConsolidado(int idAperturaProceso, int idMedicamento, int cantidadRequerida) {
	int status = 0;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimientoConsolidada SET cantidadRequerida = ? WHERE idAperturaProceso =? and idMedicamento = ?");
		ps.setInt(1, cantidadRequerida);	
		ps.setInt(2, idAperturaProceso);
		ps.setInt(3, idMedicamento);			
		status = ps.executeUpdate();
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return status;
}


public static String getListConsolidadaAEjson(int idAperturaProceso) {
	String listaRequemiento = "";
	try {
		Connection con = Database.connect();	
		PreparedStatement ps = con.prepareStatement("select idListaRequerimientoConsolidada, numItem,codigoATC, nombreMedicamento, descripcionTecnica,unidadPresentacion, cantidadRequerida,estado  from Gral.listaRequerimientoConsolidada where idAperturaProceso = ? and numItem  > 0");
		ps.setInt(1, idAperturaProceso);	
		String j = "{ \"data\":[";
		ResultSet rs = ps.executeQuery();
		int count = 0;
		while (rs.next()) {
			count++;
			int idListaRequerimientoConsolidada = rs.getInt(1);		
			int numItem = rs.getInt(2);
			String codigoATC = rs.getString(3);
			String nombreMedicamento = rs.getString(4);
			String descripcionTecnica = rs.getString(5);			
			String unidadPresentacion = rs.getString(6);
			String cantidadRequerida = rs.getString(7);
			Boolean estado = rs.getBoolean(8);
			String estadoConsolidado ="";
			
			if(estado == true) {
				estadoConsolidado = "ACTIVO";
			}else {
				estadoConsolidado = "INACTIVO";
			}
			

			j += "[" + "\"" + idListaRequerimientoConsolidada + "\","+ "\"" 
						    + numItem + "\"," + "\""
						    + codigoATC + "\"," + "\""
						    + nombreMedicamento + "\"," + "\""						    
						    + descripcionTecnica + "\"," + "\""
						    + unidadPresentacion + "\"," + "\""						   
						    + cantidadRequerida + "\"," + "\""
						    + estadoConsolidado + "\"],";
		}
			if(count == 0) {
			j += "[" + "\"" + "-" + "\"," + "\"" + 
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

	return listaRequemiento;
}


public static int updateConsolidadoItemAe(int idAperturaProceso, String nombreMedicamento, int cantidadRequerida, Boolean estado) {
	int status = 0;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimientoConsolidada SET cantidadRequerida = ?, estado = ? WHERE idAperturaProceso =? and nombreMedicamento = ?");
		ps.setInt(1, cantidadRequerida);
		ps.setBoolean(2, estado);
		ps.setInt(3, idAperturaProceso);
		ps.setString(4, nombreMedicamento);			
		status = ps.executeUpdate();
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return status;
}

public static int getMedicamentoExiste(int idAperturaProceso, int idMedicamento, int cantidad) {
	int meds = 0;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con
				.prepareStatement("select idListaRequerimientoConsolidada, estado,numItem, cantidadRequerida from Gral.listaRequerimientoConsolidada where idAperturaProceso = ? and idMedicamento= ?");
		ps.setInt(1, idAperturaProceso);
		ps.setInt(2, idMedicamento);
		ResultSet rs = ps.executeQuery();
		int count = 0;
		if (rs.next()) {
			if(rs.getBoolean(2)== false & rs.getInt(3) == 0)
			{
				///////// creamos un metodo para actualizar
				
				meds = updateAllConsolidadoEstadoInactivo( idAperturaProceso,  idMedicamento,  GetNumItemAE(idAperturaProceso),  cantidad);
				
				
			}
			else if(rs.getBoolean(2)== true & rs.getInt(3) > 0)
			{
				
				meds = updatelistaConsolidado( idAperturaProceso,  idMedicamento,  (cantidad + rs.getInt(4)));
				///////// creamos un metodo para actualizar
			}
			
		}
		else {
			Gral_listaRequerimientoConsolidada requerimiento = getProductoSeleccionado(idMedicamento);
			requerimiento.setIdAperturaProceso(idAperturaProceso);
			requerimiento.setNumItem(GetNumItemAE(idAperturaProceso));
			requerimiento.setCantidadRequerida(cantidad);
			
			meds = saveConsolidado(requerimiento);
		}
		
		System.out.print(meds);
	} catch (Exception e) {
		System.out.println(e);
	}
	System.out.println("medi " + meds);
	return meds;
}

public static int updateAllConsolidadoEstadoInactivo(int idAperturaProceso, int idMedicamento, int numItem, int cantidad) {
	int status = 0;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("UPDATE Gral.listaRequerimientoConsolidada SET estado = ?, numItem = ?, cantidad = ? WHERE idAperturaProceso =? and idMedicamento=?");
		ps.setBoolean(1, true);	
		ps.setInt(2, numItem);
		ps.setInt(3, cantidad);	
		ps.setInt(4, idAperturaProceso);
		ps.setInt(5, idMedicamento);
		status = ps.executeUpdate();
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return status;
}

public static int GetNumItemAE(int idAperturaProceso) {
	
	int num_Item = 0 ;
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("select count(numItem) from Gral.listaRequerimientoConsolidada where idAperturaProceso = ?  and numItem > 0");		
			ps.setInt(1, idAperturaProceso);
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			num_Item = rs.getInt(1)+1;				
		}			 
		con.close();
	} catch (Exception e) {
		System.out.println();
	}
	return num_Item;
}

public static Gral_listaRequerimientoConsolidada getProductoSeleccionado( int idMedicamento) {	
	
	
	Gral_listaRequerimientoConsolidada requerimiento = new Gral_listaRequerimientoConsolidada();
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement(
				"select  codAtc, codSesal,  nombre, descripcion, up, codSist  from dbo.medicamentos where codSist =? and estado1 = 'APROBADO' and estado2 = 'ACTIVO'");
		ps.setInt(1, idMedicamento);
		String j = "";
		ResultSet rs = ps.executeQuery();
		int count = 0;
		if (rs.next()) {
			requerimiento.setCodigoATC(rs.getString(1));
			requerimiento.setCodigoSesal(rs.getString(2));
			requerimiento.setNombreMedicamento(rs.getString(3));
			requerimiento.setDescripcionTecnica(rs.getString(4));
			requerimiento.setUnidadPresentacion(rs.getString(5));
			requerimiento.setIdMedicamento(rs.getInt(6));
		}	
		
		con.close();
	} catch (Exception e) {
		System.out.println(e);
	}
	return requerimiento;
}
	
public static ArrayList<Gral_listaRequerimientoConsolidada> getListConsolidadaBycontratoOrden(int idcontratoOrdenCompra){
	ArrayList<Gral_listaRequerimientoConsolidada> List = new ArrayList<>();
	try {
		Connection con = Database.connect();
		PreparedStatement ps = con.prepareStatement("SELECT lrc.numItem, lrc.codigoATC, lrc.codigoSesal, lrc.nombreMedicamento, lrc.descripcionTecnica, lrc.unidadPresentacion \r\n"
				+ "FROM Gral.listaRequerimientoConsolidada as lrc\r\n"
				+ "inner join Gral.contratoOrdenCompra as coc on lrc.idAperturaProceso = coc.idAperturaProceso\r\n"
				+ "where coc.idcontratoOrdenCompra = ? and lrc.estado = 'true' and lrc.numItem > 0");
		ps.setInt(1, idcontratoOrdenCompra);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Gral_listaRequerimientoConsolidada requerimiento = new Gral_listaRequerimientoConsolidada();				
			requerimiento.setNumItem(rs.getInt(1));
			requerimiento.setCodigoATC(rs.getString(2));
			requerimiento.setCodigoSesal(rs.getString(3));
			requerimiento.setNombreMedicamento(rs.getString(4));
			requerimiento.setDescripcionTecnica(rs.getString(5));
			requerimiento.setUnidadPresentacion(rs.getString(6));								
			List.add(requerimiento);
		}
		con.close();

	} catch (Exception e) {
		System.out.println(e);
	}
	return List;
}

}
	