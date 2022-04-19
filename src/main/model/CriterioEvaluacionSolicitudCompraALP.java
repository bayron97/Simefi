package main.model;

public class CriterioEvaluacionSolicitudCompraALP {
	private long cod;
	private int id,idCD,idC;
	private boolean Estado;
	
	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}
	
	public long getCod() {
		return cod;
	}

	public void setCod(long cod) {
		this.cod = cod;
	}
	
	public int getidCD() {
		return idCD;
	}

	public void setidCD(int idCD) {
		this.idCD = idCD;
	}
	public boolean getEstado() {
		return Estado;
	}

	public void setEstado(Boolean Estado) {
		this.Estado = Estado;
	}
	public int getidC() {
		return idC;
	}

	public void setidC(int idC) {
		this.idC = idC;
	}	
	
}
