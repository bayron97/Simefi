<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
String revisar = (String) request.getAttribute("isRev");
String rev = " ";
String cons = " ";
String modif = (String) request.getAttribute("modifObs");
String modifObs = "";
String desc = (String) request.getAttribute("modifDesc");
String modifDesc = "";
String modifGrupoText = (String)request.getAttribute("modifGrupo");
String modifGrupT = "";
String consultar = (String) request.getAttribute("isConsultar");
if (revisar != null && !revisar.isEmpty()) {
	rev = revisar;
}
if (consultar != null && !consultar.isEmpty()) {
	cons = consultar;
}
if (modif != null && !modif.isEmpty()) {
	modifObs = modif;
}
if (desc != null && !desc.isEmpty()) {
	modifDesc = desc;
}
if(modifGrupoText != null && !modifGrupoText.isEmpty()){
	modifGrupT = modifGrupoText;
}
String modifU = (String) request.getAttribute("modifUp");
String modifUp = "";
if (modifU != null && !modifU.isEmpty()) {
	modifUp = modifU;
}
%>
<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML ends --%>

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
<meta charset="utf-8" />
<title>Banco de Occidente - Plataforma de Fidecomisos</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Plataforma de Fidecomisos de Banco de Occidente"
	name="description" />
<meta content="Authcode" name="author" />
<link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

<!--Styles Area Starts-->
<!--External fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap"
	rel="stylesheet" />

<!-- Material icons -->
<link href="./assets/vendor/Material-icons/material-icons.css"
	rel="stylesheet" />

<!-- DataTables picker -->
<link
	href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css"
	rel="stylesheet" />
<link
	href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css"
	rel="stylesheet" />

<!-- General styles -->
<link href="./assets/css/general.css" rel="stylesheet" />

<!-- NavBar Styles -->
<link href="./assets/css/next-navbar.css" rel="stylesheet" />

<!-- Bootstrap4 Theme-->
<link href="./assets/css/bootstrap4-style-orange-light.css"
	rel="stylesheet" id="stylelink" />

<!-- Customized template style mandatory starts-->

<!-- Customized template style mandatory ends-->

<!--Styles Area Ends-->
</head>

