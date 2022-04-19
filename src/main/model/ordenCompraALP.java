package main.model;

public class ordenCompraALP {
	private String procesoCompra, fecha, ordenCompra, distribuidorFabricante, nombreProducto, descTecnica, up,
			tiempoEntrega, vidaUtil, observaciones;
	private int cantSolicitada;
	private float precioUnitario, precioTotal;

	public String getProcesoCompra() {
		return procesoCompra;
	}

	public void setProcesoCompra(String procesoCompra) {
		this.procesoCompra = procesoCompra;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getOrdenCompra() {
		return ordenCompra;
	}

	public void setOrdenCompra(String ordenCompra) {
		this.ordenCompra = ordenCompra;
	}

	public String getDistribuidorFabricante() {
		return distribuidorFabricante;
	}

	public void setDistribuidorFabricante(String distribuidorFabricante) {
		this.distribuidorFabricante = distribuidorFabricante;
	}

	public String getNombreProducto() {
		return nombreProducto;
	}

	public void setNombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}

	public String getDescTecnica() {
		return descTecnica;
	}

	public void setDescTecnica(String descTecnica) {
		this.descTecnica = descTecnica;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}

	public String getTiempoEntrega() {
		return tiempoEntrega;
	}

	public void setTiempoEntrega(String tiempoEntrega) {
		this.tiempoEntrega = tiempoEntrega;
	}

	public String getVidaUtil() {
		return vidaUtil;
	}

	public void setVidaUtil(String vidaUtil) {
		this.vidaUtil = vidaUtil;
	}

	public String getObservaciones() {
		return observaciones;
	}

	public void setObservaciones(String observaciones) {
		this.observaciones = observaciones;
	}

	public int getCantSolicitada() {
		return cantSolicitada;
	}

	public void setCantSolicitada(int cantSolicitada) {
		this.cantSolicitada = cantSolicitada;
	}

	public float getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(float precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	public float getPrecioTotal() {
		return precioTotal;
	}

	public void setPrecioTotal(float precioTotal) {
		this.precioTotal = precioTotal;
	}
}
