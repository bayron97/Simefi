package main.model;

public class Gral_contratacionDetalle{
	private int idcontratacionDetalle, idContratacionVaciado, cantidadEntregarSegunPlazos, cantidadEntregada, diasAtrasoEntrega, diasExoneradosMulta, tiempoEntrega, cantidadCancelada;

	private String fechaLimiteEntrega, numeroEntrega, fechaSolicitudCita, fechaRecepcion, lugarRecepcion, numFactura, vidaUtilAceptar, numActaRecepcion, numCagarantiaCumplimientoCalidad, motivoCancelacion, fechafactorCambio, cheque, banco, numCuenta;
	
	private Boolean cancelada, entregada, pagada;
	
	private Float factorCambio;
	
	public int getIdcontratacionDetalle() {
		return idcontratacionDetalle;
	}
	
	public void setIdcontratacionDetalle(int idcontratacionDetalle) {
		this.idcontratacionDetalle = idcontratacionDetalle;
	}
	
	public int getIdContratacionVaciado() {
		return idContratacionVaciado;
	}
	
	public void setIdContratacionVaciado(int idContratacionVaciado) {
		this.idContratacionVaciado = idContratacionVaciado;
	}
	
	public int getCantidadEntregarSegunPlazos() {
		return cantidadEntregarSegunPlazos;
	}
	
	public void setCantidadEntregarSegunPlazos(int cantidadEntregarSegunPlazos) {
		this.cantidadEntregarSegunPlazos = cantidadEntregarSegunPlazos;
	}
	
	public String getFechaLimiteEntrega() {
		return fechaLimiteEntrega;
	}
	
	public void setFechaLimiteEntrega(String fechaLimiteEntrega) {
		this.fechaLimiteEntrega = fechaLimiteEntrega;
	}
	
	public String getNumeroEntrega() {
		return numeroEntrega;
	}
	
	public void setNumeroEntrega(String numeroEntrega) {
		this.numeroEntrega = numeroEntrega;
	}
	
	public int getCantidadEntregada() {
		return cantidadEntregada;
	}
	
	public void setCantidadEntregada(int cantidadEntregada) {
		this.cantidadEntregada = cantidadEntregada;
	}
	
	public int getDiasAtrasoEntrega() {
		return diasAtrasoEntrega;
	}
	
	public void setDiasAtrasoEntrega(int diasAtrasoEntrega) {
		this.diasAtrasoEntrega = diasAtrasoEntrega;
	}
	
	public int getDiasExoneradosMulta() {
		return diasExoneradosMulta;
	}
	
	public void setDiasExoneradosMulta(int diasExoneradosMulta) {
		this.diasExoneradosMulta = diasExoneradosMulta;
	}
	
	public int getTiempoEntrega() {
		return tiempoEntrega;
	}
	
	public void setTiempoEntrega(int tiempoEntrega) {
		this.tiempoEntrega = tiempoEntrega;
	}
	
	public int getCantidadCancelada() {
		return cantidadCancelada;
	}
	
	public void setCantidadCancelada(int cantidadCancelada) {
		this.cantidadCancelada = cantidadCancelada;
	}
	
	public void setFechaSolicitudCita(String fechaSolicitudCita) {
		this.fechaSolicitudCita = fechaSolicitudCita;
	}
	
	public String getFechaSolicitudCita() {
		return fechaSolicitudCita;
	}
	
	public void setFechaRecepcion(String fechaRecepcion) {
		this.fechaRecepcion = fechaRecepcion;
	}
	
	public String getFechaRecepcion() {
		return fechaRecepcion;
	}
	
	public void setLugarRecepcion(String lugarRecepcion) {
		this.lugarRecepcion = lugarRecepcion;
	}
	
	public String getLugarRecepcion() {
		return lugarRecepcion;
	}

	public void setNumFactura(String numFactura) {
		this.numFactura = numFactura;
	}
	
	public String getNumFactura() {
		return numFactura;
	}
	
	public void setVidaUtilAceptar(String vidaUtilAceptar) {
		this.vidaUtilAceptar = vidaUtilAceptar;
	}
	
	public String getVidaUtilAceptar() {
		return vidaUtilAceptar;
	}
	
	public void setNumActaRecepcion(String numActaRecepcion) {
		this.numActaRecepcion = numActaRecepcion;
	}
	
	public String getNumActaRecepcion() {
		return numActaRecepcion;
	}

	public void setNumCagarantiaCumplimientoCalidad(String numCagarantiaCumplimientoCalidad) {
		this.numCagarantiaCumplimientoCalidad = numCagarantiaCumplimientoCalidad;
	}
	
	public String getNumCagarantiaCumplimientoCalidad() {
		return numCagarantiaCumplimientoCalidad;
	}
	
	public void setMotivoCancelacion(String motivoCancelacion) {
		this.motivoCancelacion = motivoCancelacion;
	}
	
	public String getMotivoCancelacion() {
		return motivoCancelacion;
	}

	public void setCancelada(Boolean cancelada) {
		this.cancelada = cancelada;
	}
	
	public Boolean getCancelada() {
		return cancelada;
	}
	
	public void setEntregada(Boolean entregada) {
		this.entregada = entregada;
	}
	
	public Boolean getEntregada() {
		return entregada;
	}
	
	public void setPagada(Boolean pagada) {
		this.pagada = pagada;
	}
	
	public Boolean getPagada() {
		return pagada;
	}
	
	public String getFechafactorCambio() {
		return fechafactorCambio;
	}
	
	public void setFechafactorCambio(String fechafactorCambio) {
		this.fechafactorCambio = fechafactorCambio;
	}
	
	public Float getFactorCambio() {
		return factorCambio;
	}
	
	public void setFactorCambio(Float factorCambio) {
		this.factorCambio = factorCambio;
	}
	
	public String getCheque() {
		return cheque;
	}
	
	public void setCheque(String cheque) {
		this.cheque = cheque;
	}
	
	public String getBanco() {
		return banco;
	}
	
	public void setBanco(String banco) {
		this.banco = banco;
	}
	
	public String getNumCuenta() {
		return numCuenta;
	}
	
	public void setNumCuenta(String numCuenta) {
		this.numCuenta = numCuenta;
	}
	
}

