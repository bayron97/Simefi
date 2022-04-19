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

	<style>
		#reqTable th:nth-child(5){
			   width: 1000px;
			}
		#reqTable td:nth-child(5){
			   width: 1000px;
			}
	</style>
<!--Styles Area Ends-->
</head>

<body class="sidemenu-open header-fixed-top body-general-styles">
	<!-- Sidebar starts -->
    <jsp:include page="Menu.jsp" flush="true" />
    <!-- Sidebar ends -->
	  
	  <div
      class="modal fade"
      id="confirmationModalCenter"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>
              <div class="modal-body main-font" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>
              <div>
                <button
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	  
	  

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
												<h6 class="username" style="font-weight: bold">
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
													style="z-index: 10; background-color: #ffffff">
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
			<div class="container main-container main-font" id="main-container">
				<%
					String read = (String) session.getAttribute("read");
					String disable = (String) session.getAttribute("disable");
					String funcion = (String) session.getAttribute("funcion");
					String func = (String) session.getAttribute("funcion");
					String type = (String) session.getAttribute("type");
					int cod = (Integer) session.getAttribute("procesocompra");
					int ben = (Integer) session.getAttribute("beneficiario");
					int sc = (Integer) session.getAttribute("solicitudcompra");
					String pro = (String) session.getAttribute("nombreproveedor");
				%>
        <div class="row">
          <div class="col-8 col-xs-8 col-md-8">
            <h2 class="mb-4 large-title">
              RECEPCION DE PRODUCTOS
            </h2>
            <h5 class="font-weight-light main-font mb-4">
              ACUERDO GENERAL
            </h5>
          </div>
          <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-5">
	              <h4 class="text-white font-weight-light ml-2 mr-3">
	              <% if (func.toUpperCase().contentEquals("NUEVO") && func != null) {%>
	                <i class="material-icons vm">add_circle</i>
	              <% } else if (func.toUpperCase().contentEquals("MODIFICAR") && func != null) {%>
	                <i class="material-icons vm">edit</i>
	              <% } else if (func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
	                <i class="material-icons vm">chrome_reader_mode</i>
	              <% } else if (func.toUpperCase().contentEquals("REVISAR") && func != null) {%>
	                <i class="material-icons vm">done_all</i>
	              <% } else {%>
	                <i class="material-icons vm">error</i>
	              <% } %>
	                <%=func.toUpperCase()%>
	              </h4>
	            </span>
            </div>
        </div>
        
        
        <div class="col-md-12">
			<div id="dataSection">
			<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="pills-home-tab" data-toggle="pill" href="#recProduc"
					role="tab" aria-controls="pills-home" aria-selected="true">RECEPCION DE PRODUCTOS</a></li>
				
				</ul>
				<div class="tab-content" id="pillZ-tabContent">
				
				<div class="tab-pane fade show active" id="recProduc" role="tabpanel" aria-labelledby="pills-home-tab">
						
						<form id="newEditRegForm" action="recepcionProductosGeneralServlet" method="post">
					<div class="card border-0 shadow-sm mb-4 main-content-div">
						<div class="card-header border-0 bg-none">
							<div class="card-body">
								<!--DATA Section-->
								<div id="dataSectionEncabezado">
									<div class="row">
										<div class="col-lg-12 col-md-12">
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<div class="form-group">
														<input type="hidden" id="Id" name="Id" value="${Id}" /> <input
															type="hidden" id="nombreprocesocompra"
															name="procesocompracod" value="${procesocompracod}" /> <input
															type="hidden" id="myfileName" name="myfileName"
															value="${myfile}" /> 
															<input type="hidden" id="tempNoItem" value="" /> 
															<label>1. NO. PROCESO DE COMPRA</label>
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
															String QueryString = "SELECT * FROM procesoCompraGeneral where estado1='APROBADO'";
															if (func != null && !func.contentEquals("nuevo")) {
																QueryString = "SELECT * from dbo.procesoCompraGeneral where cod = " + cod;
															}
															rs = state.executeQuery(QueryString);
														%>
														<select autocomplete="off" class="form-control"
															id="procesocompra" name="procesocompra" required
															onchange="ShowSelected('procesocompra');" <%=disable%>>
															<option selected disabled value="">SELECCIONA
																UNA OPCION...</option>
															<%
																while (rs.next()) {
																if (!funcion.contentEquals("nuevo")) {
															%>
															<option selected value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
															<%
																} else {
															%>
															<option value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
															<%
																}
															i = i + 1;
															}
															%>
														</select>
														<%
															rs.close();
														state.close();
														con.close();
														} catch (Exception e) {
														System.out.println(e);
														}
														%>
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="form-group" style="text-align: left">
														<label>4. PROVEEDOR</label> <input type="hidden"
															id="nombreproveedor" name="nombreproveedor"
															value="${nombreproveedor}" />
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
															String QueryString = "SELECT * FROM distribuidor d WHERE estado1 ='APROBADO' AND estado2 ='ACTIVO'";
															if (func != null && !func.contentEquals("nuevo")) {
																QueryString = "SELECT * FROM distribuidor WHERE denominacion ='" + pro + "'";
															}
															rs = state.executeQuery(QueryString);
														%>
														<select 
                              autocomplete="off"
                              class="form-control"
															id="proveedor" 
                              name="proveedor" 
                              required
															onchange="ShowSelected('proveedor');"
                              <%=disable%>
                            >
															<option selected disabled value="">SELECCIONA UNA OPCION...</option>
															<%
																while (rs.next()) {
																  if (!funcion.contentEquals("nuevo")) {
															%>
															    <option selected value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
															<%
                                  } 
                                  else {
															%>
															    <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
															  <%}
                                  i = i + 1;
															  }
                              %>
														</select>
                            <%
                              rs.close();
														  state.close();
														  con.close();
                            %>
														<%} catch (Exception e) {System.out.println(e);}%>
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<div class="form-group" style="text-align: left">
                            <input type="hidden" id="nombrebeneficiario" name="nombrebeneficiario" value="${nombrebeneficiario}"/>
														<label>2. BENEFICIARIO</label>
														<select
					                    autocomplete="off"
					                    class="form-control"
					                    id="beneficiario"
					                    name="beneficiario"
					                    required
					                    onchange="ShowSelected('beneficiario');"
					                    <%=disable%>
					                  >
					                    <option value="" selected disabled>SELECCIONA UNA OPCION...</option>
					                  </select>
													</div>
												</div>
												<div class="col-lg-6 col-md-6">
													<div class="form-group" style="text-align: left">
														<label>5. NO. ORDEN DE COMPRA</label> 
                            <input
															autocomplete="off"
                              type="text"
                              class="form-control"
															id="ordencompra"
                              name="ordencompra"
															value="${ordencompra}"
                              required
                              <%=read%> 
                            />
													</div>
												</div>
											</div>
											<div class="row">
												<div class="col-lg-6 col-md-6">
													<div class="form-group">
														<label>3. SOLICITUD DE COMPRA</label> 
														<input type="hidden"
															id="nombresolicitudcompra" name="nombresolicitudcompra"
															value="${nombresolicitudcompra}" />
														<select
					                    autocomplete="off"
					                    class="form-control"
					                    id="solicitudcompra"
					                    name="solicitudcompra"
					                    required
					                    onchange="ShowSelected('solicitudcompra');"
				                      <%=disable%>
					                  >
					                    <option selected disabled value="">SELECCIONA UNA OPCION...</option>
					                  </select>
													</div>
												</div>
											</div>
											</div>
										</div>
									</div>
								<!--DATA Section ends-->
								
								<!--Table Section Starts-->
              <div class="card-body main-font" style="overflow-x: auto;">
	             
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width: 100px;"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">ID DETALLE</th>
                      <th class="min-tablet">NO. ITEM</th>
                      <th class="min-tablet">CODIGO ATC</th>
                      <th class="min-desktop">NOMBRE DEL PRODUCTO</th>
                      <th class="">DESCRIPCION</th>
                      <th class="min-tablet">UNIDAD DE PRESENTACION</th>
                      <th class="min-desktop">PROVEEDOR</th>
                      <th class="min-desktop">LABORATORIO FABRICANTE/PAIS DE ORIGEN</th>
                      <th class="min-tablet">OBSERVACIONES</th>
                      <th class="min-tablet">TIEMPO ENTREGA (DIAS CALENDARIO)</th>
                      <th class="min-desktop">CANTIDAD COMPRADO (UNIDADES)</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">VALOR TOTAL COMPRADO</th>
                      <th class="min-desktop">NUMERO DE ORDEN DE COMPRA</th>
                      <th class="min-desktop">FECHA SUSCRIPCION ORDEN COMPRA</th>
                      <th class="min-desktop">CANTIDAD ENTREGAR SEGUN PLAZOS ENTREGA</th>
                      <th class="min-desktop">FECHA LIMITE ENTREGA</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">FECHA DE SOLICITUD CITA</th>
                      <th class="min-desktop">FECHA DE RECEPCION</th>
                      <th class="min-desktop">LUGAR DE RECEPCION</th>
                      <th class="min-desktop">NO. DE FACTURA</th>
                      <th class="min-desktop">CANTIDAD ENTREGADA (UNIDADES)</th>
                      <th class="min-desktop">TOTAL ENTREGADO (L)</th>
                      <th class="min-desktop">DIAS DE ATRASO EN LA ENTREGA</th>
                      <th class="min-desktop">MULTA POR ENTREGA TARDIA (5% MENSUAL)</th>
                      <th class="min-desktop">VALOR NETO A PAGAR</th>
                      <th class="min-desktop">VIDA UTIL A ACEPTAR</th>
                      <th class="min-desktop">INFORME DE RESULTADOS DE ANALISIS DE CALIDAD</th>
                      <th class="min-desktop">NO. INFORME DE RESULTADOS DE ANALISIS DE CALIDAD</th>
                      <th class="min-desktop">NO. LOTE DE FABRICACION ANALIZADO</th>
                      <th class="min-desktop">NO. GARANTIA DE CALIDAD</th>
                      <th class="min-desktop">NO. ACTA DE RECEPCION</th>
                      <th class="min-desktop">ESTATUS DE PAGO</th>  
                      <th class="min-desktop">APROBACION DE COMITE</th>
                      <th class="min-desktop">ESTADO ENTREGA</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
								
								<hr	></hr>
								<div class="col-md-12">
									<div id="dataSection">
										<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
											<li class="nav-item"><a class="nav-link active"
												id="pills-home-tab" data-toggle="pill" href="#pills-home"
												role="tab" aria-controls="pills-home" aria-selected="true">PASO 1</a></li>
											<li class="nav-item"><a class="nav-link"
												id="pills-profile-tab" data-toggle="pill"
												href="#pills-profile" role="tab"
												aria-controls="pills-profile" aria-selected="false">PASO 2</a></li>
										</ul>
										<div class="tab-content" id="pills-tabContent">
											<div class="tab-pane fade show active" id="pills-home"
												role="tabpanel" aria-labelledby="pills-home-tab">
												<div class="row">
													<div class="col-lg-4 col-md-4">
														<div class="form-group">
															<div class="form-group">
																<label>NO.ITEM</label>
																<input type="number" readonly="readonly" id="noItem" name="noItem" class="form-control" required />
															</div>
														</div>
													</div>
													<div class="col-lg-4 col-md-4">
														<div class="form-group">
															<label>FECHA SOLICITUD DE CITA</label> 
															<input type="date" id="fechasolicitudcita" name="fechasolicitudcita" class="form-control" />
														</div>
													</div>
													<div class="col-lg-4 col-md-4">
														<div class="form-group">
															<label>FECHA DE RECEPCION</label> 
															<input type="date" id="fecharecepcion" name="fecharecepcion" class="form-control" />
														</div>
													</div>
												</div>
												<div class="row">													
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>LUGAR DE RECEPCION</label> 
															<input type="text" id="lugarrecepcion" name="lugarrecepcion" class="form-control" />
														</div>
													</div>
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>NO. FACTURA</label> 
															<input type="text"  id="nofactura" name="nofactura" class="form-control" />
														</div>
													</div>
												</div>
												
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>CANTIDAD ENTREGADA</label> 
															<input type="number" id="cantidadentregada" name="cantidadentregada" class="form-control" />
														</div>
													</div>
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>TOTAL ENTREGADO</label> 
															<input type="number" id="totalentregado" name="totalentregado" class="form-control" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-4 col-md-4">
														<div class="form-group">
															<label>DIAS DE ATRASO EN LA ENTREGA</label> 
															<input type="number" id="diasatraso" name="diasatraso" class="form-control" />
														</div>
													</div>
													<div class="col-lg-5 col-md-5">
														<div class="form-group">
															<label>MULTA POR ENTREGA TARDIA (5% MENSUAL)</label> 
															<input type="number" id="multaentrega" name="multaentrega" class="form-control" />
														</div>
													</div>
													<div class="col-lg-3 col-md-3">
														<div class="form-group">
															<label>VALOR NETO A PAGAR</label> 
															<input type="number" id="valorneto" name="valorneto" class="form-control" />
														</div>
													</div>
												</div>
											</div>
											<div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<div class="form-group">
																<label>VIDA UTIL A ACEPTAR</label>
																<input type="text" id="vidautil" name="vidautil" class="form-control" />
															</div>
														</div>
													</div>
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>NO. GARANTIA DE CALIDAD</label> 
															<input type="text" id="nogarantia" name="nogarantia" class="form-control" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<div class="form-group">
																<label>INFORME DE RESULTADO DE ANALISIS DE CALIDAD</label>
																<input type="text" id="informeanalisis" name="informeanalisis" class="form-control" />
															</div>
														</div>
													</div>
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<label>NO. ACTA RECEPCION</label> 
															<input type="text" id="noactarecepcion" name="noactarecepcion" class="form-control" />
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-lg-6 col-md-6">
														<div class="form-group">
															<div class="form-group">
																<label>NO. LOTE DE FABRICACION ANALIZADO</label>
																<input type="text" id="nolotefabricacion" name="nolotefabricacion" class="form-control" />
															</div>
														</div>
													</div>
												</div>
												<%
													if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {
												%>
												<div class="row float-right">
													<button 
                            							class="btn btn-sm btn-success ml-2"
														id="addRegButton"
                            							type="button"
                            							hidden
                            							data-toggle="modal"
                 										data-target="#confirmationModalCenter"
                          								>
														<i class="material-icons md-18">done</i> GUARDAR
													</button>
												</div>
												<%
													}
												%>
											</div>
										</div>
										<input type="button" id="ActualizarItem"  value="Actualizar Item" class="btn btn-sm btn-success ml-2">
										
										<input type="number" name="can" id="can" hidden >
										<input id="estadoenetrega" name="estadoenetrega" hidden type="checkbox" checked="checked" />										
									</div>
								</div>
							</div>							
						</div>
						
					</div>
					<%
						if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {
					%>
						<!-- <div
		          class="modal-footer border-0 pt-0"
		          style="background-color: #f1f1f1;"
		        >
		          Submit Float Button
		          <div class="wrap-fixed-float wrap-fixed-bottom-right">
		            <button 
                  id="submit"
		              style="display: none;"
		              type="submit"
		              name="submit"
		            ></button>
		            <button
		              id="submitExternalButton"
		              class="btn btn-primary btn-rounded shadow main-font"
		              type="button"
		              value="guardar"
		            >
		              <span>GUARDAR Y CONTINUAR</span>
                  <i class="material-icons vm">arrow_forward</i>
		            </button>
		          </div>
		        </div> -->
		        
		        <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="recepcionProductosGeneral.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-right">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="backwardApertura"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

  <!-- Navigation Float Buttons section ends -->
		        
					<% } %>
					 
				</form>
				
										
				</div>
				<div class="tab-pane fade" id="canProduct" role="tabpanel" aria-labelledby="pills-profile-tab">
								
								<div class="card-body main-font" style="overflow-x: auto;">
	             
                <table 
                  id="reqTableCancelados"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width: 100px;"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">ID DETALLE</th>
                      <th class="min-tablet">NO. ITEM</th>
                      <th class="min-tablet">CODIGO ATC</th>
                      <th class="min-desktop">NOMBRE DEL PRODUCTO</th>
                      <th class="">DESCRIPCION</th>
                      <th class="min-tablet">UNIDAD DE PRESENTACION</th>
                      <th class="min-desktop">PROVEEDOR</th>
                      <th class="min-desktop">LABORATORIO FABRICANTE/PAIS DE ORIGEN</th>
                      <th class="min-tablet">OBSERVACIONES</th>
                      <th class="min-tablet">TIEMPO ENTREGA (DIAS CALENDARIO)</th>
                      <th class="min-desktop">CANTIDAD COMPRADO (UNIDADES)</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">VALOR TOTAL COMPRADO</th>
                      <th class="min-desktop">NUMERO DE ORDEN DE COMPRA</th>
                      <th class="min-desktop">FECHA SUSCRIPCION ORDEN COMPRA</th>
                      <th class="min-desktop">CANTIDAD ENTREGAR SEGUN PLAZOS ENTREGA</th>
                      <th class="min-desktop">FECHA LIMITE ENTREGA</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">FECHA DE SOLICITUD CITA</th>
                      <th class="min-desktop">FECHA DE RECEPCION</th>
                      <th class="min-desktop">LUGAR DE RECEPCION</th>
                      <th class="min-desktop">NO. DE FACTURA</th>
                      <th class="min-desktop">CANTIDAD ENTREGADA (UNIDADES)</th>
                      <th class="min-desktop">TOTAL ENTREGADO (L)</th>
                      <th class="min-desktop">DIAS DE ATRASO EN LA ENTREGA</th>
                      <th class="min-desktop">MULTA POR ENTREGA TARDIA (5% MENSUAL)</th>
                      <th class="min-desktop">VALOR NETO A PAGAR</th>
                      <th class="min-desktop">VIDA UTIL A ACEPTAR</th>
                      <th class="min-desktop">INFORME DE RESULTADOS DE ANALISIS DE CALIDAD</th>
                      <th class="min-desktop">NO. INFORME DE RESULTADOS DE ANALISIS DE CALIDAD</th>
                      <th class="min-desktop">NO. LOTE DE FABRICACION ANALIZADO</th>
                      <th class="min-desktop">NO. GARANTIA DE CALIDAD</th>
                      <th class="min-desktop">NO. ACTA DE RECEPCION</th>
                      <th class="min-desktop">ESTATUS DE PAGO</th>  
                      <th class="min-desktop">APROBACION DE COMITE</th>
                      <th class="min-desktop">ESTADO ENTREGA</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
											
			</div>
		</div>
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

  

	<!-- Modal Section starts-->
	   <div
      class="modal fade"
      id="confirmationModalCenter"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>
              <div class="modal-body main-font" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>
              <div>
                <button
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

   <div
      class="modal fade"
      id="ModalEnvioData"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>
              <div class="modal-body main-font" id="confirMessage">
                -PROCESANDO ENTREGA-
              </div>
              <div>                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>



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
	  function getAbsolutePath() {
		  var loc = window.location;
		  var pathName = loc.pathname.substring(0, loc.pathname.lastIndexOf("/") + 1);
		  return loc.href.substring(0,loc.href.length - ((loc.pathname + loc.search + loc.hash).length - pathName.length));
	  }
	  function cleanFields(){
		  $("#noItem").val(0);
		  $("#fechasolicitudcita").val('');
		  $("#fecharecepcion").val('');
		  $("#lugarrecepcion").val('');
		  $("#nofactura").val('');
		  $("#cantidadentregada").val('');
		  $("#totalentregado").val('');
		  $("#diasatraso").val('');
		  $("#multaentrega").val('');
		  $("#valorneto").val('');
		  $("#vidautil").val('');
		  $("#informeanalisis").val('');
		  $("#noactarecepcion").val('');
		  $("#nogarantia").val('');
		  $("#nolotefabricacion").val('');
	  }
		$(document).ready(function() {
							var reqTable = $("#reqTable")
									.DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												pageLength : 10,
												columnDefs : [ {
													targets : 33,
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
							
							
							
							var reqTableCancelados = $("#reqTableCancelados")
							.DataTable(
									{
										responsive : true,
										searching : true,
										bLengthChange : true,
										pageLength : 10,
										columnDefs : [ {
											targets : 33,
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
							
	<% if (funcion != null && !funcion.contentEquals("nuevo")) {%>
		var ordencomprainput = $("#ordencompra");
							var ordencompravariable = "${ordencompra}";
							ordencomprainput
									.append('<option selected value="' + ordencompravariable + '">'
											+ ordencompravariable + '</option>');
							var beneficiarioinput = $("#beneficiario");
							var beneficiariovariable = "${beneficiario}";
							var beneficiariovalor = "${beneficiario}";
							beneficiarioinput
									.append('<option selected value="' + beneficiariovariable + '">'
											+ $("#nombrebeneficiario").val() + '</option>');
							var solicitudcomprainput = $("#solicitudcompra");
							var solicitudcompravariable = "${solicitudcompra}";
							solicitudcomprainput
									.append('<option selected value="' + solicitudcompravariable + '">'
											+ $("#nombresolicitudcompra").val()  + '</option>');
							reqTable.ajax.url(getAbsolutePath()+ "RecepcionProductosGeneral"+ "?submit=Consultar&id="+ $("#Id").val()).load();							
							
	<% } %>
	
			
			var Item = [];
	
			$("#reqTable tbody").on("click", "tr", function () {
				cleanFields()
		        $(this).addClass("selected").siblings().removeClass("selected");
		        var value;
		        value = $(this).find("td:eq(1)").text();
		        
		        $("#can").val($(this).find("td:eq(15)").text());
		        
		        if($(this).find("td:eq(35)").text() == 1){	        		        	
		        	document.getElementById("estadoenetrega").checked = true;
		        	$("#confirmationModalCenter").modal('show');				 				 
					 $("#confirMessage").text("ITEM YA ENTREGADO ...");               
		        	return false;
		        }else{
		        	document.getElementById("estadoenetrega").checked = false;
		        }
		        
		        		        
		        value = $(this).find("td:eq(0)").text();		        
		        $("#noItem").prop("value", value);
		        Item.push(value);//IdDetalle
		        value = $(this).find("td:eq(1)").text();
		        Item.push(value);//NoItem
		        value = $(this).find("td:eq(2)").text();
		        Item.push(value);//CodigoATC
		        value = $(this).find("td:eq(3)").text();
		        Item.push(value);//NombreProducto
		        value = $(this).find("td:eq(4)").text();
		        Item.push(value);//Descripcion
		        value = $(this).find("td:eq(5)").text();
		        Item.push(value);//UnidadPrecentacion
		        value = $(this).find("td:eq(6)").text();
		        Item.push(value);//Proveedor
		        value = $(this).find("td:eq(7)").text();
		        Item.push(value);//LaboratorioFabricante
		        value = $(this).find("td:eq(8)").text();
		        Item.push(value);//Obsercaiones
		        value = $(this).find("td:eq(9)").text();
		        Item.push(value);//TiempoEntregaDiasCalendario
		        value = $(this).find("td:eq(10)").text();
		        Item.push(value);//CantidadCampradoUnidades
		        value = $(this).find("td:eq(11)").text();
		        Item.push(value);//PrecioUnitario
		        value = $(this).find("td:eq(12)").text();
		        Item.push(value);//ValorTotalComprado
		        value = $(this).find("td:eq(13)").text();
		        Item.push(value);//NumeroOrdenCompra
		        value = $(this).find("td:eq(14)").text();
		        Item.push(value);//FechaSuscripcion
		        value = $(this).find("td:eq(15)").text();
		        Item.push(value);//CantidadEntregadaPlazos
		        value = $(this).find("td:eq(16)").text();
		        Item.push(value);//FechaLimiteEntrega
		        value = $(this).find("td:eq(17)").text();
		        Item.push(value);//Moneda
		        value = $(this).find("td:eq(18)").text();
		        Item.push(value);//FechaSolicitudCita	
		        $("#fechasolicitudcita").prop("value", value);
		        value = $(this).find("td:eq(19)").text();
		        Item.push(value);//FechaRecepcion
		        $("#fecharecepcion").prop("value", value);
		        value = $(this).find("td:eq(20)").text();
		        Item.push(value);//LugarRecepcion
		        $("#lugarrecepcion").prop("value", value);
		        value = $(this).find("td:eq(21)").text();
		        Item.push(value);//NoFactura
		        $("#nofactura").prop("value", value);
		        value = $(this).find("td:eq(22)").text();
		        Item.push(value);//CantidadEntregadaUnidades
		        $("#cantidadentregada").prop("value", value);
		        value = $(this).find("td:eq(23)").text();
		        Item.push(value);//TotalEntregado
		        $("#totalentregado").prop("value", value);
		        value = $(this).find("td:eq(24)").text();
		        Item.push(value);//DiasAtrasoEntrega
		        $("#diasatraso").prop("value", value);
		        value = $(this).find("td:eq(25)").text();
		        Item.push(value);//MultaEntregaTardia
		        $("#multaentrega").prop("value", value);
		        value = $(this).find("td:eq(26)").text();
		        Item.push(value);//ValorNetoPagar
		        $("#valorneto").prop("value", value);
		        value = $(this).find("td:eq(27)").text();
		        Item.push(value);//VidaUtil
		        $("#vidautil").prop("value", value);
		        value = $(this).find("td:eq(28)").text();
		        Item.push(value);//InfoResultadoAnalisisCalidad
		        $("#informeanalisis").prop("value", value);
		        value = $(this).find("td:eq(29)").text();
		        Item.push(value);//NoInfoResultadoAnalisisCalidad
		        $("#nolotefabricacion").prop("value", value);
		        value = $(this).find("td:eq(30)").text();
		        Item.push(value);//NoLoteFravircaionAnalizado
		        $("#nogarantia").prop("value", value);
		        value = $(this).find("td:eq(31)").text();
		        Item.push(value);//NoGarantiaCalidad
		        $("#noactarecepcion").prop("value", value);
		        value = $(this).find("td:eq(32)").text();
		        Item.push(value);//NoActaRecepcion
		        value = $(this).find("td:eq(33)").text();
		        Item.push(value);//EstatusPago
		        value = $(this).find("td:eq(34)").text();
		        Item.push(value);//AprobacionComite
		        value = $(this).find("td:eq(35)").text();
		        Item.push(value);//EstadoEntrega
		        const rowSelected = $(this);
		        
		       
		        $("#addRegButton").on("click", function (event) {
		          event.preventDefault();
		          debugger
		          console.log($("#noItem").val())
		          if ($("#noItem").val() === "" || $("#noItem").val() === "No hay datos disponibles en la tabla.") {
		            $("#confirMessage").text(
		              "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
		            );
		          } else {
		            var Datar=reqTable.rows('.selected').data()[0];
		            
		            reqTable.row('.selected').remove().draw();
		            
		            Datar[18]=$("#fechasolicitudcita").val();
		            Datar[19]=$("#fecharecepcion").val().toUpperCase();
		            Datar[20]=$("#lugarrecepcion").val().toUpperCase();
		            Datar[21]=$("#nofactura").val();
		            Datar[22]=$("#cantidadentregada").val().toUpperCase();
		            Datar[23]=$("#totalentregado").val().toUpperCase();
		            Datar[24]=$("#diasatraso").val();
		            Datar[25]=$("#multaentrega").val().toUpperCase();
		            Datar[26]=$("#valorneto").val().toUpperCase();
		            Datar[27]=$("#vidautil").val();
		            Datar[28]=$("#informeanalisis").val().toUpperCase();
		            Datar[30]=$("#nolotefabricacion").val().toUpperCase();
		            Datar[31]=$("#nogarantia").val().toUpperCase();
		            Datar[32]=$("#noactarecepcion").val().toUpperCase();
		            reqTable.row.add(Datar).draw().node();
		            
		            cleanFields();
		            $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
		            
		          }
		        });
		      });
			
			
			  $("#ActualizarItem").on("click", function (event) {
		      	event.preventDefault();
		      	if ($("#noItem").val() === "" || $("#noItem").val() == 0 || $("#noItem").val() === "No hay datos disponibles en la tabla.") {				 
					 
					 $("#confirmationModalCenter").modal('show');				 				 
					 $("#confirMessage").text("SELECCIONE UN ITEM VALIDO...");
		               return false;
		              }
			      	
			      	if(parseInt($("#can").val()) < parseInt($("#cantidadentregada").val())){	                	
			      		$("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("EL VALOR A ENTREGAR NO PUEDE SER MAYOR A LA CANTIDAD DEL PLAZO ...");
	                	return false;
	                }
			      	
			      	if(parseInt($("#cantidadentregada").val()) == 0 || parseInt($("#cantidadentregada").val()) == null || parseInt($("#cantidadentregada").val())== "" ){	                	
			      		$("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("INGRESE UNA CANTIDAD VALIDA ...");
	                	return false;
	                }
		      	else {	            	  
	               
	                Item[18]=$("#fechasolicitudcita").val();
	                Item[19]=$("#fecharecepcion").val();
	                Item[20]=$("#lugarrecepcion").val().toUpperCase();
	                Item[21]=$("#nofactura").val();
	                Item[22]=$("#cantidadentregada").val();
	                Item[23]=$("#totalentregado").val();
		            Item[24]=$("#diasatraso").val();
		            Item[25]=$("#multaentrega").val();
		            Item[26]=$("#valorneto").val();
		            Item[27]=$("#vidautil").val();
		            Item[28]=$("#informeanalisis").val().toUpperCase();
		            Item[30]=$("#nolotefabricacion").val();
		            Item[31]=$("#nogarantia").val();
		            Item[32]=$("#noactarecepcion").val();
		            
	               var CantidadRestante = parseInt(Item[15]) - $("#cantidadentregada").val();
		         
	                 
		           var url = getAbsolutePath() + "ContratacionesNewItemValidateGeneral";		          
		           var Id = document.getElementById("Id").value;		
		           
		           //$('#ModalEnvioData').modal({backdrop: 'static', keyboard: false})
		           //$("#ModalEnvioData").modal('show');	
		          		           
		           $.ajax({
		        	    url:url,
		        	    type:"POST",
		        	    dataType:'json',
		        	    data: {json:Item, Id:Id},
		        	    success:function(data){
		        	    	reqTable.ajax.url(getAbsolutePath() + "RecepcionProductosGeneral"+ "?submit=Consultar&id="+ $("#Id").val()).load();	        	    
		        	    	cleanFields()
		             	 $("#ModalEnvioData").modal('hide');
		             	 $("#confirmationModalCenter").modal('show');				 				 
							 $("#confirMessage").text("ITEM  AGREGADO EXITISAMENTE...");
							 Item = [];
		        	    },
		        	});
		                            
	              }	      		 		      			
		    });
	 	 
			 
			  $("#CancelarItem").on("click", function (event) {
			      	event.preventDefault();
			      	if ($("#noItem").val() === "" || $("#noItem").val() == 0 || $("#noItem").val() === "No hay datos disponibles en la tabla.") {				 
						 
						 $("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("SELECCIONE UN ITEM VALIDO...");
			               return false;
			              }				      	
			      	else {	            	  
		               
			           $('#ModalEnvioData').modal({backdrop: 'static', keyboard: false})
			           $("#ModalEnvioData").modal('show');	
			          	
			           var CantidadRestante = parseInt(Item[15]) - $("#cantidadentregada").val();				         
			           var url = getAbsolutePath() + "ContratacionesCancelar";		          
			           var Id = document.getElementById("Id").value;	
			           var IdDetalle = $("#noItem").val();
			           
			           $.ajax({
			        	    url:url,
			        	    type:"POST",
			        	    dataType:'json',
			        	    data: {IdDetalle:IdDetalle},
			        	    success:function(data){
			        	    	reqTable.ajax.url(getAbsolutePath() + "RecepcionProductosGeneral"+ "?submit=Consultar&id="+ $("#Id").val()).load();	        	    
			        	    	cleanFields()
			             	 $("#ModalEnvioData").modal('hide');
			             	 $("#confirmationModalCenter").modal('show');				 				 
								 $("#confirMessage").text("ITEM  CANCELADO EXITISAMENTE...");
								
			        	    },
			        	});
			                            
		              }	      		 		      			
			    }); 
			  
			  
			 $('#submitExternalButton').click(function (event){
				 event.preventDefault();
				  if ($("#noItem").val() === "" || $("#noItem").val() === "No hay datos disponibles en la tabla.") {				 
					 
					 $("#confirmationModalCenter").modal('show');				 				 
					 $("#confirMessage").text("SELECCIONE UN ITEM ...");
		               return false;
		              }
			      	
			      	if(parseInt($("#can").val()) < parseInt($("#cantidadentregada").val())){	                	
			      		$("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("EL VALOR A ENTREGAR NO PUEDE SER MAYOR A LA CANTIDAD DEL PLAZO ...");
	                	return false;
	                }
			      	
			      	if(parseInt($("#cantidadentregada").val()) == 0 || parseInt($("#cantidadentregada").val()) == null || parseInt($("#cantidadentregada").val())== "" ){	                	
			      		$("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("INGRESE UNA CANTIDAD VALIDA ...");
	                	return false;
	                }
			      	
			      	
			      	else {	            	  
		                var Datar=reqTable.rows('.selected').data()[0];
		                
		                reqTable.row('.selected').remove().draw( false );
		                //reqTable.row(rowSelected).remove().draw();
		                var total=0;
		                var data = reqTable.rows().data();
		                data.each(function (value, index) {
		                	console.log(value,index);
		                	 console.log(value[index]);
		                	 console.log($("#noItem").val());

		                	if(value[0]==$("#noItem").val()){
		                		total+=parseFloat(value[4]);
		                	}
		                });	    
		                            	                
		                	Datar[18]=$("#fechasolicitudcita").val();
				            Datar[19]=$("#fecharecepcion").val();
				            Datar[20]=$("#lugarrecepcion").val().toUpperCase();
				            Datar[21]=$("#nofactura").val();
				            Datar[22]=$("#cantidadentregada").val();
				            Datar[23]=$("#totalentregado").val();
				            Datar[24]=$("#diasatraso").val();
				            Datar[25]=$("#multaentrega").val();
				            Datar[26]=$("#valorneto").val();
				            Datar[27]=$("#vidautil").val();
				            Datar[28]=$("#informeanalisis").val().toUpperCase();
				            Datar[30]=$("#nolotefabricacion").val();
				            Datar[31]=$("#nogarantia").val();
				            Datar[32]=$("#noactarecepcion").val();
				            //Datar[35]=1;
				            reqTable.row.add(Datar).draw().node();	                 
		              }	      		 		      			
				  
				 var container = document.getElementById("newEditRegForm");
	   		    if(reqTable.data()){
	   		    	for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
	   		    		
	               	    var cell = reqTable.row(r).data();	               	    
	               	    
	               	 var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","idDetalleinput");
				      	inputBC.setAttribute("value",cell[0]);
				      	container.appendChild(inputBC);

	   		         	var inputPT = document.createElement("input");
	   			        inputPT.setAttribute("type", "hidden");
	   			        inputPT.setAttribute("name", "noIteminput");
	   			        inputPT.setAttribute("value", cell[1]);
	   			        container.appendChild(inputPT);
	   			        
	   			     var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","codigoatc");
				      	inputBC.setAttribute("value",cell[2]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","nombreProducto");
				      	inputBC.setAttribute("value",cell[3]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","unidadprecentacio");
				      	inputBC.setAttribute("value",cell[5]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","proveedor");
				      	inputBC.setAttribute("value",cell[6]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","laboratoriofabricante");
				      	inputBC.setAttribute("value",cell[7]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","tiempoEntrega");
				      	inputBC.setAttribute("value",cell[9]);
				      	container.appendChild(inputBC);
	   			        
	   			        var inputPT = document.createElement("input");
	   			        inputPT.setAttribute("type", "hidden");
	   			        inputPT.setAttribute("name", "cantidadentregarinput");
	   			        inputPT.setAttribute("value", cell[15]);
	   			        container.appendChild(inputPT);
	   			        
	   			        var inputBF = document.createElement("input");
	   			        inputBF.setAttribute("type", "hidden");
	   			        inputBF.setAttribute("name","fechasolicitudcitainput");
	   			      	inputBF.setAttribute("value",cell[18]);
	   			      	container.appendChild(inputBF);
	   			     var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","fecharecepcioninput");
				      	inputBC.setAttribute("value",cell[19]);
				      	container.appendChild(inputBC);
				      	
				        var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","lugarrecepcioninput");
				      	inputBC.setAttribute("value",cell[20]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","nofacturainput");
				      	inputBC.setAttribute("value",cell[21]);
				      	container.appendChild(inputBC);
				      	
				        var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","cantidadentregadainput");
				      	inputBC.setAttribute("value",cell[22]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","totalentregadoinput");
				      	inputBC.setAttribute("value",cell[23]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","diasatrasoinput");
				      	inputBC.setAttribute("value",cell[24]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","multaentregainput");
				      	inputBC.setAttribute("value",cell[25]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","valornetoinput");
				      	inputBC.setAttribute("value",cell[26]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","vidautilinput");
				      	inputBC.setAttribute("value",cell[27]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","informeanalisisinput");
				      	inputBC.setAttribute("value",cell[28]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","nolotefabricacioninput");
				      	inputBC.setAttribute("value",cell[30]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","nogarantiainput");
				      	inputBC.setAttribute("value",cell[31]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","noactarecepcioninput");
				      	inputBC.setAttribute("value",cell[32]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","estadocompra");
				      	inputBC.setAttribute("value",cell[35]);
				      	container.appendChild(inputBC);
				      	
				      	
				      	
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","fechaLimiteEntrega");
				      	inputBC.setAttribute("value",cell[16]);
				      	container.appendChild(inputBC);
				      	
				      	
				      	
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","nordencompra");
				      	inputBC.setAttribute("value",cell[13]);
				      	container.appendChild(inputBC);
				      	
				      	var inputBC = document.createElement("input");
				        inputBC.setAttribute("type", "hidden");
				        inputBC.setAttribute("name","fechasuscripcion");
				      	inputBC.setAttribute("value",cell[14]);
				      	container.appendChild(inputBC);
			    	}
			    }
	   		    
			    document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
	   	  document.getElementById("submit").click();
			})
			
		})
		
		
		
		$('#pills-profile-tab').on('click', function(e) {
			e.preventDefault()
			//var btn_1 = document.getElementById('reportepago');
			//btn_1.style.display = 'inline';
		})
		$('#pills-home-tab').on('click', function(e) {
			e.preventDefault()
			//var btn_1 = document.getElementById('reportepago');
			//btn_1.style.display = 'none';
		})
		$('#pills-contact-tab').on('click', function(e) {
			e.preventDefault()
			//var btn_1 = document.getElementById('reportepago');
			//btn_1.style.display = 'none';
		})
		$(document).on('change', 'input[type=file]', function(e) {
			if (e.target.files[0]) {
				// Obtenemos la ruta temporal mediante el evento
				var TmpPath = URL.createObjectURL(e.target.files[0]);
				// Mostramos la ruta temporal en el Iframe dedicado
				$("#previewDocumentInput").prop("src", TmpPath);
				$("#previewDocumentInput").removeClass("hide");
			} else {
				$("#previewDocumentInput").prop("src", "");
				$("#previewDocumentInput").addClass("hide");
			}
		});

		function ShowSelected() {
			/* Para obtener el valor */
			var cod = document.getElementById("procesocompra").value;
			/* Para obtener el texto */
			var combo = document.getElementById("procesocompra");
			var selected = combo.options[combo.selectedIndex].text;
			$("#procesocompracod").val(selected);
		}

		function CalculoTotal() {
			var totalpagado = $("#totalPagado").val();
			var multa = $("#multa").val();
			var total = 0;
			if (totalpagado != "") {
				total = total + parseInt(totalpagado);
			}
			if (multa != "") {
				total = total - parseInt(multa);
			}
			$("#PagoTotal").val(total);

		}

		$("#procesocompra")
				.change(
						function() {

							// Guardamos el select de solicitudcomprainput
							var ordencomprainput = $("#ordencompra");
							var combo = document
									.getElementById("procesocompra");
							var selected = combo.options[combo.selectedIndex].text;
							$("#proveedor").val("");
							$("#cuentabancaria").val("");
							$("#banco").val("");

							// Guardamos el select de procesocomprainput
							var procesocomprainput = $(this);

							if ($(this).val() != '') {
								var url = getAbsolutePath()
										+ "contratoSuministros"
										+ "?submit=Consultar&noProcesoCompra="
										+ selected;
								console.log(url);
								$
										.ajax({
											//data: { id : procesocomprainput.val() },
											url : url,
											type : 'GET',
											beforeSend : function() {
												procesocomprainput.prop(
														'disabled', true);
											},
											success : function(r) {
												var m = r.split(",");
												procesocomprainput.prop(
														'disabled', false);
												ordencomprainput.prop(
														'disabled', false);
												// Limpiamos el select
												ordencomprainput.find('option')
														.remove();
												ordencomprainput
														.append('<option selected disabled value="">SELECCIONE UNA OPCION...</option>');

												$(m)
														.each(
																function(i, v) { // indice, valor
																	console
																			.log(m[i])
																	if (m[i] != '') {
																		ordencomprainput
																				.append('<option value="' + m[i] + '">'
																						+ m[i]
																						+ '</option>');
																	}
																})

												ordencomprainput.prop(
														'disabled', false);
											},
											error : function() {
												alert('Ocurrio un error en el servidor ..');
												procesocomprainput.prop(
														'disabled', false);
											}
										});
							} else {
								solicitudcomprainput.find('option').remove();
								solicitudcomprainput.prop('disabled', true);
							}
						})

		$("#ordencompra").change(
				function() {

					// Guardamos el select de solicitudcomprainput
					var proveedorinput = $("#proveedor");
					var cuentabancariainput = $("#cuentabancaria");
					var bancoinput = $("#banco");

					// Guardamos el select de procesocomprainput
					var procesocomprainput = $(this);

					if ($(this).val() != ''
							&& $(this).val() != 'SELECCIONE UNA OPCION...') {
						var url = getAbsolutePath() + "controlPagos"
								+ "?submit=Consultar&ordencompra="
								+ $("#ordencompra").val();
						console.log(url);
						$.ajax({
							url : url,
							type : 'GET',
							beforeSend : function() {
								procesocomprainput.prop('disabled', true);
							},
							success : function(r) {
								var m = r.split(",");
								procesocomprainput.prop('disabled', false);
								// Limpiamos 
								proveedorinput.val("");
								cuentabancariainput.val("");
								bancoinput.val("");

								$(m).each(function(i, v) { // indice, valor
									console.log(m[i])
									proveedorinput.val(m[0]);
									if (m[1] == "null") {
										cuentabancariainput.val("CHEQUE");
									} else {
										cuentabancariainput.val(m[1]);
									}
									if (m[2] == "null") {
										bancoinput.val("NA");
									} else {
										bancoinput.val(m[2]);
									}

								})

							},
							error : function() {
								alert('Ocurrio un error en el servidor ..');
								procesocomprainput.prop('disabled', false);
							}
						});
					}
				})
	</script>
	<!-- Java Script section ends -->
</body>
</html>
