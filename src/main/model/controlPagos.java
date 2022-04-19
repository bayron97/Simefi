package main.model;

public class controlPagos {
	private int Id,buyProcessId,noItem,diasAtraso;
	private String buyProcessCod,buyOrderId,proveedor,cuentaBancaria,banco,noFactura,fechaLimiteEntrega,fechaSolicitudCita,estado,noReferencia,fecha,actaRecepcion,informeCalidad;
	private float totalPagado,multa,pagoTotal;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public int getBuyProcessId() {
		return buyProcessId;
	}
	public void setBuyProcessId(int buyProcessId) {
		this.buyProcessId = buyProcessId;
	}
	public int getNoItem() {
		return noItem;
	}
	public void setNoItem(int noItem) {
		this.noItem = noItem;
	}
	public int getDiasAtraso() {
		return diasAtraso;
	}
	public void setDiasAtraso(int diasAtraso) {
		this.diasAtraso = diasAtraso;
	}
	public String getBuyProcessCod() {
		return buyProcessCod;
	}
	public void setBuyProcessCod(String buyProcessCod) {
		this.buyProcessCod = buyProcessCod;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getBuyOrderId() {
		return buyOrderId;
	}
	public void setBuyOrderId(String buyOrderId) {
		this.buyOrderId = buyOrderId;
	}
	public String getProveedor() {
		return proveedor;
	}
	public void setProveedor(String proveedor) {
		this.proveedor = proveedor;
	}
	public String getCuentaBancaria() {
		return cuentaBancaria;
	}
	public void setCuentaBancaria(String cuentaBancaria) {
		this.cuentaBancaria = cuentaBancaria;
	}
	public String getBanco() {
		return banco;
	}
	public void setBanco(String banco) {
		this.banco = banco;
	}
	public String getNoFactura() {
		return noFactura;
	}
	public void setNoFactura(String noFactura) {
		this.noFactura = noFactura;
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
	public float getTotalPagado() {
		return totalPagado;
	}
	public void setTotalPagado(float totalPagado) {
		this.totalPagado = totalPagado;
	}
	public float getMulta() {
		return multa;
	}
	public void setMulta(float multa) {
		this.multa = multa;
	}
	public float getPagoTotal() {
		return pagoTotal;
	}
	public void setPagoTotal(float pagoTotal) {
		this.pagoTotal = pagoTotal;
	}
	public String getNoReferencia() {
		return noReferencia;
	}
	public void setNoReferencia(String noReferencia) {
		this.noReferencia = noReferencia;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getactaRecepcion() {
		return actaRecepcion;
	}
	public void setactaRecepcion(String actaRecepcion) {
		this.actaRecepcion = actaRecepcion;
	}
	public String getinformeCalidad() {
		return informeCalidad;
	}
	public void setinformeCalidad(String informeCalidad) {
		this.informeCalidad = informeCalidad;
	}
	
	
}
