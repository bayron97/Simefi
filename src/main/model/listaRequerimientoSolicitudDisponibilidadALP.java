package main.model;

import java.util.Date;

public class listaRequerimientoSolicitudDisponibilidadALP {
	private long id, idSolicitudDisponibilidad, noItem;
	private int cantidadEmpaquePrimario, cantidadEmpaqueSecundario, cantidadEmpaqueTerciario, cantidadOfertada, noOferta;
	private float cantidadRequerida, precioUnitarioAcordado, precioTotal;
	private String noOficio, 
				   codigoATC,
				   nombreProductoRequerido, 
				   nombreProductoOfertado, 
				   descripcionTecnicaRequerida, 
				   descripcionTecnicaOfertada, 
				   unidadPresentacionRequerida, 
				   unidadPresentacionOfertada, 
				   origenFP, 
				   numCertRegSan, 
				   numCertBPM, 
				   moneda,
				   tiempoEntregaOfertado, 
				   vidaUtilOfertada, 
				   fechaVaciado,
				   fechaEvaluacion, 
				   fechaRecomendacion, 
				   cantCriterio, 
				   regSanCriterio, 
				   certBPMCriterio, 
				   tiempoEntregaCriterio, 
				   vidaUtilCriterio, 
				   recomendacionCE, 
				   criterioRecomendacion,
				   prelacionRT,
				   observaciones,
				   recomendacionesBeneficiarios,
				   estadoCompra,
				   observacionEstadoCompra, 
				   aclaracion,
				   fechaOferta,
				   regSanVenc,
				   ratificacionCT,
				   criterioResolucionCT,
				   comentariosRatificacion,
				   fechaRatificacion,
				   certBPMVenc,
				   codSolicitudCompra,	
				   numRegSanitarioVen, 
				   numCerBPMVen,
				   fechaRegSanitarioVen, 
				   fechaCerBPMVen,
				   ObserRespuestaProveedor,
				   registroSanitario,
				   segundaRCC,
				   codigoSesal;

	
	public int getnoOferta() {
		return noOferta;
	}

	public void setnoOferta(int noOferta) {
		this.noOferta = noOferta;
	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getIdSolicitudDisponibilidad() {
		return idSolicitudDisponibilidad;
	}

	public void setIdSolicitudDisponibilidad(long idSolicitudDisponibilidad) {
		this.idSolicitudDisponibilidad = idSolicitudDisponibilidad;
	}

	public long getNoItem() {
		return noItem;
	}

	public void setNoItem(long noItem) {
		this.noItem = noItem;
	}

	public float getCantidadRequerida() {
		return cantidadRequerida;
	}

	public void setCantidadRequerida(float cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
	}

	public int getCantidadOfertada() {
		return cantidadOfertada;
	}

	public void setCantidadOfertada(int cantidadOfertada) {
		this.cantidadOfertada = cantidadOfertada;
	}

	public float getPrecioUnitarioAcordado() {
		return precioUnitarioAcordado;
	}

	public void setPrecioUnitarioAcordado(float precioUnitarioAcordado) {
		this.precioUnitarioAcordado = precioUnitarioAcordado;
	}

	public float getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(float precioTotal) {
		this.precioTotal = precioTotal;
	}

	public int getCantidadEmpaquePrimario() {
		return cantidadEmpaquePrimario;
	}

	public void setCantidadEmpaquePrimario(int cantidadEmpaquePrimario) {
		this.cantidadEmpaquePrimario = cantidadEmpaquePrimario;
	}

	public int getCantidadEmpaqueSecundario() {
		return cantidadEmpaqueSecundario;
	}

	public void setCantidadEmpaqueSecundario(int cantidadEmpaqueSecundario) {
		this.cantidadEmpaqueSecundario = cantidadEmpaqueSecundario;
	}
	
	public int getcantidadEmpaqueTerciario() {
		return cantidadEmpaqueTerciario;
	}

	public void setcantidadEmpaqueTerciario(int cantidadEmpaqueTerciario) {
		this.cantidadEmpaqueTerciario = cantidadEmpaqueTerciario;
	}

	public String getNoOficio() {
		return noOficio;
	}

	public void setNoOficio(String noOficio) {
		this.noOficio = noOficio;
	}

	public String getCodigoATC() {
		return codigoATC;
	}

	public void setCodigoATC(String codigoATC) {
		this.codigoATC = codigoATC;
	}

	public String getNombreProductoRequerido() {
		return nombreProductoRequerido;
	}

	public void setNombreProductoRequerido(String nombreProductoRequerido) {
		this.nombreProductoRequerido = nombreProductoRequerido;
	}

	public String getNombreProductoOfertado() {
		return nombreProductoOfertado;
	}

	public void setNombreProductoOfertado(String nombreProductoOfertado) {
		this.nombreProductoOfertado = nombreProductoOfertado;
	}

	public String getDescripcionTecnicaRequerida() {
		return descripcionTecnicaRequerida;
	}

	public void setDescripcionTecnicaRequerida(String descripcionTecnicaRequerida) {
		this.descripcionTecnicaRequerida = descripcionTecnicaRequerida;
	}

	public String getDescripcionTecnicaOfertada() {
		return descripcionTecnicaOfertada;
	}

	public void setDescripcionTecnicaOfertada(String descripcionTecnicaOfertada) {
		this.descripcionTecnicaOfertada = descripcionTecnicaOfertada;
	}

	public String getUnidadPresentacionRequerida() {
		return unidadPresentacionRequerida;
	}

	public void setUnidadPresentacionRequerida(String unidadPresentacionRequerida) {
		this.unidadPresentacionRequerida = unidadPresentacionRequerida;
	}

	public String getUnidadPresentacionOfertada() {
		return unidadPresentacionOfertada;
	}

	public void setUnidadPresentacionOfertada(String unidadPresentacionOfertada) {
		this.unidadPresentacionOfertada = unidadPresentacionOfertada;
	}

	public String getOrigenFP() {
		return origenFP;
	}

	public void setOrigenFP(String origenFP) {
		this.origenFP = origenFP;
	}

	public String getNumCertRegSan() {
		return numCertRegSan;
	}

	public void setNumCertRegSan(String numCertRegSan) {
		this.numCertRegSan = numCertRegSan;
	}

	public String getNumCertBPM() {
		return numCertBPM;
	}

	public void setNumCertBPM(String numCertBPM) {
		this.numCertBPM = numCertBPM;
	}

	public String getTiempoEntregaOfertado() {
		return tiempoEntregaOfertado;
	}

	public void setTiempoEntregaOfertado(String tiempoEntregaOfertado) {
		this.tiempoEntregaOfertado = tiempoEntregaOfertado;
	}
	
	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}

