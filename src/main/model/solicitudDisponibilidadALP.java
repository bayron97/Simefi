package main.model;

public class solicitudDisponibilidadALP {
	private long id, idSolicitudCompra;
	private String codSolicitudDisponibilidad, fechaEmision, fechaMaximaRespuesta, proveedor, nota, nombreReporte, estadoVaciados;

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

	public String getCodSolicitudDisponibilidad() {
		return codSolicitudDisponibilidad;
	}

	public void setCodSolicitudDisponibilidad(String codSolicitudDisponibilidad) {
		this.codSolicitudDisponibilidad = codSolicitudDisponibilidad;
	}

	public String getFechaEmision() {
		return fechaEmision;
	}

	public void setFechaEmision(String fechaEmision) {
		this.fechaEmision = fechaEmision;
	}

	public String getFechaMaximaRespuesta() {
		return fechaMaximaRespuesta;
	}

	public void setFechaMaximaRespuesta(String fechaMaximaRespuesta) {
		this.fechaMaximaRespuesta = fechaMaximaRespuesta;
	}

	public String getProveedor() {
		return proveedor;
	}

	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}

	public String getNota() {
		return nota;
	}

	public void setNota(String nota) {
		this.nota = nota;
	}

	public String getNombreReporte() {
		return nombreReporte;
	}

	public void setNombreReporte(String nombreReporte) {
		this.nombreReporte = nombreReporte;
	}

	public String getEstadoVaciados() {
		return estadoVaciados;
	}

	public void setEstadoVaciados(String estadoVaciados) {
		this.estadoVaciados = estadoVaciados;
	}
}
