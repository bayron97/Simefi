package main.model;

public class Gral_listaRequerimiento {
	private int idlistaRequerimiento, idOficioBeneficiario, idMedicamento, cantidadRequerida;	
	private String codigoATC, codigoSesal, nombreMedicamento, descripcionTecnica, unidadPresentacion, vidaUtil, observacionesBeneficiario, moneda, plazosEntrega;
	private Boolean estado;

	public int getIdlistaRequerimiento() {
		return idlistaRequerimiento;
	}

	public void setIdlistaRequerimiento(int idlistaRequerimiento) {
		this.idlistaRequerimiento = idlistaRequerimiento;
	}
	
	public int getIdOficioBeneficiario() {
		return idOficioBeneficiario;
	}

	public void setIdOficioBeneficiario(int idOficioBeneficiario) {
		this.idOficioBeneficiario = idOficioBeneficiario;
	}
	
	public int getIdMedicamento() {
		return idMedicamento;
	}

	public void setIdMedicamento(int idMedicamento) {
		this.idMedicamento = idMedicamento;
	}
	
	public int getcantidadRequerida() {
		return cantidadRequerida;
	}

	public void setCantidadRequerida(int cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
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
	
	public String getMoneda() {
		return moneda;
	}

	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}

	public String getObservacionesBeneficiario() {
		return observacionesBeneficiario;
	}

	public void setObservacionesBeneficiario(String observacionesBeneficiario) {
		this.observacionesBeneficiario = observacionesBeneficiario;
	}

	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
}
