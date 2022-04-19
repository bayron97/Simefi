package main.model;

public class Gral_listaRequerimientoDTO {
	private int idlistaRequerimiento, idBeneficiario, idMedicamento, cantidadRequerida;	
	private String Oficio, beneficiario, codigoATC, codigoSesal, nombreMedicamento, descripcionTecnica, unidadPresentacion, plazosEntrega, vidaUtil, observacionesBeneficiario, moneda;
	private Boolean estado;

	public int getIdlistaRequerimiento() {
		return idlistaRequerimiento;
	}

	public void setIdlistaRequerimiento(int idlistaRequerimiento) {
		this.idlistaRequerimiento = idlistaRequerimiento;
	}
	
	public int getIdBeneficiario() {
		return idBeneficiario;
	}

	public void setIdBeneficiario(int idBeneficiario) {
		this.idBeneficiario = idBeneficiario;
	}
	
	public int getCantidadRequerida() {
		return cantidadRequerida;
	}

	public void setCantidadRequerida(int cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
	}
	
	public int getIdMedicamento() {
		return idMedicamento;
	}

	public void setIdMedicamento(int idMedicamento) {
		this.idMedicamento = idMedicamento;
	}
	
	public String getPlazosEntrega() {
		return plazosEntrega;
	}

	public void setPlazosEntrega(String plazosEntrega) {
		this.plazosEntrega = plazosEntrega;
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
	
	public String getCodigoSesal() {
		return codigoSesal;
	}

	public void setCodigoSesal(String codigoSesal) {
		this.codigoSesal = codigoSesal;
	}
	
	public String getVidaUtil() {
		return vidaUtil;
	}

	public void setVidaUtil(String vidaUtil) {
		this.vidaUtil = vidaUtil;
	}
	

	public String getObservacionesBeneficiario() {
		return observacionesBeneficiario;
	}

	public void setObservacionesBeneficiario(String observacionesBeneficiario) {
		this.observacionesBeneficiario = observacionesBeneficiario;
	}
	
	public String getOficio() {
		return Oficio;
	}

	public void setOficio(String Oficio) {
		this.Oficio = Oficio;
	}
	
	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}
	
	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}
	
}
