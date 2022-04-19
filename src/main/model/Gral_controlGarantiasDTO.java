package main.model;

public class Gral_controlGarantiasDTO extends Gral_controlGarantias {
	
	private String beneficiario, numProcesoCompra, numDocumento, proveedor;


	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}
	
	public String getNumDocumento() {
		return numProcesoCompra;
	}

	public void setNumDocumento(String numProcesoCompra) {
		this.numProcesoCompra = numProcesoCompra;
	}
	
	public String getNumProcesoCompra() {
		return numDocumento;
	}

	public void setNumProcesoCompra(String numDocumento) {
		this.numDocumento = numDocumento;
	}
	
	public String getNombreProveedor() {
		return proveedor;
	}

	public void setNombreProveedor(String proveedor) {
		this.proveedor = proveedor;
	}
	
	
}
