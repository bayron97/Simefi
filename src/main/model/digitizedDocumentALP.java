package main.model;

public class digitizedDocumentALP {
	private int Id, buyProcessID;
	private String documentName, documentDescription;

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		this.Id = id;
	}

	public int getBuyProcessID() {
		return buyProcessID;
	}

	public void setBuyProcessID(int buyProcessID) {
		this.buyProcessID = buyProcessID;
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
