package main.model;

public class beneficiario {
	private String denominacion, direccion, pais, representanteLegal, numeroFideicomiso;

	public String getDenominacion() {
		return denominacion;
	}

	public void setDenominacion(String denominacion) {
		this.denominacion = denominacion;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

	public String getRepresentanteLegal() {
		return representanteLegal;
	}

	public void setRepresentanteLegal(String representanteLegal) {
		this.representanteLegal = representanteLegal;
	}

	public String getNumeroFideicomiso() {
		return numeroFideicomiso;
	}

	public void setNumeroFideicomiso(String numeroFideicomiso) {
		this.numeroFideicomiso = numeroFideicomiso;
	}
}