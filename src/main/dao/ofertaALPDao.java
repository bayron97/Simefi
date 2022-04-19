package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ofertaALPDao {
	public static int save(ofertaALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.ofertaALP (procesoCompra, fechaOferta, distribuidor, medicamentoEstimado, up, precio, moneda, codATC, medicamentoOfertado, descripcionTecnica, recomendacionComite, criterioRecomendacion, observaciones, recomendacionesBeneficiario, codPadre, noOfertasRecibidas, nombreFabricante, registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, muestraPresentada, noFoliosOferta, obsOfertasProv, consultasArsa, consultasBenef, solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio, historialContrato, cantidadCriterio, icotermCriterio, regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil, garantiaFabrica, cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio, mantenimientoCapCriterio, idConsolidado, idItem, estado, numSanitario, numCertif, paisOrigen, descripcionTecnicaRequerida, unidadPresentacionRequerida, canEstimadaOferta, noOfertaIngresada, codSesal, obsOfertaCEO, cantidadRequerida) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)", java.sql.Statement.RETURN_GENERATED_KEYS);
			ps.setString(1, o.getProcesoCompra());
			ps.setString(2, o.getFechaOferta());
			ps.setString(3, o.getDistribuidor());
			ps.setString(4, o.getMedicamentoEstimado());
			ps.setString(5, o.getUp());
			ps.setString(6, o.getPrecio());
			ps.setString(7, o.getMoneda());
			ps.setString(8, o.getCodATC());
			ps.setString(9, o.getMedicamentoOfertado());
			ps.setString(10, o.getDescripcionTecnica());
			ps.setString(11, o.getRecomendacionComite());
			ps.setString(12, o.getCriterioRecomendacion());
			ps.setString(13, o.getObservaciones());
			ps.setString(14, o.getRecomendacionesBeneficiario());
			ps.setInt(15, o.getCodPadre());
			ps.setInt(16, o.getNoOfertasRecibidas());
			ps.setString(17, o.getNombreFabricante());
			ps.setString(18, o.getRegistroSanitario());
			ps.setString(19, o.getFechaVencSan());
			ps.setString(20, o.getFechaEmisionSan());
			ps.setString(21, o.getCertificadoManufactura());
			ps.setString(22, o.getFechaVencManufactura());
			ps.setString(23, o.getFechaEmisionManufactura());
			ps.setString(24, o.getEtiquetadoPrimario());
			ps.setString(25, o.getEtiquetadoSecundario());
			ps.setString(26, o.getEtiquetadoTerciario());
			ps.setString(27, o.getMuestraPresentada());
			ps.setString(28, o.getNoFoliosOferta());
			ps.setString(29, o.getObsOfertaProv());
			ps.setString(30, o.getConsultasArsa());
			ps.setString(31, o.getConsultasBenef());
			ps.setString(32, o.getSolicitudesAclaracion());
			ps.setString(33, o.getRespuestaSolicitudesAclaracion());
			ps.setString(34, o.getRegistroProveedor());
			ps.setString(35, o.getDescTecnicaCriterio());
			ps.setString(36, o.getHistorialContrato());
			ps.setString(37, o.getCantidadCriterio());
			ps.setString(38, o.getIcotermCriterio());
			ps.setString(39, o.getRegSanitarioCriterio());
			ps.setString(40, o.getGarantiaOfertaCriterio());
			ps.setString(41, o.getTiempoEntrega());
			ps.setString(42, o.getVidaUtil());
			ps.setString(43, o.getGarantiaFabrica());
			ps.setString(44, o.getCartaCompromisoCriterio());
			ps.setString(45, o.getAseguramientoCalidad());
			ps.setString(46, o.getRazonabilidadPrecios());
			ps.setString(47, o.getCertificadoCriterio());
			ps.setString(48, o.getMantenimientoCapCriterio());
			ps.setLong(49, o.getIdConsolidado());
			ps.setLong(50, o.getIdItem());
			ps.setString(51, o.getEstado());
			ps.setString(52, o.getNumSanitario());
			ps.setString(53, o.getNumCertif());
			ps.setString(54, o.getPaisOrigen());
			ps.setString(55, o.getDescripcionTecnicaRequerida());
			ps.setString(56, o.getUnidadPresentacionRequerida());
			ps.setInt(57, o.getcanEstimadaOferta());
			ps.setInt(58, o.getnoOfertaIngresada());
			ps.setString(59, o.getcodSesal());
			ps.setString(60, o.getobsOfertaCEO());
			ps.setFloat(61, o.getcantidadRequerida());
			
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

	public static int updateOfferData(ofertaALP o, String purchaseNumber, long itemID) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.ofertaALP set fechaOferta = ?, distribuidor = ?, medicamentoEstimado = ?, up = ?, precio = ?, moneda = ?, codATC =?, medicamentoOfertado = ?, descripcionTecnica = ?, codPadre = ?, noOfertasRecibidas = ?, nombreFabricante = ?, registroSanitario = ?, fechaVencSan = ?, fechaEmisionSan = ?, certificadoManufactura = ?, fechaVencManufactura = ?, fechaEmisionManufactura = ?, etiquetadoPrimario = ?, etiquetadoSecundario = ?, etiquetadoTerciario = ?, muestraPresentada = ?, noFoliosOferta = ?, obsOfertasProv = ?, consultasArsa = ?, consultasBenef = ?, solicitudesAclaracion = ?, respuestaSolicitudesAclaracion = ?, registroProveedor = ?, descTecnicaCriterio = ?, historialContrato = ?, cantidadCriterio = ?, icotermCriterio = ?, regSanitarioCriterio = ?, garantiaOfertaCriterio = ?, tiempoEntrega = ?, vidaUtil = ?, garantiaFabrica = ?, cartaCompromisoCriterio = ?, aseguramientoCalidad = ?, razonabilidadPrecios = ?, certificadoCriterio = ?, mantenimientoCapCriterio = ?, idConsolidado = ?, estado = ?, numSanitario = ?, numCertif = ?, paisOrigen = ?, descripcionTecnicaRequerida = ?, unidadPresentacionRequerida = ?, noOfertaIngresada = ?, obsOfertaCEO =?, canEstimadaOferta =? where noOferta = ? ");
			ps.setString(1, o.getFechaOferta());
			ps.setString(2, o.getDistribuidor());
			ps.setString(3, o.getMedicamentoEstimado());
			ps.setString(4, o.getUp());
			ps.setString(5, o.getPrecio());
			ps.setString(6, o.getMoneda());
			ps.setString(7, o.getCodATC());
			ps.setString(8, o.getMedicamentoOfertado());
			ps.setString(9, o.getDescripcionTecnica());
			ps.setInt(10, o.getCodPadre());
			ps.setInt(11, 1);
			ps.setString(12, o.getNombreFabricante());
			ps.setString(13, o.getRegistroSanitario());
			ps.setString(14, o.getFechaVencSan());
			ps.setString(15, o.getFechaEmisionSan());
			ps.setString(16, o.getCertificadoManufactura());
			ps.setString(17, o.getFechaVencManufactura());
			ps.setString(18, o.getFechaEmisionManufactura());
			ps.setString(19, o.getEtiquetadoPrimario());
			ps.setString(20, o.getEtiquetadoSecundario());
			ps.setString(21, o.getEtiquetadoTerciario());
			ps.setString(22, o.getMuestraPresentada());
			ps.setString(23, o.getNoFoliosOferta());
			ps.setString(24, o.getObsOfertaProv());
			ps.setString(25, o.getConsultasArsa());
			ps.setString(26, o.getConsultasBenef());
			ps.setString(27, o.getSolicitudesAclaracion());
			ps.setString(28, o.getRespuestaSolicitudesAclaracion());
			ps.setString(29, o.getRegistroProveedor());
			ps.setString(30, o.getDescTecnicaCriterio());
			ps.setString(31, o.getHistorialContrato());
			ps.setString(32, o.getCantidadCriterio());
			ps.setString(33, o.getIcotermCriterio());
			ps.setString(34, o.getRegSanitarioCriterio());
			ps.setString(35, o.getGarantiaOfertaCriterio());
			ps.setString(36, o.getTiempoEntrega());
			ps.setString(37, o.getVidaUtil());
			ps.setString(38, o.getGarantiaFabrica());
			ps.setString(39, o.getCartaCompromisoCriterio());
			ps.setString(40, o.getAseguramientoCalidad());
			ps.setString(41, o.getRazonabilidadPrecios());
			ps.setString(42, o.getCertificadoCriterio());
			ps.setString(43, o.getMantenimientoCapCriterio());
			ps.setLong(44, o.getIdConsolidado());
			ps.setString(45, o.getEstado());
			ps.setString(46, o.getNumSanitario());
			ps.setString(47, o.getNumCertif());
			ps.setString(48, o.getPaisOrigen());
			ps.setString(49, o.getDescripcionTecnicaRequerida());
			ps.setString(50, o.getUnidadPresentacionRequerida());
			ps.setInt(51, o.getnoOfertaIngresada());
			ps.setString(52, o.getobsOfertaCEO());
			ps.setInt(53, o.getcanEstimadaOferta());
			ps.setInt(54, Integer.parseInt(o.getnoOferta()));
			//ps.setLong(53, itemID);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteOne(int noOferta) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from dbo.ofertaALP where noOferta = ?");
			ps.setInt(1, noOferta);			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ofertaALP getOneAprovBasic(String purchaseNumber, int idItem) {
		ofertaALP o = new ofertaALP();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct idItem, medicamentoEstimado, medicamentoOfertado, up, unidadPresentacionRequerida, descripcionTecnica, descripcionTecnicaRequerida, codATC, distribuidor, numSanitario, numCertif, nombreFabricante, precio, moneda, fechaOferta, recomendacionesBeneficiario, paisOrigen, fechaVencSan, fechaVencManufactura from dbo.ofertaALP where procesoCompra = ? and idItem = ?");
			ps.setString(1, purchaseNumber);
			ps.setLong(2, idItem);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				o.setIdItem(rs.getInt(1));
				o.setMedicamentoEstimado(rs.getString(2));
				o.setMedicamentoOfertado(rs.getString(3));
				o.setUp(rs.getString(4));
				if (rs.getString(4) == null) {
					o.setUp("NINGUNA");
				}
				o.setUnidadPresentacionRequerida(rs.getString(5));
				if (rs.getString(5) == null) {
					o.setUnidadPresentacionRequerida("NINGUNA");
				}
				o.setDescripcionTecnica(rs.getString(6));
				if (rs.getString(6) == null) {
					o.setDescripcionTecnica("NO AGREGADA");
				}
				o.setDescripcionTecnicaRequerida(rs.getString(7));
				if (rs.getString(7) == null) {
					o.setDescripcionTecnicaRequerida("NO AGREGADA");
				}
				o.setCodATC(rs.getString(8));
				o.setDistribuidor(rs.getString(9));
				o.setNumSanitario(rs.getString(10));
				if (rs.getString(10) == null) {
					o.setNumSanitario("NO AGREGADO");
				}
				o.setNumCertif(rs.getString(11));
				if (rs.getString(11) == null) {
					o.setNumCertif("NINGUNO");
				}
				o.setNombreFabricante(rs.getString(12));
				o.setPrecio(rs.getString(13));
				o.setMoneda(rs.getString(14));
				o.setFechaOferta(rs.getString(15));
				o.setRecomendacionesBeneficiario(rs.getString(16));
				if (rs.getString(16) == null) {
					o.setRecomendacionesBeneficiario("-");
				}
				o.setPaisOrigen(rs.getString(17));
				if (rs.getString(17) == null) {
					o.setPaisOrigen("NO AGREGADO");
				}
				o.setFechaVencSan(rs.getString(18));
				if (rs.getString(18) == null) {
					o.setFechaVencSan("NO AGREGADA");
				}
				o.setFechaVencManufactura(rs.getString(19));
				if (rs.getString(19) == null) {
					o.setFechaVencManufactura("NO AGREGADA");
				}
			}
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		return o;
	}

	public static int getCantMedsByProcAndReqID(long reqID, String proc) {
		int cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select count(*) from dbo.ofertaALP where idConsolidado = ? and procesoCompra = ?");
			ps.setLong(1, reqID);
			ps.setString(2, proc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			cant = -1;
		}
		System.out.println("cant " + cant);
		return cant;
	}

	
	public static int getCantMedsByProcAndReqIDByProveedor(long reqID, String proc, String proveedor) {
		int cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select count(*) from dbo.ofertaALP where idConsolidado = ? and procesoCompra = ?");
			ps.setLong(1, reqID);
			ps.setString(2, proc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			cant = -1;
		}
		return cant;
	}
	
	public static int getLastMedIDByProc(String proc) {
		Integer cant = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement("select idItem from dbo.ofertaALP where procesoCompra = ?");
			ps.setString(1, proc);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				cant = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
			cant = -1;
		}
		return cant;
	}

	public static int getBuyProcessCod(String buyPurchaseNumber) {
		int number = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT cod FROM dbo.vaciadoOfertasALP where procesoCompra='" + buyPurchaseNumber + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				number = rs.getInt(1);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return number;
	}

	public static int updateRecomendaciones(ofertaALP o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.ofertaALP set recomendacionComite = ?, criterioRecomendacion = ?, observaciones= ?, recomendacionesBeneficiario = ? where procesoCompra = ? and medicamentoOfertado = ? and codATC = ? and codPadre = ? and distribuidor = ? and medicamentoEstimado = ? and descripcionTecnica = ? and up = ? and precio = ?");
			ps.setString(1, o.getRecomendacionComite());
			ps.setString(2, o.getCriterioRecomendacion());
			ps.setString(3, o.getObservaciones());
			ps.setString(4, o.getRecomendacionesBeneficiario());
			ps.setString(5, o.getProcesoCompra());
			ps.setString(6, o.getMedicamentoOfertado());
			ps.setString(7, o.getCodATC());
			ps.setInt(8, o.getCodPadre());
			ps.setString(9, o.getDistribuidor());
			ps.setString(10, o.getMedicamentoEstimado());
			ps.setString(11, o.getDescripcionTecnica());
			ps.setString(12, o.getUp());
			ps.setString(13, o.getPrecio());
			
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(status + " status");
		return status;
	}
	//AQUI
	public static String getofferListByPurchaseNumber(String ALPNumber) {
		String offerList = "";
		System.out.println(ALPNumber + " ALPNumber");
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"SELECT noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado,\r\n"
					+ "descripcionTecnicaRequerida, descripcionTecnica, up, canEstimadaOferta, precio,\r\n"
					+ "nombreFabricante, paisOrigen, registroSanitario, numSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura,\r\n"
					+ "numCertif, fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario,\r\n"
					+ "etiquetadoTerciario, obsOfertasProv, noFoliosOferta, muestraPresentada, solicitudesAclaracion,              \r\n"
					+ "respuestaSolicitudesAclaracion, consultasArsa, consultasBenef, estado, noOferta, fechaOferta, moneda, obsOfertaCEO, (CAST((CAST(precio AS DECIMAL(20, 4))*canEstimadaOferta) AS DECIMAL(20, 4))) as precioTotal from dbo.ofertaALP where procesoCompra Like '" + ALPNumber
							+ "%'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				
				
				String noOfertaIngresada = rs.getString(1);if(noOfertaIngresada == null || noOfertaIngresada.isEmpty()){ noOfertaIngresada = "-"; }
                String distribuidor = rs.getString(2);if(distribuidor == null || distribuidor.isEmpty()){ distribuidor = "-"; }
                String idItem = rs.getString(3);if(idItem == null || idItem.isEmpty()){ idItem = "-"; }
                String codATC = rs.getString(4);if(codATC == null || codATC.isEmpty()){ codATC = "-"; }
                String codSesal = rs.getString(5);if(codSesal == null || codSesal.isEmpty()){ codSesal = "-"; }
                String medicamentoEstimado = rs.getString(6);if(medicamentoEstimado == null || medicamentoEstimado.isEmpty()){ medicamentoEstimado = "-"; }
                String medicamentoOfertado = rs.getString(7);if(medicamentoOfertado == null || medicamentoOfertado.isEmpty()){ medicamentoOfertado = "-"; }
                String descripcionTecnicaRequerida = rs.getString(8);if(descripcionTecnicaRequerida == null || descripcionTecnicaRequerida.isEmpty()){ descripcionTecnicaRequerida = "-"; }
                String descripcionTecnica = rs.getString(9);if(descripcionTecnica == null || descripcionTecnica.isEmpty()){ descripcionTecnica = "-"; }
                String unidadPresentacionRequerida = rs.getString(10);if(unidadPresentacionRequerida == null || unidadPresentacionRequerida.isEmpty()){ unidadPresentacionRequerida = "NINGUNA"; }
                String canEstimadaOferta = rs.getString(11);if(canEstimadaOferta == null || canEstimadaOferta.isEmpty()){ canEstimadaOferta = "-"; }
                String precio = rs.getString(12);if(precio == null || precio.isEmpty()){ precio = "-"; }
                String nombreFabricante = rs.getString(13);if(nombreFabricante == null || nombreFabricante.isEmpty()){ nombreFabricante = "-"; }
                String paisOrigen = rs.getString(14);if(paisOrigen == null || paisOrigen.isEmpty()){ paisOrigen = "-"; }
                String registroSanitario = rs.getString(15);if(registroSanitario == null || registroSanitario.isEmpty()){ registroSanitario = "-"; }
                String numSanitario = rs.getString(16);if(numSanitario == null || numSanitario.isEmpty()){ numSanitario = "-"; }
                String fechaVencSan = rs.getString(17);
                String fechaEmisionSan = rs.getString(18);
                String certificadoManufactura = rs.getString(19);if(certificadoManufactura == null || certificadoManufactura.isEmpty()){ certificadoManufactura = "-"; }
                String numCertif = rs.getString(20);if(numCertif == null || numCertif.isEmpty()){ numCertif = "-"; }
                String fechaVencManufactura = rs.getString(21);
                String fechaEmisionManufactura = rs.getString(22);
                
                if(certificadoManufactura.contentEquals("NO PRESENTO")){
                	certificadoManufactura = "N/A";
                }
                
                String etiquetadoPrimario = rs.getString(23);if(etiquetadoPrimario == null || etiquetadoPrimario.isEmpty()){ etiquetadoPrimario = "-"; }
                String etiquetadoSecundario = rs.getString(24);if(etiquetadoSecundario == null || etiquetadoSecundario.isEmpty()){ etiquetadoSecundario = "-"; }
                String etiquetadoTerciario = rs.getString(25);if(etiquetadoTerciario == null || etiquetadoTerciario.isEmpty()){ etiquetadoTerciario = "-"; }
                String obsOfertasProv = rs.getString(26);if(obsOfertasProv == null || obsOfertasProv.isEmpty()){ obsOfertasProv = "-"; }
                String noFoliosOferta = rs.getString(27);if(noFoliosOferta == null || noFoliosOferta.isEmpty()){ noFoliosOferta = "-"; }
                String muestraPresentada = rs.getString(28);if(muestraPresentada == null || muestraPresentada.isEmpty()){ muestraPresentada = "-"; }
                String solicitudesAclaracion = rs.getString(29);if(solicitudesAclaracion == null || solicitudesAclaracion.isEmpty()){ solicitudesAclaracion = "-"; }
                String respuestaSolicitudesAclaracion = rs.getString(30);if(respuestaSolicitudesAclaracion == null || respuestaSolicitudesAclaracion.isEmpty()){ respuestaSolicitudesAclaracion = "-"; }
                String consultasArsa = rs.getString(31);if(consultasArsa == null || consultasArsa.isEmpty()){ consultasArsa = "-"; }
                String consultasBenef = rs.getString(32);if(consultasBenef == null || consultasBenef.isEmpty()){ consultasBenef = "-"; }
                String estado = rs.getString(33);if(estado == null || estado.isEmpty()){ estado = "EN PROCESO"; }
                int noOferta = rs.getInt(34);
                String fechaOferta = rs.getString(35);if(fechaOferta == null || estado.isEmpty()){ fechaOferta = "-"; }
                String moneda = rs.getString(36);if(moneda == null || moneda.isEmpty()){ moneda = "-"; }			
                String obsOfertaCEO = rs.getString(37);if(obsOfertaCEO == null || obsOfertaCEO.isEmpty()){ obsOfertaCEO = "-"; }
                String precioTotal = rs.getString(38);if(precioTotal == null || precioTotal.isEmpty()){ precioTotal = "0"; }
				String historialCumplimientoCalidad = "VER REPORTE";
				String historialCumplimientoContrato = "VER REPORTE";				
				String CE = "";
				//String criteriosEvaluacion = "<td><ul>";
				String criteriosEvaluacion = "";
				ArrayList<CriterioEvaluacionDTO> cd = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpciones(noOferta);
				
//				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
//					//criteriosEvaluacion += "<li> <b> CITERIO: </b> "+opcionesCriterios.getNombreCriterio() +" <strong> &nbsp;&nbsp;OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle() +"</li> ";
//					criteriosEvaluacion +=   "\"" + "<th>" + "" + opcionesCriterios.getNombreCriterio() + "</th>" + "\"," 
//										   + "\"" + "<td>" + opcionesCriterios.getNombreCriterioDetalle() + "</td>" + "\"," ;
//				}
				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
					//criteriosEvaluacion += "<li> <b> CITERIO: </b> "+opcionesCriterios.getNombreCriterio() +" <strong> &nbsp;&nbsp;OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle() +"</li> ";
					criteriosEvaluacion +=   "\"" + opcionesCriterios.getNombreCriterioDetalle().toUpperCase() + "\"," ;
				}
				//criteriosEvaluacion += "</ul></td>";
				
				CE =criteriosEvaluacion;
				
				if(fechaVencSan == null || fechaVencSan.isEmpty())
				{ fechaVencSan = "-"; }else {
					String[] fechaVencSan1 = fechaVencSan.split("-");
					fechaVencSan = fechaVencSan1[2]+"-"+fechaVencSan1[1]+"-"+fechaVencSan1[0];
				}
				
				if(fechaEmisionSan == null || fechaEmisionSan.isEmpty())
				{ fechaEmisionSan = "-"; }
				else {
					String[] fechaEmisionSan1 = fechaEmisionSan.split("-");
					fechaEmisionSan = fechaEmisionSan1[2]+"-"+fechaEmisionSan1[1]+"-"+fechaEmisionSan1[0];
				}
				
				if(fechaVencManufactura == null || fechaVencManufactura.isEmpty())
				{ fechaVencManufactura = "-"; }
				else {
					String[] fechaVencManufactura1 = fechaVencManufactura.split("-");
					fechaVencManufactura = fechaVencManufactura1[2]+"-"+fechaVencManufactura1[1]+"-"+fechaVencManufactura1[0];
				}
				
				if(fechaEmisionManufactura == null || fechaEmisionManufactura.isEmpty())
				{ fechaEmisionManufactura = "-"; }
				else {String[] fechaEmisionManufactura1 = fechaEmisionManufactura.split("-");
				fechaEmisionManufactura = fechaEmisionManufactura1[2]+"-"+fechaEmisionManufactura1[1]+"-"+fechaEmisionManufactura1[0];}
				
				
				
				j += "[" + "\"" + count + "\"," + 
						   "\"" + noOferta + "\"," + 
						   "\"" + noOfertaIngresada + "\"," + 
						   "\"" + distribuidor  + "\"," + 
						   "\"" + idItem + "\"," + 
						   "\"" + codATC + "\"," + 
						   "\""	+ codSesal + "\"," + 
						   "\"" + medicamentoEstimado + "\"," + 
						   "\"" + medicamentoOfertado + "\"," + 
						   "\"" + descripcionTecnicaRequerida + "\"," + 
						   "\"" + descripcionTecnica + "\"," + 
						   "\"" + unidadPresentacionRequerida + "\"," + 
						   "\"" + canEstimadaOferta +  "\"," + 
						   "\"" + moneda+" "+precio  + "\"," + 
						   //"\""	+ moneda+" "+(Float.parseFloat(precio)*Integer.parseInt(canEstimadaOferta)) + "\"," + 
						   "\""	+ moneda+" "+precioTotal + "\"," + 
						   "\"" + nombreFabricante + "\"," + 
						   "\""	+ paisOrigen + "\"," + 
						   "\"" + registroSanitario + "\"," + 
						   "\""	+ numSanitario +  "\"," + 
						   "\"" + fechaVencSan + "\"," + 
						   "\"" + fechaEmisionSan + "\"," + 
						   "\"" + certificadoManufactura + "\"," + 
						   "\""	+ numCertif + "\"," + 
						   "\"" + fechaVencManufactura + "\"," + 
						   "\"" + fechaEmisionManufactura + "\"," + 
						   "\"" + etiquetadoPrimario  + "\"," + 
						   "\"" + etiquetadoSecundario  + "\"," + 
						   "\"" + etiquetadoTerciario + "\"," + 
						   "\"" + obsOfertasProv  + "\"," + 
						   "\"" + noFoliosOferta + "\"," + 
						   "\""	+ muestraPresentada  + "\"," + 
						   "\"" + solicitudesAclaracion + "\"," + 
						   "\""	+ respuestaSolicitudesAclaracion + "\"," + 
						   "\"" + consultasArsa + "\"," + 
						   "\""	+ consultasBenef + "\"," + 
						   "\"" + obsOfertaCEO + "\"," + 
						   "\"" + historialCumplimientoCalidad + "\"," + 
						   "\"" + historialCumplimientoContrato + "\"," + 
						   "\"" + estado + "\"," + 
						   "\""	+ fechaOferta + "\"," + 
						   "\"" + moneda  + "\"," + 
						   CE +  
						   "\"" + estado + "\"," + 
						   "\"" + fechaOferta + "\"],";
				
		}
			if (count == 0) {
				
				int proceso = 0;
				String criteriosEvaluacion = "";
				String empty = "-";
				
				ps = con.prepareStatement(
						"select idproc from numeroProcesoCompra where cod ='"+ALPNumber+"'");				
				 rs = ps.executeQuery();				
				while (rs.next()) {
					 proceso = rs.getInt(1);
				}
				
				ArrayList<CriterioEvaluacionDTO> CriteriosAplica =   CriterioEvalucionDao.getCriteriosByproCompra(proceso);
				for(CriterioEvaluacionDTO opcionesCriterios : CriteriosAplica) {
					
					criteriosEvaluacion +=   "\"" + empty + "\"," ;
				}
				
				
				j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						 + "\"" + empty + "\"," + "\"" + empty + "\"," 
						 + criteriosEvaluacion + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		System.out.println(offerList);
		return offerList;
	}

	public static String getofferAprovBasicListByPurchaseNumber(String ALPNumber) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
