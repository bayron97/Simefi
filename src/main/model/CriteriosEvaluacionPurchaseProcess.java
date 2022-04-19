package main.model;

public class CriteriosEvaluacionPurchaseProcess {
	private String NombreCriterioDetalle, NombreCriterio;
	private int id, idCE;

	public String getNombreCriterio() {
		return NombreCriterio;
	}

	public void setNombreCriterio(String NombreCriterio) {
		this.NombreCriterio = NombreCriterio;
	}

	public String getNombreCriterioDetalle() {
		return NombreCriterioDetalle;
	}

	public void setNombreCriterioDetalle(String NombreCriterioDetalle) {
		this.NombreCriterioDetalle = NombreCriterioDetalle;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getIdCE() {
		return idCE;
	}

	public void setIdCE(int idCE) {
		this.idCE = idCE;
	}

}
