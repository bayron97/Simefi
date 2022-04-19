package main.model;

public class listaRequerimientoGeneral {
	private int procesoCompra, noOfertasRecibidas, IdListRequirement;
	private float cantidadRequerida;
	private String noOficio, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, beneficiario, cantidadEntregaPlazos, vidaUtil, observaciones, moneda;

	public int getIdListRequirement() {
		return IdListRequirement;
	}

	public void setIdListRequirement(int IdListRequirement) {
		this.IdListRequirement = procesoCompra;
	}

	public int getProcesoCompra() {
		return procesoCompra;
	}

	public void setProcesoCompra(int procesoCompra) {
		this.procesoCompra = procesoCompra;
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

	public String getNombreMedicamento() {
		return nombreMedicamento;
	}

	public void setNombreMedicamento(String nombreMedicamento) {
		this.nombreMedicamento = nombreMedicamento;
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

	public String getCantidadEntregaPlazos() {
		return cantidadEntregaPlazos;
	}

	public void setCantidadEntregaPlazos(String cantidadEntregaPlazos) {
		this.cantidadEntregaPlazos = cantidadEntregaPlazos;
	}
	
	public String getVidaUtil() {
		return vidaUtil;
	}

	public void setVidaUtil(String vidaUtil) {
		this.vidaUtil = vidaUtil;
	}
	
	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	
	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public int getNoOfertasRecibidas() {
		return noOfertasRecibidas;
	}

	public void setNoOfertasRecibidas(int noOfertasRecibidas) {
		this.noOfertasRecibidas = noOfertasRecibidas;
	}
}
