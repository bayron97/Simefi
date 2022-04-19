package main.model;

public class Gral_terminosReferencia {
	private int idterminosReferencia, idAperturaProceso;	
	private String nombreDocumento, descripcion;


	public int getIdterminosReferencia() {
		return idterminosReferencia;
	}

	public void setIdterminosReferencia(int idterminosReferencia) {
		this.idterminosReferencia = idterminosReferencia;
	}
	
	public int getIdAperturaProceso() {
		return idAperturaProceso;
	}

	public void setIdAperturaProceso(int idAperturaProceso) {
		this.idAperturaProceso = idAperturaProceso;
	}
	
	
	public String getNombreDocumento() {
		return nombreDocumento;
	}

	public void setNombreDocumento(String nombreDocumento) {
		this.nombreDocumento = nombreDocumento;
	}
	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
}
