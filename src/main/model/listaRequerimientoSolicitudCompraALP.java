package main.model;

public class listaRequerimientoSolicitudCompraALP {
	private long id, idSolicitudCompra, noItem;
	private float cantidadRequerida;
	private String noOficio, codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, tiempoEntrega, vidaUtil,
			proveedor, observaciones, numCertRegSan, certBPM, origenFP, precioUnitario, moneda, fechaOferta, 
			codSolicitudDisponibilidad, nombreProductoRequerido, descripcionTecnicaRequerida, unidadPresentacionRequerida, 
			recomendacionesBeneficiarios, regSanVenc, certBPMVenc, recomendacionComite, registroSanitario, codigoSesal,
			fechaVencimientoRegSan, fechaEmisionRegSan, fechaVencimientoBPM, fechaEmisionBPM;
	private int prelacionRALP, noOferta;
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public int getnoOferta() {
		return noOferta;
	}

	public void setnoOferta(int noOferta) {
		this.noOferta = noOferta;
	}

	public long getIdSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setIdSolicitudCompra(long idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
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

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public String getDescripcionTecnica() {
		return descripcionTecnica;
	}

	public void setDescripcionTecnica(String descripcionTecnica) {
		this.descripcionTecnica = descripcionTecnica;
	}

	public String getUnidadPresentacion() {
		return unidadPresentacion;
	}

	public void setUnidadPresentacion(String unidadPresentacion) {
		this.unidadPresentacion = unidadPresentacion;
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

	public String getProveedor() {
		return proveedor;
	}

	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getNumCertRegSan() {
		return numCertRegSan;
	}

	public void setNumCertRegSan(String numCertRegSan) {
		this.numCertRegSan = numCertRegSan;
	}

	public String getCertBPM() {
		return certBPM;
	}

	public void setCertBPM(String certBPM) {
		this.certBPM = certBPM;
	}

	public String getOrigenFP() {
		return origenFP;
	}

	public void setOrigenFP(String origenFP) {
		this.origenFP = origenFP;
	}

	public String getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(String precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}

	public String getFechaOferta() {
		return fechaOferta;
	}

	public void setFechaOferta(String fechaOferta) {
		this.fechaOferta = fechaOferta;
	}

	public String getCodSolicitudDisponibilidad() {
		return codSolicitudDisponibilidad;
	}

	public void setCodSolicitudDisponibilidad(String codSolicitudDisponibilidad) {
		this.codSolicitudDisponibilidad = codSolicitudDisponibilidad;
	}

	public String getNombreProductoRequerido() {
		return nombreProductoRequerido;
	}

	public void setNombreProductoRequerido(String nombreProductoRequerido) {
		this.nombreProductoRequerido = nombreProductoRequerido;
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

	public String getRecomendacionesBeneficiarios() {
		return recomendacionesBeneficiarios;
	}

	public void setRecomendacionesBeneficiarios(String recomendacionesBeneficiarios) {
		this.recomendacionesBeneficiarios = recomendacionesBeneficiarios;
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
	
	public int getprelacionRALP() {
		return prelacionRALP;
	}

	public void setprelacionRALP(int prelacionRALP) {
		this.prelacionRALP = prelacionRALP;
	}	
	
	public String getrecomendacionComite() {
		return recomendacionComite;
	}

	public void setrecomendacionComite(String recomendacionComite) {
		this.recomendacionComite = recomendacionComite;
	}
	
	public String getregistroSanitario() {
		return registroSanitario;
	}

	public void setregistroSanitario(String registroSanitario) {
		this.registroSanitario = registroSanitario;
	}
	
	
	public String getcodigoSesal() {
		return codigoSesal;
	}

	public void setcodigoSesal(String codigoSesal) {
		this.codigoSesal = codigoSesal;
	}
	
	
	public String getfechaVencimientoRegSan() {
		return fechaVencimientoRegSan;
	}

	public void setfechaVencimientoRegSan(String fechaVencimientoRegSan) {
		this.fechaVencimientoRegSan = fechaVencimientoRegSan;
	}
	
	
	public String getfechaEmisionRegSan() {
		return fechaEmisionRegSan;
	}

	public void setfechaEmisionRegSan(String fechaEmisionRegSan) {
		this.fechaEmisionRegSan = fechaEmisionRegSan;
	}
	
	
	public String getfechaVencimientoBPM() {
		return fechaVencimientoBPM;
	}

	public void setfechaVencimientoBPM(String fechaVencimientoBPM) {
		this.fechaVencimientoBPM = fechaVencimientoBPM;
	}
	
	
	public String getfechaEmisionBPM() {
		return fechaEmisionBPM;
	}

	public void setfechaEmisionBPM(String fechaEmisionBPM) {
		this.fechaEmisionBPM = fechaEmisionBPM;
	}
	
}
