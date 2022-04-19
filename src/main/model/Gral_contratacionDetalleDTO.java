package main.model;

public class Gral_contratacionDetalleDTO extends Gral_contratacionVaciado{
	private int idcontratacionDetalle,  cantidadEntregarSegunPlazos;

	private String fechaLimiteEntrega, numeroEntrega;
	
	
	public int getIdcontratacionDetalle() {
		return idcontratacionDetalle;
	}
	
	public void setIdcontratacionDetalle(int idcontratacionDetalle) {
		this.idcontratacionDetalle = idcontratacionDetalle;
	}
	
	
	
	public int getCantidadEntregarSegunPlazos() {
		return cantidadEntregarSegunPlazos;
	}
	
	public void setCantidadEntregarSegunPlazos(int cantidadEntregarSegunPlazos) {
		this.cantidadEntregarSegunPlazos = cantidadEntregarSegunPlazos;
	}
	
	public String getFechaLimiteEntrega() {
		return fechaLimiteEntrega;
	}
	
	public void setFechaLimiteEntrega(String fechaLimiteEntrega) {
		this.fechaLimiteEntrega = fechaLimiteEntrega;
	}
	
	public String getNumeroEntrega() {
		return numeroEntrega;
	}
	
	public void setNumeroEntrega(String numeroEntrega) {
		this.numeroEntrega = numeroEntrega;
	}
	
	
}
