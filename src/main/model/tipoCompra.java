package main.model;

public class tipoCompra {
	private int no;
	private String tipoCompra, abreviatura, estado, observaciones, motivo;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTipoCompra() {
		return tipoCompra;
	}

	public void setTipoCompra(String tipoCompra) {
		this.tipoCompra = tipoCompra;
	}

	public String getabreviatura() {
		return abreviatura;
	}

	public void setabreviatura(String abreviatura) {
		this.abreviatura = abreviatura;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
	public String getmotivo() {
		return motivo;
	}

	public void setmotivo(String motivo) {
		this.motivo = motivo;
	}
}
