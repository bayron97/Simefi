package main.model;

public class vaciadoOfertasGeneral {
	private int cod, productosConOfertas, productosRecomendados, productosEstimados,
	productosCompletados, productosAnulados;
private String procesoCompra, fecha, distribuidorAutorizado;

public int getCod() {
return cod;
}

public void setCod(int cod) {
this.cod = cod;
}

public int getProductosConOfertas() {
return productosConOfertas;
}

public void setProductosConOfertas(int productosConOfertas) {
this.productosConOfertas = productosConOfertas;
}

public int getProductosRecomendados() {
return productosRecomendados;
}

public void setProductosRecomendados(int productosRecomendados) {
this.productosRecomendados = productosRecomendados;
}

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

public int getProductosEstimados() {
return productosEstimados;
}

public void setProductosEstimados(int productosEstimados) {
this.productosEstimados = productosEstimados;
}

public int getProductosCompletados() {
return productosCompletados;
}

public void setProductosCompletados(int productosCompletados) {
this.productosCompletados = productosCompletados;
}

public int getProductosAnulados() {
return productosAnulados;
}

public void setProductosAnulados(int productosAnulados) {
this.productosAnulados = productosAnulados;
}

public String getDistribuidorAutorizado() {
	return distribuidorAutorizado;
}

public void setDistribuidorAutorizado(String distribuidorAutorizado) {
	this.distribuidorAutorizado = distribuidorAutorizado;
}
}