//					"select idItem, medicamentoOfertado, up, descripcionTecnica, codATC, distribuidor from dbo.ofertaALP where procesoCompra Like '"
//							+ ALPNumber + "%' and recomendacionComite='SI'");
     		"select idItem, codATC, codSesal, medicamentoOfertado,up,  descripcionTecnica from dbo.ofertaALP where procesoCompra Like '"
				+ ALPNumber + "%' and recomendacionComite='SI' group by idItem, codATC, codSesal, medicamentoOfertado,up ,  descripcionTecnica");	
					
			
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String idItem = rs.getString(1);
				String codATC = rs.getString(2);
				String codSesal = rs.getString(3);
				String medicamentoOfertado = rs.getString(4);
				String upOfertada = rs.getString(5);
				String descripcionTecnica = rs.getString(6);
				//String unidadPresentacionOfertada = rs.getString(3);
//				if (unidadPresentacionOfertada == null) {
//					unidadPresentacionOfertada = "NINGUNA";
//				}
//				String descripcionTecnicaOfertada = rs.getString(4);
//				if (descripcionTecnicaOfertada == null) {
//					descripcionTecnicaOfertada = "NO AGREGADA";
//				}
//				String codigoATC = rs.getString(5);
//				String proveedor = rs.getString(6);

				j += "[" + "\"" + idItem + "\","
                         + "\"" + codATC + "\","
                         + "\"" + codSesal + "\","
                         + "\"" + medicamentoOfertado + "\","
                         + "\"" + upOfertada + "\","
						 + "\"" + descripcionTecnica + "\"],";
				
