package main.model;

public class contratacionesGenerales{
	private int id,idProcesoCompra,idBeneficiario,idSolicitudCompra,idProveedor;
	private float montoTotalPagar;
	private String procesoCompra, beneficiario,solicitudCompra,proveedor,noOrdenCompra, observaciones, nombreDocumento,fechaSuscripcion,estados,fechaPago,noReferencia;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getIdProcesoCompra() {
		return idProcesoCompra;
	}
	public void setIdProcesoCompra(int idProcesoCompra) {
		this.idProcesoCompra = idProcesoCompra;
	}
	public int getIdBeneficiario() {
		return idBeneficiario;
	}
	public void setIdBeneficiario(int idBeneficiario) {
		this.idBeneficiario = idBeneficiario;
	}
	public int getIdSolicitudCompra() {
		return idSolicitudCompra;
	}
	public void setIdSolicitudCompra(int idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
	}
	public int getIdProveedor() {
		return idProveedor;
	}
	public void setIdProveedor(int idProveedor) {
		this.idProveedor = idProveedor;
	}
	public String getProcesoCompra() {
		return procesoCompra;
	}
	public void setProcesoCompra(String procesoCompra) {
		this.procesoCompra = procesoCompra;
	}
	public String getBeneficiario() {
		return beneficiario;
	}
	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}
	public String getSolicitudCompra() {
		return solicitudCompra;
	}
	public void setSolicitudCompra(String solicitudCompra) {
		this.solicitudCompra = solicitudCompra;
	}
	public String getProveedor() {
		return proveedor;
	}
	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}
	public String getNoOrdenCompra() {
		return noOrdenCompra;
	}
	public void setNoOrdenCompra(String noOrdenCompra) {
		this.noOrdenCompra = noOrdenCompra;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getNombreDocumento() {
		return nombreDocumento;
	}
	public void setNombreDocumento(String nombreDocumento) {
		this.nombreDocumento = nombreDocumento;
	}
	public String getFechaSuscripcion() {
		return fechaSuscripcion;
	}
	public void setFechaSuscripcion(String fechaSuscripcion) {
		this.fechaSuscripcion = fechaSuscripcion;
	}
	public float getMontoTotalPagar() {
		return montoTotalPagar;
	}
	public void setMontoTotalPagar(float montoTotalPagar) {
		this.montoTotalPagar = montoTotalPagar;
	}
	public String getEstados() {
		return estados;
	}
	public void setEstados(String estados) {
		this.estados = estados;
	}
	public String getFechaPago() {
		return fechaPago;
	}
	public void setFechaPago(String fechaPago) {
		this.fechaPago = fechaPago;
	}
	public String getNoReferencia() {
		return noReferencia;
	}
	public void setNoReferencia(String noReferencia) {
		this.noReferencia = noReferencia;
	}

	
	
}
