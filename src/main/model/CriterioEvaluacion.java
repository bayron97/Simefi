package main.model;

public class CriterioEvaluacion {
	private String NombreCriterio, estado, motivo;
	private int id;

	public String getNombreCriterio() {
		return NombreCriterio;
	}

	public void setNombreCriterio(String NombreCriterio) {
		this.NombreCriterio = NombreCriterio;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public String getestado() {
		return estado;
	}

	public void setestado(String estado) {
		this.estado = estado;
	}
	
	public String getmotivo() {
		return motivo;
	}

	public void setmotivo(String motivo) {
		this.motivo = motivo;
	}
	
}
