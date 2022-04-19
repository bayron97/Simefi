package main.model;

public class digitizedDocForSolicitudCompALP {
	private long idSolicitudCompra;
	private int Id;
	private String documentName, documentDescription;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		this.Id = id;
	}

	public long getidSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setidSolicitudCompra(long idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
	}

	public String getDocumentName() {
		return documentName;
	}

	public void setDocumentName(String documentName) {
		this.documentName = documentName;
	}

	public String getDocumentDescription() {
		return documentDescription;
	}

	public void setDocumentDescription(String documentDescription) {
		this.documentDescription = documentDescription;
	}

}
