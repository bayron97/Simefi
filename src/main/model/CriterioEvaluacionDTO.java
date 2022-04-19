package main.model;

import java.util.ArrayList;

public class CriterioEvaluacionDTO {
	private String NombreCriterioDetalle, NombreCriterio;
	private int id, idCE, cod, idC, idCD, idProceso;
	private boolean Estado;
	private long idSolicitud;
	private  ArrayList<CriteriosEvaluacionDetalle>  listDetalle = new  ArrayList<CriteriosEvaluacionDetalle>();

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

	public boolean getEstado() {
		return Estado;
	}

	public void setEstado(Boolean Estado) {
		this.Estado = Estado;
	}
	
	public int getcod() {
		return cod;
	}

	public void setcod(int cod) {
		this.cod = cod;
	}
	
	public int getidC() {
		return idC;
	}

	public void setidC(int idC) {
		this.idC = idC;
	}
	
	public ArrayList<CriteriosEvaluacionDetalle> getlistDetalle() {
		return listDetalle;
	}

	public void setlistDetalle(ArrayList<CriteriosEvaluacionDetalle> listDetalle) {
		this.listDetalle = listDetalle;
	}	
	
	public long getidSolicitud() {
		return idSolicitud;
	}

	public void setidSolicitud(long idSolicitud) {
		this.idSolicitud = idSolicitud;
	}
	
	public int getidCD() {
		return idCD;
	}

	public void setidCD(int idCD) {
		this.idCD = idCD;
	}
	
	public int getidProceso() {
		return idProceso;
	}

	public void setidProceso(int idProceso) {
		this.idProceso = idProceso;
	}
}
