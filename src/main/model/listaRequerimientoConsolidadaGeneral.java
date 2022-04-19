package main.model;

public class listaRequerimientoConsolidadaGeneral {
	private int procesoCompra, IdListRequirement, noOfertasRecibidas;
	private float cantidadRequerida;
	private String codigoATC, nombreProducto, descripcionTecnica, unidadPresentacion, estado, noOficio, beneficiario;

	public int getIdListRequirement() {
		return IdListRequirement;
	}

	public void setIdListRequirement(int IdListRequirement) {
		this.IdListRequirement = IdListRequirement;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getNoOfertasRecibidas() {
		return noOfertasRecibidas;
	}

	public void setNoOfertasRecibidas(int noOfertasRecibidas) {
		this.noOfertasRecibidas = noOfertasRecibidas;
	}

	public String getNoOficio() {
		return noOficio;
	}

	public void setNoOficio(String noOficio) {
		this.noOficio = noOficio;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

}
