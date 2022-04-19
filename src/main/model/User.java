package main.model;

public class User {
	private int codigoEmpleado;
	private String nombre, usuario, password, correo, puesto, estado1, estado2, observacion, funcion, identidad,
			fechaCreacion, fechaModificacion;
	private String tieneAccesos;

	public void setCodEmp(int cod) {
		this.codigoEmpleado = cod;
	}

	public int getCodEmp() {
		return codigoEmpleado;
	}

	public void setNombre(String n) {
		this.nombre = n;
	}

	public String getNombre() {
		return nombre;
	}

	public void setUsuario(String n) {
		this.usuario = n;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setPassword(String n) {
		this.password = n;
	}

	public String getPassword() {
		return password;
	}

	public void setCorreo(String n) {
		this.correo = n;
	}

	public String getCorreo() {
		return correo;
	}

	public void setPuesto(String n) {
		this.puesto = n;
	}

	public String getPuesto() {
		return puesto;
	}

	public void setEstado2(String n) {
		this.estado2 = n;
	}

	public String getEstado2() {
		return estado2;
	}

	public void setEstado1(String n) {
		this.estado1 = n;
	}

	public String getEstado1() {
		return estado1;
	}

	public void setFuncion(String n) {
		this.funcion = n;
	}

	public String getFuncion() {
		return funcion;
	}

	public void setObs(String n) {
		this.observacion = n;
	}

	public String getObs() {
		return observacion;
	}

	public String getIdentidad() {
		return identidad;
	}

	public void setIdentidad(String identidad) {
		this.identidad = identidad;
	}

	public String getFechaCreacion() {
		return fechaCreacion;
	}

	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	public String getFechaModificacion() {
		return fechaModificacion;
	}

	public void setFechaModificacion(String fechaModificacion) {
		this.fechaModificacion = fechaModificacion;
	}

	public String getTieneAccesos() {
		return tieneAccesos;
	}

	public void setTieneAccesos(String tieneAccesos) {
		this.tieneAccesos = tieneAccesos;
	}
}