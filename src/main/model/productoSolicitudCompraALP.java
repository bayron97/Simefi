package main.model;

public class productoSolicitudCompraALP {
	long idSolicitudCompra;
	int id, cantidadRequerida, item;
	private String nombreProductoSegunCatalogo, UnidadPresentacion, tiempoEntregaRequerido, vidaUtilRequerida, nOficio, codigoATC, codigoSesal, observacionBeneficiario, descripcionTecnicaAcordada;

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}
	
	public int getitem() {
		return item;
	}

	public void setitem(int item) {
		this.item = item;
	}
	
	public long getidSolicitudCompra() {
		return idSolicitudCompra;
	}

	public void setidSolicitudCompra(long idSolicitudCompra) {
		this.idSolicitudCompra = idSolicitudCompra;
	}
	
	public int getcantidadRequerida() {
		return cantidadRequerida;
	}

	public void setcantidadRequerida(int cantidadRequerida) {
		this.cantidadRequerida = cantidadRequerida;
	}
	
	//String
		
	public String getnombreProductoSegunCatalogo() {
		return nombreProductoSegunCatalogo;
	}

	public void setnombreProductoSegunCatalogo(String nombreProductoSegunCatalogo) {
		this.nombreProductoSegunCatalogo = nombreProductoSegunCatalogo;
	}
	
	public String getUnidadPresentacion() {
		return UnidadPresentacion;
	}

	public void setUnidadPresentacion(String UnidadPresentacion) {
		this.UnidadPresentacion = UnidadPresentacion;
	}	
	
	public String gettiempoEntregaRequerido() {
		return tiempoEntregaRequerido;
	}

	public void settiempoEntregaRequerido(String tiempoEntregaRequerido) {
		this.tiempoEntregaRequerido = tiempoEntregaRequerido;
	}
	
	public String getvidaUtilRequerida() {
		return vidaUtilRequerida;
	}

	public void setvidaUtilRequerida(String vidaUtilRequerida) {
		this.vidaUtilRequerida = vidaUtilRequerida;
	}
	
	public String getnOficio() {
		return nOficio;
	}

	public void setnOficio(String nOficio) {
		this.nOficio = nOficio;
	}
	
	public String getcodigoATC() {
		return codigoATC;
	}

	public void setcodigoATC(String codigoATC) {
		this.codigoATC = codigoATC;
	}
	
	public String getobservacionBeneficiario() {
		return observacionBeneficiario;
	}

	public void setobservacionBeneficiario(String observacionBeneficiario) {
		this.observacionBeneficiario = observacionBeneficiario;
	}
	
	public String getcodigoSesal() {
		return codigoSesal;
	}

	public void setcodigoSesal(String codigoSesal) {
		this.codigoSesal = codigoSesal;
	}
	
	public String getdescripcionTecnicaAcordada() {
		return descripcionTecnicaAcordada;
	}

	public void setdescripcionTecnicaAcordada(String descripcionTecnicaAcordada) {
		this.descripcionTecnicaAcordada = descripcionTecnicaAcordada;
	}
}