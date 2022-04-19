package main.model;

public class ofertaGeneral {
	private String procesoCompra, fechaOferta, distribuidor, medicamentoEstimado, up, precio, moneda, codATC,
	medicamentoOfertado, descripcionTecnica, recomendacionComite, criterioRecomendacion, observaciones,
	recomendacionesBeneficiario, prelacion, fechaRatificacion, ratificacionCTF, comentariosRatificacion,
	nombreFabricante, registroSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura,
	fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario,
	etiquetadoTerciario, muestraPresentada, obsOfertaProv, consultasArsa, consultasBenef, cantidadCriterio,
	solicitudesAclaracion, respuestaSolicitudesAclaracion, registroProveedor, descTecnicaCriterio,
	historialContrato, icotermCriterio, regSanitarioCriterio, garantiaOfertaCriterio, tiempoEntrega, vidaUtil,
	garantiaFabrica, cartaCompromisoCriterio, aseguramientoCalidad, razonabilidadPrecios, certificadoCriterio,
	noFoliosOferta, mantenimientoCapCriterio, estado, numSanitario, numCertif, descripcionTecnicaRequerida, 
	unidadPresentacionRequerida, paisOrigen;
private int codPadre, noOfertasRecibidas;
private long idConsolidado, idItem;

public String getProcesoCompra() {
return procesoCompra;
}

public void setProcesoCompra(String procesoCompra) {
this.procesoCompra = procesoCompra;
}

public String getFechaOferta() {
return fechaOferta;
}

public void setFechaOferta(String fechaOferta) {
this.fechaOferta = fechaOferta;
}

public String getDistribuidor() {
return distribuidor;
}

public void setDistribuidor(String distribuidor) {
this.distribuidor = distribuidor;
}

public String getMedicamentoEstimado() {
return medicamentoEstimado;
}

public void setMedicamentoEstimado(String medicamentoEstimado) {
this.medicamentoEstimado = medicamentoEstimado;
}

public String getUp() {
return up;
}

public void setUp(String up) {
this.up = up;
}

public String getPrecio() {
return precio;
}

public void setPrecio(String precio) {
this.precio = precio;
}

public String getMoneda() {
return moneda;
}

public void setMoneda(String moneda) {
this.moneda = moneda;
}

public String getCodATC() {
return codATC;
}

public void setCodATC(String codATC) {
this.codATC = codATC;
}

public String getMedicamentoOfertado() {
return medicamentoOfertado;
}

public void setMedicamentoOfertado(String medicamentoOfertado) {
this.medicamentoOfertado = medicamentoOfertado;
}

public String getRecomendacionComite() {
return recomendacionComite;
}

public void setRecomendacionComite(String recomendacionComite) {
this.recomendacionComite = recomendacionComite;
}

public String getCriterioRecomendacion() {
return criterioRecomendacion;
}

public void setCriterioRecomendacion(String criterioRecomendacion) {
this.criterioRecomendacion = criterioRecomendacion;
}

public String getPrelacion() {
return prelacion;
}

public void setPrelacion(String prelacion) {
this.prelacion = prelacion;
}

public String getFechaRatificacion() {
return fechaRatificacion;
}

public void setFechaRatificacion(String fechaRatificacion) {
this.fechaRatificacion = fechaRatificacion;
}

public String getRatificacionCTF() {
return ratificacionCTF;
}

public void setRatificacionCTF(String ratificacionCTF) {
this.ratificacionCTF = ratificacionCTF;
}

public String getComentariosRatificacion() {
return comentariosRatificacion;
}

public void setComentariosRatificacion(String comentariosRatificacion) {
this.comentariosRatificacion = comentariosRatificacion;
}

public String getDescripcionTecnica() {
return descripcionTecnica;
}

public void setDescripcionTecnica(String descripcionTecnica) {
this.descripcionTecnica = descripcionTecnica;
}

public String getObservaciones() {
return observaciones;
}

public void setObservaciones(String observaciones) {
this.observaciones = observaciones;
}

public String getRecomendacionesBeneficiario() {
return recomendacionesBeneficiario;
}

public void setRecomendacionesBeneficiario(String recomendacionesBeneficiario) {
this.recomendacionesBeneficiario = recomendacionesBeneficiario;
}

public int getCodPadre() {
return codPadre;
}

public void setCodPadre(int codPadre) {
this.codPadre = codPadre;
}

public int getNoOfertasRecibidas() {
return noOfertasRecibidas;
}

public void setNoOfertasRecibidas(int noOfertasRecibidas) {
this.noOfertasRecibidas = noOfertasRecibidas;
}

public String getNombreFabricante() {
return nombreFabricante;
}

public void setNombreFabricante(String nombreFabricante) {
this.nombreFabricante = nombreFabricante;
}

public String getRegistroSanitario() {
return registroSanitario;
}

public void setRegistroSanitario(String registroSanitario) {
this.registroSanitario = registroSanitario;
}

public String getFechaVencSan() {
return fechaVencSan;
}

public void setFechaVencSan(String fechaVencSan) {
this.fechaVencSan = fechaVencSan;
}

public String getFechaEmisionSan() {
return fechaEmisionSan;
}

public void setFechaEmisionSan(String fechaEmisionSan) {
this.fechaEmisionSan = fechaEmisionSan;
}

public String getCertificadoManufactura() {
return certificadoManufactura;
}

public void setCertificadoManufactura(String certificadoManufactura) {
this.certificadoManufactura = certificadoManufactura;
}

public String getFechaVencManufactura() {
return fechaVencManufactura;
}

public void setFechaVencManufactura(String fechaVencManufactura) {
this.fechaVencManufactura = fechaVencManufactura;
}

public String getFechaEmisionManufactura() {
return fechaEmisionManufactura;
}

public void setFechaEmisionManufactura(String fechaEmisionManufactura) {
this.fechaEmisionManufactura = fechaEmisionManufactura;
}

public String getEtiquetadoPrimario() {
return etiquetadoPrimario;
}

public void setEtiquetadoPrimario(String etiquetadoPrimario) {
this.etiquetadoPrimario = etiquetadoPrimario;
}

public String getEtiquetadoSecundario() {
return etiquetadoSecundario;
}

public void setEtiquetadoSecundario(String etiquetadoSecundario) {
this.etiquetadoSecundario = etiquetadoSecundario;
}

public String getEtiquetadoTerciario() {
return etiquetadoTerciario;
}

public void setEtiquetadoTerciario(String etiquetadoTerciario) {
this.etiquetadoTerciario = etiquetadoTerciario;
}

public String getMuestraPresentada() {
return muestraPresentada;
}

public void setMuestraPresentada(String muestraPresentada) {
this.muestraPresentada = muestraPresentada;
}

public String getNoFoliosOferta() {
return noFoliosOferta;
}

public void setNoFoliosOferta(String noFoliosOferta) {
this.noFoliosOferta = noFoliosOferta;
}

public String getObsOfertaProv() {
return obsOfertaProv;
}

public void setObsOfertaProv(String obsOfertaProv) {
this.obsOfertaProv = obsOfertaProv;
}

public String getConsultasArsa() {
return consultasArsa;
}

public void setConsultasArsa(String consultasArsa) {
this.consultasArsa = consultasArsa;
}

public String getConsultasBenef() {
return consultasBenef;
}

public void setConsultasBenef(String consultasBenef) {
this.consultasBenef = consultasBenef;
}

public String getCantidadCriterio() {
return cantidadCriterio;
}

public void setCantidadCriterio(String cantidadCriterio) {
this.cantidadCriterio = cantidadCriterio;
}

public String getSolicitudesAclaracion() {
return solicitudesAclaracion;
}

public void setSolicitudesAclaracion(String solicitudesAclaracion) {
this.solicitudesAclaracion = solicitudesAclaracion;
}

public String getRespuestaSolicitudesAclaracion() {
return respuestaSolicitudesAclaracion;
}

public void setRespuestaSolicitudesAclaracion(String respuestaSolicitudesAclaracion) {
this.respuestaSolicitudesAclaracion = respuestaSolicitudesAclaracion;
}

public String getRegistroProveedor() {
return registroProveedor;
}

public void setRegistroProveedor(String registroProveedor) {
this.registroProveedor = registroProveedor;
}

public String getDescTecnicaCriterio() {
return descTecnicaCriterio;
}

public void setDescTecnicaCriterio(String descTecnicaCriterio) {
this.descTecnicaCriterio = descTecnicaCriterio;
}

public String getHistorialContrato() {
return historialContrato;
}

public void setHistorialContrato(String historialContrato) {
this.historialContrato = historialContrato;
}

public String getIcotermCriterio() {
return icotermCriterio;
}

public void setIcotermCriterio(String icotermCriterio) {
this.icotermCriterio = icotermCriterio;
}

public String getRegSanitarioCriterio() {
return regSanitarioCriterio;
}

public void setRegSanitarioCriterio(String regSanitarioCriterio) {
this.regSanitarioCriterio = regSanitarioCriterio;
}

public String getGarantiaOfertaCriterio() {
return garantiaOfertaCriterio;
}

public void setGarantiaOfertaCriterio(String garantiaOfertaCriterio) {
this.garantiaOfertaCriterio = garantiaOfertaCriterio;
}

public String getTiempoEntrega() {
return tiempoEntrega;
}

public void setTiempoEntrega(String tiempoEntrega) {
this.tiempoEntrega = tiempoEntrega;
}

public String getVidaUtil() {
return vidaUtil;
}

public void setVidaUtil(String vidaUtil) {
this.vidaUtil = vidaUtil;
}

public String getGarantiaFabrica() {
return garantiaFabrica;
}

public void setGarantiaFabrica(String garantiaFabrica) {
this.garantiaFabrica = garantiaFabrica;
}

public String getCartaCompromisoCriterio() {
return cartaCompromisoCriterio;
}

public void setCartaCompromisoCriterio(String cartaCompromisoCriterio) {
this.cartaCompromisoCriterio = cartaCompromisoCriterio;
}

public String getAseguramientoCalidad() {
return aseguramientoCalidad;
}

public void setAseguramientoCalidad(String aseguramientoCalidad) {
this.aseguramientoCalidad = aseguramientoCalidad;
}

public String getRazonabilidadPrecios() {
return razonabilidadPrecios;
}

public void setRazonabilidadPrecios(String razonabilidadPrecios) {
this.razonabilidadPrecios = razonabilidadPrecios;
}

public String getCertificadoCriterio() {
return certificadoCriterio;
}

public void setCertificadoCriterio(String certificadoCriterio) {
this.certificadoCriterio = certificadoCriterio;
}

public String getMantenimientoCapCriterio() {
return mantenimientoCapCriterio;
}

public void setMantenimientoCapCriterio(String mantenimientoCapCriterio) {
this.mantenimientoCapCriterio = mantenimientoCapCriterio;
}

public long getIdConsolidado() {
return idConsolidado;
}

public void setIdConsolidado(long idConsolidado) {
this.idConsolidado = idConsolidado;
}

public long getIdItem() {
return idItem;
}

public void setIdItem(long idItem) {
this.idItem = idItem;
}

public String getEstado() {
return estado;
}

public void setEstado(String estado) {
this.estado = estado;
}

public String getNumSanitario() {
return numSanitario;
}

public void setNumSanitario(String numSanitario) {
this.numSanitario = numSanitario;
}

public String getNumCertif() {
return numCertif;
}

public void setNumCertif(String numCertif) {
this.numCertif = numCertif;
}

public String getDescripcionTecnicaRequerida() {
return descripcionTecnicaRequerida;
}

public void setDescripcionTecnicaRequerida(String descripcionTecnicaRequerida) {
this.descripcionTecnicaRequerida = descripcionTecnicaRequerida;
}

public String getUnidadPresentacionRequerida() {
return unidadPresentacionRequerida;
}

public void setUnidadPresentacionRequerida(String unidadPresentacionRequerida) {
this.unidadPresentacionRequerida = unidadPresentacionRequerida;
}

public String getPaisOrigen() {
return paisOrigen;
}

public void setPaisOrigen(String paisOrigen) {
this.paisOrigen = paisOrigen;
}
}
