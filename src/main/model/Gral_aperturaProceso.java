package main.model;

public class Gral_aperturaProceso {
	private int idAperturaProceso, idBeneficiario;	
	private String numProcesoCompra, fechaPublicacion, fechaLimite, fechaApertura, lugar, periodoValidez, 
				   estado, observaciones, descripcionCompra, beneficiario;


	public int getIdAperturaProceso() {
		return idAperturaProceso;
	}

	public void setIdAperturaProceso(int idAperturaProceso) {
		this.idAperturaProceso = idAperturaProceso;
	}

	public String getNumProcesoCompra() {
		return numProcesoCompra;
	}

	public void setNumProcesoCompra(String numProcesoCompra) {
		this.numProcesoCompra = numProcesoCompra;
	}
	
	
	public String getFechaPublicacion() {
		return fechaPublicacion;
	}

	public void setFechaPublicacion(String fechaPublicacion) {
		this.fechaPublicacion = fechaPublicacion;
	}
	
	public String getFechaLimite() {
		return fechaLimite;
	}

	public void setFechaLimite(String fechaLimite) {
		this.fechaLimite = fechaLimite;
	}
	
	public String getFechaApertura() {
		return fechaApertura;
	}

	public void setFechaApertura(String fechaApertura) {
		this.fechaApertura = fechaApertura;
	}
	
	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public String getPeriodoValidez() {
		return periodoValidez;
	}

	public void setPeriodoValidez(String periodoValidez) {
		this.periodoValidez = periodoValidez;
	}

	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado1) {
		this.estado = estado1;
	}
	
	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getDescripcionCompra() {
		return descripcionCompra;
	}

	public void setDescripcionCompra(String descripcioncompra) {
		this.descripcionCompra = descripcioncompra;
	}
	
	public int getIdBeneficiario() {
		return idBeneficiario;
	}

	public void setIdBeneficiario(int idBeneficiario) {
		this.idBeneficiario = idBeneficiario;
	}
	
	public String getbeneficiario() {
		return beneficiario;
	}

	public void setbeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}
	
}
