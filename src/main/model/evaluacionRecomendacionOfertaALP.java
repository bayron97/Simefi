package main.model;

public class evaluacionRecomendacionOfertaALP {
	private long id, noSolicitudCompra, noSolicitudDisponibilidad;
	private int noItem;
	private float cantidadRequerida, cantidadOfertada, precioUnitarioAcordado, precioTotal;
	private String fechaVaciado, noProcesoCompra, distribuidor, prelacion, codigoATC, productoRequerido,
			productoAcordado, descripcionTecnicaRequerido, descripcionTecnicaAcordado, unidadPresentacionRequerido,
			unidadPresentacionAcordada, nombreFabricante_paisOrigen, cerfRegSan, cerfBPM, tiempoEntregaOfertada,
			vidaUtilOfertada, cantidadiEmpaquePrimario, cantidadiEmpaqueSecundario, fechaEvaluacionRecomendacion,
			recomendacionComite, criterioRecomendacion, prelacionRecomendacionTecnica, observaciones,
			RecomendacionBeneficiarios, estatusCompra, observacionesEstadoOrdenCompra;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getNoSolicitudCompra() {
		return noSolicitudCompra;
	}

	public void setNoSolicitudCompra(long noSolicitudCompra) {
		this.noSolicitudCompra = noSolicitudCompra;
	}

	public long getNoSolicitudDisponibilidad() {
		return noSolicitudDisponibilidad;
	}

	public void setNoSolicitudDisponibilidad(long noSolicitudDisponibilidad) {
		this.noSolicitudDisponibilidad = noSolicitudDisponibilidad;
	}

	public int getNoItem() {
		return noItem;
	}

	public void setNoItem(int noItem) {
		this.noItem = noItem;
	}

	public float getCantidadRequerida() {
		return cantidadRequerida;
	}

	public void setCantidadRequerida(float cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
	}

	public float getCantidadOfertada() {
		return cantidadOfertada;
	}

	public void setCantidadOfertada(float cantidadOfertada) {
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

	public String getFechaVaciado() {
		return fechaVaciado;
	}

	public void setFechaVaciado(String fechaVaciado) {
		this.fechaVaciado = fechaVaciado;
	}

	public String getNoProcesoCompra() {
		return noProcesoCompra;
	}

	public void setNoProcesoCompra(String noProcesoCompra) {
		this.noProcesoCompra = noProcesoCompra;
	}

	public String getDistribuidor() {
		return distribuidor;
	}

	public void setDistribuidor(String distribuidor) {
		this.distribuidor = distribuidor;
	}

	public String getPrelacion() {
		return prelacion;
	}

	public void setPrelacion(String prelacion) {
		this.prelacion = prelacion;
	}

	public String getCodigoATC() {
		return codigoATC;
	}

	public void setCodigoATC(String codigoATC) {
		this.codigoATC = codigoATC;
	}

	public String getProductoRequerido() {
		return productoRequerido;
	}

	public void setProductoRequerido(String productoRequerido) {
		this.productoRequerido = productoRequerido;
	}

	public String getProductoAcordado() {
		return productoAcordado;
	}

	public void setProductoAcordado(String productoAcordado) {
		this.productoAcordado = productoAcordado;
	}

	public String getDescripcionTecnicaRequerido() {
		return descripcionTecnicaRequerido;
	}

	public void setDescripcionTecnicaRequerido(String descripcionTecnicaRequerido) {
		this.descripcionTecnicaRequerido = descripcionTecnicaRequerido;
	}

	public String getDescripcionTecnicaAcordado() {
		return descripcionTecnicaAcordado;
	}

	public void setDescripcionTecnicaAcordado(String descripcionTecnicaAcordado) {
		this.descripcionTecnicaAcordado = descripcionTecnicaAcordado;
	}

	public String getUnidadPresentacionRequerido() {
		return unidadPresentacionRequerido;
	}

	public void setUnidadPresentacionRequerido(String unidadPresentacionRequerido) {
		this.unidadPresentacionRequerido = unidadPresentacionRequerido;
	}

	public String getUnidadPresentacionAcordada() {
		return unidadPresentacionAcordada;
	}

	public void setUnidadPresentacionAcordada(String unidadPresentacionAcordada) {
		this.unidadPresentacionAcordada = unidadPresentacionAcordada;
	}

	public String getNombreFabricante_paisOrigen() {
		return nombreFabricante_paisOrigen;
	}

	public void setNombreFabricante_paisOrigen(String nombreFabricante_paisOrigen) {
		this.nombreFabricante_paisOrigen = nombreFabricante_paisOrigen;
	}

	public String getCerfRegSan() {
		return cerfRegSan;
	}

	public void setCerfRegSan(String cerfRegSan) {
		this.cerfRegSan = cerfRegSan;
	}

	public String getCerfBPM() {
		return cerfBPM;
	}

	public void setCerfBPM(String cerfBPM) {
		this.cerfBPM = cerfBPM;
	}

	public String getTiempoEntregaOfertada() {
		return tiempoEntregaOfertada;
	}

	public void setTiempoEntregaOfertada(String tiempoEntregaOfertada) {
		this.tiempoEntregaOfertada = tiempoEntregaOfertada;
	}

	public String getVidaUtilOfertada() {
		return vidaUtilOfertada;
	}

	public void setVidaUtilOfertada(String vidaUtilOfertada) {
		this.vidaUtilOfertada = vidaUtilOfertada;
	}

	public String getCantidadiEmpaquePrimario() {
		return cantidadiEmpaquePrimario;
	}

	public void setCantidadiEmpaquePrimario(String cantidadiEmpaquePrimario) {
		this.cantidadiEmpaquePrimario = cantidadiEmpaquePrimario;
	}

	public String getCantidadiEmpaqueSecundario() {
		return cantidadiEmpaqueSecundario;
	}

	public void setCantidadiEmpaqueSecundario(String cantidadiEmpaqueSecundario) {
		this.cantidadiEmpaqueSecundario = cantidadiEmpaqueSecundario;
	}

	public String getFechaEvaluacionRecomendacion() {
		return fechaEvaluacionRecomendacion;
	}

	public void setFechaEvaluacionRecomendacion(String fechaEvaluacionRecomendacion) {
		this.fechaEvaluacionRecomendacion = fechaEvaluacionRecomendacion;
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

	public String getPrelacionRecomendacionTecnica() {
		return prelacionRecomendacionTecnica;
	}

	public void setPrelacionRecomendacionTecnica(String prelacionRecomendacionTecnica) {
		this.prelacionRecomendacionTecnica = prelacionRecomendacionTecnica;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getRecomendacionBeneficiarios() {
		return RecomendacionBeneficiarios;
	}

	public void setRecomendacionBeneficiarios(String recomendacionBeneficiarios) {
		RecomendacionBeneficiarios = recomendacionBeneficiarios;
	}

	public String getEstatusCompra() {
		return estatusCompra;
	}

	public void setEstatusCompra(String estatusCompra) {
		this.estatusCompra = estatusCompra;
	}

	public String getObservacionesEstadoOrdenCompra() {
		return observacionesEstadoOrdenCompra;
	}

	public void setObservacionesEstadoOrdenCompra(String observacionesEstadoOrdenCompra) {
		this.observacionesEstadoOrdenCompra = observacionesEstadoOrdenCompra;
	}

}
