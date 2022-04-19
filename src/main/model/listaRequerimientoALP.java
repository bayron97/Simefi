package main.model;

public class listaRequerimientoALP {
	private int procesoCompra, noOfertasRecibidas, IdListRequirement;
	private float cantidadRequerida;
	private String noOficio, codigoATC, nombreMedicamento, descripcionTecnica, unidadPresentacion, beneficiario, codSesal;

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
	
	public String getcodSesal() {
		return codSesal;
	}

	public void setcodSesal(String codSesal) {
		this.codSesal = codSesal;
	}
}
