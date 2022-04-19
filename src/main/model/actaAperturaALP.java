package main.model;

public class actaAperturaALP {
	private String denominacion, procesoCompra ;
	private int id, idListRequirement,ofertasRecividas, noOfertador;
	private boolean estado;

	public int getnoOfertador() {
		return noOfertador;
	}

	public void setnoOfertador(int noOfertador) {
		this.noOfertador = noOfertador;
	}
	
	public String getdenominacion() {
		return denominacion;
	}

	public void setdenominacion(String denominacion) {
		this.denominacion = denominacion;
	}
	
	public String getprocesoCompra() {
		return procesoCompra;
	}

	public void setprocesoCompra(String procesoCompra) {
		this.procesoCompra = procesoCompra;
	}
	
	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}
	
	public int getidListRequirement() {
		return idListRequirement;
	}

	public void setidListRequirement(int idListRequirement) {
		this.idListRequirement = idListRequirement;
	}

	public int getofertasRecividas() {
		return ofertasRecividas;
	}

	public void setofertasRecividas(int ofertasRecividas) {
		this.ofertasRecividas = ofertasRecividas;
	}
	
	public boolean getestado() {
		return estado;
	}

	public void setestado(Boolean estado) {
		this.estado = estado;
	}
	
}
