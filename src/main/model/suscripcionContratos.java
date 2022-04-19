package main.model;

public class suscripcionContratos {
	private String fechaSubs, fechaVenc, observacion, padre;

	public String getFechaSubs() {
		return fechaSubs;
	}

	public void setFechaSubs(String fechaSubs) {
		this.fechaSubs = fechaSubs;
	}

	public String getFechaVenc() {
		return fechaVenc;
	}

	public void setFechaVenc(String fechaVenc) {
		this.fechaVenc = fechaVenc;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getPadre() {
		return padre;
	}

	public void setPadre(String padre) {
		this.padre = padre;
	}
}
