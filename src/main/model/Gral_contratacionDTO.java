package main.model;

public class Gral_contratacionDTO extends Gral_contratacion{
	
	private String numProcesoCompra, beneficiario, nombreProveedor, tipoDocuemnto, numDocumento, fechaSuscripcion, documento;
	
	
	
	public String getNumProcesoCompra() {
		return numProcesoCompra;
	}
	
	public void setNumProcesoCompra(String numProcesoCompra) {
		this.numProcesoCompra = numProcesoCompra;
	}
	
	public String getBeneficiario() {
		return beneficiario;
	}
	
	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}
	
	public String getNombreProveedor() {
		return nombreProveedor;
	}
	
	public void setNombreProveedor(String nombreProveedor) {
		this.nombreProveedor = nombreProveedor;
	}
	
	public String getTipoDocuemnto() {
		return tipoDocuemnto;
	}
	
	public void setTipoDocuemnto(String tipoDocuemnto) {
		this.tipoDocuemnto = tipoDocuemnto;
	}
	
	public String getNumDocumento() {
		return numDocumento;
	}
	
	public void setNumDocumento(String numDocumento) {
		this.numDocumento = numDocumento;
	}
	
	public String getFechaSuscripcion() {
		return fechaSuscripcion;
	}
	
	public void setFechaSuscripcion(String fechaSuscripcion) {
		this.fechaSuscripcion = fechaSuscripcion;
	}

	public String getDocumento() {
		return documento;
	}
	
	public void setDocumento(String documento) {
		this.documento = documento;
	}

}
