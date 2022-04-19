package main.model;

public class accesos {
	private int uId;
	private String Usuario, SubModulo, TipoAcceso, estado1, motivo1, estado2, motivo2;

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getUsuario() {
		return Usuario;
	}

	public void setUsuario(String usuario) {
		Usuario = usuario;
	}

	public String getSubModulo() {
		return SubModulo;
	}

	public void setSubModulo(String subModulo) {
		SubModulo = subModulo;
	}

	public String getTipoAcceso() {
		return TipoAcceso;
	}

	public void setTipoAcceso(String tipoAcceso) {
		TipoAcceso = tipoAcceso;
	}

	public String getEstado1() {
		return estado1;
	}

	public void setEstado1(String estado1) {
		this.estado1 = estado1;
	}

	public String getMotivo1() {
		return motivo1;
	}

	public void setMotivo1(String motivo1) {
		this.motivo1 = motivo1;
	}

	public String getEstado2() {
		return estado2;
	}

	public void setEstado2(String estado2) {
		this.estado2 = estado2;
	}

	public String getMotivo2() {
		return motivo2;
	}

	public void setMotivo2(String motivo2) {
		this.motivo2 = motivo2;
	}
}
