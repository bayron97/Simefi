package main.dao;

import main.model.*;
import main.Database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ofertaGeneralDao {
	public static int save(ofertaGeneral o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"insert into dbo.ofertaGeneral (procesoCompra, fechaOferta, distribuidor, medicamentoEstimado, up, precio, moneda, codATC, medicamentoOfertado, descripcionTecnica, recomendacionComite, criterioRecomendacion, observaciones, recomendacionesBeneficiario, prelacion, fechaRatificacion, ratificacionCTF, comentariosRatificacion, codPadre, noOfertasRecibidas, nombreFabricante, registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, muestraPresentada, noFoliosOferta, obsOfertasProv, consultasArsa, consultasBenef, solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio, historialContrato, cantidadCriterio, icotermCriterio, regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil, garantiaFabrica, cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio, mantenimientoCapCriterio, idConsolidado, idItem, estado, numSanitario, numCertif, paisOrigen, descripcionTecnicaRequerida, unidadPresentacionRequerida) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			ps.setString(15, o.getPrelacion());
			ps.setString(16, o.getFechaRatificacion());
			ps.setString(17, o.getRatificacionCTF());
			ps.setString(18, o.getComentariosRatificacion());
			ps.setInt(19, o.getCodPadre());
			ps.setInt(20, o.getNoOfertasRecibidas());
			ps.setString(21, o.getNombreFabricante());
			ps.setString(22, o.getRegistroSanitario());
			ps.setString(23, o.getFechaVencSan());
			ps.setString(24, o.getFechaEmisionSan());
			ps.setString(25, o.getCertificadoManufactura());
			ps.setString(26, o.getFechaVencManufactura());
			ps.setString(27, o.getFechaEmisionManufactura());
			ps.setString(28, o.getEtiquetadoPrimario());
			ps.setString(29, o.getEtiquetadoSecundario());
			ps.setString(30, o.getEtiquetadoTerciario());
			ps.setString(31, o.getMuestraPresentada());
			ps.setString(32, o.getNoFoliosOferta());
			ps.setString(33, o.getObsOfertaProv());
			ps.setString(34, o.getConsultasArsa());
			ps.setString(35, o.getConsultasBenef());
			ps.setString(36, o.getSolicitudesAclaracion());
			ps.setString(37, o.getRespuestaSolicitudesAclaracion());
			ps.setString(38, o.getRegistroProveedor());
			ps.setString(39, o.getDescTecnicaCriterio());
			ps.setString(40, o.getHistorialContrato());
			ps.setString(41, o.getCantidadCriterio());
			ps.setString(42, o.getIcotermCriterio());
			ps.setString(43, o.getRegSanitarioCriterio());
			ps.setString(44, o.getGarantiaOfertaCriterio());
			ps.setString(45, o.getTiempoEntrega());
			ps.setString(46, o.getVidaUtil());
			ps.setString(47, o.getGarantiaFabrica());
			ps.setString(48, o.getCartaCompromisoCriterio());
			ps.setString(49, o.getAseguramientoCalidad());
			ps.setString(50, o.getRazonabilidadPrecios());
			ps.setString(51, o.getCertificadoCriterio());
			ps.setString(52, o.getMantenimientoCapCriterio());
			ps.setLong(53, o.getIdConsolidado());
			ps.setLong(54, o.getIdItem());
			ps.setString(55, o.getEstado());
			ps.setString(56, o.getNumSanitario());
			ps.setString(57, o.getNumCertif());
			ps.setString(58, o.getPaisOrigen());
			ps.setString(59, o.getDescripcionTecnicaRequerida());
			ps.setString(60, o.getUnidadPresentacionRequerida());
			
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateOfferData(ofertaGeneral o, String purchaseNumber, long itemID) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.ofertaGeneral set fechaOferta = ?, distribuidor = ?, medicamentoEstimado = ?, up = ?, precio = ?, moneda = ?, codATC =?, medicamentoOfertado = ?, descripcionTecnica = ?, codPadre = ?, noOfertasRecibidas = ?, nombreFabricante = ?, registroSanitario = ?, fechaVencSan = ?, fechaEmisionSan = ?, certificadoManufactura = ?, fechaVencManufactura = ?, fechaEmisionManufactura = ?, etiquetadoPrimario = ?, etiquetadoSecundario = ?, etiquetadoTerciario = ?, muestraPresentada = ?, noFoliosOferta = ?, obsOfertasProv = ?, consultasArsa = ?, consultasBenef = ?, solicitudesAclaracion = ?, respuestaSolicitudesAclaracion = ?, registroProveedor = ?, descTecnicaCriterio = ?, historialContrato = ?, cantidadCriterio = ?, icotermCriterio = ?, regSanitarioCriterio = ?, garantiaOfertaCriterio = ?, tiempoEntrega = ?, vidaUtil = ?, garantiaFabrica = ?, cartaCompromisoCriterio = ?, aseguramientoCalidad = ?, razonabilidadPrecios = ?, certificadoCriterio = ?, mantenimientoCapCriterio = ?, idConsolidado = ?, estado = ?, numSanitario = ?, numCertif = ?, paisOrigen = ?, descripcionTecnicaRequerida = ?, unidadPresentacionRequerida = ? where procesoCompra = ? and idItem = ?");
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

			ps.setString(51, purchaseNumber);
			ps.setLong(52, itemID);

			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteOne(String purchaseNumber, long itemID) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con
					.prepareStatement("delete from dbo.ofertaGeneral where procesoCompra = ? and idItem = ?");
			ps.setString(1, purchaseNumber);
			ps.setLong(2, itemID);
			status = ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static ofertaGeneral getOneAprovBasic(String purchaseNumber, int idItem) {
		ofertaGeneral o = new ofertaGeneral();
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distinct idItem, medicamentoEstimado, medicamentoOfertado, up, unidadPresentacionRequerida, descripcionTecnica, descripcionTecnicaRequerida, codATC, distribuidor, numSanitario, numCertif, nombreFabricante, precio, moneda, fechaOferta, recomendacionesBeneficiario, paisOrigen, fechaVencSan, fechaVencManufactura from dbo.ofertaGeneral where procesoCompra = ? and idItem = ?");
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
					"select count(*) from dbo.ofertaGeneral where idConsolidado = ? and procesoCompra = ?");
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
			PreparedStatement ps = con.prepareStatement("select idItem from dbo.ofertaGeneral where procesoCompra = ?");
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
					"SELECT cod FROM dbo.vaciadoOfertasGeneral where procesoCompra='" + buyPurchaseNumber + "'");
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

	public static int updateRatificaciones(ofertaGeneral o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.ofertaGeneral set fechaRatificacion = ?, ratificacionCTF = ?, comentariosRatificacion = ? where procesoCompra = ? and medicamentoOfertado = ? and codATC = ? and codPadre = ? and distribuidor = ? and medicamentoEstimado = ? and descripcionTecnica = ?"
							+ " and up = ? and precio = ?");
			ps.setString(1, o.getFechaRatificacion());
			ps.setString(2, o.getRatificacionCTF());
			ps.setString(3, o.getComentariosRatificacion());
			ps.setString(4, o.getProcesoCompra());
			ps.setString(5, o.getMedicamentoOfertado());
			ps.setString(6, o.getCodATC());
			ps.setInt(7, o.getCodPadre());
			ps.setString(8, o.getDistribuidor());
			ps.setString(9, o.getMedicamentoEstimado());
			ps.setString(10, o.getDescripcionTecnica());
			ps.setString(11, o.getUp());
			ps.setString(12, o.getPrecio());
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateRecomendaciones(ofertaGeneral o) {
		int status = 0;
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"update dbo.ofertaGeneral set recomendacionComite = ?, criterioRecomendacion = ?, observaciones= ?, recomendacionesBeneficiario = ?, prelacion= ? where procesoCompra = ? and medicamentoOfertado = ? and codATC = ? and codPadre = ? and distribuidor = ? and medicamentoEstimado = ? and descripcionTecnica = ? and up = ? and precio = ?");
			ps.setString(1, o.getRecomendacionComite());
			ps.setString(2, o.getCriterioRecomendacion());
			ps.setString(3, o.getObservaciones());
			ps.setString(4, o.getRecomendacionesBeneficiario());
			ps.setString(5, o.getPrelacion());
			ps.setString(6, o.getProcesoCompra());
			ps.setString(7, o.getMedicamentoOfertado());
			ps.setString(8, o.getCodATC());
			ps.setInt(9, o.getCodPadre());
			ps.setString(10, o.getDistribuidor());
			ps.setString(11, o.getMedicamentoEstimado());
			ps.setString(12, o.getDescripcionTecnica());
			ps.setString(13, o.getUp());
			ps.setString(14, o.getPrecio());
			status = ps.executeUpdate();
			con.close();
			System.out.println();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static String getofferListByPurchaseNumber(String GeneralNumber) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distribuidor, codATC, medicamentoEstimado, medicamentoOfertado, descripcionTecnica, up, precio, moneda, fechaOferta,"
							+ "nombreFabricante, registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, muestraPresentada,"
							+ "noFoliosOferta, obsOfertasProv, consultasArsa, consultasBenef, solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio, historialContrato, cantidadCriterio, icotermCriterio,"
							+ "regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil, garantiaFabrica, cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio, mantenimientoCapCriterio, idConsolidado, idItem, estado,"
							+ "numSanitario, numCertif" + " from dbo.ofertaGeneral where procesoCompra Like '" + GeneralNumber
							+ "%'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String distFab = rs.getString(1);
				String codATC = rs.getString(2);
				String nombreMedicamentoEstimado = rs.getString(3);
				String nombreMedicamentoOfertado = rs.getString(4);
				String descripcionTecnicaOfertada = rs.getString(5);
				if (descripcionTecnicaOfertada == null) {
					descripcionTecnicaOfertada = "NO AGREGADA";
				}
				String upOfertada = rs.getString(6);
				if (upOfertada == null) {
					upOfertada = "NINGUNA";
				}
				String precioUnitarioOfertado = rs.getString(7);
				String moneda = rs.getString(8);
				String fechaOferta = rs.getString(9);
				String nombreFabricante = rs.getString(10);
				if (nombreFabricante == null) {
					nombreFabricante = "-";
				}
				String paisOrigen = "-";
				String registroSanitario = rs.getString(11);
				if (registroSanitario == null) {
					registroSanitario = "-";
				}
				String fechaVencimientoSanitario = rs.getString(12);
				if (fechaVencimientoSanitario == null) {
					fechaVencimientoSanitario = "-";
				}
				String fechaEmisionSanitario = rs.getString(13);
				if (fechaEmisionSanitario == null) {
					fechaEmisionSanitario = "-";
				}
				String certificadoManufactura = rs.getString(14);
				if (certificadoManufactura == null) {
					certificadoManufactura = "-";
				}
				String fechaVencimientoManufactura = rs.getString(15);
				if (fechaVencimientoManufactura == null) {
					fechaVencimientoManufactura = "-";
				}
				String fechaEmisionManufactura = rs.getString(16);
				if (fechaEmisionManufactura == null) {
					fechaEmisionManufactura = "-";
				}
				String etiquetadoPrimario = rs.getString(17);
				if (etiquetadoPrimario == null) {
					etiquetadoPrimario = "-";
				}
				String etiquetadoSecundario = rs.getString(18);
				if (etiquetadoSecundario == null) {
					etiquetadoSecundario = "-";
				}
				String etiquetadoTerciario = rs.getString(19);
				if (etiquetadoTerciario == null) {
					etiquetadoTerciario = "-";
				}
				String muestraPresentada = rs.getString(20);
				if (muestraPresentada == null) {
					muestraPresentada = "-";
				}
				String nofoliosOferta = rs.getString(21);
				if (nofoliosOferta == null) {
					nofoliosOferta = "-";
				}
				String obsOfertasProv = rs.getString(22);
				if (obsOfertasProv == null) {
					obsOfertasProv = "-";
				}
				String consultasArsa = rs.getString(23);
				if (consultasArsa == null) {
					consultasArsa = "-";
				}
				String consultasBenef = rs.getString(24);
				if (consultasBenef == null) {
					consultasBenef = "-";
				}
				String historialCumplimientoCalidad = "VER REPORTE";
				String historialCumplimientoContrato = "VER REPORTE";
				String solicitudesAclaracion = rs.getString(25);
				if (solicitudesAclaracion == null) {
					solicitudesAclaracion = "-";
				}
				String respuestaSolicitudesAclaracion = rs.getString(26);
				if (respuestaSolicitudesAclaracion == null) {
					respuestaSolicitudesAclaracion = "-";
				}
				String registroProveedorCriterio = rs.getString(27);
				if (registroProveedorCriterio == null) {
					registroProveedorCriterio = "NO CUMPLE";
				}
				String descTecnicaCriterio = rs.getString(28);
				if (descTecnicaCriterio == null) {
					descTecnicaCriterio = "NO CUMPLE";
				}
				String historialCumplimientoContratosCriterio = rs.getString(29);
				if (historialCumplimientoContratosCriterio == null) {
					historialCumplimientoContratosCriterio = "NO CUMPLE";
				}
				String cantidadCriterio = rs.getString(30);
				if (cantidadCriterio == null) {
					cantidadCriterio = "NO CUMPLE";
				}
				String icoTermCriterio = rs.getString(31);
				if (icoTermCriterio == null) {
					icoTermCriterio = "NO CUMPLE";
				}
				String regSanCriterio = rs.getString(32);
				if (regSanCriterio == null) {
					regSanCriterio = "NO CUMPLE";
				}
				String garantiaOfertaCriterio = rs.getString(33);
				if (garantiaOfertaCriterio == null) {
					garantiaOfertaCriterio = "NO CUMPLE";
				}
				String tiempoEntregaCriterio = rs.getString(34);
				if (tiempoEntregaCriterio == null) {
					tiempoEntregaCriterio = "NO CUMPLE";
				}
				String vidaUtilCriterio = rs.getString(35);
				if (vidaUtilCriterio == null) {
					vidaUtilCriterio = "NO CUMPLE";
				}
				String garantiaFabricaCriterio = rs.getString(36);
				if (garantiaFabricaCriterio == null) {
					garantiaFabricaCriterio = "NO CUMPLE";
				}
				String cartaCompromisoCriterio = rs.getString(37);
				if (cartaCompromisoCriterio == null) {
					cartaCompromisoCriterio = "NO CUMPLE";
				}
				String aseguramientoCalidadCriterio = rs.getString(38);
				if (aseguramientoCalidadCriterio == null) {
					aseguramientoCalidadCriterio = "NO CUMPLE";
				}
				String razonabilidadPreciosCriterio = rs.getString(39);
				if (razonabilidadPreciosCriterio == null) {
					razonabilidadPreciosCriterio = "NO CUMPLE";
				}
				String certificadoBuenasPracticasManufacturaCriterio = rs.getString(40);
				if (certificadoBuenasPracticasManufacturaCriterio == null) {
					certificadoBuenasPracticasManufacturaCriterio = "NO CUMPLE";
				}
				String mantenimientoCapacitacionCriterio = rs.getString(41);
				if (mantenimientoCapacitacionCriterio == null) {
					mantenimientoCapacitacionCriterio = "NO CUMPLE";
				}
				String idReq = rs.getString(42);
				String idItem = rs.getString(43);

				String estadoOferta = rs.getString(44);
				if (estadoOferta == null) {
					estadoOferta = "EN PROCESO";
				}

				String numSanitario = rs.getString(45);
				String numCertif = rs.getString(46);

				j += "[" + "\"" + idItem + "\"," + "\"" + distFab + "\"," + "\"" + codATC + "\"," + "\""
						+ nombreMedicamentoEstimado + "\"," + "\"" + nombreMedicamentoOfertado + "\"," + "\""
						+ descripcionTecnicaOfertada + "\"," + "\"" + upOfertada + "\"," + "\"" + precioUnitarioOfertado
						+ "\"," + "\"" + moneda + "\"," + "\"" + fechaOferta + "\"," + "\"" + nombreFabricante + "\","
						+ "\"" + paisOrigen + "\"," + "\"" + registroSanitario + "\"," + "\""
						+ numSanitario + "\"," + "\"" + fechaVencimientoSanitario + "\"," + "\""
						+ fechaEmisionSanitario + "\"," + "\"" + certificadoManufactura + "\"," + "\""
						+ numCertif + "\"," + "\"" + fechaVencimientoManufactura + "\"," + "\""
						+ fechaEmisionManufactura + "\"," + "\"" + etiquetadoPrimario + "\"," + "\""
						+ etiquetadoSecundario + "\"," + "\"" + etiquetadoTerciario + "\"," + "\"" + muestraPresentada
						+ "\"," + "\"" + nofoliosOferta + "\"," + "\"" + obsOfertasProv + "\"," + "\"" + consultasArsa
						+ "\"," + "\"" + consultasBenef + "\"," + "\"" + historialCumplimientoCalidad + "\"," + "\""
						+ historialCumplimientoContrato + "\"," + "\"" + solicitudesAclaracion + "\"," + "\""
						+ respuestaSolicitudesAclaracion + "\"," + "\"" + registroProveedorCriterio + "\"," + "\""
						+ descTecnicaCriterio + "\"," + "\"" + historialCumplimientoContratosCriterio + "\"," + "\""
						+ cantidadCriterio + "\"," + "\"" + icoTermCriterio + "\"," + "\"" + regSanCriterio + "\","
						+ "\"" + garantiaOfertaCriterio + "\"," + "\"" + tiempoEntregaCriterio + "\"," + "\""
						+ vidaUtilCriterio + "\"," + "\"" + garantiaFabricaCriterio + "\"," + "\""
						+ cartaCompromisoCriterio + "\"," + "\"" + aseguramientoCalidadCriterio + "\"," + "\""
						+ razonabilidadPreciosCriterio + "\"," + "\"" + certificadoBuenasPracticasManufacturaCriterio
						+ "\"," + "\"" + mantenimientoCapacitacionCriterio + "\"," + "\"" + idReq + "\"," + "\""
						+ estadoOferta + "\"],";
			}
			if (count == 0) {
				String empty = "-";
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
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerList;
	}

	public static String getofferAprovBasicListByPurchaseNumber(String GeneralNumber) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select idItem, medicamentoOfertado, up, descripcionTecnica, codATC, distribuidor from dbo.ofertaGeneral where procesoCompra Like '"
							+ GeneralNumber + "%' and recomendacionComite='SI'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			while (rs.next()) {
				count++;
				String idItem = rs.getString(1);
				String medicamentoOfertado = rs.getString(2);
				String unidadPresentacionOfertada = rs.getString(3);
				if (unidadPresentacionOfertada == null) {
					unidadPresentacionOfertada = "NINGUNA";
				}
				String descripcionTecnicaOfertada = rs.getString(4);
				if (descripcionTecnicaOfertada == null) {
					descripcionTecnicaOfertada = "NO AGREGADA";
				}
				String codigoATC = rs.getString(5);
				String proveedor = rs.getString(6);

				j += "[" + "\"" + idItem + "\"," + "\"" + medicamentoOfertado + "\"," + "\""
						+ unidadPresentacionOfertada + "\"," + "\"" + descripcionTecnicaOfertada + "\"," + "\""
						+ codigoATC + "\"," + "\"" + proveedor + "\"],";
			}
			if (count == 0) {
				String empty = "-";
				j += "[" + "\"" + "-" + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
						+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerList;
	}

	public static String getofferListForIRByATCNumberJSON(String proc, int ATCnumber) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distribuidor, medicamentoEstimado, medicamentoOfertado, descripcionTecnica, up, precio, moneda, recomendacionComite, criterioRecomendacion, observaciones, recomendacionesBeneficiario,prelacion, fechaOferta, nombreFabricante, \r\n"
							+ "registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura, fechaVencManufactura, fechaEmisionManufactura, \r\n"
							+ "etiquetadoPrimario, etiquetadoSecundario, etiquetadoTerciario, muestraPresentada,noFoliosOferta, obsOfertasProv, consultasArsa,\r\n"
							+ "consultasBenef, solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio, historialContrato,\r\n"
							+ "cantidadCriterio, icotermCriterio,regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil, garantiaFabrica,\r\n"
							+ "cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio from dbo.ofertaGeneral where codATC Like '"
							+ ATCnumber + "%' and procesoCompra=?");
			ps.setString(1, proc);
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			String ATCnumberParam = String.valueOf(ATCnumber);
			while (rs.next()) {
				count++;
				String distribuidor = rs.getString(1);
				String medicamentoEstimado = rs.getString(2);
				String medicamentoOfertado = rs.getString(3);
				String descripcionTecnica = rs.getString(4);
				if (descripcionTecnica == null) {
					descripcionTecnica = "-";
				}
				String up = rs.getString(5);
				if (up == null) {
					up = "-";
				}
				String precio = rs.getString(6);
				String moneda = rs.getString(7);
				String recomendacionComite = rs.getString(8);
				if (recomendacionComite == null) {
					recomendacionComite = "-";
				}
				String criterioRecomendacion = rs.getString(9);
				if (criterioRecomendacion == null) {
					criterioRecomendacion = "-";
				}
				String observaciones = rs.getString(10);
				if (observaciones == null) {
					observaciones = "-";
				}
				String recomendacionesBeneficiario = rs.getString(11);
				if (recomendacionesBeneficiario == null) {
					recomendacionesBeneficiario = "-";
				}
				String prelacion = rs.getString(12);
				if (prelacion == null) {
					prelacion = "-";
				}
				String fechaOferta = rs.getString(13);
				if (fechaOferta == null) {
					fechaOferta = "-";
				}
				String nombrefabricante = rs.getString(14);
				if (nombrefabricante == null) {
					nombrefabricante = "-";
				}
				String registrosanitario = rs.getString(15);
				if (registrosanitario == null) {
					registrosanitario = "-";
				}
				String fechavencsan = rs.getString(16);
				if (fechavencsan == null) {
					fechavencsan = "-";
				}
				String fechaemisionsan = rs.getString(17);
				if (fechaemisionsan == null) {
					fechaemisionsan = "-";
				}
				String certificadomanufactura = rs.getString(18);
				if (certificadomanufactura == null) {
					certificadomanufactura = "-";
				}
				String fechavencmanufactura = rs.getString(19);
				if (fechavencmanufactura == null) {
					fechavencmanufactura = "-";
				}
				String fechaemisionmanufactura = rs.getString(20);
				if (fechaemisionmanufactura == null) {
					fechaemisionmanufactura = "-";
				}
				String etiquetadoprimario = rs.getString(21);
				if (etiquetadoprimario == null) {
					etiquetadoprimario = "-";
				}
				String etiquetadosecundario = rs.getString(22);
				if (etiquetadosecundario == null) {
					etiquetadosecundario = "-";
				}
				String etiquetadoterciario = rs.getString(23);
				if (etiquetadoterciario == null) {
					etiquetadoterciario = "-";
				}
				String muestrapresentada = rs.getString(24);
				if (muestrapresentada == null) {
					muestrapresentada = "-";
				}
				String nofoliosoferta = rs.getString(25);
				if (nofoliosoferta == null) {
					observaciones = "-";
				}
				String obsofertaprov = rs.getString(26);
				if (obsofertaprov == null) {
					obsofertaprov = "-";
				}
				String consultasarsa = rs.getString(27);
				if (consultasarsa == null) {
					consultasarsa = "-";
				}
				String consultasbenef = rs.getString(28);
				if (consultasbenef == null) {
					consultasbenef = "-";
				}
				String solicitudesaclaracion = rs.getString(29);
				if (solicitudesaclaracion == null) {
					solicitudesaclaracion = "-";
				}
				String respuestasolicitudesaclaracion = rs.getString(30);
				if (respuestasolicitudesaclaracion == null) {
					respuestasolicitudesaclaracion = "-";
				}
				String registroproveedor = rs.getString(31);
				if (registroproveedor == null) {
					registroproveedor = "-";
				}
				String descripciontecnicacriterio = rs.getString(32);
				if (descripciontecnicacriterio == null) {
					descripciontecnicacriterio = "-";
				}
				String historialcontrato = rs.getString(33);
				if (historialcontrato == null) {
					historialcontrato = "-";
				}
				String cantidadcriterio = rs.getString(34);
				if (cantidadcriterio == null) {
					cantidadcriterio = "-";
				}
				String icotermcriterio = rs.getString(35);
				if (icotermcriterio == null) {
					icotermcriterio = "-";
				}
				String regsanitariocriterio = rs.getString(36);
				if (regsanitariocriterio == null) {
					regsanitariocriterio = "-";
				}
				String garantiaofertacriterio = rs.getString(37);
				if (garantiaofertacriterio == null) {
					garantiaofertacriterio = "-";
				}
				String tiempoentrega = rs.getString(38);
				if (tiempoentrega == null) {
					tiempoentrega = "-";
				}
				String vidautil = rs.getString(39);
				if (vidautil == null) {
					vidautil = "-";
				}
				String garantiafabrica = rs.getString(40);
				if (garantiafabrica == null) {
					garantiafabrica = "-";
				}
				String cartacompromisocriterio = rs.getString(41);
				if (cartacompromisocriterio == null) {
					cartacompromisocriterio = "-";
				}
				String aseguramientocalidad = rs.getString(42);
				if (aseguramientocalidad == null) {
					aseguramientocalidad = "-";
				}
				String razonabilidadprecios = rs.getString(43);
				if (razonabilidadprecios == null) {
					razonabilidadprecios = "-";
				}
				String certificadocriterio = rs.getString(44);
				if (certificadocriterio == null) {
					certificadocriterio = "-";
				}

				j += "[" + "\"" + count + "\"," + "\"" + distribuidor + "\"," + "\"" + ATCnumberParam + "\"," + "\""
						+ medicamentoEstimado + "\"," + "\"" + medicamentoOfertado + "\"," + "\"" + descripcionTecnica
						+ "\"," + "\"" + up + "\"," + "\"" + precio + "\"," + "\"" + moneda + "\"," + "\""
						+ recomendacionComite + "\"," + "\"" + criterioRecomendacion + "\"," + "\"" + observaciones
						+ "\"," + "\"" + recomendacionesBeneficiario + "\"," + "\"" + prelacion + "\"," + "\""
						+ fechaOferta + "\"," + "\"" + nombrefabricante + "\"," + "\"" + registrosanitario + "\","
						+ "\"" + fechavencsan + "\"," + "\"" + fechaemisionsan + "\"," + "\"" + certificadomanufactura
						+ "\"," + "\"" + fechavencmanufactura + "\"," + "\"" + fechaemisionmanufactura + "\"," + "\""
						+ etiquetadoprimario + "\"," + "\"" + etiquetadosecundario + "\"," + "\"" + etiquetadoterciario
						+ "\"," + "\"" + muestrapresentada + "\"," + "\"" + nofoliosoferta + "\"," + "\""
						+ obsofertaprov + "\"," + "\"" + consultasarsa + "\"," + "\"" + consultasbenef + "\"," + "\""
						+ solicitudesaclaracion + "\"," + "\"" + respuestasolicitudesaclaracion + "\"," + "\""
						+ registroproveedor + "\"," + "\"" + descripciontecnicacriterio + "\"," + "\""
						+ historialcontrato + "\"," + "\"" + cantidadcriterio + "\"," + "\"" + icotermcriterio + "\","
						+ "\"" + regsanitariocriterio + "\"," + "\"" + garantiaofertacriterio + "\"," + "\""
						+ tiempoentrega + "\"," + "\"" + vidautil + "\"," + "\"" + garantiafabrica + "\"," + "\""
						+ cartacompromisocriterio + "\"," + "\"" + aseguramientocalidad + "\"," + "\""
						+ razonabilidadprecios + "\"," + "\"" + certificadocriterio + "\"," + "\""

						+ "\"],";
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

	public static String getofferListForRatificationByATCNumberJSON(int ATCnumber) {
		String offerList = "";
		try {
			Connection con = Database.connect();
			PreparedStatement ps = con.prepareStatement(
					"select distribuidor, medicamentoEstimado, medicamentoOfertado, descripcionTecnica, up, precio, moneda, recomendacionComite, criterioRecomendacion, observaciones, recomendacionesBeneficiario, ratificacionCTF, comentariosRatificacion, fechaRatificacion from dbo.ofertaGeneral where codATC Like '"
							+ ATCnumber + "%'");
			String j = "{ \"data\":[";
			ResultSet rs = ps.executeQuery();
			int count = 0;
			String ATCnumberParam = String.valueOf(ATCnumber);
			while (rs.next()) {
				count++;
				String distribuidor = rs.getString(1);
				String medicamentoEstimado = rs.getString(2);
				String medicamentoOfertado = rs.getString(3);
				String descripcionTecnica = rs.getString(4);
				if (descripcionTecnica == null) {
					descripcionTecnica = "-";
				}
				String up = rs.getString(5);
				if (up == null) {
					up = "-";
				}
				String precio = rs.getString(6);
				String moneda = rs.getString(7);
				String recomendacionComite = rs.getString(8);
				if (recomendacionComite == null) {
					recomendacionComite = "-";
				}
				String criterioRecomendacion = rs.getString(9);
				if (criterioRecomendacion == null) {
					criterioRecomendacion = "-";
				}
				String observaciones = rs.getString(10);
				if (observaciones == null) {
					observaciones = "-";
				}
				String recomendacionesBeneficiario = rs.getString(11);
				if (recomendacionesBeneficiario == null) {
					recomendacionesBeneficiario = "-";
				}
				String ratificacionCTF = rs.getString(12);
				if (ratificacionCTF == null) {
					ratificacionCTF = "-";
				}
				String comentariosRatificacion = rs.getString(13);
				if (comentariosRatificacion == null) {
					comentariosRatificacion = "-";
				}
				String fechaRatificacion = rs.getString(14);
				if (fechaRatificacion == null) {
					fechaRatificacion = "-";
				}

				j += "[" + "\"" + count + "\"," + "\"" + distribuidor + "\"," + "\"" + ATCnumberParam + "\"," + "\""
						+ medicamentoEstimado + "\"," + "\"" + medicamentoOfertado + "\"," + "\"" + descripcionTecnica
						+ "\"," + "\"" + up + "\"," + "\"" + precio + "\"," + "\"" + moneda + "\"," + "\""
						+ recomendacionComite + "\"," + "\"" + criterioRecomendacion + "\"," + "\"" + observaciones
						+ "\"," + "\"" + recomendacionesBeneficiario + "\"," + "\"" + ratificacionCTF + "\"," + "\""
						+ comentariosRatificacion + "\"," + "\"" + fechaRatificacion + "\"," + "\"" + "\"],";
			}
			j = j.substring(0, j.length() - 1);
			j += "]}";
			offerList = j;
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		return offerList;
	}
}
