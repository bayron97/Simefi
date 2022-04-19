package main.model;

public class oficioSolicitudCompraALP {
	private long id, idSolicitudCompra;
	private int noItem;
	private String noOficio, nombreDocumento;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getIdSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setIdSolicitudCompra(long idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
	}

	public int getNoItem() {
		return noItem;
	}

	public void setNoItem(int noItem) {
		this.noItem = noItem;
	}

	public String getNoOficio() {
		return noOficio;
	}

	public void setNoOficio(String noOficio) {
		this.noOficio = noOficio;
	}

	public String getNombreDocumento() {
		return nombreDocumento;
	}

	public void setNombreDocumento(String nombreDocumento) {
		this.nombreDocumento = nombreDocumento;
	}
}