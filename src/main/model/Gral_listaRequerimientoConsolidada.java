package main.model;

public class Gral_listaRequerimientoConsolidada {
	private int idListaRequerimientoConsolidada, idAperturaProceso, numItem,  idMedicamento, cantidadRequerida;	
	private String codigoATC, codigoSesal, nombreMedicamento, descripcionTecnica, unidadPresentacion;
	private Boolean estado;

	public int getCantidadRequerida() {
		return cantidadRequerida;
	}

	public void setCantidadRequerida(int cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
	}
	
	public int getIdListaRequerimientoConsolidada() {
		return idListaRequerimientoConsolidada;
	}

	public void setIdListaRequerimientoConsolidada(int idListaRequerimientoConsolidada) {
		this.idListaRequerimientoConsolidada = idListaRequerimientoConsolidada;
	}
	
	public int getIdAperturaProceso() {
		return idAperturaProceso;
	}

	public void setIdAperturaProceso(int idAperturaProceso) {
		this.idAperturaProceso = idAperturaProceso;
	}
	
	public int getIdMedicamento() {
		return idMedicamento;
	}

	public void setIdMedicamento(int idMedicamento) {
		this.idMedicamento = idMedicamento;
	}
	
	public int getNumItem() {
		return numItem;
	}

	public void setNumItem(int numItem) {
		this.numItem = numItem;
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
	
	public boolean getEstado() {
		return estado;
	}

	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	
}
