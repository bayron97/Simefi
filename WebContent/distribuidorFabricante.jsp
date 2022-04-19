<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

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
			</div>

			<!-- Main container starts -->
			<div class="container main-container" id="main-container">
				<div class="container-fluid">
					<div class="row">
						<div class="container main-container">
							<div class="row align-items-center">
								<div class="col-12 col-xs-12 col-md-12">
									<h2 class="mb-4 large-title">DISTRIBUIDOR / FABRICANTE</h2>
									<h5 class="font-weight-light main-font">ADMINISTRACION DE
										DATOS / DISTRIBUIDOR / FABRICANTE</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="card border-0 shadow-sm mb-4 main-content-div">
					<div class="card-header border-0 bg-none">
						<div class="row">
							<div class="col-12 col-md">
								<p class="fs15"></p>
							</div>
							<div class="col-auto align-self-center main-font">
								<%
								String tipo = (String) session.getAttribute("tipoAcceso");
								String servlet = (String) request.getAttribute("throughServlet");
								String acceso = "none";
								if ((tipo != null && !tipo.isEmpty()) && (servlet != null && !servlet.isEmpty())) {
									acceso = tipo;
								}
								boolean auth = true;
								if (!acceso.contentEquals("administrar") && !acceso.contentEquals("digitar") && !acceso.contentEquals("consultar") && !acceso.contentEquals("verificar") ) {
									auth = false;								
								}
								%>
								<form action="distribuidorServlet" method="post">
									<input autocomplete="off" type="hidden" id="modifId"
										name="modifId"> <input autocomplete="off"
										type="hidden" id="modifTipo" name="modifTipo"> <%
 if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) {
 %>
											<button class="btn btn-sm btn-success ml-2"
												id="historialUsuario" data-target="#confirmationModalCenter"
												data-toggle="modal" onclick="event.preventDefault();">
												<i class="material-icons md-18">add_circle</i> NUEVO
											</button> <%
 }
 %> <%
 if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) {
 %>
											<button class="btn btn-sm btn-success ml-2"
												id="confirmamodificacion" onclick="event.preventDefault();">
												<i class="material-icons md-18">edit</i> MODIFICAR
											</button>
											<button class="btn btn-sm btn-success ml-2"
												id="modificarBtnM" type="submit" name="submit"
												value="modify">
												<i class="material-icons md-18">edit</i> MODIFICAR
											</button> <%
 }
 %> <%
 if (acceso.contentEquals("administrar") || acceso.contentEquals("consultar")) {
 %>
											<button class="btn btn-sm btn-success ml-2" id="consultarBtn"
												name="submit" value="consultar">
												<i class="material-icons md-18">chrome_reader_mode</i>
												CONSULTAR
											</button> <%
 }
 %> <%
 if (acceso.contentEquals("administrar") || acceso.contentEquals("verificar")) {
 %>
									<button class="btn btn-sm btn-success ml-2" id="revAprobBtn"
										name="submit" value="revisar">
										<i class="material-icons md-18">done_all</i> REVISAR & APROBAR
									</button>
									<%
									}
									%>
								</form>



							</div>
						</div>
					</div>
					<div class="card-body main-font">
						<%
						if (auth == true) {
						%>
						<!--Table Section starts-->
						<table id="datatable"
							class="table table-bordered w-100 mb-0 table-aditional-styles">
							<thead>
								<tr>
									<th class="all">COD.</th>
									<th class="min-desktop">DENOMINACION SOCIAL</th>
									<th class="none">RTN</th>
									<th class="min-desktop">REPRESENTANTE LEGAL</th>
									<th class="min-desktop">CLASIFICACION</th>
									<th class="min-desktop">ESTADO 1</th>
									<th class="none">MOTIVO 1</th>
									<th class="min-desktop">ESTADO 2</th>
									<th class="none">MOTIVO 2</th>
								</tr>
							</thead>
							<tbody>
								<%
								try {
									Connection con = null;
									Statement state = null;
									int i = 1;
									ResultSet rs = null;
									ResultSet rd = null;
									String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									con = DriverManager.getConnection(url, "admin", "system123");
									state = con.createStatement();
									Statement state1 = con.createStatement();
									String QueryString = "SELECT * from dbo.distribuidor where distribuidor <> 'BENEFICIARIO';";
									rs = state.executeQuery(QueryString);
								%>
								<%
								while (rs.next()) {
									String query1 = "select nombre from dbo.representanteLegal where matricula = '" + rs.getString(1)
									+ "' and estado = 'Activo'";
									rd = state1.executeQuery(query1);
									String ob = "";
									while (rd.next()) {
										ob = rd.getString(1);
										if (rd.wasNull()) {
									ob = " ";
										}
									}
									String st = rs.getString(2);
									if (rs.wasNull()) {
										st = " ";
									}
									String st2 = rs.getString(3);
									if (rs.wasNull()) {
										st2 = " ";
									}
									String st3 = rs.getString(6);
									if (rs.wasNull()) {
										st3 = " ";
									}
									String st4 = rs.getString(7);
									if (rs.wasNull()) {
										st4 = " ";
									}
									String st5 = rs.getString(8);
									if (rs.wasNull()) {
										st5 = " ";
									}
									String st6 = rs.getString(9);
									if (rs.wasNull()) {
										st6 = " ";
									}
									String st7 = rs.getString(10);
									if (rs.wasNull()) {
										st7 = " ";
									}
								%>
								<tr>
									<td><%=i%></td>
									<td><%=rs.getString(1).toUpperCase()%></td>
									<td><%=st.toUpperCase()%></td>
									<td><%=ob.toUpperCase()%></td>
									<td><%=rs.getString(5).toUpperCase()%></td>
									<%
									if (st3.toUpperCase().contentEquals("RECHAZADO")) {
									%>
									<td>
										<div class="btn-danger btn btn-sm">RECHAZADO</div>
									</td>
									<%
									} else if (st3.toUpperCase().contentEquals("PENDIENTE DE APROBAR")) {
									%>
									<td>
										<div class="btn-warning btn btn-sm">PENDIENTE DE APROBAR</div>
									</td>
									<%
									} else if (st3.toUpperCase().contentEquals("APROBADO")) {
									%>
									<td>
										<div class="btn-success btn btn-sm">APROBADO</div>
									</td>
									<%
									} else {
									%>
									<td>
										<div class="btn-secondary btn btn-sm">-----</div>
									</td>
									<%
									}
									%>
									<td><%=st4.toUpperCase()%></td>
									<%
									if (st5.toUpperCase() == null || st5.isEmpty() || st5.toUpperCase().contentEquals("INACTIVO")) {
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
									<td><%=st6.toUpperCase()%></td>
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
						<%
						}
						%>
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

	<!--***No Buttons in this page***-->

	<!-- Navigation Float Buttons section ends -->

	<!-- Modal Section starts-->

	<%
	if (auth == true) {
	%>
	<!-- Type Select Modal -->
	<div class="modal fade" id="confirmationModalCenter" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered "
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-25">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<div class="row mb-2 justify-content-center">
							<figure class="avatar avatar-50"> <img
								src="./bancoccicon.png" alt=""></figure>
							<h2 class="mb-0 ml-2 text-white main-font">NUEVO</h2>
						</div>
						<div class="modal-body main-font" id="confirMessage">
							<!--DATA Section starts-->
							<div id="dataSection">
								<form action="distribuidorServlet" method="post">
									<input autocomplete="off" type="hidden" name="modifTipo"
										value="DISTRIBUIDOR">
										<div class="row">
											<button id="newDistButton" name="submit" value="nDistFab"
												class="btn btn-primary btn-block main-font">
												DISTRIBUIDOR</button>
										</div>
								</form>
								<div class="row">
									<button id="newFabButton"
										class="btn btn-primary btn-block main-font"
										onclick="window.location.href='nFabricante.jsp';">
										FABRICANTE</button>
								</div>
								<!-- <form action="distribuidorServlet" method="post">
									<input autocomplete="off" type="hidden" name="modifTipo"
										value="DISTRIBUIDOR/FABRICANTE">
										<div class="row">
											<button id="newDistFabButton" name="submit" value="nDistFab"
												class="btn btn-primary btn-block main-font">
												DISTRIBUIDOR/FABRICANTE</button>
										</div>
								</form> -->
							</div>
							<!--DATA Section ends-->
						</div>
						<div>
							<button class="btn btn-primary btn-block main-font"
								id="confirModalButton" data-dismiss="modal">
								<i class="material-icons md-18">arrow_back</i> ATRAS
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

	<!-- Modal Section ends-->
	<div class="modal fade" id="confirmationModify" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered "
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-25">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<div class="row mb-2 justify-content-center">
							<figure class="avatar avatar-50"> <img
								src="./bancoccicon.png" alt=""></figure>
							<h2 class="mb-0 ml-2 text-white main-font">NUEVO</h2>
						</div>
						<div class="modal-body main-font" id="confirMessage">
							<!--DATA Section starts-->
							<div id="dataSection">
								<h5 class="mb-4 large-title">¿ESTA SEGURO QUE DESEA
									MODIFICAR ESTE ITEM? SI ACEPTA MODIFICARA EL ESTADO
									AUTOMATICAMENTE</h5>
								<div class="row">
									<button id="newDistButtonM"
										class="btn btn-primary btn-block main-font">ACEPTAR Y
										CONTINUAR</button>
								</div>

								<div class="row"></div>

							</div>
							<!--DATA Section ends-->
						</div>
						<div>
							<button class="btn btn-primary btn-block main-font"
								id="confirModalButton" data-dismiss="modal">
								<i class="material-icons md-18"></i> CANCELAR
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal de vacio validador -->
	<!-- Confirmation Modal -->
	<div class="modal fade " id="alerta" tabindex="-1" role="dialog"
		aria-hidden="true">
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
						<div class="modal-body main-font mt-2" id="confirMessagealert">
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

		$(document)
				.ready(
						function() {
							<% if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) {%>
							document.getElementById('modificarBtnM').style.display = 'none';
							<% }%>								
							
							/* data Table */
							$("#datatable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												columnDefs : [ {
													targets : 7,
													orderable : false,
												}, ],
												language : {
													emptyTable : "No hay datos disponibles en la tabla.",
													info : "Del START al END de TOTAL ",
													infoEmpty : "Mostrando 0 registros de un total de 0 ",
													infoFiltered : "(filtrados de un total de MAX registros)",
													infoPostFix : "(Actualizados)",
													lengthMenu : "Mostrar: MENU",
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

		var estado1Value = "";
		$("#datatable tr").click(function() {
			$(this).addClass("selected").siblings().removeClass("selected");
			var value;
			value = $(this).find("td:eq(1)").text();
			$("#modifId").prop("value", value);
			value = $(this).find('td:eq(4)').text();
			$("#modifTipo").prop("value", value);
			value = $(this).find("td:eq(5) div").html();
			estado1Value = value;
		});

		$("#confirmamodificacion")
				.click(
						function() {

							var elemento = document.getElementById("modifId").value;

							if (elemento == null || elemento == "") {
								$("#confirMessagealert")
										.text(
												"ALERTA! POR FAVOR SELECCIONE UN DISTRIBUIDOR O FABRICANTE PARA EDITAR");
								$("#alerta").modal('show');
							} else {
								if (estado1Value == "APROBADO" || estado1Value == "RECHAZADO") {
									$('#confirmationModify').modal('show');
								} else {
									$('#modificarBtnM').click();
								}

							}

						});

		$("#revAprobBtn")
				.click(
						function() {

							var elemento = document.getElementById("modifId").value;

							if (elemento == null || elemento == "") {
								$("#confirMessagealert")
										.text(
												"ALERTA! POR FAVOR SELECCIONE UN DISTRIBUIDOR O FABRICANTE PARA EDITAR");
								$("#alerta").modal('show');
								return false;
							}
						});

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

		$("#newDistButtonM").click(
				function() {
					var url = getAbsolutePath()
							+ "EstadoBeneficiarioModificarAPI";
					var modifId = document.getElementById("modifId").value;
					$.ajax({
						url : url,
						type : "POST",
						dataType : 'json',
						data : {
							modifId : modifId
						},
						success : function(data) {
							if (parseInt(data) == 0) {
								$("#confirMessagealert").text(
										"ERROR! NO SE ACTUALIZO EL ESTADO ");
								$("#alerta").modal('show');
								return false;
							} else {
								//$("#modificarBtnM").trigger("click");  	    	 
								$('#modificarBtnM').click();
							}
						},
					});

				});
	</script>

	<!-- Java Script section ends -->
</body>
</html>