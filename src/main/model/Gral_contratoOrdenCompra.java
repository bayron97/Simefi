package main.model;

public class Gral_contratoOrdenCompra {
	private int idcontratoOrdenCompra, idAperturaProceso, idProveedor;	
	private String nombreProveedor, tipoDocuemnto, numDocumento, fechaSuscripcion, observaciones, documento;


	public int getIdcontratoOrdenCompra() {
		return idcontratoOrdenCompra;
	}

	public void setIdcontratoOrdenCompra(int idcontratoOrdenCompra) {
		this.idcontratoOrdenCompra = idcontratoOrdenCompra;
	}
	
	public int getIdAperturaProceso() {
		return idAperturaProceso;
	}

	public void setIdAperturaProceso(int idAperturaProceso) {
		this.idAperturaProceso = idAperturaProceso;
	}
		
	public int getIdProveedor() {
		return idProveedor;
	}

	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
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
		
	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
			
	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}
		
}
