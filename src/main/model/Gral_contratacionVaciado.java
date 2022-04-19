package main.model;

public class Gral_contratacionVaciado{
	private int idContratacionVaciado, idContratacion, numItem, cantidadComprada;

	private String nombreMedicamento, codigoATC, codigoSesal, descripcionTecnica, unidadPresentacion, nombreFabricante, paisOrigen, marca
    ,modelo , precioUnitario, tiemposEntrega, vidaUtil, observaciones, precioTotal;
	
	private Boolean estado;
	
	public int getIdContratacionVaciado() {
		return idContratacionVaciado;
	}
	
	public void setIdContratacionVaciado(int idContratacionVaciado) {
		this.idContratacionVaciado = idContratacionVaciado;
	}
	
	public int getIdContratacion() {
		return idContratacion;
	}
	
	public void setIdContratacion(int idContratacion) {
		this.idContratacion = idContratacion;
	}
	
	public int getNumItem() {
		return numItem;
	}
	
	public void setNumItem(int numItem) {
		this.numItem = numItem;
	}
	
	public String getNombreMedicamento() {
		return nombreMedicamento;
	}
	
	public void setNombreMedicamento(String nombreMedicamento) {
		this.nombreMedicamento = nombreMedicamento;
	}
	
	public String getCodigoATC() {
		return codigoATC;
	}
	
	public void setCodigoATC(String codigoATC) {
		this.codigoATC = codigoATC;
	}
	
	public String getCodigoSesal() {
		return codigoSesal;
	}
	
	public void setCodigoSesal(String codigoSesal) {
		this.codigoSesal = codigoSesal;
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
	
	public String getNombreFabricante() {
		return nombreFabricante;
	}
	
	public void setNombreFabricante(String nombreFabricante) {
		this.nombreFabricante = nombreFabricante;
	}
	
	public String getPaisOrigen() {
		return paisOrigen;
	}
	
	public void setPaisOrigen(String paisOrigen) {
		this.paisOrigen = paisOrigen;
	}
	
	public String getMarca() {
		return marca;
	}
	
	public void setMarca(String marca) {
		this.marca = marca;
	}
	
	public String getModelo() {
		return modelo;
	}
	
	public void setModelo(String modelo) {
		this.modelo = modelo;
	}
	
	public int getCantidadComprada() {
		return cantidadComprada;
	}
	
	public void setCantidadComprada(int cantidadComprada) {
		this.cantidadComprada = cantidadComprada;
	}
	
	public String getPrecioUnitario() {
		return precioUnitario;
	}
	
	public void setPrecioUnitario(String precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	
	public String getTiemposEntrega() {
		return tiemposEntrega;
	}
	
	public void setTiemposEntrega(String tiemposEntrega) {
		this.tiemposEntrega = tiemposEntrega;
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
	
	public Boolean getEstado() {
		return estado;
	}
	
	public void setEstado(Boolean estado) {
		this.estado = estado;
	}
	
	
	public String getPrecioTotal() {
		return precioTotal;
	}
	
	public void setPrecioTotal(String precioTotal) {
		this.precioTotal = precioTotal;
	}
}
