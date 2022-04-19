package main.model;

public class vaciadoEvaluacionRecomendacionALP {
	private long id;
	private int noItemsRequeridos, noItemsOfertados, noProveedoresParticipando, noOfertasRecibidas, noOfertasRecomendadas;
	private String noProcesoCompra, codSolicitudCompra, fecha, beneficiario, estado, observaciones;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getNoItemsRequeridos() {
		return noItemsRequeridos;
	}
	public void setNoItemsRequeridos(int noItemsRequeridos) {
		this.noItemsRequeridos = noItemsRequeridos;
	}
	public int getNoItemsOfertados() {
		return noItemsOfertados;
	}
	public void setNoItemsOfertados(int noItemsOfertados) {
		this.noItemsOfertados = noItemsOfertados;
	}
	public int getNoProveedoresParticipando() {
		return noProveedoresParticipando;
	}
	public void setNoProveedoresParticipando(int noProveedoresParticipando) {
		this.noProveedoresParticipando = noProveedoresParticipando;
	}
	public int getNoOfertasRecibidas() {
		return noOfertasRecibidas;
	}
	public void setNoOfertasRecibidas(int noOfertasRecibidas) {
		this.noOfertasRecibidas = noOfertasRecibidas;
	}
	public int getNoOfertasRecomendadas() {
		return noOfertasRecomendadas;
	}
	public void setNoOfertasRecomendadas(int noOfertasRecomendadas) {
		this.noOfertasRecomendadas = noOfertasRecomendadas;
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
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getBeneficiario() {
		return beneficiario;
	}
	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
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
}
