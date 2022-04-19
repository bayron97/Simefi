package main.model;

public class Gral_oficioBeneficiario {
	private int idOficioBeneficiario, idAperturaProceso;	
	private String Oficio, nombreArchivo;


	public int getIdOficioBeneficiario() {
		return idOficioBeneficiario;
	}

	public void setIdOficioBeneficiario(int idOficioBeneficiario) {
		this.idOficioBeneficiario = idOficioBeneficiario;
	}

	public int getIdAperturaProceso() {
		return idAperturaProceso;
	}

	public void setIdAperturaProceso(int idAperturaProceso) {
		this.idAperturaProceso = idAperturaProceso;
	}
	
	public String getOficio() {
		return Oficio;
	}

	public void setOficio(String Oficio) {
		this.Oficio = Oficio;
	}
	
	public String getnombreArchivo() {
		return nombreArchivo;
	}

	public void setnombreArchivo(String nombreArchivo) {
		this.nombreArchivo = nombreArchivo;
	}

	
}
