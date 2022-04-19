package main.model;

public class contratosuministrodocumento {
	private String idDocumentos, nombresArchivos, descripcionesArchivos;
	
	private int idContrato;

	public int getidContrato() {
		return idContrato;
	}

	public void setidContrato(int idContrato) {
		this.idContrato = idContrato;
	}
	
	public String getidDocumentos() {
		return idDocumentos;
	}

	public void setidDocumentos(String idDocumentos) {
		this.idDocumentos = idDocumentos;
	}

	public String getnombresArchivos() {
		return nombresArchivos;
	}

	public void setnombresArchivos(String nombresArchivos) {
		this.nombresArchivos = nombresArchivos;
	}

	public String getdescripcionesArchivos() {
		return descripcionesArchivos;
	}

	public void setdescripcionesArchivos(String descripcionesArchivos) {
		this.descripcionesArchivos = descripcionesArchivos;
	}	

}
