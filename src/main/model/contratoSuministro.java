package main.model;

public class contratoSuministro {
	private int Id,buyProcessId;
	private String distribuidor, fecha,buyProcessCod, observaciones, documentName,buyOrderId;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getBuyProcessId() {
		return buyProcessId;
	}
	public void setBuyProcessId(int buyProcessId) {
		this.buyProcessId = buyProcessId;
	}
	public String getBuyOrderId() {
		return buyOrderId;
	}
	public void setBuyOrderId(String buyOrderId) {
		this.buyOrderId = buyOrderId;
	}
	public String getBuyProcessCod() {
		return buyProcessCod;
	}
	public void setBuyProcessCod(String buyProcessCod) {
		this.buyProcessCod = buyProcessCod;
	}
	public String getDistribuidor() {
		return distribuidor;
	}
	public void setDistribuidor(String distribuidor) {
		this.distribuidor = distribuidor;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getDocumentName() {
		return documentName;
	}
	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	
}
