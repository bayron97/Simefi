package main.model;

public class medicamentos {
	private int codSist;
	private String codAtc, codSesal, nombre, viaAdmin, up, atencion, descripcion, estado1, movimiento1, estado2,
			movimiento2, grupo, subGrupo, observacion, beneficiario, listado;

	public int getCodSist() {
		return codSist;
	}

	public void setCodSist(int codSist) {
		this.codSist = codSist;
	}

	public String getCodAtc() {
		return codAtc;
	}

	public void setCodAtc(String codAtc) {
		this.codAtc = codAtc;
	}

	public String getCodSesal() {
		return codSesal;
	}

	public void setCodSesal(String codSesal) {
		this.codSesal = codSesal;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getViaAdmin() {
		return viaAdmin;
	}

	public void setViaAdmin(String viaAdmin) {
		this.viaAdmin = viaAdmin;
	}

	public String getUp() {
		return up;
	}

	public void setUp(String up) {
		this.up = up;
	}

	public String getAtencion() {
		return atencion;
	}

	public void setAtencion(String atencion) {
		this.atencion = atencion;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public String getEstado1() {
		return estado1;
	}

	public void setEstado1(String estado1) {
		this.estado1 = estado1;
	}

	public String getMovimiento1() {
		return movimiento1;
	}

	public void setMovimiento1(String movimiento1) {
		this.movimiento1 = movimiento1;
	}

	public String getEstado2() {
		return estado2;
	}

	public void setEstado2(String estado2) {
		this.estado2 = estado2;
	}

	public String getMovimiento2() {
		return movimiento2;
	}

	public void setMovimiento2(String movimiento2) {
		this.movimiento2 = movimiento2;
	}

	public String getGrupo() {
		return grupo;
	}

	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}

	public String getSubGrupo() {
		return subGrupo;
	}

	public void setSubGrupo(String subGrupo) {
		this.subGrupo = subGrupo;
	}

	public String getBeneficiario() {
		return beneficiario;
	}

	public void setBeneficiario(String beneficiario) {
		this.beneficiario = beneficiario;
	}

	public String getObservacion() {
		return observacion;
	}

	public void setObservacion(String observacion) {
		this.observacion = observacion;
	}

	public String getListado() {
		return listado;
	}

	public void setListado(String listado) {
		this.listado = listado;
	}
}