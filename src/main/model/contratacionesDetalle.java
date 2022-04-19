package main.model;

public class contratacionesDetalle {
	private long idDetalle,id;
	private int noItem,cantidadEntregaPlazos,cantidadEntrega;
	private float cantidadComprado,precioUnitario,valorTotalCompra,diasAtraso,multa,valorNetoPagar;
	private String codigoATC, nombreProducto,descripcionTecnica, unidadPresentacion, proveedor,fabricante_PaisOrigen,observaciones,tiempoEntrega,numeroOdenCompra,fechaSuscripcion,fechaLimiteEntrega,fechaSolicitudCita,fechaRecepcion,lugarRecepcion,noFactura,totalEntrega;
	private String vidaUtil,informeResultadoAnalisis,noInformeResultadoAnalisis,noLoteFabricacion,noGarantia,noActaRecepcion,statusPago,aprobacionComite,moneda;
	private boolean EstadoEntrega,cancelado;
	public long getIdDetalle() {
		return idDetalle;
	}
	public void setIdDetalle(long idDetalle) {
		this.idDetalle = idDetalle;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public int getNoItem() {
		return noItem;
	}
	public void setNoItem(int noItem) {
		this.noItem = noItem;
	}
	public int getCantidadEntregaPlazos() {
		return cantidadEntregaPlazos;
	}
	public void setCantidadEntregaPlazos(int cantidadEntregaPlazos) {
		this.cantidadEntregaPlazos = cantidadEntregaPlazos;
	}
	public int getCantidadEntrega() {
		return cantidadEntrega;
	}
	public void setCantidadEntrega(int cantidadEntrega) {
		this.cantidadEntrega = cantidadEntrega;
	}
	public float getCantidadComprado() {
		return cantidadComprado;
	}
	public void setCantidadComprado(float cantidadComprado) {
		this.cantidadComprado = cantidadComprado;
	}
	public float getPrecioUnitario() {
		return precioUnitario;
	}
	public void setPrecioUnitario(float precioUnitario) {
		this.precioUnitario = precioUnitario;
	}
	public float getValorTotalCompra() {
		return valorTotalCompra;
	}
	public void setValorTotalCompra(float valorTotalCompra) {
		this.valorTotalCompra = valorTotalCompra;
	}
	public float getDiasAtraso() {
		return diasAtraso;
	}
	public void setDiasAtraso(float diasAtraso) {
		this.diasAtraso = diasAtraso;
	}
	public float getMulta() {
		return multa;
	}
	public void setMulta(float multa) {
		this.multa = multa;
	}
	public float getValorNetoPagar() {
		return valorNetoPagar;
	}
	public void setValorNetoPagar(float valorNetoPagar) {
		this.valorNetoPagar = valorNetoPagar;
	}
	public String getCodigoATC() {
		return codigoATC;
	}
	public void setCodigoATC(String codigoATC) {
		this.codigoATC = codigoATC;
	}
	public String getNombreProducto() {
		return nombreProducto;
	}
	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	public String getDescripcionTecnica() {
		return descripcionTecnica;
	}
	public void setDescripcionTecnica(String descripcionTecnica) {
		this.descripcionTecnica = descripcionTecnica;
	}
	public String getUnidadPresentacion() {
		return unidadPresentacion;
	}
	public void setUnidadPresentacion(String unidadPresentacion) {
		this.unidadPresentacion = unidadPresentacion;
	}
	public String getProveedor() {
		return proveedor;
	}
	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}
	public String getFabricante_PaisOrigen() {
		return fabricante_PaisOrigen;
	}
	public void setFabricante_PaisOrigen(String fabricante_PaisOrigen) {
		this.fabricante_PaisOrigen = fabricante_PaisOrigen;
	}
	public String getObservaciones() {
		return observaciones;
	}
	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}
	public String getTiempoEntrega() {
		return tiempoEntrega;
	}
	public void setTiempoEntrega(String tiempoEntrega) {
		this.tiempoEntrega = tiempoEntrega;
	}
	public String getNumeroOdenCompra() {
		return numeroOdenCompra;
	}
	public void setNumeroOdenCompra(String numeroOdenCompra) {
		this.numeroOdenCompra = numeroOdenCompra;
	}
	public String getFechaSuscripcion() {
		return fechaSuscripcion;
	}
	public void setFechaSuscripcion(String fechaSuscripcion) {
		this.fechaSuscripcion = fechaSuscripcion;
	}
	public String getFechaLimiteEntrega() {
		return fechaLimiteEntrega;
	}
	public void setFechaLimiteEntrega(String fechaLimiteEntrega) {
		this.fechaLimiteEntrega = fechaLimiteEntrega;
	}
	public String getFechaSolicitudCita() {
		return fechaSolicitudCita;
	}
	public void setFechaSolicitudCita(String fechaSolicitudCita) {
		this.fechaSolicitudCita = fechaSolicitudCita;
	}
	public String getFechaRecepcion() {
		return fechaRecepcion;
	}
	public void setFechaRecepcion(String fechaRecepcion) {
		this.fechaRecepcion = fechaRecepcion;
	}
	public String getLugarRecepcion() {
		return lugarRecepcion;
	}
	public void setLugarRecepcion(String lugarRecepcion) {
		this.lugarRecepcion = lugarRecepcion;
	}
	public String getNoFactura() {
		return noFactura;
	}
	public void setNoFactura(String noFactura) {
		this.noFactura = noFactura;
	}
	public String getTotalEntrega() {
		return totalEntrega;
	}
	public void setTotalEntrega(String totalEntrega) {
		this.totalEntrega = totalEntrega;
	}
	public String getVidaUtil() {
		return vidaUtil;
	}
	public void setVidaUtil(String vidaUtil) {
		this.vidaUtil = vidaUtil;
	}
	public String getInformeResultadoAnalisis() {
		return informeResultadoAnalisis;
	}
	public void setInformeResultadoAnalisis(String informeResultadoAnalisis) {
		this.informeResultadoAnalisis = informeResultadoAnalisis;
	}
	public String getNoInformeResultadoAnalisis() {
		return noInformeResultadoAnalisis;
	}
	public void setNoInformeResultadoAnalisis(String noInformeResultadoAnalisis) {
		this.noInformeResultadoAnalisis = noInformeResultadoAnalisis;
	}
	public String getNoLoteFabricacion() {
		return noLoteFabricacion;
	}
	public void setNoLoteFabricacion(String noLoteFabricacion) {
		this.noLoteFabricacion = noLoteFabricacion;
	}
	public String getNoGarantia() {
		return noGarantia;
	}
	public void setNoGarantia(String noGarantia) {
		this.noGarantia = noGarantia;
	}
	public String getNoActaRecepcion() {
		return noActaRecepcion;
	}
	public void setNoActaRecepcion(String noActaRecepcion) {
		this.noActaRecepcion = noActaRecepcion;
	}
	public String getStatusPago() {
		return statusPago;
	}
	public void setStatusPago(String statusPago) {
		this.statusPago = statusPago;
	}
	public String getAprobacionComite() {
		return aprobacionComite;
	}
	public void setAprobacionComite(String aprobacionComite) {
		this.aprobacionComite = aprobacionComite;
	}
	
	public String getMoneda() {
		return moneda;
	}
	public void setMoneda(String moneda) {
		this.moneda = moneda;
	}

	public boolean getEstadoEntrega() {
		return EstadoEntrega;
	}
	public void setEstadoEntrega(Boolean EstadoEntrega) {
		this.EstadoEntrega = EstadoEntrega;
	}
	
	public boolean getcancelado() {
		return cancelado;
	}
	public void setcancelado(Boolean cancelado) {
		this.cancelado = cancelado;
	}
}
