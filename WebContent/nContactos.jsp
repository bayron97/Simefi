<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
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
String modifTipo = (String) request.getAttribute("modifTipo");
String modif = "";
if (modifTipo != null && !modifTipo.isEmpty()) {
	modif = modifTipo;
}
String revision = (String) request.getAttribute("isRev");
String rev = "false";
if (revision != null && !revision.isEmpty()) {
	rev = revision;
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
										aria-expanded="false"> <i class="material-icons">email</i>
											<span class="counter bg-primary">1</span>
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
										aria-haspopup="true" aria-expanded="false"> <figure
												class="rounded avatar avatar-40 rounded-circle"> <img
												src="userIcon.png" alt="" /> </figure>
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
													style="z-index: 10; background-color: #ffffff;"> <img
													src="userIcon.png" alt="" /> </figure>
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
									aria-expanded="false">SECCIONES</button>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="#">DATOS GENERALES</a> <a
										class="dropdown-item" href="#">REPRESENTANTES LEGALES</a>
									<%
									if (modif.contentEquals("BENEFICIARIO")) {
									%>
									<a class="dropdown-item" href="#">COMITE TECNICO</a>
									<%
									} else {
									%>
									<a class="dropdown-item" href="#">ACCIONISTAS DIRECTOS</a> <a
										class="dropdown-item" href="#">ACCIONISTAS INDIRECTOS</a>
									<%
									}
									%>
									<a class="dropdown-item active" href="#">CONTACTOS</a> <a
										class="dropdown-item" href="#">HISTORICO</a>
								</div>
							</div>
							<ul class="nav nav-pills mr-auto d-none d-sm-flex">
								<li class="nav-item"><a class="nav-link" href="#">DATOS
										GENERALES</a></li>
								<li class="nav-item"><a class="nav-link" href="#">REPRESENTANTES
										LEGALES</a></li>
								<%
								if (modif.contentEquals("BENEFICIARIO")) {
								%>
								<li class="nav-item"><a class="nav-link" href="#">COMITE
										TECNICO</a></li>
								<%
								} else {
								%>
								<li class="nav-item"><a class="nav-link" href="#">ACCIONISTAS
										DIRECTOS</a></li>
								<li class="nav-item"><a class="nav-link" href="#">ACCIONISTAS
										INDIRECTOS</a></li>
								<%
								}
								%>
								<li class="nav-item"><a class="nav-link active" href="#">CONTACTOS</a>
								</li>
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
				<div class="container-fluid">
					<div class="row">
						<div class="container main-container">
							<div class="row align-items-center">
								<%
								if (modif.contentEquals("BENEFICIARIO")) {
								%>
								<div class="col-8 col-xs-8 col-md-8">
									<h2 class="mb-4 large-title">CONTACTOS</h2>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / BENEFICIARIOS</h5>
								</div>
								<%
								} else {
								%>
								<div class="col-8 col-xs-8 col-md-8">
									<h2 class="mb-4 large-title">CONTACTOS</h2>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / DISTRIBUIDOR / FABRICANTE</h5>
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
										<span class="font-weight-bold">REGISTRO: </span> <span
											class="mb-2 btn btn-outline-dark btn-rounded">${padre.toUpperCase()}</span>
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
									data-target="#newReg" data-toggle="modal"
									id="changeStateButton">
									<i class="material-icons md-18">spellcheck</i> MODIFICACION &
									ESTATUS
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
									<th class="none">CARGO</th>
									<th class="min-desktop">DEPARTAMENTO</th>
									<th class="min-desktop">TELEFONOS</th>
									<th class="min-desktop">TELEFONO FIJO</th>
									<th class="min-desktop">EXTENSION</th>
									<th class="min-desktop">CORREOS ELECTRONICOS</th>
									<th class="min-desktop">ESTADO</th>
									<th hidden class="min-desktop">id</th>
									<th class="none">OBSERVACIONES</th>
									
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
									String padre = (String) request.getAttribute("padre");
									String QueryString = "select * from dbo.contactos where padre = '" + padre + "'";
									rs = state.executeQuery(QueryString);
									while (rs.next()) {
										String st = rs.getString(2);
										if (rs.wasNull()) {
									st = " ";
										}
										String st2 = rs.getString(3);
										if (rs.wasNull()) {
									st2 = " ";
										}
										String st3 = rs.getString(4);
										if (rs.wasNull()) {
									st3 = " ";
										}
										String st3b = rs.getString(11);
										if (rs.wasNull()) {
									st3b = " ";
										}
										String st4 = rs.getString(5);
										if (rs.wasNull()) {
									st4 = " ";
										}
										String st5 = rs.getString(6);
										if (rs.wasNull()) {
									st5 = " ";
										}
										String st6 = rs.getString(7);
										if (rs.wasNull()) {
									st6 = " ";
										}
										String st6b = rs.getString(12);
										if (rs.wasNull()) {
									st6b = " ";
										}
										String st7 = rs.getString(8);
										if (rs.wasNull()) {
									st7 = " ";
										}
										String st8 = rs.getString(9);
										if (rs.wasNull()) {
									st8 = " ";
										}
								%>
								<tr>
								
									<td><%=i%></td>
									
									<td><%=rs.getString(1).toUpperCase()%></td>
									<td><%=st.toUpperCase()%></td>
									<td><%=st2.toUpperCase()%></td>
									<td><%=st3.toUpperCase()%>/<br><%=st3b.toUpperCase()%></td>
									<td><%=st4.toUpperCase()%></td>
									<td><%=st5.toUpperCase()%></td>
									<td><%=st6.toUpperCase()%>/<br><%=st6b.toUpperCase()%></td>
									
									<%
									if (st7 == null || st7.isEmpty() || st7.toUpperCase().contentEquals("INACTIVO")) {
									%>
									<td>
										<div class="btn-secondary btn btn-sm">INACTIVO</div>
									</td>
									<%
									} else {
									%>
									<td>
										<div class="btn-success btn btn-sm">ACTIVO</div>
									</td>
									<%
									}
									%>
									<td hidden><%=rs.getString(13).toUpperCase()%></td>
									<td><%=st8.toUpperCase()%></td>
									
								</tr>
								<%
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
	<form method="post" action="contactoServlet" class="main-font">
		<input autocomplete="off" type="hidden" value="${padre}" name="padre">
		<input autocomplete="off" type="hidden" value="${isRev}" name="isRev">
		<input autocomplete="off" type="hidden" value="${modifTipo}"
			name="modifTipo">
		<input autocomplete="off" type="hidden" value="${isConsultar}"
			name="isConsultar">
		<input autocomplete="off" type="hidden" value="${isModif}"
			name="isModif">
		<div class="wrap-fixed-float wrap-fixed-bottom-left">
			<button class="btn btn-primary btn-rounded shadow"
				id="regresarButton" name="submit" value="back">
				<i class="material-icons vm">arrow_back</i> REGRESAR
			</button>
		</div>
		<div class="wrap-fixed-float wrap-fixed-bottom-right">
			<%
			if (cons.contentEquals("true")) {
			%>
			<button class="btn btn-primary btn-rounded shadow" name="submit"
				id="submit" value="contactos">
				<span>FINALIZAR</span> <i class="material-icons vm">done_all</i>
			</button>
			<%
			} else if (rev.contentEquals("true")) {
			%>
			<button class="btn btn-primary btn-rounded shadow" id="submit"
				data-target="#aprovRegModal" data-toggle="modal"
				onclick="event.preventDefault();">
				<span>FINALIZAR</span> <i class="material-icons vm">done_all</i>
			</button>
			<%
			} else {
			%>
			<button class="btn btn-primary btn-rounded shadow" name="submit"
				id="submit" value="contactos">
				<span>GUARDAR & FINALIZAR</span> <i class="material-icons vm">done_all</i>
			</button>
			<%
			}
			%>
		</div>
	</form>

	<!-- Navigation Float Buttons section ends -->

	<!-- Modal Section starts-->

	<%
	if (!rev.contentEquals("true")) {
	%>
	<!--New Reg Modal-->
	<div class="modal fade main-font" id="newReg" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<!--Form Edit Reg starts-->
			<form id="editRegForm" method="post" action="contactoServlet">
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
							<h1 class="mb-0 text-white">REGISTRO & GESTION DE
								INFORMACION DE CONTACTOS</h1>
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
															<input type="hidden" id="oldName" name="oldName">
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>NOMBRE COMPLETO*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="nombre" name="nombre" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>CARGO*</label> <input autocomplete="off"
																			type="text" class="form-control" id="cargo"
																			name="cargo" placeholder="" required />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>DEPARTAMENTO*</label> <input autocomplete="off"
																			type="text" class="form-control" id="departamento"
																			name="departamento" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>TELEFONO 1*</label> <input autocomplete="off"
																			type="text" class="form-control" id="tMovil"
																			name="tMovil" placeholder="" required />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>TELEFONO 2</label> <input autocomplete="off"
																			type="text" class="form-control" id="tMovil2"
																			name="tMovil2" placeholder="" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>TELEFONO FIJO</label> <input autocomplete="off"
																			type="text" class="form-control" id="tFijo"
																			name="tFijo" placeholder="" />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>EXTENSION</label> <input autocomplete="off"
																			type="text" class="form-control" id="extension"
																			name="extension" placeholder="" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>CORREO ELECTRONICO 1*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="correo" name="correo" placeholder="" required />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>CORREO ELECTRONICO 2</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="correo2" name="correo2" placeholder="" />
																			<input
																			autocomplete="off" type="hidden" class="form-control"
																			id="id" name="id" placeholder="" />
																	</div>
																</div>
															</div>
														</div>
														<!--DATA Section ends-->

														<!--STATE Section-->
														<div id="stateSection"
															class="state-section-aditional-styles">
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<h5 class="mb-3 text-center" style="font-weight: bold;">
																		ESTADO</h5>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="checkActivo" name="activo" />
																		<label for="checkActivo">ACTIVO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="checkInactivo"
																			name="inactivo" /> <label for="checkInactivo">INACTIVO</label>
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>OBSERVACIONES</label> <input autocomplete="off"
																			type="text" class="form-control" id="obs" name="obs"
																			placeholder="" />
																	</div>
																</div>
															</div>
														</div>
														<!--STATE Section ends-->

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
					<input autocomplete="off" type="hidden" value="${padre}"
						name="padre"> <input autocomplete="off" type="hidden"
						value="${isRev}" name="isRev"> <input autocomplete="off"
						type="hidden" value="${modifTipo}" name="modifTipo"> <input
						autocomplete="off" type="hidden" value="${isModif}" name="isModif">
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
									<button id="submitButton" name="submit" type="submit"
										value="enviar"
										class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
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

	<%
	} else if (rev != null && cons.contentEquals("false")) {
	String es1 = "";
	String es2 = "";
	String motivo1 = "";
	String motivo2 = "";
	try {
		Connection con = null;
		Statement state = null;
		ResultSet rs = null;
		String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		con = DriverManager.getConnection(url, "admin", "system123");
		state = con.createStatement();
		String padre = (String) request.getAttribute("padre");
		String modifT = (String) request.getAttribute("modifTipo");
		String QueryString;
		if (modifT.contentEquals("BENEFICIARIO")) {
			QueryString = "select estado1, estado2, motivo1, motivo2 from dbo.distribuidor where denominacion = '" + padre
			+ "' and distribuidor = 'BENEFICIARIO'";
		} else {
			QueryString = "select estado1, estado2, motivo1, motivo2 from dbo.distribuidor where denominacion = '" + padre
			+ "'";
		}
		rs = state.executeQuery(QueryString);
		while (rs.next()) {
			es1 = rs.getString(1);
			es2 = rs.getString(2);
			motivo1 = rs.getString(3);
			motivo2 = rs.getString(4);
		}
		if (motivo1 == null || motivo1.isEmpty()) {
			motivo1 = "";
		}
		if (motivo2 == null || motivo2.isEmpty()) {
			motivo2 = "";
		}
	} catch (Exception e) {
		System.out.println(e);
	}
	%>
	<!--Aprov Reg Modal-->
	<div class="modal fade main-font" id="aprovRegModal" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered"
			role="document">
			<!--Form Edit Reg starts-->
			<form id="editRegForm" method="post" action="distribuidorServlet">
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
							<%
							if (modif.contentEquals("BENEFICIARIO")) {
							%>
							<h1 class="mb-5 text-white">REVISION Y APROBACION FINAL DE
								BENEFICIARIO</h1>
							<%
							} else {
							%>
							<h1 class="mb-5 text-white">REVISION Y APROBACION FINAL DE
								DISTRIBUIDOR/FABRICANTE</h1>
							<%
							}
							%>
						</div>

						<div class="row top-60">
							<div class="col-12 col-md-12">
								<div class="card border-0 shadow bg-white h-100">
									<div class="card-body text-center"
										style="background: url(./assets/img/BAC.png) no-repeat center center;">
										<div class="row">
											<div class="card-body">
												<div class="row justify-content-center">
													<div class="col-md-10 mx-auto">
														<!--DATA Section-->
														<div id="dataSection">
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>DENOMINACION SOCIAL*</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="overlayDs" name="overlayCod" value="${padre}"
																			placeholder="ERROR - SIN REGISTRO" required readOnly />
																	</div>
																</div>
															</div>
														</div>
														<!--DATA Section ends-->

														<!--STATE Section-->
														<div id="stateSection"
															class="state-section-aditional-styles">
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<h5 class="mb-3 text-center" style="font-weight: bold;">
																		ESTADO 1*</h5>
																</div>
															</div>
															<%
															if (es1.contentEquals("APROBADO")) {
															%>
															<div class="row">
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="activ1" name="act1" checked />
																		<label for="activ1">APROBADO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="pendienteAprobar"
																			name="pendienteAprobar" value="false" enabled /> <label
																			for="pendienteAprobar">PENDIENTE DE APROBADO</label>
																	</div>
																</div>
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="in1" name="in1" /> <label
																			for="in1">RECHAZADO</label>
																	</div>
																</div>
															</div>
															<%
															} else if (es1.contentEquals("RECHAZADO")) {
															%>
															<div class="row">
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="activ1" name="act1" /> <label
																			for="activ1">APROBADO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="pendienteAprobar"
																			name="pendienteAprobar" value="false" enabled /> <label
																			for="pendienteAprobar">PENDIENTE DE APROBADO</label>
																	</div>
																</div>
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="in1" name="in1" checked />
																		<label for="in1"> RECHAZADO</label>
																	</div>
																</div>
															</div>
															<%
															} else if (es1.contentEquals("PENDIENTE DE APROBAR")) {
															%>
															<div class="row">
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="activ1" name="act1" /> <label
																			for="activ1">APROBADO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="pendienteAprobar"
																			name="pendienteAprobar" checked value="false" enabled />
																		<label for="pendienteAprobar">PENDIENTE DE
																			APROBAR</label>
																	</div>
																</div>
																<div class="col-lg-3 col-md-3">
																	<div class="form-group">
																		<input type="checkbox" id="in1" name="in1" /> <label
																			for="in1">RECHAZADO</label>
																	</div>
																</div>
															</div>
															<%
															}
															%>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>MOTIVO DE RECHAZO</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="m1" name="mot1" placeholder=""
																			value="<%=motivo1%>" />
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<h5 class="mb-3 text-center" style="font-weight: bold;">
																		ESTADO 2*</h5>
																</div>
															</div>
															<%
															if (es2.contentEquals("ACTIVO")) {
															%>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="activ2" name="act2" checked />
																		<label for="activ2">ACTIVO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="in2" name="in2" /> <label
																			for="in2">INACTIVO</label>
																	</div>
																</div>
															</div>
															<%
															} else if (es2.contentEquals("INACTIVO")) {
															%>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="activ2" name="act2" /> <label
																			for="activ2">ACTIVO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="in2" name="in2" checked />
																		<label for="in2">INACTIVO</label>
																	</div>
																</div>
															</div>
															<%
															} else {
															%>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="activ2" name="act2" /> <label
																			for="activ2">ACTIVO</label>
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<input type="checkbox" id="in2" name="in2" /> <label
																			for="in2">INACTIVO</label>
																	</div>
																</div>
															</div>
															<%
															}
															%>
															<div class="row">
																<div class="col-lg-12 col-md-12">
																	<div class="form-group">
																		<label>MOTIVO DE INACTIVACION</label> <input
																			autocomplete="off" type="text" class="form-control"
																			id="m2" name="mot2" placeholder=""
																			value="<%=motivo2%>" />
																	</div>
																</div>
															</div>
														</div>
														<!--STATE Section ends-->

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
					<input autocomplete="off" type="hidden" value="${padre}"
						name="padre"> <input autocomplete="off" type="hidden"
						value="${isRev}" name="isRev"> <input autocomplete="off"
						type="hidden" value="${modifTipo}" name="modifTipo"> <input
						autocomplete="off" type="hidden" value="${isModif}" name="isModif">
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
									<button id="submitButton" name="submit" value="rev"
										type="submit"
										class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
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
	<%
	}
	%>

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
	<%if (rev.contentEquals("false") && cons.contentEquals("false")) {%>
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

		$(document)
				.ready(
						function() {

							setinputFilter(document.getElementById("tMovil"),
									function(value) {
										return /^\d*$/.test(value);
									});
							setinputFilter(document.getElementById("tMovil2"),
									function(value) {
										return /^\d*$/.test(value);
									});
							setinputFilter(document.getElementById("tFijo"),
									function(value) {
										return /^\d*$/.test(value);
									});

							/* data Table */
							$("#datatable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												columnDefs : [ {
													targets : 9,
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

		$("#datatable tr").click(
				function() {
					$(this).addClass("selected").siblings().removeClass(
							"selected");
					var value;
					value = $(this).find('td:eq(1)').text();
					$("#nombre").prop("value", value);
					$("#oldName").prop("value", value);
					value = $(this).find("td:eq(2)").text();
					$("#cargo").prop("value", value);
					value = $(this).find("td:eq(3)").text();
					$("#departamento").prop("value", value);
					value = $(this).find("td:eq(4)").text();
					$("#tMovil").prop("value", value.split('/')[0]);
					$("#tMovil2").prop("value", value.split('/')[1]);
					value = $(this).find("td:eq(5)").text();
					$("#tFijo").prop("value", value);
					value = $(this).find("td:eq(6)").text();
					$("#extension").prop("value", value);
					value = $(this).find("td:eq(7)").text();
					$("#correo").prop("value", value.split('/')[0]);
					$("#correo2").prop("value", value.split('/')[1]);
					value = $(this).find('td:eq(9)').text();
					$("#id").prop("value", value);
					value = $(this).find("td:eq(10)").text();
					$("#obs").prop("value", value);
					
					

					value = $(this).find("td:eq(8) div").text();
					if (value === "activo" || value === "Activo"
							|| value === "ACTIVO") {
						$("#checkActivo").prop("checked", true);
						$("#checkInactivo").prop("checked", false);
					} else if (value === "inactivo" || value === "Inactivo"
							|| value === "INACTIVO") {
						$("#checkActivo").prop("checked", false);
						$("#checkInactivo").prop("checked", true);
					} else {
						$("#checkActivo").prop("checked", false);
						$("#checkInactivo").prop("checked", false);
					}
				});

		$("#newRegButton")
				.on(
						"click",
						function() {
							$("#subtitleChange").text("NUEVO REGISTRO");
							$("#infoIcon").text("format_shapes");
							$("#instructionSubtitle").removeClass("hide");
							$("#editRegForm #dataSection div div div input")
									.prop("readonly", false);
							$("#editRegForm #dataSection div div div select")
									.prop("disabled", false);
							$("#editRegForm")[0].reset();
							$("#editRegForm #dataSection").removeClass("hide");
							$("#editRegForm #stateSection").addClass("hide");
							$("#editRegForm #errorSection").addClass("hide");
							$("#submitButton").prop("value", "enviar");
							$("#editRegForm #submitButtonsSection")
									.removeClass("hide");
						});

		$("#changeStateButton").on(
				"click",
				function() {
					var value = $("#nombre").val();
					$("#subtitleChange").text("MODIFICAR & CAMBIAR ESTADO");
					if (value === "") {
						$("#infoIcon").text("error");
						$("#editRegForm #errorSection").removeClass("hide");
						$("#instructionSubtitle").addClass("hide");
						$("#editRegForm #dataSection").addClass("hide");
						$("#editRegForm #stateSection").addClass("hide");
						$("#editRegForm #submitButtonsSection")
								.addClass("hide");
					} else {
						$("#infoIcon").text("format_shapes");
						$("#editRegForm #errorSection").addClass("hide");
						$("#instructionSubtitle").removeClass("hide");
						$("#editRegForm #dataSection div div div input").prop(
								"readonly", false);
						$("#editRegForm #dataSection div div div select").prop(
								"disabled", true);
						$("#editRegForm #dataSection").removeClass("hide");
						$("#editRegForm #stateSection").removeClass("hide");
						$("#submitButton").prop("value", "apr");
						$("#editRegForm #submitButtonsSection").removeClass(
								"hide");
					}
				});

		$("#submitButton").on(
				"click",
				function() {
					$("#editRegForm #dataSection div div div select").prop(
							"disabled", false);
				});

		$("#checkActivo").on("change", function() {
			$("#checkInactivo").prop("checked", false);
		});

		$("#checkInactivo").on("change", function() {
			$("#checkActivo").prop("checked", false);
		});
	<%} else {%>
		$(document)
				.ready(
						function() {
							/* data Table */
							$("#datatable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												columnDefs : [ {
													targets : 9,
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

		$("#datatable tr").click(function() {
			$(this).addClass("selected").siblings().removeClass("selected");
		});

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