	public String getVidaUtilOfertada() {
		return vidaUtilOfertada;
	}

	public void setVidaUtilOfertada(String vidaUtilOfertada) {
		this.vidaUtilOfertada = vidaUtilOfertada;
	}
	
	public String getFechaVaciado() {
		return fechaVaciado;
	}

	public void setFechaVaciado(String fechaVaciado) {
		this.fechaVaciado = fechaVaciado;
	}

	public String getFechaEvaluacion() {
		return fechaEvaluacion;
	}

	public void setFechaEvaluacion(String fechaEvaluacion) {
		this.fechaEvaluacion = fechaEvaluacion;
	}

	public String getFechaRecomendacion() {
		return fechaRecomendacion;
	}

	public void setFechaRecomendacion(String fechaRecomendacion) {
		this.fechaRecomendacion = fechaRecomendacion;
	}

	public String getCantCriterio() {
		return cantCriterio;
	}

	public void setCantCriterio(String cantCriterio) {
		this.cantCriterio = cantCriterio;
	}

	public String getRegSanCriterio() {
		return regSanCriterio;
	}

	public void setRegSanCriterio(String regSanCriterio) {
		this.regSanCriterio = regSanCriterio;
	}

	public String getCertBPMCriterio() {
		return certBPMCriterio;
	}

	public void setCertBPMCriterio(String certBPMCriterio) {
		this.certBPMCriterio = certBPMCriterio;
	}

	public String getTiempoEntregaCriterio() {
		return tiempoEntregaCriterio;
	}

	public void setTiempoEntregaCriterio(String tiempoEntregaCriterio) {
		this.tiempoEntregaCriterio = tiempoEntregaCriterio;
	}

	public String getVidaUtilCriterio() {
		return vidaUtilCriterio;
	}

	public void setVidaUtilCriterio(String vidaUtilCriterio) {
		this.vidaUtilCriterio = vidaUtilCriterio;
	}

	public String getRecomendacionCE() {
		return recomendacionCE;
	}

	public void setRecomendacionCE(String recomendacionCE) {
		this.recomendacionCE = recomendacionCE;
	}

	public String getCriterioRecomendacion() {
		return criterioRecomendacion;
	}