//				j += "[" + "\"" + idItem + "\"," + "\"" + medicamentoOfertado + "\"," + "\""
//						+ unidadPresentacionOfertada + "\"," + "\"" + descripcionTecnicaOfertada + "\"," + "\""
//						+ codigoATC + "\"," + "\"" + proveedor + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + empty + "\"," 
						 + "\"" + empty + "\","
						 + "\"" + empty + "\","
						 + "\"" + empty + "\","
						 + "\"" + empty + "\"," 
						 + "\"" + empty + "\"],";
			}
//			if (count == 0) {
//				String empty = "-";
//				j += "[" + "\"" + "-" + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
//						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
//			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		System.out.println(offerList);
		return offerList;
	}

	//////INFORME RECOMENDACION
	public static String getofferListForIRByATCNumberJSON(String proc, String medicamento) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
//					"select distribuidor, medicamentoEstimado, medicamentoOfertado, descripcionTecnica, up, precio, moneda, recomendacionComite, criterioRecomendacion, observaciones, recomendacionesBeneficiario, fechaOferta, nombreFabricante, \r\n"
//							+ "registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, fechaVencManufactura, fechaEmisionManufactura, \r\n"
//							+ "etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, muestraPresentada,noFoliosOferta, obsOfertasProv, consultasArsa,\r\n"
//							+ "consultasBenef, solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio, historialContrato,\r\n"
//							+ "cantidadCriterio, icotermCriterio,regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil, garantiaFabrica,\r\n"
//							+ "cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio, noOferta, idItem from dbo.ofertaALP where codATC Like '"
//							+ ATCnumber + "%' and procesoCompra=?");
					
					
					"select noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado, descripcionTecnicaRequerida,\r\n"
					+ "	   descripcionTecnica, up, canEstimadaOferta, (CAST(precio AS DECIMAL(20, 4))) as precio, nombreFabricante, paisOrigen, registroSanitario, numSanitario,\r\n"
					+ "	   fechaVencSan, fechaEmisionSan, certificadoManufactura, numCertif, fechaVencManufactura, fechaEmisionManufactura,\r\n"
					+ "	   etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, obsOfertasProv, noFoliosOferta, muestraPresentada,\r\n"
					+ "	   solicitudesAclaracion, respuestaSolicitudesAclaracion, consultasArsa, consultasBenef, recomendacionComite,\r\n"
					+ "	   criterioRecomendacion, observaciones, recomendacionesBeneficiario, noOferta, prelacionRALP, moneda, unidadPresentacionRequerida, cantidadRequerida, obsOfertaCEO,  (CAST((CAST(precio AS DECIMAL(20, 4))*canEstimadaOferta) AS DECIMAL(20, 4))) as precioTotal from ofertaALP  "
					+ "		where medicamentoEstimado ='"+ medicamento + "' and procesoCompra=?");
					
			ps.setString(1, proc);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			String ATCnumberParam = String.valueOf(medicamento);
			while (rs.next()) {
				count++;
				
				String noOfertaIngresada = rs.getString(1); if (noOfertaIngresada == null) {noOfertaIngresada = "-";}
				String distribuidor = rs.getString(2); if (distribuidor == null) {distribuidor = "-";}
				String idItem = rs.getString(3); if (idItem == null) {idItem = "-";}
				String codATC = rs.getString(4); if (codATC == null) {codATC = "-";}
				String codSesal = rs.getString(5); if (codSesal == null) {codSesal = "-";}
				String medicamentoEstimado = rs.getString(6); if (medicamentoEstimado == null) {medicamentoEstimado = "-";}
				String medicamentoOfertado = rs.getString(7); if (medicamentoOfertado == null) {medicamentoOfertado = "-";}
				String descripcionTecnica = rs.getString(8); if (descripcionTecnica == null) {descripcionTecnica = "-";}
				String descripcionTecnicaOfertada = rs.getString(9); if (descripcionTecnicaOfertada == null) {descripcionTecnicaOfertada = "-";}
				String up = rs.getString(10); if (up == null) {up = "-";}
				String unidadPresentacionRequerida = rs.getString(40); if (unidadPresentacionRequerida == null) {unidadPresentacionRequerida = "-";}
				String canEstimadaOferta = rs.getString(11); if (canEstimadaOferta == null) {canEstimadaOferta = "-";}
				String canRequerida = rs.getString(41); if (canRequerida == null) {canRequerida = "-";}
				String precio = rs.getString(12); if (precio == null) {precio = "-";}
				String nombreFabricante = rs.getString(13); if (nombreFabricante == null) {nombreFabricante = "-";}
				String paisOrigen = rs.getString(14); if (paisOrigen == null) {paisOrigen = "-";}
				String registroSanitario = rs.getString(15); if (registroSanitario == null) {registroSanitario = "-";}
				String numSanitario = rs.getString(16); if (numSanitario == null) {numSanitario = "-";}
				String fechaVencSan = rs.getString(17); if (fechaVencSan == null) {fechaVencSan = "-";}
				String fechaEmisionSan = rs.getString(18); if (fechaEmisionSan == null) {fechaEmisionSan = "-";}
				String certificadoManufactura = rs.getString(19); if (certificadoManufactura == null) {certificadoManufactura = "-";}
				String numCertif = rs.getString(20); if (numCertif == null) {numCertif = "-";}
				String fechaVencManufactura = rs.getString(21); if (fechaVencManufactura == null) {fechaVencManufactura = "-";}
				String fechaEmisionManufactura = rs.getString(22); if (fechaEmisionManufactura == null) {fechaEmisionManufactura = "-";}
				String etiquetadoPrimario = rs.getString(23); if (etiquetadoPrimario == null) {etiquetadoPrimario = "-";}
				String etiquetadoSecundario = rs.getString(24); if (etiquetadoSecundario == null) {etiquetadoSecundario = "-";}
				String etiquetadoTerciario = rs.getString(25); if (etiquetadoTerciario == null) {etiquetadoTerciario = "-";}
				String obsOfertasProv = rs.getString(26); if (obsOfertasProv == null) {obsOfertasProv = "-";}
				String noFoliosOferta = rs.getString(27); if (noFoliosOferta == null) {noFoliosOferta = "-";}
				String muestraPresentada = rs.getString(28); if (muestraPresentada == null) {muestraPresentada = "-";}
				String solicitudesAclaracion = rs.getString(29); if (solicitudesAclaracion == null) {solicitudesAclaracion = "-";}
				String respuestaSolicitudesAclaracion = rs.getString(30); if (respuestaSolicitudesAclaracion == null) {respuestaSolicitudesAclaracion = "-";}
				String consultasArsa = rs.getString(31); if (consultasArsa == null) {consultasArsa = "-";}
				String consultasBenef = rs.getString(32); if (consultasBenef == null) {consultasBenef = "-";}
				String obsCeo = rs.getString(42); if (obsCeo == null) {obsCeo = "-";}
				String historialCumpleCalidad = "VER REPORTE";
				String historialCumpleContrato = "VER REPORTE";				
				String recomendacionComite = rs.getString(33); if (recomendacionComite == null) {recomendacionComite = "-";}
				String criterioRecomendacion = rs.getString(34); if (criterioRecomendacion == null) {criterioRecomendacion = "-";}
				String observaciones = rs.getString(35); if (observaciones == null) {observaciones = "-";}
				String recomendacionesBeneficiario = rs.getString(36); if (recomendacionesBeneficiario == null) {recomendacionesBeneficiario ="-" ;}
				int  noOferta = rs.getInt(37);				
				String prelacionRALP = rs.getString(38); if (prelacionRALP == null) {prelacionRALP ="0" ;}
				String moneda = rs.getString(39); 
				System.out.println("ESTO");
				System.out.println(moneda + " ?" );


				String CE = "";
				String criteriosEvaluacion = "";
				//String criteriosEvaluacion = "<td><ul>";				
				ArrayList<CriterioEvaluacionDTO> cd = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpciones(noOferta);
				
//				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
//					criteriosEvaluacion += "<li> <b> CRITERIO: </b> "+opcionesCriterios.getNombreCriterio() +" <strong> - OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle() +"</li> ";
//				}
//				criteriosEvaluacion += "</ul></td>";
//				
				
				for(CriterioEvaluacionDTO opcionesCriterios : cd) {
					criteriosEvaluacion +=   "\"" + opcionesCriterios.getNombreCriterioDetalle().toUpperCase() + "\"," ;
				}
				
				CE =criteriosEvaluacion;
				
				if(fechaVencSan == null || fechaVencSan.isEmpty())
				{ fechaVencSan = "-"; }else {
					String[] fechaVencSan1 = fechaVencSan.split("-");
					fechaVencSan = fechaVencSan1[2]+"-"+fechaVencSan1[1]+"-"+fechaVencSan1[0];
				}
				
				if(fechaEmisionSan == null || fechaEmisionSan.isEmpty())
				{ fechaEmisionSan = "-"; }
				else {
					String[] fechaEmisionSan1 = fechaEmisionSan.split("-");
					fechaEmisionSan = fechaEmisionSan1[2]+"-"+fechaEmisionSan1[1]+"-"+fechaEmisionSan1[0];
				}
				
				if(fechaVencManufactura == null || fechaVencManufactura.isEmpty())
				{ fechaVencManufactura = "-"; }
				else {
					String[] fechaVencManufactura1 = fechaVencManufactura.split("-");
					fechaVencManufactura = fechaVencManufactura1[2]+"-"+fechaVencManufactura1[1]+"-"+fechaVencManufactura1[0];
				}
				
				if(fechaEmisionManufactura == null || fechaEmisionManufactura.isEmpty())
				{ fechaEmisionManufactura = "-"; }
				else {String[] fechaEmisionManufactura1 = fechaEmisionManufactura.split("-");
				fechaEmisionManufactura = fechaEmisionManufactura1[2]+"-"+fechaEmisionManufactura1[1]+"-"+fechaEmisionManufactura1[0];}
				
				
				j += "[" + "\"" + noOferta +  "\"," + "\""  + count + "\"," + "\""  + noOfertaIngresada.toUpperCase() + "\"," + "\"" + distribuidor.toUpperCase() + "\"," + "\""
						+ idItem.toUpperCase() + "\"," + "\"" + codATC.toUpperCase() + "\"," + "\"" + codSesal.toUpperCase() + "\"," + "\"" 
						+ medicamentoEstimado.toUpperCase() + "\"," + "\"" + medicamentoOfertado.toUpperCase() + "\"," + "\"" + descripcionTecnica.toUpperCase() + "\"," + "\""						
						+ descripcionTecnicaOfertada.toUpperCase() + "\"," + "\"" + unidadPresentacionRequerida.toUpperCase() + "\"," +  "\"" +  up.toUpperCase() + "\"," + "\"" 
						+ nombreFabricante.toUpperCase() + "\"," + "\"" + paisOrigen.toUpperCase()+ "\"," + "\"" + canRequerida.toUpperCase() + "\"," + "\"" + canEstimadaOferta.toUpperCase() + "\"," + "\""						
						+ ( moneda + " " +precio.toUpperCase()   ) + "\"," + "\"" +  moneda + " " + rs.getString(43) + "\"," + "\"" 
						+ registroSanitario.toUpperCase() + "\"," + "\"" 
						+ numSanitario + "\"," + "\"" + fechaVencSan + "\"," + "\"" + fechaEmisionSan + "\"," + "\"" 
						+ certificadoManufactura.toUpperCase() + "\"," + "\"" + numCertif + "\"," + "\"" + fechaVencManufactura + "\"," + "\"" 
						+ fechaEmisionManufactura + "\"," + "\"" + etiquetadoPrimario.toUpperCase() + "\"," + "\"" + etiquetadoSecundario.toUpperCase() + "\"," + "\""
						+ etiquetadoTerciario.toUpperCase() + "\"," + "\"" + muestraPresentada.toUpperCase()  + "\"," + "\"" + noFoliosOferta + "\"," + "\""
						+ obsOfertasProv.toUpperCase() + "\"," + "\"" + solicitudesAclaracion.toUpperCase() + "\"," + "\""
						+ respuestaSolicitudesAclaracion.toUpperCase() + "\"," + "\"" + consultasArsa.toUpperCase() + "\"," + "\"" + consultasBenef.toUpperCase() + "\"," + "\""
						+ obsCeo.toUpperCase() + "\"," + "\"" + historialCumpleCalidad.toUpperCase() + "\"," + "\"" + historialCumpleContrato.toUpperCase() + "\","+ "\"" 
						+ recomendacionComite.toUpperCase() + "\","  + "\"" + prelacionRALP.toUpperCase() + "\","  + "\"" 
						+ criterioRecomendacion.toUpperCase() + "\"," + "\"" + observaciones.toUpperCase() +  "\"," + "\"" + recomendacionesBeneficiario.toUpperCase() +  "\"," + CE  +  "\"" + ""  + "\"],";   
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			System.out.println(offerList);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerList;
	}
	
	public static ArrayList<ofertaALP> getRecommendOffersByProcV2(String proc) {
		ArrayList<ofertaALP> offerRecommendList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado, \r\n"
					+ "descripcionTecnica, descripcionTecnicaRequerida, unidadPresentacionRequerida, up,  canEstimadaOferta, precio, nombreFabricante,\r\n"
					+ "paisOrigen, registroSanitario, numSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, numCertif, fechaVencManufactura,\r\n"
					+ "fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, prelacionRALP, criterioRecomendacion,\r\n"
					+ "observaciones, recomendacionesBeneficiario from dbo.ofertaALP where procesoCompra = ? and recomendacionComite = 'SI' and prelacionRALP = 1");
			ps.setString(1, proc);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ofertaALP newOferta = new ofertaALP();
				
				
				newOferta.setnoOfertaIngresada(rs.getInt(1));if (rs.getString(1) == null) {newOferta.setnoOfertaIngresada(0);}
				newOferta.setDistribuidor(rs.getString(2));if (rs.getString(2) == null) {newOferta.setDistribuidor("-");}
				newOferta.setIdItem(rs.getInt(3));if (rs.getString(3) == null) {newOferta.setIdItem(0);}
				newOferta.setCodATC(rs.getString(4));if (rs.getString(4) == null) {newOferta.setCodATC("-");}
				newOferta.setcodSesal(rs.getString(5));if (rs.getString(5) == null) {newOferta.setcodSesal("-");}
				newOferta.setMedicamentoEstimado(rs.getString(6));if (rs.getString(6) == null) {newOferta.setMedicamentoEstimado("-");}
				newOferta.setMedicamentoOfertado(rs.getString(7));if (rs.getString(7) == null) {newOferta.setMedicamentoOfertado("-");}
				newOferta.setDescripcionTecnica(rs.getString(8));if (rs.getString(8) == null) {newOferta.setDescripcionTecnica("-");}
				newOferta.setDescripcionTecnicaRequerida(rs.getString(9));if (rs.getString(9) == null) {newOferta.setDescripcionTecnicaRequerida("-");}
				newOferta.setUnidadPresentacionRequerida(rs.getString(10));if (rs.getString(10) == null) {newOferta.setUnidadPresentacionRequerida("-");}
				newOferta.setUp(rs.getString(11));if (rs.getString(11) == null) {newOferta.setUp("-");}
				newOferta.setcanEstimadaOferta(rs.getInt(12));if (rs.getString(12) == null) {newOferta.setcanEstimadaOferta(0);}
				newOferta.setPrecio(rs.getString(13));if (rs.getString(13) == null) {newOferta.setPrecio("0");}
				newOferta.setNombreFabricante(rs.getString(14));if (rs.getString(14) == null) {newOferta.setNombreFabricante("-");}
				newOferta.setPaisOrigen(rs.getString(15));if (rs.getString(15) == null) {newOferta.setPaisOrigen("-");}
				newOferta.setRegistroSanitario(rs.getString(16));if (rs.getString(16) == null) {newOferta.setRegistroSanitario("-");}
				newOferta.setNumSanitario(rs.getString(17));if (rs.getString(17) == null) {newOferta.setNumSanitario("-");}
				newOferta.setFechaVencSan(rs.getString(18));if (rs.getString(18) == null) {newOferta.setFechaVencSan("-");}
				newOferta.setFechaEmisionSan(rs.getString(19));if (rs.getString(19) == null) {newOferta.setFechaEmisionSan("-");}
				newOferta.setCertificadoManufactura(rs.getString(20));if (rs.getString(20) == null) {newOferta.setCertificadoManufactura("-");}
				newOferta.setNumCertif(rs.getString(21));if (rs.getString(21) == null) {newOferta.setNumCertif("-");}
				newOferta.setFechaVencManufactura(rs.getString(22));if (rs.getString(22) == null) {newOferta.setNumCertif("-");}
				newOferta.setFechaEmisionManufactura(rs.getString(23));if (rs.getString(23) == null) {newOferta.setFechaEmisionManufactura("-");}
				newOferta.setEtiquetadoPrimario(rs.getString(24));if (rs.getString(24) == null) {newOferta.setEtiquetadoPrimario("-");}
				newOferta.setEtiquetadoSecundario(rs.getString(25));if (rs.getString(25) == null) {newOferta.setEtiquetadoSecundario("-");}
				newOferta.setEtiquetadoTerciario(rs.getString(26));if (rs.getString(26) == null) {newOferta.setEtiquetadoTerciario("-");}
				newOferta.setprelacionRALP(rs.getInt(27));if (rs.getString(27) == null) {newOferta.setprelacionRALP(0);}
				newOferta.setCriterioRecomendacion(rs.getString(28));if (rs.getString(28) == null) {newOferta.setCriterioRecomendacion("-");}
				newOferta.setObservaciones(rs.getString(29));if (rs.getString(29) == null) {newOferta.setObservaciones("-");}
				newOferta.setRecomendacionesBeneficiario(rs.getString(30));if (rs.getString(30) == null) {newOferta.setRecomendacionesBeneficiario("-");}				
				
				offerRecommendList.add(newOferta);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerRecommendList;
	}
	
	public static ArrayList<ofertaALP> getRecommendOffersByProc(String proc) {
		ArrayList<ofertaALP> offerRecommendList = new ArrayList<>();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado, \r\n"
					+ "descripcionTecnica, descripcionTecnicaRequerida, unidadPresentacionRequerida, up,  canEstimadaOferta, precio, nombreFabricante,\r\n"
					+ "paisOrigen, registroSanitario, numSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, numCertif, fechaVencManufactura,\r\n"
					+ "fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, prelacionRALP, criterioRecomendacion,\r\n"
					+ "observaciones, recomendacionesBeneficiario, (CAST((CAST(precio AS DECIMAL(20, 4))*canEstimadaOferta) AS DECIMAL(20, 4))) as precioTotal, cantidadRequerida, moneda from dbo.ofertaALP where procesoCompra = ? and recomendacionComite = 'SI'");
			ps.setString(1, proc);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				ofertaALP newOferta = new ofertaALP();
				
				
				newOferta.setnoOfertaIngresada(rs.getInt(1));if (rs.getString(1) == null) {newOferta.setnoOfertaIngresada(0);}
				newOferta.setDistribuidor(rs.getString(2));if (rs.getString(2) == null) {newOferta.setDistribuidor("-");}
				newOferta.setIdItem(rs.getInt(3));if (rs.getString(3) == null) {newOferta.setIdItem(0);}
				newOferta.setCodATC(rs.getString(4));if (rs.getString(4) == null) {newOferta.setCodATC("-");}
				newOferta.setcodSesal(rs.getString(5));if (rs.getString(5) == null) {newOferta.setcodSesal("-");}
				newOferta.setMedicamentoEstimado(rs.getString(6));if (rs.getString(6) == null) {newOferta.setMedicamentoEstimado("-");}
				newOferta.setMedicamentoOfertado(rs.getString(7));if (rs.getString(7) == null) {newOferta.setMedicamentoOfertado("-");}
				newOferta.setDescripcionTecnica(rs.getString(8));if (rs.getString(8) == null) {newOferta.setDescripcionTecnica("-");}
				newOferta.setDescripcionTecnicaRequerida(rs.getString(9));if (rs.getString(9) == null) {newOferta.setDescripcionTecnicaRequerida("-");}
				newOferta.setUnidadPresentacionRequerida(rs.getString(10));if (rs.getString(10) == null) {newOferta.setUnidadPresentacionRequerida("-");}
				newOferta.setUp(rs.getString(11));if (rs.getString(11) == null) {newOferta.setUp("-");}
				newOferta.setcanEstimadaOferta(rs.getInt(12));if (rs.getString(12) == null) {newOferta.setcanEstimadaOferta(0);}
				newOferta.setPrecio(rs.getString(13));if (rs.getString(13) == null) {newOferta.setPrecio("0");}
				newOferta.setNombreFabricante(rs.getString(14));if (rs.getString(14) == null) {newOferta.setNombreFabricante("-");}
				newOferta.setPaisOrigen(rs.getString(15));if (rs.getString(15) == null) {newOferta.setPaisOrigen("-");}
				newOferta.setRegistroSanitario(rs.getString(16));if (rs.getString(16) == null) {newOferta.setRegistroSanitario("-");}
				newOferta.setNumSanitario(rs.getString(17));if (rs.getString(17) == null) {newOferta.setNumSanitario("-");}
				newOferta.setFechaVencSan(rs.getString(18));if (rs.getString(18) == null) {newOferta.setFechaVencSan("");}
				newOferta.setFechaEmisionSan(rs.getString(19));if (rs.getString(19) == null) {newOferta.setFechaEmisionSan("");}
				newOferta.setCertificadoManufactura(rs.getString(20));if (rs.getString(20) == null) {newOferta.setCertificadoManufactura("-");}
				newOferta.setNumCertif(rs.getString(21));if (rs.getString(21) == null) {newOferta.setNumCertif("-");}
				newOferta.setFechaVencManufactura(rs.getString(22));if (rs.getString(22) == null) {newOferta.setNumCertif("-");}
				newOferta.setFechaEmisionManufactura(rs.getString(23));//if (rs.getString(23) == null) {newOferta.setFechaEmisionManufactura("");}
				newOferta.setEtiquetadoPrimario(rs.getString(24));if (rs.getString(24) == null) {newOferta.setEtiquetadoPrimario("-");}
				newOferta.setEtiquetadoSecundario(rs.getString(25));if (rs.getString(25) == null) {newOferta.setEtiquetadoSecundario("-");}
				newOferta.setEtiquetadoTerciario(rs.getString(26));if (rs.getString(26) == null) {newOferta.setEtiquetadoTerciario("-");}
				newOferta.setprelacionRALP(rs.getInt(27));if (rs.getString(27) == null) {newOferta.setprelacionRALP(0);}
				newOferta.setCriterioRecomendacion(rs.getString(28));if (rs.getString(28) == null) {newOferta.setCriterioRecomendacion("-");}
				newOferta.setObservaciones(rs.getString(29));if (rs.getString(29) == null) {newOferta.setObservaciones("-");}
				newOferta.setRecomendacionesBeneficiario(rs.getString(30));if (rs.getString(30) == null) {newOferta.setRecomendacionesBeneficiario("-");}				
				newOferta.setprecioTotal(rs.getString(31));if (rs.getString(31) == null) {newOferta.setPrecio("0");}
				newOferta.setcantidadRequerida(rs.getFloat(32));if (rs.getString(32) == null) {newOferta.setcantidadRequerida(0.0f);}				
				newOferta.setMoneda(rs.getString(33));if (rs.getString(33) == null) {newOferta.setPrecio("-");}
				
				offerRecommendList.add(newOferta);
			}
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerRecommendList;
	}
	
	//para nuevo catalago
		public static ArrayList<ofertaALP> getAll() {
			ArrayList<ofertaALP> procesoCompra = new ArrayList<>();
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement("select procesoCompra from dbo.ofertaALP group by procesoCompra");
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ofertaALP p = new ofertaALP();
					p.setProcesoCompra(rs.getString(1));

					procesoCompra.add(p);
				}
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}

			return procesoCompra;
		}
			
		
		public static ArrayList<ofertaALP> getOfertabyProCompra(String procesoCompra, String medicamento) {
			ArrayList<ofertaALP> reqList = new ArrayList<>();
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"select distinct idItem, medicamentoEstimado, medicamentoOfertado, up, unidadPresentacionRequerida, descripcionTecnica, descripcionTecnicaRequerida, codATC, distribuidor, numSanitario, numCertif, nombreFabricante, precio, moneda, fechaOferta, recomendacionesBeneficiario, paisOrigen, fechaVencSan, fechaVencManufactura, prelacionRALP,recomendacionComite, noOferta from dbo.ofertaALP where procesoCompra = ? and medicamentoOfertado =?");
				ps.setString(1, procesoCompra);
				ps.setString(2, medicamento);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ofertaALP o = new ofertaALP();

					o.setIdItem(rs.getInt(1));
					o.setMedicamentoEstimado(rs.getString(2));
					o.setMedicamentoOfertado(rs.getString(3));
					o.setUp(rs.getString(4));
					if (rs.getString(4) == null) {
						o.setUp("NINGUNA");
					}
					o.setUnidadPresentacionRequerida(rs.getString(5));
					if (rs.getString(5) == null) {
						o.setUnidadPresentacionRequerida("NINGUNA");
					}
					o.setDescripcionTecnica(rs.getString(6));
					if (rs.getString(6) == null) {
						o.setDescripcionTecnica("NO AGREGADA");
					}
					o.setDescripcionTecnicaRequerida(rs.getString(7));
					if (rs.getString(7) == null) {
						o.setDescripcionTecnicaRequerida("NO AGREGADA");
					}
					o.setCodATC(rs.getString(8));
					o.setDistribuidor(rs.getString(9));
					o.setNumSanitario(rs.getString(10));
					if (rs.getString(10) == null) {
						o.setNumSanitario("NO AGREGADO");
					}
					o.setNumCertif(rs.getString(11));
					if (rs.getString(11) == null) {
						o.setNumCertif("NINGUNO");
					}
					o.setNombreFabricante(rs.getString(12));
					o.setPrecio(rs.getString(13));
					o.setMoneda(rs.getString(14));
					o.setFechaOferta(rs.getString(15));
					o.setRecomendacionesBeneficiario(rs.getString(16));
					if (rs.getString(16) == null) {
						o.setRecomendacionesBeneficiario("-");
					}
					o.setPaisOrigen(rs.getString(17));
					if (rs.getString(17) == null) {
						o.setPaisOrigen("NO AGREGADO");
					}
					o.setFechaVencSan(rs.getString(18));
					if (rs.getString(18) == null) {
						o.setFechaVencSan("NO AGREGADA");
					}
					o.setFechaVencManufactura(rs.getString(19));
					if (rs.getString(19) == null) {
						o.setFechaVencManufactura("NO AGREGADA");
					}
					o.setprelacionRALP(rs.getInt(20));
					o.setRecomendacionComite(rs.getString(21));
					if (rs.getString(21) == null) {
						o.setRecomendacionComite("NO AGREGADA");
					}
					o.setnoOferta(rs.getString(22));
					
					reqList.add(o);
				}
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}

			return reqList;
		}

		//antes usado el metodo de arriba getOfertabyProCompra
		public static ArrayList<ofertaALP> getOfertabyProCompraParaSolicitud(String procesoCompra, String medicamento) {
			ArrayList<ofertaALP> reqList = new ArrayList<>();
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"select distinct idItem, medicamentoEstimado, medicamentoOfertado, up, unidadPresentacionRequerida, descripcionTecnica, descripcionTecnicaRequerida, codATC, distribuidor, numSanitario, numCertif, nombreFabricante, precio, moneda, fechaOferta, recomendacionesBeneficiario, paisOrigen, fechaVencSan, fechaVencManufactura, prelacionRALP,recomendacionComite, noOferta, codSesal, fechaEmisionSan, fechaEmisionManufactura from dbo.ofertaALP where procesoCompra = ? and medicamentoOfertado =?");
				ps.setString(1, procesoCompra);
				ps.setString(2, medicamento);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					ofertaALP o = new ofertaALP();

					o.setIdItem(rs.getInt(1));
					o.setMedicamentoEstimado(rs.getString(2));
					o.setMedicamentoOfertado(rs.getString(3));
					o.setUp(rs.getString(4));
					if (rs.getString(4) == null) {
						o.setUp("NINGUNA");
					}
					o.setUnidadPresentacionRequerida(rs.getString(5));
					if (rs.getString(5) == null) {
						o.setUnidadPresentacionRequerida("NINGUNA");
					}
					o.setDescripcionTecnica(rs.getString(6));
					if (rs.getString(6) == null) {
						o.setDescripcionTecnica("NO AGREGADA");
					}
					o.setDescripcionTecnicaRequerida(rs.getString(7));
					if (rs.getString(7) == null) {
						o.setDescripcionTecnicaRequerida("NO AGREGADA");
					}
					o.setCodATC(rs.getString(8));
					o.setDistribuidor(rs.getString(9));
					o.setNumSanitario(rs.getString(10));
					if (rs.getString(10) == null) {
						o.setNumSanitario("NO AGREGADO");
					}
					o.setNumCertif(rs.getString(11));
					if (rs.getString(11) == null) {
						o.setNumCertif("NINGUNO");
					}
					o.setNombreFabricante(rs.getString(12));
					o.setPrecio(rs.getString(13));
					o.setMoneda(rs.getString(14));
					o.setFechaOferta(rs.getString(15));
					o.setRecomendacionesBeneficiario(rs.getString(16));
					if (rs.getString(16) == null) {
						o.setRecomendacionesBeneficiario("-");
					}
					o.setPaisOrigen(rs.getString(17));
					if (rs.getString(17) == null) {
						o.setPaisOrigen("NO AGREGADO");
					}
					o.setFechaVencSan(rs.getString(18));
					if (rs.getString(18) == null) {
						o.setFechaVencSan("NO AGREGADA");
					}
					o.setFechaVencManufactura(rs.getString(19));
					if (rs.getString(19) == null) {
						o.setFechaVencManufactura("NO AGREGADA");
					}
					o.setprelacionRALP(rs.getInt(20));
					o.setRecomendacionComite(rs.getString(21));
					if (rs.getString(21) == null) {
						o.setRecomendacionComite("NO AGREGADA");
					}
					o.setnoOferta(rs.getString(22));
					o.setcodSesal(rs.getString(23));
					o.setFechaEmisionSan(rs.getString(24));
					o.setFechaEmisionManufactura(rs.getString(25));
					
					
					reqList.add(o);
				}
				con.close();

			} catch (Exception e) {
				System.out.println(e);
			}

			return reqList;
		}

		public static int updateRecomendacion(ofertaALP o) {
			int status = 0;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"update dbo.ofertaALP set recomendacionComite = ?, criterioRecomendacion = ?, observaciones= ?, recomendacionesBeneficiario = ? where noOferta = ? ");
				ps.setString(1, o.getRecomendacionComite());
				ps.setString(2, o.getCriterioRecomendacion());
				ps.setString(3, o.getObservaciones());
				ps.setString(4, o.getRecomendacionesBeneficiario());
				ps.setInt(5, Integer.parseInt(o.getnoOferta()));				
				
				status = ps.executeUpdate();
				con.close();
				System.out.println();
			} catch (Exception e) {
				System.out.println(e);
			}
			System.out.println(status + " status");
			return status;
		}
		
		public static int updateRecomendacionPrelacion(ofertaALP o) {
			System.out.println( o.getprelacionRALP() + " " + o.getnoOferta());
			int status = 0;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"update dbo.ofertaALP set prelacionRALP = ? where noOferta = ? ");
				ps.setInt(1, o.getprelacionRALP());
				ps.setInt(2, Integer.parseInt(o.getnoOferta()));				
				
				status = ps.executeUpdate();
				con.close();
				System.out.println();
			} catch (Exception e) {
				System.out.println(e);
			}
			System.out.println(status + " status");
			return status;
		}
		
		///// TABLA EXPORT
		public static String getofferListForJSON(int codPadreBus) {
			String offerList = "";
			System.out.println("lkdnlknlkdndlknalkdnalkdnklandkl");
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"select noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado, descripcionTecnicaRequerida,\r\n"
								+ "	   descripcionTecnica, up, canEstimadaOferta, CAST(precio AS DECIMAL(20, 4)) AS precio , nombreFabricante, paisOrigen, registroSanitario, numSanitario,\r\n"
								+ "	   fechaVencSan, fechaEmisionSan, certificadoManufactura, numCertif, fechaVencManufactura, fechaEmisionManufactura,\r\n"
								+ "	   etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, obsOfertasProv, noFoliosOferta, muestraPresentada,\r\n"
								+ "	   solicitudesAclaracion, respuestaSolicitudesAclaracion, consultasArsa, consultasBenef, recomendacionComite,\r\n"
								+ "	   criterioRecomendacion, observaciones, recomendacionesBeneficiario, noOferta, prelacionRALP, moneda, unidadPresentacionRequerida, cantidadRequerida, obsOfertaCEO, (CAST((CAST(precio AS DECIMAL(20, 4))*canEstimadaOferta) AS DECIMAL(20, 4))) as precioTotal from dbo.ofertaALP where codPadre="+ codPadreBus +"");
				
				String j = "{ \"data\":[";
				ResultSet rs = ps.executeQuery();
				int count = 0;
				//String ATCnumberParam = String.valueOf(12);
				while (rs.next()) {
					count++;
					String noOfertaIngresada = rs.getString(1); if (noOfertaIngresada == null) {noOfertaIngresada = "-";}
					String distribuidor = rs.getString(2); if (distribuidor == null) {distribuidor = "-";}
					String idItem = rs.getString(3); if (idItem == null) {idItem = "-";}
					String codATC = rs.getString(4); if (codATC == null) {codATC = "-";}
					String codSesal = rs.getString(5); if (codSesal == null) {codSesal = "-";}
					String medicamentoEstimado = rs.getString(6); if (medicamentoEstimado == null) {medicamentoEstimado = "-";}
					String medicamentoOfertado = rs.getString(7); if (medicamentoOfertado == null) {medicamentoOfertado = "-";}
					String descripcionTecnica = rs.getString(8); if (descripcionTecnica == null) {descripcionTecnica = "-";}
					String descripcionTecnicaOfertada = rs.getString(9); if (descripcionTecnicaOfertada == null) {descripcionTecnicaOfertada = "-";}
					String up = rs.getString(10); if (up == null) {up = "-";}
					String unidadPresentacionRequerida = rs.getString(40); if (unidadPresentacionRequerida == null) {unidadPresentacionRequerida = "-";}
					String canEstimadaOferta = rs.getString(11); if (canEstimadaOferta == null) {canEstimadaOferta = "-";}
					String canRequerida = rs.getString(41); if (canRequerida == null) {canRequerida = "-";}
					String precio = rs.getString(12); if (precio == null) {precio = "-";}
					String nombreFabricante = rs.getString(13); if (nombreFabricante == null) {nombreFabricante = "-";}
					String paisOrigen = rs.getString(14); if (paisOrigen == null) {paisOrigen = "-";}
					String registroSanitario = rs.getString(15); if (registroSanitario == null) {registroSanitario = "-";}
					String numSanitario = rs.getString(16); if (numSanitario == null) {numSanitario = "-";}
					String fechaVencSan = rs.getString(17); if (fechaVencSan == null) {fechaVencSan = "-";}
					String fechaEmisionSan = rs.getString(18); if (fechaEmisionSan == null) {fechaEmisionSan = "-";}
					String certificadoManufactura = rs.getString(19); if (certificadoManufactura == null) {certificadoManufactura = "-";}
					String numCertif = rs.getString(20); if (numCertif == null) {numCertif = "-";}
					String fechaVencManufactura = rs.getString(21); if (fechaVencManufactura == null) {fechaVencManufactura = "-";}
					String fechaEmisionManufactura = rs.getString(22); if (fechaEmisionManufactura == null) {fechaEmisionManufactura = "-";}
					String etiquetadoPrimario = rs.getString(23); if (etiquetadoPrimario == null) {etiquetadoPrimario = "-";}
					String etiquetadoSecundario = rs.getString(24); if (etiquetadoSecundario == null) {etiquetadoSecundario = "-";}
					String etiquetadoTerciario = rs.getString(25); if (etiquetadoTerciario == null) {etiquetadoTerciario = "-";}
					String obsOfertasProv = rs.getString(26); if (obsOfertasProv == null) {obsOfertasProv = "-";}
					String noFoliosOferta = rs.getString(27); if (noFoliosOferta == null) {noFoliosOferta = "-";}
					String muestraPresentada = rs.getString(28); if (muestraPresentada == null) {muestraPresentada = "-";}
					String solicitudesAclaracion = rs.getString(29); if (solicitudesAclaracion == null) {solicitudesAclaracion = "-";}
					String respuestaSolicitudesAclaracion = rs.getString(30); if (respuestaSolicitudesAclaracion == null) {respuestaSolicitudesAclaracion = "-";}
					String consultasArsa = rs.getString(31); if (consultasArsa == null) {consultasArsa = "-";}
					String consultasBenef = rs.getString(32); if (consultasBenef == null) {consultasBenef = "-";}
					String obsCeo = rs.getString(42); if (obsCeo == null) {obsCeo = "-";}
					String historialCumpleCalidad = "VER REPORTE";
					String historialCumpleContrato = "VER REPORTE";				
					String recomendacionComite = rs.getString(33); if (recomendacionComite == null) {recomendacionComite = "-";}
					String criterioRecomendacion = rs.getString(34); if (criterioRecomendacion == null) {criterioRecomendacion = "-";}
					String observaciones = rs.getString(35); if (observaciones == null) {observaciones = "-";}
					String recomendacionesBeneficiario = rs.getString(36); if (recomendacionesBeneficiario == null) {recomendacionesBeneficiario ="-" ;}
					int  noOferta = rs.getInt(37);				
					String prelacionRALP = rs.getString(38); if (prelacionRALP == null) {prelacionRALP ="0" ;}
					String moneda = rs.getString(39); 
					System.out.println("ESTO");
					System.out.println(moneda + " ?" );


					String CE = "";
					String criteriosEvaluacion = "";	
					//String criteriosEvaluacion = "<td><ul>";	
					ArrayList<CriterioEvaluacionDTO> cd = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpciones(noOferta);
					
//					for(CriterioEvaluacionDTO opcionesCriterios : cd) {
//						criteriosEvaluacion += "<li> <b> CRITERIO: </b> "+opcionesCriterios.getNombreCriterio() +" <strong> - OPCION: </strong> "+opcionesCriterios.getNombreCriterioDetalle() +"</li> ";
//					}
//					criteriosEvaluacion += "</ul></td>";
//					
					for(CriterioEvaluacionDTO opcionesCriterios : cd) {
						criteriosEvaluacion +=   "\"" + opcionesCriterios.getNombreCriterioDetalle().toUpperCase() + "\"," ;
					}
					
					CE =criteriosEvaluacion;
					
					if(fechaVencSan == null || fechaVencSan.isEmpty())
					{ fechaVencSan = "-"; }else {
						String[] fechaVencSan1 = fechaVencSan.split("-");
						fechaVencSan = fechaVencSan1[2]+"-"+fechaVencSan1[1]+"-"+fechaVencSan1[0];
					}
					
					if(fechaEmisionSan == null || fechaEmisionSan.isEmpty())
					{ fechaEmisionSan = "-"; }
					else {
						String[] fechaEmisionSan1 = fechaEmisionSan.split("-");
						fechaEmisionSan = fechaEmisionSan1[2]+"-"+fechaEmisionSan1[1]+"-"+fechaEmisionSan1[0];
					}
					
					if(fechaVencManufactura == null || fechaVencManufactura.isEmpty())
					{ fechaVencManufactura = "-"; }
					else {
						String[] fechaVencManufactura1 = fechaVencManufactura.split("-");
						fechaVencManufactura = fechaVencManufactura1[2]+"-"+fechaVencManufactura1[1]+"-"+fechaVencManufactura1[0];
					}
					
					if(fechaEmisionManufactura == null || fechaEmisionManufactura.isEmpty())
					{ fechaEmisionManufactura = "-"; }
					else {String[] fechaEmisionManufactura1 = fechaEmisionManufactura.split("-");
					fechaEmisionManufactura = fechaEmisionManufactura1[2]+"-"+fechaEmisionManufactura1[1]+"-"+fechaEmisionManufactura1[0];}
					
					
					j += "[" + "\"" + noOferta +  "\"," + "\""  + count + "\"," + "\""  + noOfertaIngresada.toUpperCase() + "\"," + "\"" + distribuidor.toUpperCase() + "\"," + "\""
							+ idItem.toUpperCase() + "\"," + "\"" + codATC.toUpperCase() + "\"," + "\"" + codSesal.toUpperCase() + "\"," + "\"" 
							+ medicamentoEstimado.toUpperCase() + "\"," + "\"" + medicamentoOfertado.toUpperCase() + "\"," + "\"" + descripcionTecnica.toUpperCase() + "\"," + "\""						
							+ descripcionTecnicaOfertada.toUpperCase() + "\"," + "\"" + unidadPresentacionRequerida.toUpperCase() + "\"," +  "\"" +   up.toUpperCase() + "\"," + "\"" 
							+ nombreFabricante.toUpperCase() + "\"," + "\"" + paisOrigen.toUpperCase()+ "\"," + "\"" + canRequerida.toUpperCase() + "\"," + "\"" + canEstimadaOferta.toUpperCase() + "\"," + "\""						
							+ (moneda + " " + precio.toUpperCase()  ) + "\"," + "\"" + moneda + " " +rs.getString(43) + "\"," + "\"" 
							+ registroSanitario.toUpperCase() + "\"," + "\"" 
							+ numSanitario + "\"," + "\"" + fechaVencSan + "\"," + "\"" + fechaEmisionSan + "\"," + "\"" 
							+ certificadoManufactura.toUpperCase() + "\"," + "\"" + numCertif + "\"," + "\"" + fechaVencManufactura + "\"," + "\"" 
							+ fechaEmisionManufactura + "\"," + "\"" + etiquetadoPrimario.toUpperCase() + "\"," + "\"" + etiquetadoSecundario.toUpperCase() + "\"," + "\""
							+ etiquetadoTerciario.toUpperCase() + "\"," + "\"" + muestraPresentada.toUpperCase() + "\"," + "\"" + noFoliosOferta + "\"," + "\""
							+ obsOfertasProv.toUpperCase() + "\"," + "\"" + solicitudesAclaracion.toUpperCase() + "\"," + "\""
							+ respuestaSolicitudesAclaracion.toUpperCase() + "\"," + "\"" + consultasArsa.toUpperCase() + "\"," + "\"" + consultasBenef.toUpperCase() + "\"," + "\""
							+ obsCeo.toUpperCase() + "\"," + "\"" + historialCumpleCalidad.toUpperCase() + "\"," + "\"" + historialCumpleContrato.toUpperCase() + "\","+ "\"" 
							+ recomendacionComite.toUpperCase() + "\","  + "\"" + prelacionRALP.toUpperCase() + "\","  + "\"" 
							+ criterioRecomendacion.toUpperCase() + "\"," + "\"" + observaciones.toUpperCase() +  "\"," + "\"" + recomendacionesBeneficiario.toUpperCase() +  "\"," + CE  +  "\"" + ""  + "\"],";
				}
				
				
				if (count == 0) {
					
					int st = 0;
					String criteriosEvaluacion = "";
					String empty = "-";
					
					ps = con.prepareStatement("select  npc.idProc from ofertaALP as oALP inner join numeroProcesoCompra as npc on npc.cod = oALP.procesoCompra WHERE oALP.codPadre = "+ codPadreBus  +" group by npc.idProc");
					rs = ps.executeQuery();
					while (rs.next()) {
						 st = rs.getInt(1);
					}
					
					ps = con.prepareStatement("select CEALP.idC, CED.NombreCriterio from [dbo].[CriterioEvaluacionALP] as CEALP INNER JOIN CriteriosEvaluacionDetalle AS CED ON CEALP.idC = CED.idCE  where CEALP.Estado = 'true' and CEALP.cod = "+ st +" group by CEALP.idC, CED.NombreCriterio");
					rs = ps.executeQuery();
					while (rs.next()) {
						// st = rs.getInt(1);
						 criteriosEvaluacion +=   "\"" + empty + "\"," ;
					}
					
					j += "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," 
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
							 + criteriosEvaluacion + "\"" + empty + "\"],";
				}
				
				j = j.substring(0, j.length() - 1);
				j += "]}";
				System.out.println(j);
				offerList = j;
				System.out.println(offerList);
				con.close();
			} catch (Exception e) {
				System.out.println(e);
			}

			return offerList;
		}
		
		public static int updateRecomendacionRactifcacion(ofertaALP o) {
			int status = 0;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"update dbo.ofertaALP set recomendacionComite = ?, criterioRecomendacion = ?, observaciones= ?, recomendacionesBeneficiario = ? where noOferta = ? ");
				ps.setString(1, o.getRecomendacionComite());
				ps.setString(2, o.getCriterioRecomendacion());
				ps.setString(3, o.getObservaciones());
				ps.setString(4, o.getRecomendacionesBeneficiario());
				ps.setInt(5, Integer.parseInt(o.getnoOferta()));				
				
				status = ps.executeUpdate();
				con.close();
				System.out.println();
			} catch (Exception e) {
				System.out.println(e);
			}
			System.out.println(status + " status");
			return status;
		}
		
		public static int validarNewNumOferta(String purchaseProc, String noOfertador, String distributor, String reqID) {
			
			int Finalizado = 0 ;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"SELECT count(idItem) as cantidadOfertadaVaciada FROM ofertaALP where noOfertaIngresada =? and procesoCompra =? and idItem = ?");		
				 //ps.setString(1, distributor);
				 ps.setString(1, noOfertador);
				 ps.setString(2, purchaseProc);
				 ps.setString(3, reqID);
				ResultSet rs = ps.executeQuery();
				int cantfertadas = 0;
				if (rs.next()) {
					cantfertadas = rs.getInt(1);
				}			
				System.out.println("cantfertadas "+ cantfertadas);
				
				if(cantfertadas > 0) {
					PreparedStatement ps2  = con.prepareStatement("select ofertasRecividas from actaApertura where procesoCompra = '"+purchaseProc+"' and idListRequirement = '"+reqID+"' and noOfertador = '"+noOfertador+"'");
					
					ResultSet rs2 = ps2.executeQuery();
					int cantActas = 0;
					if (rs2.next()) {
						cantActas = rs2.getInt(1);;
					}
					
					System.out.println("cantActas "+ cantActas);
					
					if(cantActas == cantfertadas) {
						Finalizado =1;
					}else {
						Finalizado =0;
					}
					
					System.out.println("Finalizado "+ Finalizado);
				}
				
				
				
			} catch (Exception e) {
				System.out.println(e);
			}
			return Finalizado;
		}
		
		public static int validarUpdateNumOferta(String purchaseProc, String noOferta , String noOfertador, String distributor) {
			System.out.println("-----------------------------------");
			System.out.println(purchaseProc + " " + noOferta + " " + noOfertador + " " + distributor);
			
			int existe = 0 ;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"SELECT * FROM ofertaALP where noOfertaIngresada =? and procesoCompra =? and noOferta !=?");		
				 //ps.setString(1, distributor);
				 ps.setString(1, noOfertador);
				 ps.setString(2, purchaseProc);
				 ps.setInt(3, Integer.parseInt(noOferta));
				ResultSet rs = ps.executeQuery();
				int count = 0;
				if (rs.next()) {
					count += 1;
				}
				
				existe = count;
				
			} catch (Exception e) {
				System.out.println();
			}
			System.out.println(existe + " existe existeexiste" );
			return existe;
		}
		
		
		public static int ValidaSihayOfertaPorProducto(String procesoCompra, int item) {
			
			int existe = 0 ;
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"select * from ofertaALP where procesoCompra =? and idItem = ?");		
				 ps.setString(1, procesoCompra);
				 ps.setInt(2, item);
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					existe++;
				}				
				
			} catch (Exception e) {
				System.out.println();
			}
			return existe;
		}
		
public static ofertaALP SelectDataDetele(int noOferta) {
			
			ofertaALP oferta = new ofertaALP();
			try {
				Connection con = Database.connect();
				PreparedStatement ps = con.prepareStatement(
						"select idConsolidado, procesoCompra from dbo.ofertaALP where noOferta =?");		
				 ps.setInt(1, noOferta);				
				ResultSet rs = ps.executeQuery();
				
				if (rs.next()) {
					oferta.setIdConsolidado(rs.getLong(1));
					oferta.setProcesoCompra(rs.getString(2));
				}				
				
			} catch (Exception e) {
				System.out.println();
			}
			return oferta;
		}
		
		
}