<body class="sidemenu-open header-fixed-top body-general-styles">
	<!-- Sidebar starts -->
	<jsp:include page="Menu.jsp" flush="true" />
	<!-- Sidebar ends -->

	<!-- wrapper starts -->
	<div class="wrapper">
		<div class="content shadow-sm main-content-div">
			<div class="container-fluid header-container">
				<div class="row header">
					<div class="container-fluid" id="header-container">
						<div class="row">
							<!-- Header starts -->
							<nav class="navbar col-12 navbar-expand main-font">
							<button class="menu-btn btn btn-link btn-sm" type="button">
								<i class="material-icons">menu</i>
							</button>
							<div class="collapse navbar-collapse" id="navbarSupportedContent">
								<!-- icons dropwdowns starts -->
								<ul class="navbar-nav ml-auto">
									<!-- Message dropdown-->
									<li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" id="navbarDropdown5"
										role="button" data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false"> <i
											class="material-icons">email</i> <span
											class="counter bg-primary">1</span>
									</a>
										<div
											class="dropdown-menu dropdown-menu-sm-left dropdown-menu-center no-defaults pt-0 overflow-hidden"
											aria-labelledby="navbarDropdown5">
											<div class="position-relative text-center rounded">
												<div class="background">
													<img src="./assets/img/BAC_LOGIN.png" alt="" />
												</div>
												<div class="py-3 text-white">
													<h5 class="font-weight-normal">MENSAJES</h5>
													<p>ACTUALIZACIONES Y ESTADOS</p>
												</div>
											</div>
											<div class="scroll-y h-320 d-block">
												<a class="dropdown-item border-top" href="#">
													<div class="row">
														<div class="col-auto align-self-center">
															<i class="material-icons text-template-primary">mail</i>
														</div>
														<div class="col pl-0">
															<div class="row mb-1">
																<div class="col">
																	<p class="mb-0">BIENVENIDO</p>
																</div>
																<div class="col-auto pl-0">
																	<p class="small text-mute text-trucated mt-1">
																		2/12/2019</p>
																</div>
															</div>
															<p class="small text-mute">BIENVENIDO A LA PLATAFORMA
																DE FIDECOMISOS DE BANCO DE OCCIDENTE.</p>
														</div>
													</div>
												</a>
											</div>
										</div></li>

									<!-- Profile dropdown-->
									<li class="nav-item dropdown ml-0 ml-sm-4"><a
										class="nav-link dropdown-toggle profile-link" href="#"
										id="navbarDropdown6" role="button" data-toggle="dropdown"
										aria-haspopup="true" aria-expanded="false">
											<figure class="rounded avatar avatar-40 rounded-circle">
											<img src="userIcon.png" alt="" /> </figure>
											<div class="username-text ml-2 mr-2 d-none d-lg-inline-block">
												<h6 class="username" style="font-weight: bold;">
													<span>BIENVENIDO:</span>${sessionScope.usuario}
												</h6>
											</div> <figure
												class="rounded avatar avatar-30 d-none d-md-inline-block">
											<i class="material-icons">expand_more</i> </figure>
									</a>
										<div
											class="dropdown-menu dropdown-menu-right w-300 pt-0 overflow-hidden"
											aria-labelledby="navbarDropdown6">
											<div class="position-relative text-center rounded py-5">
												<div class="background">
													<img src="./assets/img/BAC_LOGIN.png" alt="" />
												</div>
											</div>
											<div class="text-center mb-3 top-60 z-2">
												<figure
													class="avatar avatar-120 mx-auto shadow rounded-circle"
													style="z-index: 10; background-color: #ffffff;">
												<img src="userIcon.png" alt="" /> </figure>
											</div>
											<h5 class="text-center mb-0">${sessionScope.usuario}</h5>
											<p class="text-center">USUARIO</p>
											<p class="text-center text-secondary fs13">HONDURAS</p>
											<a class="dropdown-item border-top" href="#">
												<div class="row">
													<div class="col-auto align-self-center">
														<i class="material-icons text-success">account_box</i>
													</div>
													<div class="col pl-0">
														<p class="mb-0">MI PERFIL</p>
														<p class="small text-mute text-trucated">ACTUALIZAR
															DATOS DEL USUARIO</p>
													</div>
													<div class="col-auto align-self-center text-right pl-0">
														<i class="material-icons text-mute small">chevron_right</i>
													</div>
												</div>
											</a>
											<form action="logout" method="post">
												<button class="dropdown-item border-top" type="submit">
													<div class="row">
														<div class="col-auto align-self-center">
															<i class="material-icons text-danger">exit_to_app</i>
														</div>
														<div class="col pl-0">
															<p class="mb-0 text-danger">CERRAR SESION</p>
														</div>
														<div class="col-auto align-self-center text-right pl-0">
															<i class="material-icons text-mute small text-danger">chevron_right</i>
														</div>
													</div>
												</button>
											</form>
										</div></li>
								</ul>
								<!-- icons dropwdowns ends -->
							</div>
							</nav>
							<!-- Header ends -->
						</div>
					</div>
				</div>
				<div class="row submenu">
					<div class="container-fluid" id="submenu-container">
						<div class="row">
							<!-- Submenu section starts -->
							<nav class="navbar col-12 main-font">
							<div class="dropdown mr-auto d-flex d-sm-none">
								<button class="btn dropdown-toggle btn-sm btn-primary"
									type="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">SECCIONES
								</button>
								<div class="dropdown-menu">
									<a type="button" class="dropdown-item active" href="#">MEDICAMENTOS</a>
									<a type="button" class="dropdown-item" href="#">FICHA
										TECNICA (DIGITAL)</a> <a type="button" class="dropdown-item"
										href="#">HISTORICO</a>
								</div>
							</div>
							<ul class="nav nav-pills mr-auto d-none d-sm-flex">
								<li class="nav-item"><a class="nav-link active" href="#">MEDICAMENTOS</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">FICHA
										TECNICA (DIGITAL)</a></li>
								<li class="nav-item"><a class="nav-link" href="#">HISTORICO</a>
								</li>
							</ul>
							</nav>
							<!-- Submenu section ends -->
						</div>
					</div>
				</div>
			</div>

			<!-- Main container starts -->
			<div class="container main-container" id="main-container">
				<div class="row">
					<div class="col-8 col-xs-8 col-md-8">
						<h2 class="mt-1 mb-4 large-title">MEDICAMENTOS</h2>
						<h5 class="font-weight-light main-font mb-4">MEDICAMENTOS Y
							OTROS / MEDICAMENTOS</h5>
					</div>
					<div class="col-4 col-xs-4 col-md-4 text-right">
						<span class="badge badge-primary mb-1">
							<h6 class="text-white font-weight-bold ml-2 mr-3">
								<%
								if (request.getAttribute("titulo") == "MODIFICAR") {
								%>
								<i class="material-icons vm">edit</i>
								<%
								} else if (cons.contentEquals("true")) {
								%>
								<i class="material-icons vm">chrome_reader_mode</i>
								<%
								} else if (rev.contentEquals("true")) {
								%>
								<i class="material-icons vm">done_all</i>
								<%
								} else {
								%>
								<i class="material-icons vm">add_circle</i>
								<%
								}
								%>
								<%=request.getAttribute("titulo")%>
							</h6>
						</span>
					</div>
				</div>
				<!--Content starts-->
				<div class="main-content-div main-font">
					<form id="newEditRegForm" action="medicamentoServlet" method="post">
						<input type="hidden" name="isModif" value="${isModif}">
						<input type="hidden" name="modifId" value="${modifId}">
						<input type="hidden" name="accion" value="${titulo}">
						<div class="row">
							<%
							if (rev.contentEquals("true") || cons.contentEquals("true")) {
							%>
							<!-- First Column starts-->
							<div class="col-lg-7 col-md-7">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<h5 id="instructionSubtitle"
											class="mb-3 text-center float-left"
											style="font-weight: bold;">I)
											DATOS GENERALES (* ES OBLIGATORIO)</h5>
									</div>
								</div>
								<div class="row" hidden>
									<div class="col-lg-4 col-md-4">
										<label>CODIGO DE SISTEMA*</label>
									</div>
									<div class="col-lg-8 col-md-8">
										<input autocomplete="off" type="text"
											class="form-control mb-2" id="codSist" name="codSist"
											value="${modifId}" required readonly />
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>CODIGO ATC*</label> <input autocomplete="off"
												type="text" class="form-control" id="codAtc" name="codAtc"
												value="${modifAtc}" required disabled />
										</div>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>CODIGO SESAL*</label> <input autocomplete="off"
												type="text" class="form-control" id="codSesal"
												name="codSesal" value="${modifSesal}" required disabled />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>GRUPO TERAPEUTICO*</label> 
											<textarea autocomplete="off" type="text" class="form-control" 
											id="grupo" name="grupo" disabled rows="4" cols="50">${modifGrupo}</textarea>
										</div>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>SUB GRUPO TERAPEUTICO*</label>
											<textarea autocomplete="off" type="text" class="form-control" 
											id="grupo" name="grupo" disabled rows="4" cols="50">${modifSubGrupo}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<label>NOMBRE GENERICO*</label> <input autocomplete="off"
												type="text" class="form-control" id="nombre" name="nombre"
												value="${modifNombre}" required disabled />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<label>UNIDAD DE PRESENTACION (UP)*</label> <select
												class="form-control" id="up" name="up" required disabled>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String QueryString = "SELECT * from dbo.up where estado = 'ACTIVO'";
													rs = state.executeQuery(QueryString);
												%>
												<%
												while (rs.next()) {
													if (modifUp.equalsIgnoreCase(rs.getString(1))) {
												%>
												<option value='<%=rs.getString(1)%>' selected><%=rs.getString(1).toUpperCase()%></option>
												<%
												} else {
												%>
												<option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
												<%
												}
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</select>
										</div>
									</div>
								</div>
								<div class="row mt-3 mb-4">
									<div class="col-lg-12 col-md-12">
										<label>DESCRIPCION TECNICA*</label>
										<textarea autocomplete="off" class="form-control"
											id="descripcion" name="descripcion"
											style="min-height: 250px;" readonly><%=modifDesc%></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<h5>LISTADO*</h5>
											<select class="form-control" id="listado" name="listado"
												required disabled>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													String idModif = (String) request.getAttribute("modifId");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String lnme = "";
													String QueryString = "SELECT listado from dbo.medicamentos where codSist = " + idModif;
													rs = state.executeQuery(QueryString);
												%>
												<%
												while (rs.next()) {
													lnme = rs.getString(1);
												}
												if (lnme == null || lnme.isEmpty()) {
													lnme = "no";
												}
												if (!lnme.contentEquals("Listado Nacional de Medicamentos Esenciales (LNME)")) {
												%>
												<option value="lnme">LISTADO NACIONAL DE
													MEDICAMENTOS ESENCIALES (LNME)</option>
												<option selected>LISTADO ADJUNTO</option>
												<%
												} else {
												%>
												<option value="lnme" selected>LISTADO NACIONAL DE
													MEDICAMENTOS ESENCIALES (LNME)</option>
												<option>LISTADO ADJUNTO</option>
												<%
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</select>
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-lg-12 col-md-12">
										<label>OBSERVACIONES*</label>
										<textarea autocomplete="off" class="form-control"
											id="observacion" name="observacion"
											style="min-height: 250px;" readonly><%=modifObs%></textarea>
									</div>
								</div>
							</div>
							<!-- First Column ends-->

							<%
							} else {
							%>

							<!-- First Column starts-->
							<div class="col-lg-7 col-md-7">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<h5 id="instructionSubtitle"
											class="mb-3 text-center float-left"
											style="font-weight: bold;">I)
											DATOS GENERALES (* ES OBLIGATORIO)</h5>
									</div>
								</div>
								<div class="row" hidden>
									<div class="col-lg-4 col-md-4">
										<label>CODIGO DE SISTEMA*</label>
									</div>
									<div class="col-lg-8 col-md-8">
										<input autocomplete="off" type="text"
											class="form-control mb-2" id="codSist" name="codSist"
											value="${modifId}" required readonly />
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>CODIGO ATC*</label> <input autocomplete="off"
												type="text" class="form-control" id="codAtc" name="codAtc"
												value="${modifAtc}" required />
										</div>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>CODIGO SESAL*</label> <input autocomplete="off"
												type="text" class="form-control" id="codSesal"
												name="codSesal" value="${modifSesal}" required />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>GRUPO TERAPEUTICO*</label> 
												
												<textarea autocomplete="off" type="text" class="form-control" 
											id="grupo" name="grupo"  rows="4" cols="50">${modifGrupo}</textarea>
										</div>
									</div>
									<div class="col-lg-6 col-md-6">
										<div class="form-group">
											<label>SUB GRUPO TERAPEUTICO*</label> 												
												<textarea autocomplete="off" type="text" class="form-control" 
												id="subGrupo" name="subGrupo"  rows="4" cols="50">${modifSubGrupo}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<label>NOMBRE GENERICO*</label> <input autocomplete="off"
												type="text" class="form-control" id="nombre" name="nombre"
												value="${modifNombre}" required />
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<label>UNIDAD DE PRESENTACION (UP)*</label> <select
												class="form-control" id="up" name="up" required>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String QueryString = "SELECT * from dbo.up where estado = 'ACTIVO'";
													rs = state.executeQuery(QueryString);
												%>
												<%
												while (rs.next()) {
													if (modifUp.equalsIgnoreCase(rs.getString(1))) {
												%>
												<option value='<%=rs.getString(1)%>' selected><%=rs.getString(1).toUpperCase()%></option>
												<%
												} else {
												%>
												<option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
												<%
												}
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</select>
										</div>
									</div>
								</div>
								<div class="row mt-3 mb-4">
									<div class="col-lg-12 col-md-12">
										<label>DESCRIPCION TECNICA*</label>
										<textarea autocomplete="off" class="form-control"
											id="descripcion" name="descripcion"
											placeholder="INGRESE UNA DESCRIPCION TECNICA..."
											style="min-height: 250px;"><%=modifDesc%></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<div class="form-group">
											<h5>LISTADO*</h5>
											<select class="form-control" id="listado" name="listado"
												required>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													String idModif = (String) request.getAttribute("modifId");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String lnme = "";
													String QueryString = "SELECT listado from dbo.medicamentos where codSist = " + idModif;
													rs = state.executeQuery(QueryString);
												%>
												<%
												while (rs.next()) {
													lnme = rs.getString(1);
												}
												if (lnme == null || lnme.isEmpty()) {
													lnme = "no";
												}
												if (!lnme.contentEquals("Listado Nacional de Medicamentos Esenciales (LNME)")) {
												%>
												<option value="lnme">LISTADO NACIONAL DE
													MEDICAMENTOS ESENCIALES (LNME)</option>
												<option selected>LISTADO ADJUNTO</option>
												<%
												} else {
												%>
												<option value="lnme" selected>LISTADO NACIONAL DE
													MEDICAMENTOS ESENCIALES (LNME)</option>
												<option>LISTADO ADJUNTO</option>
												<%
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</select>
										</div>
									</div>
								</div>
								<div class="row mb-5">
									<div class="col-lg-12 col-md-12">
										<label>OBSERVACIONES DEL PRODUCTO</label>
										<textarea autocomplete="off" class="form-control"
											id="observacion" name="observacion"
											style="min-height: 250px;"><%=modifObs%></textarea>
									</div>
								</div>
							</div>
							<!-- First Column ends-->
							<%
							}
							%>

							<!-- Second Column starts-->
							<div class="col-lg-5 col-md-5">
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<h5 class="float-left">NIVEL DE ATENCION</h5>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12 col-md-12">
										<h6 class="float-left">1ER NIVEL DE ATENCION*</h6>
										<table id="levelAttention1Table"
											class="table table-bordered w-100 mb-0 table-aditional-styles">
											<thead>
												<tr>
													<th class="all">NOMBRE</th>
													<th class="all">SELECCIONAR</th>
												</tr>
											</thead>
											<tbody>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String QueryString = "SELECT * from dbo.nivelAtencion where nivel = '1ER NIVEL DE ATENCION' and estado = 'ACTIVO'";
													rs = state.executeQuery(QueryString);

													String nivel = (String) request.getAttribute("modifNivel");
													String n = "";
													if (nivel != null && !nivel.isEmpty()) {
														n = nivel;
													}
													while (rs.next()) {
														if (n.toUpperCase().contains(rs.getString(5).toUpperCase())) {
													if (rev.contentEquals("true") || cons.contentEquals("true")) {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														checked disabled />
													</td>
												</tr>
												<%
												} else {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														checked /></td>
												</tr>
												<%
												}
												} else {
												if (rev.contentEquals("true") || cons.contentEquals("true")) {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														disabled /></td>
												</tr>
												<%
												} else {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>' />
													</td>
												</tr>
												<%
												}
												}
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row mt-3">
									<div class="col-lg-12 col-md-12">
										<h6 class="float-left">2DO NIVEL DE ATENCION*</h6>
										<table id="levelAttention2Table"
											class="table table-bordered w-100 mb-0 table-aditional-styles">
											<thead>
												<tr>
													<th class="all">NOMBRE</th>
													<th class="all">SELECCIONAR</th>
												</tr>
											</thead>
											<tbody>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String QueryString = "SELECT * from dbo.nivelAtencion where nivel = '2DO NIVEL DE ATENCION' and estado = 'ACTIVO'";
													rs = state.executeQuery(QueryString);

													String nivel = (String) request.getAttribute("modifNivel");
													String n = "";
													if (nivel != null && !nivel.isEmpty()) {
														n = nivel;
													}
													while (rs.next()) {
														if (n.toUpperCase().contains(rs.getString(5).toUpperCase())) {
													if (rev.contentEquals("true") || cons.contentEquals("true")) {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														disabled checked />
													</td>
												</tr>
												<%
												} else {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														checked /></td>
												</tr>
												<%
												}
												} else {
												if (rev.contentEquals("true") || cons.contentEquals("true")) {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>'
														disabled /></td>
												</tr>
												<%
												} else {
												%>
												<tr>
													<td><%=rs.getString(2).toUpperCase()%> (<%=rs.getString(5)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="atencion" name="atencion" value='<%=rs.getString(5)%>' />
													</td>
												</tr>
												<%
												}
												}
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
								<div class="row mt-5 mb-4">
									<div class="col-lg-12 col-md-12">
										<h5 class="float-left">VIA DE ADMINISTRACION*</h5>
										<table id="routeAdministrationTable"
											class="table table-bordered w-100 mb-0 table-aditional-styles">
											<thead>
												<tr>
													<th class="all">NOMBRE</th>
													<th class="all">SELECCIONAR</th>
												</tr>
											</thead>
											<tbody>
												<%
												try {
													Connection con = null;
													Statement state = null;
													ResultSet rs = null;
													String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
													Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
													con = DriverManager.getConnection(url, "admin", "system123");
													state = con.createStatement();
													String QueryString = "SELECT * from dbo.viaAdmin where estado = 'ACTIVO'";
													rs = state.executeQuery(QueryString);

													String vias = (String) request.getAttribute("modifVia");
													String v = "";
													if (vias != null && !vias.isEmpty()) {
														v = vias;
													}
													
													
													
													
													
													String[] parts = v.split("-");
													
													/* for (String string : parts) {
												        System.out.println("ARRAY "+string );
												    } */
													
													while (rs.next()) {
														
														boolean viatb = false;
														
														for (String viaA : parts) {
															if (rev.contentEquals("true") || cons.contentEquals("true")) {
													        if(viaA.equals(rs.getString(2))){
													    viatb = true;
													        	
													        	%>
												<tr>
													<td><%=rs.getString(1).toUpperCase()%> (<%=rs.getString(2)%>)</td>
													<td><input type="checkbox" class="form-control"
														id="viaAdmin" name="viaAdmin" value='<%=rs.getString(2)%>'
														disabled checked /></td>
												</tr>
												
												
												<%  }
												}else {
													 if(viaA.equals(rs.getString(2))){
														    viatb = true;
														        	
														        	%>
													<tr>
														<td><%=rs.getString(1).toUpperCase()%> (<%=rs.getString(2)%>)</td>
														<td><input type="checkbox" class="form-control"
															id="viaAdmin" name="viaAdmin" value='<%=rs.getString(2)%>'
															 checked /></td>
													</tr>
													
													
													<%  }
												} 
													        
													        }	
														if (rev.contentEquals("true") || cons.contentEquals("true")) {
															
														if(viatb == false)
											        	{
											        		
											        	%>
														<tr>
															<td><%=rs.getString(1).toUpperCase()%> (<%=rs.getString(2)%>)</td>
															<td><input type="checkbox" class="form-control"
																id="viaAdmin" name="viaAdmin" value='<%=rs.getString(2)%>'
																disabled />
															</td>
														</tr>
														
														<%
											        	}
														}else{
															
															if(viatb == false)
												        	{
												        		
												        	%>
															<tr>
																<td><%=rs.getString(1).toUpperCase()%> (<%=rs.getString(2)%>)</td>
																<td><input type="checkbox" class="form-control"
																	id="viaAdmin" name="viaAdmin" value='<%=rs.getString(2)%>'
																	 />
																</td>
															</tr>
															
															<%
												        	}
														}
														
														
												}
												rs.close();
												state.close();
												con.close();
												} catch (Exception e) {
												System.out.println(e);
												}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!-- Second Column ends-->
						</div>
						<!--Submit section starts-->
						<div class="wrap-fixed-float wrap-fixed-bottom-right">
							<%
							if (rev.contentEquals("true")) {
							%>
							<button id="submitButton"
								class="btn btn-primary btn-rounded shadow main-font"
								type="submit" name="submit" value="revisarFicha">
								<span>CONTINUAR </span> <i class="material-icons vm">done</i>
							</button>
							<%
							} else if (cons.contentEquals("true")) {
							%>
							<button id="submitButton"
								class="btn btn-primary btn-rounded shadow main-font"
								type="submit" name="submit" value="consultarFicha">
								<span>CONTINUAR </span> <i class="material-icons vm">done</i>
							</button>
							<%
							} else {
							%>
							<button id="submitButton"
								class="btn btn-primary btn-rounded shadow main-font"
								type="button">
								<span>GUARDAR & CONTINUAR </span> <i class="material-icons vm">done</i>
							</button>
							<input class="hide" type="submit" id="finalSubmit" name="submit" />
							<%
							}
							%>
						</div>
						<!--Submit section ends-->
					</form>
				</div>
				<!--Content ends-->
			</div>
			<!-- Main container ends -->
		</div>
		<footer class="footer main-font">
		<div class="container-fluid">
			<div class="row">
				<div
					class="col-12 col-md text-center text-md-left align-self-center">
					<p>
						TODOS LOS DERECHOS RESERVADOS POR <a href="">BANCOCCI</a>
					</p>
				</div>
				<div class="col-12 col-md-auto text-center text-md-right">
					<ul class="nav justify-content-center justify-md-content-end">
						<li class="nav-item"><a class="nav-link active"
							href="/term-use1">TERMINOS DE USO</a></li>
						<li class="nav-item"><a class="nav-link" href="/policy2">POLITICA
								DE PRIVACIDAD</a></li>
						<li class="nav-item"><a class="nav-link" href="/contactus3">CONTACTANOS</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		</footer>
	</div>
	<!-- wrapper ends -->

	<!-- Navigation Float Buttons section starts -->

	<!-- Cancel Float Button -->
	<form method="post" action="medicamentoServlet">
		<div class="wrap-fixed-float wrap-fixed-bottom-left">
			<button class="btn btn-primary btn-rounded shadow main-font"
				name="submit" value="cancelarN">
				<i class="material-icons vm">close</i> CANCELAR
			</button>
		</div>
	</form>

	<!-- Navigation Float Buttons section ends -->

	<!-- Modal Section starts-->
	<%
	if (!rev.contentEquals("true") && !cons.contentEquals("true")) {
	%>
	<!-- Confirmation Modal -->
	<div class="modal fade " id="confirmationModalCenter" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered "
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-50">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<figure class="avatar avatar-100 mx-auto mb-5"> <img
							src="./bancoccicon.png" alt=""></figure>
						<div class="modal-body main-font mt-2" id="confirMessage">
							-DESCRIPCION MOTIVO DE LA MODAL-</div>
						<div>
							<button class="btn btn-primary btn-block main-font"
								id="confirModalButton" data-dismiss="modal">
								ACEPTAR <i class="material-icons md-18">done</i>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>


	<!-- Java Script section starts -->

	<!-- JQuery -->
	<script src="./assets/js/jquery-3.5.1.js"></script>

	<!-- Utils -->
	<script src="./assets/js/utils.js"></script>

	<!-- Next-navbar -->
	<script src="./assets/js/next-navbar.js"></script>

	<!-- DataTables js -->
	<script
		src="./assets/vendor/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.responsive.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedColumns.min.js"></script>

	<!--Bootstrap Javascript-->
	<script src="./assets/js/bootstrap.min.js"></script>

	<!-- Customized page level js -->
	<script>
		"use strict";
		function getAbsolutePath() {
			var loc = window.location;
			var pathName = loc.pathname.substring(0, loc.pathname
					.lastIndexOf("/") + 1);
			return loc.href
					.substring(
							0,
							loc.href.length
									- ((loc.pathname + loc.search + loc.hash).length - pathName.length));
		}

		$(document)
				.ready(
						function() {
							/* data Table */
							$("#levelAttention1Table")
									.DataTable(
											{
												responsive : true,
												searching : false,
												bLengthChange : true,
												paging : false,
												iDisplayLength : -1,
												columnDefs : [ {
													targets : 1,
													orderable : false,
												}, ],
												language : {
													emptyTable : "No hay datos disponibles en la tabla.",
													info : "Del _START_ al _END_ de _TOTAL_ ",
													infoEmpty : "Mostrando 0 registros de un total de 0 ",
													infoFiltered : "(filtrados de un total de _MAX_ registros)",
													infoPostFix : "(Actualizados)",
													lengthMenu : "Mostrar: _MENU_",
													loadingRecords : "Cargando...",
													processing : "Procesando...",
													search : "",
													searchPlaceholder : "Buscar registro...",
													zeroRecords : "No se han encontrado coincidencias.",
													paginate : {
														first : "Primera",
														last : "Ultima",
														next : "Siguiente",
														previous : "Anterior",
													},
												},
												lengthMenu : [
														[ 10, 20, 25, 50, -1 ],
														[ 10, 20, 25, 50,
																"Todos" ], ],
												order : [ [ 0, "asc" ] ],
											});

							$("#levelAttention2Table")
									.DataTable(
											{
												responsive : true,
												searching : false,
												bLengthChange : true,
												paging : false,
												iDisplayLength : -1,
												columnDefs : [ {
													targets : 1,
													orderable : false,
												}, ],
												language : {
													emptyTable : "No hay datos disponibles en la tabla.",
													info : "Del _START_ al _END_ de _TOTAL_ ",
													infoEmpty : "Mostrando 0 registros de un total de 0 ",
													infoFiltered : "(filtrados de un total de _MAX_ registros)",
													infoPostFix : "(Actualizados)",
													lengthMenu : "Mostrar: _MENU_",
													loadingRecords : "Cargando...",
													processing : "Procesando...",
													search : "",
													searchPlaceholder : "Buscar registro...",
													zeroRecords : "No se han encontrado coincidencias.",
													paginate : {
														first : "Primera",
														last : "Ultima",
														next : "Siguiente",
														previous : "Anterior",
													},
												},
												lengthMenu : [
														[ 10, 20, 25, 50, -1 ],
														[ 10, 20, 25, 50,
																"Todos" ], ],
												order : [ [ 0, "asc" ] ],
											});

							$("#routeAdministrationTable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												paging : false,
												iDisplayLength : -1,
												columnDefs : [ {
													targets : 1,
													orderable : false,
												}, ],
												language : {
													emptyTable : "No hay datos disponibles en la tabla.",
													info : "Del _START_ al _END_ de _TOTAL_ ",
													infoEmpty : "Mostrando 0 registros de un total de 0 ",
													infoFiltered : "(filtrados de un total de _MAX_ registros)",
													infoPostFix : "(Actualizados)",
													lengthMenu : "Mostrar: _MENU_",
													loadingRecords : "Cargando...",
													processing : "Procesando...",
													search : "",
													searchPlaceholder : "Buscar registro...",
													zeroRecords : "No se han encontrado coincidencias.",
													paginate : {
														first : "Primera",
														last : "Ultima",
														next : "Siguiente",
														previous : "Anterior",
													},
												},
												lengthMenu : [
														[ 10, 20, 25, 50, -1 ],
														[ 10, 20, 25, 50,
																"Todos" ], ],
												order : [ [ 0, "asc" ] ],
											});
						});
	<%if (!rev.contentEquals("true") && !cons.contentEquals("true")) {%>
		$("#submitButton")
				.on(
						"click",
						function(event) {
							event.preventDefault();

							var url = getAbsolutePath() + "ValidarCodSESAL";
							var codSesal = document.getElementById("codSesal").value;
							var codSist = document.getElementById("codSist").value;
							$
									.ajax({
										url : url,
										type : "POST",
										dataType : 'json',
										data : {
											codSesal : codSesal,
											codSist : codSist
										},
										success : function(data) {

											if (data == "0") {
												var countNAChecked = 0;
												var countVAChecked = 0;
												var naChecks = $("[name=atencion]");
												var vaChecks = $("[name=viaAdmin]");
												for (var a = 0; a < naChecks.length; a++) {
													if ($(naChecks[a]).prop(
															"checked")) {
														countNAChecked++;
													}
												}

												for (var b = 0; b < vaChecks.length; b++) {
													if ($(vaChecks[b]).prop(
															"checked")) {
														countVAChecked++;
														
													}
												}

												if (countNAChecked === 0
														|| countVAChecked === 0) {
													$("#confirMessage")
															.text(
																	"ERROR! DEBE SELECCIONAR AL MENOS 1 NIVEL DE ATENCION Y 1 VIA DE ADMINISTRACION");
													$(
															"#confirmationModalCenter")
															.modal('show');
												} else {
													$("#finalSubmit").trigger(
															"click");
												}
											} else {
												$("#confirMessage")
														.text(
																"ALERTA! CODIGO DE SESAL YA ESTA REGISTRADO POR FAVOR INGRESE UNO NUEVO ");
												$("#confirmationModalCenter")
														.modal('show');
												return false;
											}

										},
									});

						});
	<%}%>
		
	<%if (rev.contentEquals("true")) {%>
		$("#activ1").on("change", function() {
			$("#in1").prop("checked", false);
			$("#pendienteAprobar").prop("checked", false);
		});

		$("#in1").on("change", function() {
			$("#activ1").prop("checked", false);
			$("#pendienteAprobar").prop("checked", false);
		});
		
		$("#pendienteAprobar").on("change", function() {
			$("#activ1").prop("checked", false);
			$("#in1").prop("checked", false);
		});

		//ESTADO 2
		$("#activ2").on("change", function() {
			$("#in2").prop("checked", false);
		});

		$("#in2").on("change", function() {
			$("#activ2").prop("checked", false);
		});
	<%}%>
		
	</script>
	<!-- Java Script section ends -->
</body>
</html>