	public void setCriterioRecomendacion(String criterioRecomendacion) {
		this.criterioRecomendacion = criterioRecomendacion;
	}

	public String getPrelacionRT() {
		return prelacionRT;
	}

	public void setPrelacionRT(String prelacionRT) {
		this.prelacionRT = prelacionRT;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getRecomendacionesBeneficiarios() {
		return recomendacionesBeneficiarios;
	}

	public void setRecomendacionesBeneficiarios(String recomendacionesBeneficiarios) {
		this.recomendacionesBeneficiarios = recomendacionesBeneficiarios;
	}

	public String getEstadoCompra() {
		return estadoCompra;
	}

	public void setEstadoCompra(String estadoCompra) {
		this.estadoCompra = estadoCompra;
	}

	public String getObservacionEstadoCompra() {
		return observacionEstadoCompra;
	}

	public void setObservacionEstadoCompra(String observacionEstadoCompra) {
		this.observacionEstadoCompra = observacionEstadoCompra;
	}
	
	public String getAclaracion() {
		return aclaracion;
	}

	public void setAclaracion(String aclaracion) {
		this.aclaracion = aclaracion;
	}

	public String getFechaOferta() {
		return fechaOferta;
	}

	public void setFechaOferta(String fechaOferta) {
		this.fechaOferta = fechaOferta;
	}

	public String getRegSanVenc() {
		return regSanVenc;
	}

	public void setRegSanVenc(String regSanVenc) {
		this.regSanVenc = regSanVenc;
	}

	public String getCertBPMVenc() {
		return certBPMVenc;
	}

	public void setCertBPMVenc(String certBPMVenc) {
		this.certBPMVenc = certBPMVenc;
	}

	public String getRatificacionCT() {
		return ratificacionCT;
	}

	public void setRatificacionCT(String ratificacionCT) {
		this.ratificacionCT = ratificacionCT;
	}

	public String getCriterioResolucionCT() {
		return criterioResolucionCT;
	}

	public void setCriterioResolucionCT(String criterioResolucionCT) {
		this.criterioResolucionCT = criterioResolucionCT;
	}

	public String getComentariosRatificacion() {
		return comentariosRatificacion;
	}

	public void setComentariosRatificacion(String comentariosRatificacion) {
		this.comentariosRatificacion = comentariosRatificacion;
	}

	public String getFechaRatificacion() {
		return fechaRatificacion;
	}

	public void setFechaRatificacion(String fechaRatificacion) {
		this.fechaRatificacion = fechaRatificacion;
	}

	public String getCodSolicitudCompra() {
		return codSolicitudCompra;
	}

	public void setCodSolicitudCompra(String codSolicitudCompra) {
		this.codSolicitudCompra = codSolicitudCompra;
	}
	
	public String getnumRegSanitarioVen() {
		return numRegSanitarioVen;
	}

	public void setnumRegSanitarioVen(String numRegSanitarioVen) {
		this.numRegSanitarioVen = numRegSanitarioVen;
	}
	
	public String getnumCerBPMVen() {
		return numCerBPMVen;
	}

	public void setnumCerBPMVen(String numCerBPMVen) {
		this.numCerBPMVen = numCerBPMVen;
	}
	
	public String getfechaRegSanitarioVen() {
		return fechaRegSanitarioVen;
	}

	public void setfechaRegSanitarioVen(String fechaRegSanitarioVen) {
		this.fechaRegSanitarioVen = fechaRegSanitarioVen;
	}
	
	public String getfechaCerBPMVen() {
		return fechaCerBPMVen;
	}

	public void setfechaCerBPMVen(String fechaCerBPMVen) {
		this.fechaCerBPMVen = fechaCerBPMVen;
	}
	
	public String getObserRespuestaProveedor() {
		return ObserRespuestaProveedor;
	}

	public void setObserRespuestaProveedor(String ObserRespuestaProveedor) {
		this.ObserRespuestaProveedor = ObserRespuestaProveedor;
	}
	
	public String getregistroSanitario() {
		return registroSanitario;
	}

	public void setregistroSanitario(String registroSanitario) {
		this.registroSanitario = registroSanitario;
	}
	
	public String getsegundaRCC() {
		return segundaRCC;
	}

	public void setsegundaRCC(String segundaRCC) {
		this.segundaRCC = segundaRCC;
	}
	
	public String getcodigoSesal() {
		return codigoSesal;
	}

	public void setcodigoSesal(String cosigoSesal) {
		this.codigoSesal = cosigoSesal;
	}
}
