package main.model;

public class historialAccesos {
	private static String fecha, modulo, submodulo, usuario, funcion;

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		historialAccesos.fecha = fecha;
	}

	public String getModulo() {
		return modulo;
	}

	public void setModulo(String modulo) {
		historialAccesos.modulo = modulo;
	}

	public String getSubmodulo() {
		return submodulo;
	}

	public void setSubmodulo(String submodulo) {
		historialAccesos.submodulo = submodulo;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		historialAccesos.usuario = usuario;
	}

	public String getFuncion() {
		return funcion;
	}

	public void setFuncion(String funcion) {
		historialAccesos.funcion = funcion;
	}
}
