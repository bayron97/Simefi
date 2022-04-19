package main.model;

public class catalogo {
	int id, noitem,codATC;
	private String nombreProducto, descripcionTecnica, unidadPresentacion;

	public int getid() {
		return id;
	}

	public void setid(int id) {
		this.id = id;
	}
	
	public int getnoitem() {
		return noitem;
	}

	public void setnoitem(int codATC) {
		this.codATC = codATC;
	}
	
	public int getcodATC() {
		return codATC;
	}

	public void setcodATC(int codATC) {
		this.codATC = codATC;
	}
	
	public String getnombreProducto() {
		return nombreProducto;
	}

	public void setnombreProducto(String nombreProducto) {
		this.nombreProducto = nombreProducto;
	}
	
	public String getdescripcionTecnica() {
		return descripcionTecnica;
	}

	public void setdescripcionTecnica(String descripcionTecnica) {
		this.descripcionTecnica = descripcionTecnica;
	}
	
	public String getunidadPresentacion() {
		return unidadPresentacion;
	}

	public void setunidadPresentacion(String unidadPresentacion) {
		this.unidadPresentacion = unidadPresentacion;
	}

	
}