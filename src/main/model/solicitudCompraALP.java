package main.model;

public class solicitudCompraALP {
	private long id;
	private String fecha, noProcesoCompra, codSolicitudCompra, beneficiario, descripcionCompra, cantCriterio, regSanCriterio,
			certBPMCriterio, tiempoEntregaCriterio, vidaUtilCriterio, estado, observaciones;
	private int noItemsSolicitados;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getNoProcesoCompra() {
		return noProcesoCompra;
	}

	public void setNoProcesoCompra(String noProcesoCompra) {
		this.noProcesoCompra = noProcesoCompra;
	}

	public String getCodSolicitudCompra() {
		return codSolicitudCompra;
	}

	public void setCodSolicitudCompra(String codSolicitudCompra) {
		this.codSolicitudCompra = codSolicitudCompra;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public String getDescripcionCompra() {
		return descripcionCompra;
	}

	public void setDescripcionCompra(String descripcionCompra) {
		this.descripcionCompra = descripcionCompra;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public int getNoItemsSolicitados() {
		return noItemsSolicitados;
	}

	public void setNoItemsSolicitados(int noItemsSolicitados) {
		this.noItemsSolicitados = noItemsSolicitados;
	}
}