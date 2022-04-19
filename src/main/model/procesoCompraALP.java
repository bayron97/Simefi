package main.model;

public class procesoCompraALP {
	private int cod, noItemsRequeridos;
	private String noProcesoCompra, fechaLimite, fechaApertura, lugar, periodoValidez, idioma, tipoMoneda, estado1,
			observaciones, descripcioncompra;

	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public int getNoItemsRequeridos() {
		return noItemsRequeridos;
	}

	public void setNoItemsRequeridos(int noItemsRequeridos) {
		this.noItemsRequeridos = noItemsRequeridos;
	}

	public String getNoProcesoCompra() {
		return noProcesoCompra;
	}

	public void setNoProcesoCompra(String noProcesoCompra) {
		this.noProcesoCompra = noProcesoCompra;
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

	public String getIdioma() {
		return idioma;
	}

	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}

	public String getTipoMoneda() {
		return tipoMoneda;
	}

	public void setTipoMoneda(String tipoMoneda) {
		this.tipoMoneda = tipoMoneda;
	}

	public String getEstado1() {
		return estado1;
	}

	public void setEstado1(String estado1) {
		this.estado1 = estado1;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public String getDescripcionCompra() {
		return descripcioncompra;
	}

	public void setDescripcionCompra(String descripcioncompra) {
		this.descripcioncompra = descripcioncompra;
	}
}
