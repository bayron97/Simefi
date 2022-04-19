package main.model;

public class Gral_resultadoAnalisCalidad{
	private int idResultadoAnalisCalidad, idcontratacionDetalle;

	private String numInformeResultadoAnalisis, resultadoAnalisisCalidad, numLoteFabricanteAnalizado,observaciones;
	
	
	public int getIdResultadoAnalisCalidad() {
		return idResultadoAnalisCalidad;
	}
	
	public void setIdResultadoAnalisCalidad(int idResultadoAnalisCalidad) {
		this.idResultadoAnalisCalidad = idResultadoAnalisCalidad;
	}
	
	public int getIdcontratacionDetalle() {
		return idcontratacionDetalle;
	}
	
	public void setIdcontratacionDetalle(int idcontratacionDetalle) {
		this.idcontratacionDetalle = idcontratacionDetalle;
	}
	
	public String getnumInformeResultadoAnalisis() {
		return numInformeResultadoAnalisis;
	}
	
	public void setnumInformeResultadoAnalisis(String numInformeResultadoAnalisis) {
		this.numInformeResultadoAnalisis = numInformeResultadoAnalisis;
	}
	
	public String getResultadoAnalisisCalidad() {
		return resultadoAnalisisCalidad;
	}
	
	public void setResultadoAnalisisCalidad(String resultadoAnalisisCalidad) {
		this.resultadoAnalisisCalidad = resultadoAnalisisCalidad;
	}
		
	public String getNumLoteFabricanteAnalizado() {
		return numLoteFabricanteAnalizado;
	}
	
	public void setNumLoteFabricanteAnalizado(String numLoteFabricanteAnalizado) {
		this.numLoteFabricanteAnalizado = numLoteFabricanteAnalizado;
	}

	public String getObservaciones() {
		return observaciones;
	}
	
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	
}
