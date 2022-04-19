<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
String modifTipo = (String) request.getAttribute("modifTipo");
String modif = "";
if (modifTipo != null && !modifTipo.isEmpty()) {
	modif = modifTipo;
}
String isModif = (String) request.getAttribute("isModif");
String mod = "false";
if (isModif != null && !isModif.isEmpty()) {
	mod = isModif;
}
String isConsultar = (String) request.getAttribute("isConsultar");
String cons = "false";
if (isConsultar != null && !isConsultar.isEmpty()) {
	cons = isConsultar;
}
String revision = (String) request.getAttribute("isRev");
String rev = "false";
if (revision != null && !rev.isEmpty()) {
	rev = revision;
}
String directo = (String) request.getAttribute("directo");
String dir = "";
if (directo != null && !directo.isEmpty()) {
	dir = directo;
}
float porcentajeCant = 0.0f;
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
			</div>

			<!-- Main container starts -->
			<div class="container main-container" id="main-container">
				<div class="container-fluid">
					<div class="row">
						<div class="container main-container">
							<div class="row align-items-center">
								<%
								if (modif.contentEquals("BENEFICIARIO")) {
								%>
								<div class="col-8 col-xs-8 col-md-8">
									<h2 class="mb-4 large-title">LISTADO DE INTEGRANTES POR
										COMITE</h2>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / BENEFICIARIOS / COMITE TECNICO</h5>
								</div>
								<%
								} else {
								%>
								<div class="col-8 col-xs-8 col-md-8">
									<h2 class="mb-4 large-title">LISTADO DE ACCIONISTAS POR
										ESCRITURA</h2>
									<%
									if (dir.contentEquals("false")) {
									%>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / DISTRIBUIDOR / FABRICANTE / ACCIONISTAS INDIRECTOS</h5>
									<%
									} else {
									%>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / DISTRIBUIDOR / FABRICANTE / ACCIONISTAS DIRECTOS</h5>
									<%
									}
									%>
								</div>
								<%
								}
								%>
								<div class="col-4 col-xs-4 col-md-4 text-right">
									<span class="badge badge-primary mb-1">
										<h6 class="text-white font-weight-bold ml-2 mr-3">
											<%
											if (mod.contentEquals("true")) {
											%>
											<i class="material-icons vm">edit</i> MODIFICAR
											<%
											} else if (cons.contentEquals("true")) {
											%>
											<i class="material-icons vm">chrome_reader_mode</i> CONSULTAR
											<%
											} else if (rev.contentEquals("true")) {
											%>
											<i class="material-icons vm">done_all</i> REVISAR & APROBAR
											<%
											} else {
											%>
											<i class="material-icons vm">add_circle</i> NUEVO
											<%
											}
											%>
										</h6>
									</span>
									<h5 class="main-font">
										<%
										if (modif.contentEquals("BENEFICIARIO")) {
										%>
										<span class="font-weight-bold">COMITE: </span>
										<%
										} else {
										%>
										<span class="font-weight-bold">ESCRITURA: </span>
										<%
										}
										%>
										<span class="mb-2 btn btn-outline-dark btn-rounded">${nombreEscritura}</span>
									</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card border-0 shadow-sm mb-4 main-content-div">
					<%
					if (!rev.contentEquals("true")) {
					%>
					<div class="card-header border-0 bg-none">
						<div class="row">
							<div class="col-12 col-md">
								<p class="fs15"></p>
							</div>
							<div class="col-auto align-self-center main-font">

								<button class="btn btn-sm btn-success ml-2"
									data-target="#newReg" data-toggle="modal" id="newRegButton">
									<i class="material-icons md-18">add_circle</i> NUEVO
								</button>
								<button class="btn btn-sm btn-success ml-2"
									data-target="#newReg" data-toggle="modal" id="editRegButton">
									<i class="material-icons md-18">spellcheck</i> MODIFICAR
								</button>
							</div>
						</div>
					</div>
					<%
					}
					%>
					<div class="card-body main-font">
						<!--Table Section starts-->
						<table id="datatable"
							class="table table-bordered w-100 mb-0 table-aditional-styles">
							<thead>
								<tr>
									<th class="all">#</th>
									<th class="all">NOMBRE</th>
									<th class="min-desktop">NACIONALIDAD</th>
									<th class="none">TIPO DE IDENTIFICACION</th>
									<th class="min-desktop">NO. DE IDENTIFICACION</th>
									<th class="min-desktop">PAIS DE RESIDENCIA</th>
									<th class="min-desktop">TIPO DE ACCIONISTA</th>
									<th class="min-desktop">% DE PARTICIPACION</th>
									<th class="none">CANTIDAD DE ACCIONES</th>
									<th hidden>ID_DB</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
								
									Connection con = null;
									Statement state = null;
									int i = 1;
									ResultSet rs = null;
									String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									con = DriverManager.getConnection(url, "admin", "system123");
									state = con.createStatement();
									String escrituraPadre = (String) request.getAttribute("escrituraPadre");
									String QueryString = "SELECT * from dbo.accionista where padre = '" + escrituraPadre + "'";
									rs = state.executeQuery(QueryString);
								%>
								<%
								while (rs.next()) {
									String st = rs.getString(10);
									if (rs.wasNull()) {
										st = " ";
									}
									String st2 = rs.getString(11);
									if (rs.wasNull()) {
										st2 = " ";
									}
									String st3 = rs.getString(12);
									if (rs.wasNull()) {
										st3 = " ";
									}
									String ob = rs.getString(9);
									if (rs.wasNull()) {
										ob = " ";
									}
									
									
									porcentajeCant = porcentajeCant + rs.getFloat(4);
									System.out.println(porcentajeCant);
									System.out.println("------");
								%>
								<tr>
									<td><%=i%></td>
									<td><%=rs.getString(10).toUpperCase()%></td>
									<td><%=rs.getString(1).toUpperCase()%></td>
									<td><%=rs.getString(2).toUpperCase()%></td>
									<td><%=rs.getString(6).toUpperCase()%></td>
									<td><%=rs.getString(3).toUpperCase()%></td>
									<td><%=rs.getString(7).toUpperCase()%></td>
									<td name="porc"><%=rs.getFloat(4)%></td>
									<td><%=rs.getString(8)%></td>
									
									<td hidden><%=rs.getInt(18)%></td>
								</tr>
								<%
								System.out.println("acciones" + rs.getString(8));
								i = i + 1;
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
						<!--Table Section ends-->
					</div>
				</div>
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

	<!-- Navigation Float Buttons & Hidden Form for Wizard-->
	<form method="post" action="accionistaServlet" class="main-font">
		<input autocomplete="off" type="hidden" name="directo"
			value="${directo}">
		<input autocomplete="off" type="hidden" name="modifTipo"
			value="${modifTipo}">
		<input autocomplete="off" type="hidden" name="padre" id="padre"
			value="${padre}">
		<input autocomplete="off" type="hidden" name="isRev" value="${isRev}">
		<input autocomplete="off" type="hidden" name="isConsultar"
			value="${isConsultar}">
		<input autocomplete="off" type="hidden" name="isModif"
			value="${isModif}">
		<input autocomplete="off" type="hidden" value="${escrituraPadre}"
			name="escrituraPadre" id="escrituraPadre">
		<div class="wrap-fixed-float wrap-fixed-bottom-right">
			<button class="btn btn-primary btn-rounded shadow"
				id="regresarButton"  name="submit" value="back">
				<i class="material-icons vm">arrow_back</i> REGRESAR
			</button>		
			
		</div>
	</form>

	<!-- Navigation Float Buttons section ends -->

	<!-- Modal Section starts-->

	<!--New Reg Modal-->
	<div class="modal fade main-font" id="newReg" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<!--Form Edit Reg starts-->
			<form id="editRegForm" method="post" action="accionistaServlet">
				<div class="modal-content shadow-lg-dark overflow-hidden">
					<button type="button" class="closePersonalize" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true" class="">x</span>
					</button>
					<div class="modal-body" style="background-color: #f1f1f1;">
						<div class="background h-320">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<div class="text-center pb-5">
							<h1 class="mb-0 text-white">REGISTRO DE ACCIONISTAS POR
								ESCRITURA</h1>
							<h4 id="subtitleChange" class="mb-5 text-white font-weight-light">
								-ACCION DEL FORMULARIO-</h4>
						</div>

						<div class="row top-60">
							<div class="col-12 col-md-12">
								<div class="card border-0 shadow bg-white h-100">
									<div class="card-body text-center"
										style="background: url(./assets/img/BAC.png) no-repeat center center;">
										<i id="infoIcon"
											class="avatar avatar-60 md-36 material-icons text-template-primary">format_shapes</i>
										<h5 id="instructionSubtitle" class="mb-3 text-center">
											INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):</h5>
										<div class="row">
											<div class="card-body">
												<div class="row justify-content-center">
													<div class="col-md-10 mx-auto">
														<!--DATA Section-->
														<div id="dataSection">
															<input autocomplete="off" type="hidden" id="idaprov"
																name="idaprov" />
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																	<input type="hidden" value="0" name="idAccionistaEscritura" id="idAccionistaEscritura" >
																	<input type="hidden" value="${nombreEscritura}" name="nombreEscritura" id="nombreEscritura" >
																		<label>NOMBRE COMPLETO*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="nombre" name="nombre" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>NACIONALIDAD*</label> <input autocomplete="off"
																			type="text" class="form-control" id="nacionalidad"
																			name="nacionalidad" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>TIPO DE IDENTIFICACION*</label> <select
																			class="form-control" id="tipoId" name="tipoId"
																			required>
																			<option value="TARJETA DE IDENTIDAD" selected>TARJETA
																				DE IDENTIDAD</option>
																			<option value="RTN">RTN</option>
																			<option value="PASAPORTE">PASAPORTE</option>
																			<option value="CARNET DE RESIDENTE">CARNET
																				DE RESIDENTE</option>
																			<option value="CEDULA DE EXTRANJERIA">CEDULA
																				DE EXTRANJERIA</option>
																		</select>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>NO. DE IDENTIFICACION*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="noId" name="noId" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>PAIS DE RESIDENCIA*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="paisResidencia" name="paisResidencia"
																			placeholder="" required />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>TIPO DE ACCIONISTA*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="tipoAccionista" name="tipoAccionista"
																			placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>% DE PARTICIPACION*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="participacion" name="participacion"
																			placeholder="" required />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>CANTIDAD DE ACCIONES*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="cantidadAcciones" name="cantidadAcciones"
																			placeholder="" required />
																	</div>
																</div>
															</div>
														</div>
														<!--DATA Section ends-->

														<!--ERROR Section-->
														<div id="errorSection" class="hide">
															<div class="row">
																<div class="col-lg-12 col-md-12 text-center">
																	<h1>ERROR</h1>
																	<p class="text-mute">CIERRE LA MODAL Y SELECCIONE
																		EL REGISTRO A MODIFICAR EN LA TABLA</p>
																</div>
															</div>
														</div>
														<!--ERROR Section ends-->
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Hidden data for wizard section starts-->
					<input autocomplete="off" type="hidden" name="directo"
						value="${directo}"> <input autocomplete="off"
						type="hidden" name="isModif" value="${isModif}"> <input
						autocomplete="off" type="hidden" value="${padre}" name="padre"
						id="padre"> <input autocomplete="off" type="hidden"
						value="${escrituraPadre}" name="escrituraPadre"
						id="escrituraPadre"> <input autocomplete="off"
						type="hidden" value="${oldId}" name="oldId" id="oldId"> <input
						autocomplete="off" type="hidden" name="modifTipo"
						value="${modifTipo}"> <input autocomplete="off"
						type="hidden" name="isRev" value="${isRev}"> <input
						autocomplete="off" type="hidden" name="oldP" id="oldP"> <input
						autocomplete="off" type="hidden" name="isConsultar"
						value="${isConsultar}">
					<!--Hidden data for wizard section ends-->
					<div class="modal-footer border-0 pt-0"
						style="background-color: #f1f1f1;">
						<!--Submit Buttons Section-->
						<div id="submitButtonsSection" class="container">
							<div class="row w-100 mx-0">
								<div class="col-12 col-md-6 text-center">
									<button type="button" id="cancelButton" data-dismiss="modal"
										aria-label="Close"
										class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
										CANCELAR</button>
								</div>
								<div class="col-12 col-md-6 text-center">
									<button name="submit" hidden id="submitButton" type="submit"
										value="guardar"
										class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
										GUARDAR</button>
										
										<button name="validador" id="validador" type="button" 										
										class="mb-2  mr-2 btn btn-lg btn-success">
										GUARDAR</button>
								</div>
							</div>
						</div>
						<!--Submit Buttons Section ends-->
					</div>
				</div>
			</form>
			<!--Form Edit Reg ends-->
		</div>
	</div>
	<!--Custom New Modal-->

	<!-- Modal Section ends-->

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

		function setinputFilter(textbox, inputFilter) {
			[ "input", "keydown", "keyup", "mousedown", "mouseup", "select",
					"contextmenu", "drop" ].forEach(function(event) {
				textbox.addEventListener(event, function() {
					if (inputFilter(this.value)) {
						this.oldValue = this.value;
						this.oldSelectionStart = this.selectionStart;
						this.oldSelectionEnd = this.selectionEnd;
					} else if (this.hasOwnProperty("oldValue")) {
						this.value = this.oldValue;
						this.setSelectionRange(this.oldSelectionStart,
								this.oldSelectionEnd);
					} else {
						this.value = "";
					}
				});
			});
		}

		function checkguardar() {
			$("#submitButton").trigger("click")
			$("#subtitleChange").text("NUEVO REGISTRO");
			$("#infoIcon").text("format_shapes");
			$("#instructionSubtitle").removeClass("hide");
			$("#editRegForm")[0].reset();
			$("#editRegForm #dataSection").removeClass("hide");
			$("#editRegForm #submitButtonsSection").removeClass("hide");
			$("#editRegForm #errorSection").addClass("hide");			
			$("#submitButton").prop("value", "guardar");
		}

		$(document)
				.ready(
						function() {							
							//setinputFilter(document.getElementById("noId"), function(value){return /^\d*$/.test(value);});
							//setinputFilter(document.getElementById("participacion"), function(value){return /^\d*$/.test(value);});
							/* setinputFilter(document
									.getElementById("cantidadAcciones"),
									function(value) {
										return /^\d*$/.test(value);
									}); */

							/* data Table */
							$("#datatable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												columnDefs : [ {
													targets : 8,
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
														[ /* 10, 20, 25, 50, */ -1 ],
														[ /* 10, 20, 25, 50, */
																"Todos" ], ],
												order : [ [ 6, "asc" ] ],
											});
						});

		$("#datatable tr").click(function() {
			$(this).addClass("selected").siblings().removeClass("selected");
			var value;
			value = $(this).find('td:eq(1)').text();
			$("#nombre").prop("value", value);
			$("#oldId").prop("value", value);
			value = $(this).find('td:eq(2)').text();
			$("#nacionalidad").prop("value", value);
			value = $(this).find('td:eq(3)').text();
			$("#tipoId").prop("value", value);
			$("#idaprov").prop("value", value);
			value = $(this).find('td:eq(4)').text();
			$("#noId").prop("value", value);
			value = $(this).find('td:eq(5)').text();
			$("#paisResidencia").prop("value", value);
			value = $(this).find('td:eq(6)').text();
			$("#tipoAccionista").prop("value", value);
			value = $(this).find('td:eq(7)').text();
			$("#participacion").prop("value", value);
			$("#oldP").prop("value", value);
			value = $(this).find('td:eq(8)').text();
			$("#cantidadAcciones").prop("value", value);
			value = $(this).find('td:eq(9)').text();
			$("#idAccionistaEscritura").prop("value", value);			
			
		});

		$("#validador").on("click", function() {
			
			
			var values = document.getElementsByName("porc");
			
			var total = 0.0;
			for (var i = 0; i < values.length; i++) {
				total += parseFloat(values[i].innerHTML);
			}
			var oldPc = document.getElementById("oldP").value;
			if (oldPc) {
				total += parseFloat(document.getElementById("participacion").value) - oldPc;
				if (total > 100) {
					alert("El porcentaje de participacion total es mayor de 100! No se podra agregar este registro. Reporta un total de: "
							+ total);					
				}else{
					checkguardar()
				}
			} else {
				total += parseFloat(document.getElementById("participacion").value);
				if (total > 100) {
					alert("El porcentaje de participacion total es mayor de 100! No se podra agregar este registro");
				}else{
					checkguardar()
				}
			}
			
		});
		
		$("#regresarButton").on("click", function() {
			
			var porciento = <%=porcentajeCant%>;
			
			/* debugger;
			var values = document.getElementsByName("porc");
			var suma = 0.0;
			var total = 0.0;
			for (var i = 0; i < values.length; i++) {
				total = suma + parseFloat(values[i].innerHTML);
				console.log(total);
			} */
			
						
			if(porciento < 100){
				
				alert("Para poder regresar debe de cuadrar el total a 100%")
				return false;
			}else{
				
			}
		})
		
		$("#editRegButton")
				.on(
						"click",
						function() {
							var value = $("#nombre").val();
							if (value === "") {
								$("#subtitleChange").text("EDITAR REGISTRO");
								$("#infoIcon").text("error");
								$("#editRegForm #errorSection").removeClass(
										"hide");
								$("#instructionSubtitle").addClass("hide");
								$("#editRegForm #dataSection").addClass("hide");
								$("#editRegForm #submitButtonsSection")
										.addClass("hide");
							} else {
								$("#subtitleChange").text("EDITAR REGISTRO");
								$("#infoIcon").text("format_shapes");
								$("#instructionSubtitle")
										.text(
												"INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):");
								$("#instructionSubtitle").removeClass("hide");
								$("#editRegForm #dataSection").removeClass(
										"hide");
								$("#editRegForm #errorSection")
										.addClass("hide");
								$("#editRegForm #submitButtonsSection")
										.removeClass("hide");
								$("#submitButton").prop("value", "editar");
							}
						});

		$("#participacion").on("change", function() {
			/* checkVal(this); */
		});

		$('input[name=participacion]').bind(
				'keypress',
				function(event) {
					var regex = new RegExp("^[0-9.]+$");
					var key = String.fromCharCode(!event.charCode ? event.which
							: event.charCode);
					if (!regex.test(key)) {
						event.preventDefault();
						return false;
					}
				});

		$('input[name=noId]').bind(
				'keypress',
				function(event) {
					var regex = new RegExp("^[a-zA-Z0-9 ]+$");
					var key = String.fromCharCode(!event.charCode ? event.which
							: event.charCode);
					if (!regex.test(key)) {
						event.preventDefault();
						return false;
					}
				});
	</script>

	<!-- Java Script section ends -->
</body>
</html>
