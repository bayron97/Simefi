<%@page import="main.model.Gral_contratoOrdenCompra"%>
<%@page import="java.util.ArrayList"%>
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


<!-- <style>
		#reqTable th:nth-child(5){
			   width: 1000px;
			}
		#reqTable td:nth-child(5){
			   width: 1000px;
			}
	</style> -->
<!--Styles Area Ends-->
</head>

<body class="sidemenu-open header-fixed-top body-general-styles">
	<!-- Sidebar starts -->
	<jsp:include page="Header.jsp" flush="true" />
	<!-- Sidebar ends -->

	<!-- wrapper starts -->
	<div class="wrapper">
		<div class="content shadow-sm main-content-div">
			<!-- Main container starts -->
			<div class="container main-container main-font" id="main-container">
				<%
				String read = (String) session.getAttribute("read");
				String disable = (String) session.getAttribute("disable");
				String accion = (String) session.getAttribute("accion");
				%>
				<div class="row">
					<div class="col-8 col-xs-8 col-md-8">
						<h2 class="mb-4 large-title">RECEPCION DE PRODUCTOS</h2>
						<h5 class="font-weight-light main-font mb-4">ACUERDO GENERAL</h5>
					</div>
					<div class="col-4 col-xs-4 col-md-4 text-right">
						<span class="badge badge-primary mb-5">
							<h4 class="text-white font-weight-light ml-2 mr-3">
								<%
								if (accion.toUpperCase().contentEquals("NUEVO")) {
								%>
								<i class="material-icons vm">add_circle</i>
								<%
								} else if (accion.toUpperCase().contentEquals("MODIFICAR")) {
								%>
								<i class="material-icons vm">edit</i>
								<%
								} else if (accion.toUpperCase().contentEquals("CONSULTAR")) {
								%>
								<i class="material-icons vm">chrome_reader_mode</i>
								<%
								} else if (accion.toUpperCase().contentEquals("REVISAR")) {
								%>
								<i class="material-icons vm">done_all</i>
								<%
								} else {
								%>
								<i class="material-icons vm">error</i>
								<%
								}
								%>
								<%=accion.toUpperCase()%>
							</h4>
						</span>
					</div>
				</div>


				<div class="col-md-12">
					<div id="dataSection">
						<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="pills-home-tab" data-toggle="pill" href="#recProduc"
								role="tab" aria-controls="pills-home" aria-selected="true">RECEPCION
									DE PRODUCTOS</a></li>
							<li class="nav-item"><a class="nav-link"
								id="pills-profile-tab" data-toggle="pill" href="#canProduct"
								role="tab" aria-controls="pills-profile" aria-selected="false">PRODUCTOS
									CANCELADOS</a></li>
						</ul>
						<div class="tab-content" id="pillZ-tabContent">

							<div class="tab-pane fade show active" id="recProduc"
								role="tabpanel" aria-labelledby="pills-home-tab">

								<form id="controlEntregaForm" action="recepcionProductosServlet"
									method="post">
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
																	<input type="hidden" id="idcontratacionDetalle" name="idcontratacionDetalle"/>	
																	<input type="hidden" id="idContratacionVaciado" name="idContratacionVaciado"/>
																	<input type="hidden" id="fechaLimiteEntrega" name="fechaLimiteEntrega"/>
																	<input type="hidden" id="numeroEntrega" name="numeroEntrega"/>																
																		<label>1. NO. PROCESO DE COMPRA</label>
																	<input type="text" 
																		  		id="procesoCompra" 
																		 		class="form-control"
																				name="procesoCompra"
																				readonly="readonly"
																				value="${numProcesoCompra}" />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group" style="text-align: left">
																		<label>4. PROVEEDOR</label> 
																		 <select autocomplete="off" 
											                        	 		  class="form-control" 
											                        	 		  id="idProveedor" 
											                        	 		  name="idProveedor" 
											                        	 		  required <%=disable%>>
											                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
											                                     <%ArrayList<Gral_contratoOrdenCompra> proveedores = (ArrayList<Gral_contratoOrdenCompra>) request.getAttribute("proveedoresList");
											                                        if (proveedores != null){
											                                              for(Gral_contratoOrdenCompra proveedor : proveedores){%>
											                                       			  <option value="<%=proveedor.getIdProveedor()%>"><%=proveedor.getNombreProveedor().toUpperCase()%></option>
											                                       	<%}};%>
											                                        </select> 
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group" style="text-align: left">
																	 <label>2. BENEFICIARIO</label> 
																	 <input type="text" 
																		  		id="beneficiario" 
																		  		readonly="readonly"
																		 		class="form-control"
																		 		value = "${beneficiarioProceso}"
																				name="beneficiario" />
																	</div>
																</div>
																<div class="col-lg-6 col-md-6">
																	<div class="form-group" style="text-align: left">
																		<label>5. NO. ORDEN DE COMPRA</label> 
																		 <select autocomplete="off" 
											                        	 		 class="form-control" 
											                        	 		 id="idContratacion" 
											                        	 		 name="idContratacion" 
											                        	 		 required <%=disable%>>
											                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
											                         </select> 
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">
																		<label>3. MONDEDA DE LA COMPRA</label> 
																		 <input type="text" 
																		  		id="moneda" 
																		 		class="form-control"
																		 		readonly="readonly"
																				name="moneda" />
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<!--DATA Section ends-->

												<!--Table Section Starts-->
												<div class="card-body main-font" style="overflow-x: auto;">

													<table id="reqTable"
														class="table table-bordered w-100 mb-0 table-aditional-styles"
														style="overflow-x: auto; width: 100px;"
														aria-describedby="Tabla de recomendaciones por ofertas">
														<thead>
															<tr>
																<th class="all">ID DETALLE</th>
												<th class="min-desktop">BENEFICIARIO</th>
												<th class="min-desktop">NUM PROCESO COMPRA</th>
												<th class="min-desktop">PROVEEDOR</th>
												<th class="min-desktop">NUM ITEM</th>
												<th class="min-desktop">CODIGO ATC</th>
												<th class="min-desktop">CODIGO SESAL</th>
												<th class="min-desktop">PRODUCTO</th>
												<th class="min-desktop">DESCRIPCION TECNICA</th>
												<th class="min-desktop">UNIDAD PRESENTANCION</th>
												<th class="min-desktop">NOMBRE FABRICANTE</th>
												<th class="min-desktop">PAIS ORIGEN</th>
												<th class="min-desktop">MARCA </th>
												<th class="min-desktop">MODELO</th>
												<th class="min-desktop">CANTIDAD COMPRADA</th>
												<th class="min-desktop">PRECIO UNITARIO</th>
												<th class="min-desktop">PRECIO TOTAL</th>
												<th class="min-desktop">TIEMPO ENTREGA</th>
												<th class="min-desktop">VIDA UTIL</th>
												<th class="min-desktop">OBSERVACIONES</th>
												<th class="min-desktop">TIPO DOCUMENTO</th>
												<th class="min-desktop">NUM DOCUMENTO</th>
												<th class="min-desktop">FECHA SUSCRIPCION</th>
												<th class="min-desktop">FECHA LIMITE ENTREGA</th>
												<th class="min-desktop">NUM ENTREGA</th>
												<th class="min-desktop">CANTIDAD ENTREGAR SEGUN PLAZOS</th>
												<th class="min-desktop">CANTIDAD ENTREGADA</th>
												<th class="min-desktop">TOTAL ENTREGADO</th>
												<th class="min-desktop">CANTIDAD CANCELADA</th>
												<th class="min-desktop">VALOR CANCELADO</th>
												<th class="min-desktop">MOTIVO CANCELACION</th>												
												<th class="min-desktop">FECHA SOLICITUD CITA</th>
												<th class="min-desktop">DIAS EXONERADOS MULTA</th>
												<th class="min-desktop">DIAS ATRASADOS EN LA ENTREGA</th>
												<th class="min-desktop">MULTA ENTREGA TARDIA</th>
												<th class="min-desktop">VALOR NETO PAGAR</th>
												<th class="min-desktop">CANCELADA</th>
												<th class="min-desktop">ENTREGA</th>
												<th class="min-desktop">ID CONTRATACION VACIADO</th>
															</tr>
														</thead>
														<tbody>
														</tbody>
													</table>
												</div>
												<!--Table Section ends-->

												<hr></hr>
												<div class="col-md-12">
													<div id="dataSection">
														<ul class="nav nav-pills mb-3" id="pills-tab"
															role="tablist">
															<li class="nav-item"><a class="nav-link active"
																id="pills-home-tab" data-toggle="pill"
																href="#pills-home" role="tab" aria-controls="pills-home"
																aria-selected="true">PASO 1</a></li>
															<li class="nav-item"><a class="nav-link"
																id="pills-profile-tab" data-toggle="pill"
																href="#pills-profile" role="tab"
																aria-controls="pills-profile" aria-selected="false">PASO
																	2</a></li>
														</ul>
														<div class="tab-content" id="pills-tabContent">
															<div class="tab-pane fade show active" id="pills-home"
																role="tabpanel" aria-labelledby="pills-home-tab">
																<div class="row">
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<div class="form-group">
																				<label>NO.ITEM</label> 
																				<input  type="text"
																						readonly="readonly" 
																						id="numItem" 
																						name="numItem"
																						class="form-control" 
																						required />
																			</div>
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>FECHA SOLICITUD DE CITA</label> 
																			<input type="date" 
																				    id="fechaSolicitudCita"
																					name="fechaSolicitudCita" 
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>FECHA DE RECEPCION</label> 
																			<input  type="date"
																					id="fechaRecepcion" 
																					name="fechaRecepcion"
																					class="form-control" />
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<br />
																			<label>LUGAR DE RECEPCION</label> 
																			<input  type="text"
																					id="lugarRecepcion" 
																					name="lugarRecepcion"
																					maxlength="150"
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<br />
																			<label>NO. FACTURA</label> 
																			<input 	type="text"
																					id="numFactura" 
																					name="numFactura"
																					maxlength="50" 
																					class="form-control" />
																		</div>
																	</div>
																	
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>CANTIDAD A ENTREGAR SEGUN PLAZOS ENTREGA</label> 
																			<input type="text"
																					id="cantidadEntregarSegunPlazos" 
																					name="cantidadEntregarSegunPlazos" 
																					readonly="readonly"
																					class="form-control" />
																		</div>
																	</div>

																</div>

																<div class="row">
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>CANTIDAD ENTREGADA</label> 
																			<input  type="text"
																					id="cantidadEntregada"
																					name="cantidadEntregada" 
																					maxlength="6"
																					onkeypress='return soloNumeros(event)'
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>PRECIO UNITARIO</label> 
																			<input type="text"
																				   readonly="readonly" 
																				   id="precioUnitario"
																					name="precioUnitario" 
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>TOTAL ENTREGADO</label> 
																			<input  type="text"
																					readonly="readonly" 
																					id="totalEntregado"
																					name="totalEntregado" 
																					class="form-control" />
																		</div>
																	</div>
																	
																</div>
																<div class="row">
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>DIAS DE ATRASO EN LA ENTREGA</label> 
																			<input  type="text" 
																					id="diasAtrasoEntrega" 
																					name="diasAtrasoEntrega"
																					maxlength="4"
																					onkeypress='return soloNumeros(event)'
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>MULTA POR ENTREGA TARDIA (5% MENSUAL)</label>
																			<input type="text" 
																				   readonly="readonly"
																				   id="multaEntregaTardia" 
																				   name="multaEntregaTardia"
																				   readonly="readonly" 
																				   class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>VALOR NETO A PAGAR</label> 
																			<input  type="text"
																					id="ValorNeto" 
																					name="ValorNeto" 
																					readonly="readonly" 
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>DIAS EXONERADOS DE MULTA</label> 
																			<input  type="text"
																					id="diasExoneradosMulta" 
																					name="diasExoneradosMulta" 
																					maxlength="4"
																					onkeypress='return soloNumeros(event)'
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-4 col-md-4">
																		<div class="form-group">
																			<label>TIEMPO DE PAGO (DIAS)</label> 
																			<input  type="text"
																					id="tiempoEntrega" 
																					name="tiempoEntrega" 
																					maxlength="4"
																					onkeypress='return soloNumeros(event)'
																					class="form-control" />
																		</div>
																	</div>
																</div>
															</div>
															
															<!-- Paso 2 -->
															<div class="tab-pane fade" id="pills-profile"
																role="tabpanel" aria-labelledby="pills-profile-tab">
																<div class="row">
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<div class="form-group">
																				<label>VIDA UTIL A ACEPTAR</label> 
																				<input type="text" 
																						id="vidaUtilAceptar" 
																						name="vidaUtilAceptar"
																						maxlength="150"
																						class="form-control" />
																			</div>
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<div class="form-group">
																				<label>NUM ACTA RECEPCION</label> 
																				<input type="text" 
																				       id="numActaRecepcion"
																					   name="numActaRecepcion" 
																					   maxlength="150"
																					   class="form-control" />
																			</div>
																		</div>
																	</div>	
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<div class="form-group">
																				<label>NUM GARANTIA CUMPLIMIENTO/CALIDAD</label> 
																				<input type="text" 
																						id="numCagarantiaCumplimientoCalidad"
																						name="numCagarantiaCumplimientoCalidad" 
																						maxlength="150"
																						class="form-control" />
																			</div>
																		</div>
																	</div>																																		
																</div>
																
																<hr size="10px" color="orange" />
															
																<input type="hidden" name="idResultadoAnalisCalidad" id="idResultadoAnalisCalidad" />
																<div class="row">																
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<label>NUM  DE INFORME DE CALIDAD</label> 
																			<input type="text" 
																					id="numInformeResultadoAnalisisTB" 
																					name="numInformeResultadoAnalisisTB"
																					maxlength="100"
																					class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<div class="form-group">
																				<label>RESULTADO DE CALIDAD</label> 
																				<input type="text" 
																						id="resultadoAnalisisCalidadTB"
																						name="resultadoAnalisisCalidadTB" 
																						maxlength="500"
																						class="form-control" />
																			</div>
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<label>LOTE DE FABRICACION ANALIZADO</label> 
																			<input type="text"
																				   id="numLoteFabricanteAnalizadoTB" 
																				   name="numLoteFabricanteAnalizadoTB"
																				   maxlength="100"
																				   class="form-control" />
																		</div>
																	</div>
																	<div class="col-lg-6 col-md-6">
																		<div class="form-group">
																			<div class="form-group">
																				<label>OBSERVACIONES</label> 
																				<input type="text" 
																						id="observacionesTB"
																						name="observacionesTB" 
																						maxlength="2000"
																						class="form-control" />
																			</div>
																		</div>
																	</div>
																</div>
																
																<button type="button" 
																		id="nuevoResultadoCalidad"
																		name="nuevoResultadoCalidad"
																		class="btn btn-sm btn-success ml-2">AÑADIR RESULTADO DE CALIDAD
																</button>
															 <br />
															  <br />
															   <br />
															    <br />
																
										<div class="form-group">
                                        <table id="resultadosCalidad" class="table table-bordered w-100 mb-0 table-aditional-styles" aria-describedby="Tabla de Beneficiarios y Oficios">
                                          <thead>
                                            <tr>
                                              <th class="all">ID RESULTADO CALIDAD</th>
                                              <th class="min-tablet">NUM INFORME CALIDAD</th>
                                              <th class="min-tablet">RESULTADO CALIDAD</th>
                                              <th class="min-tablet">LOTE DE FABRICACION ANALIZADO</th>
                                               <th class="min-tablet">OBSERVACIONES</th>
                                            </tr>
                                          </thead>                                         
                                        </table>
                                        <!--Ben Final Table Section ends-->
                                      </div>
																
																<%
																if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {
																%>
																<div class="row float-right">
																	<button class="btn btn-sm btn-success ml-2"
																		id="addRegButton" type="button" hidden
																		data-toggle="modal"
																		data-target="#confirmationModalCenter">
																		<i class="material-icons md-18">done</i> GUARDAR
																	</button>
																</div>
																<%
																}
																%>
															</div>
														</div>
														<hr size="10px" color="orange" />
														
														<button type="button" 
																		id="Guardar"
																		name="Guardar"
																		class="btn btn-sm btn-success ml-2">REALIZAR ENTREGA
																</button>
																
																<button type="button" 
																		id="CancelarItem"
																		name="CancelarItem"	
																		data-target="#cancelarItemEntrega" data-toggle="modal"																	 	
																		
																		class="btn btn-sm btn-success ml-2">CANCELAR ENTREGA
																</button>
																
																
													</div>
												</div>
											</div>
										</div>

									</div>
									<%
									if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {
									%>
					

									<!-- Navigation Float Buttons section starts -->

									<!-- Cancel Float Button -->
									<form id="back" method="post" action="recepcionProductos.jsp">
										<div class="wrap-fixed-float wrap-fixed-bottom-right">
											<button class="btn btn-primary btn-rounded shadow main-font"
												name="submit" value="backwardApertura">
												<i class="material-icons vm">arrow_back</i> REGRESAR
											</button>
										</div>
									</form>

									<!-- Navigation Float Buttons section ends -->

									<%
									}
									%>

								</form>


							</div>
							<div class="tab-pane fade" id="canProduct" role="tabpanel"
								aria-labelledby="pills-profile-tab">

								<div class="card-body main-font" style="overflow-x: auto;">

									<table id="reqTableCancelados"
										class="table table-bordered w-100 mb-0 table-aditional-styles"
										style="overflow-x: auto; width: 100px;"
										aria-describedby="Tabla de recomendaciones por ofertas">
										<thead>
											<tr>												
												<th class="min-desktop">BENEFICIARIO</th>
												<th class="min-desktop">NUM PROCESO COMPRA</th>
												<th class="min-desktop">PROVEEDOR</th>
												<th class="min-desktop">NUM ITEM</th>
												<th class="min-desktop">CODIGO ATC</th>
												<th class="min-desktop">CODIGO SESAL</th>
												<th class="min-desktop">PRODUCTO</th>
												<th class="min-desktop">DESCRIPCION TECNICA</th>
												<th class="min-desktop">UNIDAD PRESENTANCION</th>
												<th class="min-desktop">NOMBRE FABRICANTE</th>
												<th class="min-desktop">PAIS ORIGEN</th>
												<th class="min-desktop">MARCA </th>
												<th class="min-desktop">MODELO</th>
												<th class="min-desktop">CANTIDAD COMPRADA</th>
												<th class="min-desktop">PRECIO UNITARIO</th>
												<th class="min-desktop">PRECIO TOTAL</th>
												<th class="min-desktop">TIEMPO ENTREGA</th>
												<th class="min-desktop">VIDA UTIL</th>
												<th class="min-desktop">OBSERVACIONES</th>
												<th class="min-desktop">TIPO DOCUMENTO</th>
												<th class="min-desktop">NUM DOCUMENTO</th>
												<th class="min-desktop">FECHA SUSCRIPCION</th>
												<th class="min-desktop">FECHA LIMITE ENTREGA</th>
												<th class="min-desktop">NUM ENTREGA</th>
												<th class="min-desktop">CANTIDAD ENTREGAR SEGUN PLAZOS</th>
												<th class="min-desktop">CANTIDAD ENTREGADA</th>
												<th class="min-desktop">TOTAL ENTREGADO</th>
												<th class="min-desktop">CANTIDAD CANCELADA</th>
												<th class="min-desktop">VALOR CANCELADO</th>
												<th class="min-desktop">MOTIVO CANCELACION</th>												
												<th class="min-desktop">FECHA SOLICITUD CITA</th>
												<th class="min-desktop">DIAS EXONERADOS MULTA</th>
												<th class="min-desktop">DIAS ATRASADOS EN LA ENTREGA</th>
												<th class="min-desktop">MULTA ENTREGA TARDIA</th>
												<th class="min-desktop">VALOR NETO PAGAR</th>																							
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
	<jsp:include page="Footer.jsp" flush="true" />
	</div>
	<!-- wrapper ends -->



	<!-- Modal Section starts-->
	<div class="modal fade" id="confirmationModalCenter" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-50">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<figure class="avatar avatar-100 mx-auto mb-4"> <img
							src="./bancoccicon.png" alt="" /> </figure>
						<div class="modal-body main-font" id="confirMessage">
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

	<div class="modal fade" id="ModalEnvioData" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered"
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-50">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<figure class="avatar avatar-100 mx-auto mb-4"> <img
							src="./bancoccicon.png" alt="" /> </figure>
						<div class="modal-body main-font" id="confirMessage">
							-PROCESANDO ENTREGA-</div>
						<div></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

  <div
      class="modal fade main-font"
      id="cancelarItemEntrega"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form  id="compraForm" method="post">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">
                ¿SEGURO DE CANCELAR LA ENTREGA DE ESTE ITEM?      
               </h1>
           
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat centercenter;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">format_shapes</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):
                      </h5>
                      <div id="dataSection">
                        <div class="row">                        
                        <input id="idcontratacionDetalle" name="idcontratacionDetalle" type="hidden"/>
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <div class="form-group">
								<div class="form-group">
								<label>MOTIVO CANCELACION*</label> 
								<input type="text" 
								       id="motivoCancelacion"
									   name="motivoCancelacion" 
									   maxlength="2000"									   
									   class="form-control" />
								</div>
							</div>                              
                            </div>
                          </div>                        
                        </div>
                        
                       
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="modal-footer border-0 pt-0"
              style="background-color: #f1f1f1;"
            >
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-6 col-md-6 text-center">
                    
                    <button type="button" id="aceptoCancelarItem" name="aceptoCancelarItem" 
						data-dismiss="modal" aria-label="Close"
						        class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">ACEPTAR
						</button>
						
                  </div>
                  <div class="col-6 col-md-6 text-center">
                    
                    
						<button type="button" id="noAceptoAnularItem" name="noAceptoAnularItem" 
						 data-dismiss="modal" aria-label="Close"
						        class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">CANCELAR ANULACIÓN
						</button>
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
    
    



	<!-- Customized page level js -->
	<script>
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
		
		$(document).ready(function() {
							var reqTable = $("#reqTable").DataTable(
											{
												responsive : true,
												searching : true,
												bLengthChange : true,
												pageLength : 10,
												columnDefs : [ {
													targets : 32,
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
							
							var resultadosCalidad = $("#resultadosCalidad")
							.DataTable(
									{
										responsive : true,
										searching : true,
										bLengthChange : true,
										pageLength : 10,
										columnDefs : [ {
											targets : 4,
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
							
							
							 $("#idProveedor").change(function(){
							    	var idContratacion = $("#idContratacion");
							        // Guardamos el select de solicitudcomprainput	       
							        var combo = document.getElementById("idProveedor");
								    var idProveedor = combo.options[combo.selectedIndex].value;			
							        // Guardamos el select de procesocomprainput	        
							        var procesocomprainput = $(this);
							        if($(this).val() != '')
							        {
							        	var url = getAbsolutePath() + "Gral_recepcionAPI" + "?accion=GetnumDocumentos&idProveedor="+idProveedor;
							           
							        	$.ajax({	             
							                url:   url,
							                type:  'GET',
							                beforeSend: function ()
							                {
							                    procesocomprainput.prop('disabled', true);
							                },
							                success:  function (r) 
							                {
							                	var m=r.split(",");
							                	
							                    procesocomprainput.prop('disabled', false);
							                    idContratacion .prop('disabled', false);
							                    idContratacion .find('option').remove();
							                    idContratacion .append('<option>SELECCIONE UNA OPCION...</option>');
							                    $(m).each(function(i, v){ 		                	
								                	if(m[i]!=''){
								                		idContratacion.append(m[i]);
								                	}
							                    })	
							                    idContratacion.prop('disabled', false);
							                },
							                error: function()
							                {
							                    alert('Ocurrio un error en el servidor ..');
							                    procesocomprainput.prop('disabled', false);
							                }
							            });
							        }
							        else
							        {
							        	procesocomprainput.find('option').remove();
							        	procesocomprainput.prop('disabled', true);
							        }
							    })
							
							    $("#idContratacion").change(function(){	    	
							        var combo = document.getElementById("idContratacion");
								    var idContratacion = combo.options[combo.selectedIndex].value;	
								     $.post("Gral_recepcionAPI",
						        		{
						      	  		accion: 'GetDatosProceso', idContratacion : idContratacion
						        		},
						        		function (responseText) {     
						        			console.log(responseText)
						        		var r = responseText.split(";")
						        		
						        			$("#beneficiario").val(r[0]); 
						      	  			$("#moneda").val(r[1]);   
						      	  			
						      	  		
						         		}
						      	);
								     
								     
								     reqTable.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcion&idContratacion="+ idContratacion).load();  
								     reqTableCancelados.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcionCanceladas&idContratacion="+ idContratacion).load();  
								     
								});
							 
							 $("#reqTable tbody").on("click", "tr", function () {									
							        $(this).addClass("selected").siblings().removeClass("selected");							      
							       // $("#idcontratacionDetalle").val($(this).find("td:eq(0)").text());
							       
							       if($(this).find("td:eq(37)").text()== 1){
							    	   $("#confirmationModalCenter").modal('show');	
					                   $("#confirMessage").text("ALERTA! ESTE ITEN YA FUE ENTREGADO...");					                   
							       }else if($(this).find("td:eq(36)").text()== 1){
							    	   $("#confirmationModalCenter").modal('show');	
					                   $("#confirMessage").text("ALERTA! ESTE ITEN FUE CANCELADO...");	
							       }else{
							    	   $("#idcontratacionDetalle").prop("value", $(this).find("td:eq(0)").text());
								        $("#numItem").prop("value", $(this).find("td:eq(4)").text());
								        $("#precioUnitario").prop("value",$(this).find("td:eq(15)").text());
								        $("#cantidadEntregarSegunPlazos").prop("value",$(this).find("td:eq(25)").text());
								        $("#cantidadEntregada").val($(this).find("td:eq(26)").text());							        
								        $("#idContratacionVaciado").val($(this).find("td:eq(38)").text());
								        $("#fechaLimiteEntrega").val($(this).find("td:eq(23)").text()); 
								        $("#numeroEntrega").val($(this).find("td:eq(24)").text());
								        resultadosCalidad.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getResultadosCalidad&idcontratacionDetalle="+ document.getElementById("idcontratacionDetalle").value).load();  
								         
							       }
							       
							       
							 })
							 
							 $('#Guardar').click(function(){
								 
								 
							    	
							    
							    	if(document.getElementById("cantidadEntregada").value > document.getElementById("cantidadEntregarSegunPlazos").value){
							    		alert("La cantidad entregada no puede ser mayor a la cantidad de entrega plazos")
							    	}else{
							    		var combo = document.getElementById("idContratacion");
									    var idContratacion = combo.options[combo.selectedIndex].value;	
						             var url = getAbsolutePath() + "Gral_recepcionAPI" + "?accion=UpdateDetalleRecepcion" ;           
						               $.ajax({                        
						                 type: "POST", 
						                 url: url,
						                 data: $("#controlEntregaForm").serialize(), 
						                 success: function(data)             
						                 {
						                   $("#confirmationModalCenter").modal('show');	
						                   $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
						                   reqTable.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcion&idContratacion="+ idContratacion).load();   
						                   reqTableCancelados.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcionCanceladas&idContratacion="+ idContratacion).load();  
						                 }
						               });
						               cleanInputDetalle() 
							    	}
					          });
							 
							 $('#aceptoCancelarItem').click(function(){
								 var combo = document.getElementById("idContratacion");
								 var idContratacion = combo.options[combo.selectedIndex].value;	
					             var url = getAbsolutePath() + "Gral_recepcionAPI" + "?accion=CancelarItem" ;           
					               $.ajax({                        
					                 type: "POST", 
					                 url: url,
					                 data: {idcontratacionDetalle: document.getElementById("idcontratacionDetalle").value,
					                	 motivoCancelacion: document.getElementById("motivoCancelacion").value,
					                	 	cantidadCancelada: document.getElementById("cantidadEntregarSegunPlazos").value},
					                 success: function(data)             
					                 {
					                   $("#confirmationModalCenter").modal('show');	
					                   $("#confirMessage").text("EXITOSO! ITEM CANCELADO CORRECTAMENTE...");
					                   reqTable.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcion&idContratacion="+ idContratacion).load();   
					                   reqTableCancelados.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcionCanceladas&idContratacion="+ idContratacion).load();  
					                 }
					               });
					               cleanInputDetalle() 
					          });
							 
							 $('#nuevoResultadoCalidad').click(function(){							 	
								 var url = getAbsolutePath() + "Gral_recepcionAPI" + "?accion=saveresultadosCalidad" ;           
					               $.ajax({                        
					                 type: "POST", 
					                 url: url,
					                 data: {numInformeResultadoAnalisis: document.getElementById("numInformeResultadoAnalisisTB").value,
					                	 	resultadoAnalisisCalidad: document.getElementById("resultadoAnalisisCalidadTB").value,
					                	 	numLoteFabricanteAnalizado: document.getElementById("numLoteFabricanteAnalizadoTB").value,
					                	 	idcontratacionDetalle: document.getElementById("idcontratacionDetalle").value,
					                	 	observaciones: document.getElementById("observacionesTB").value}, 
					                 success: function(data)             
					                 {
					                	 $("#confirmationModalCenter").modal('show');	
					                   $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
					                   resultadosCalidad.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getResultadosCalidad&idcontratacionDetalle="+ document.getElementById("idcontratacionDetalle").value).load();   
					                   reqTableCancelados.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getDetalleRecepcionCanceladas&idContratacion="+ idContratacion).load();  
					                 }
					               });
					               cleanInputResultadoCalidad() 
					          });
							 
							    
		});
		
		$('#cantidadEntregada').on('keyup change', function() {			
			 $("#totalEntregado").prop("value", parseFloat(this.value* document.getElementById("precioUnitario").value)); 
			 valorTotal()
	    	});
		
		$('#diasAtrasoEntrega').on('keyup change', function() {			
			 $("#multaEntregaTardia").prop("value", parseFloat((document.getElementById("totalEntregado").value* 0.5*this.value))/30); 
			 valorTotal()	
		});
		
		function valorTotal() {
						
			 $("#ValorNeto").prop("value", parseFloat(document.getElementById("totalEntregado").value-document.getElementById("multaEntregaTardia").value)); 
		}
	
		function soloNumeros(event) { 
		    if(event.charCode >= 48 && event.charCode <= 57){
		      return true;
		     }
		     return false;        
		}
		
		function cleanInputDetalle() {
			 $("#idcontratacionDetalle").prop("value", "");
			 $("#idContratacionVaciado").prop("value", "");
			 $("#fechaLimiteEntrega").prop("value", "");
			 $("#numeroEntrega").prop("value", "");
			 $("#numItem").prop("value", "");
			 $("#fechaSolicitudCita").prop("value", "");
			 $("#fechaRecepcion	").prop("value", "");
			 $("#lugarRecepcion").prop("value", "");
			 $("#numFactura").prop("value", "");
			 $("#cantidadEntregarSegunPlazos").prop("value", "");
			 $("#cantidadEntregada").prop("value", "");
			 $("#precioUnitario").prop("value", "");
			 $("#totalEntregado").prop("value", "");
			 $("#diasAtrasoEntrega").prop("value", "");
			 $("#multaEntregaTardia").prop("value", "");
			 $("#ValorNeto").prop("value", "");
			 $("#diasExoneradosMulta").prop("value", "");
			 $("#tiempoEntrega").prop("value", "");
			 $("#vidaUtilAceptar").prop("value", "");
			 $("#numActaRecepcion").prop("value", "");
			 $("#numCagarantiaCumplimientoCalidad").prop("value", "");
			 $("#motivoCancelacion").prop("value", "");			 
		}
		
		function cleanInputResultadoCalidad() {
			 $("#idResultadoAnalisCalidad").prop("value", "");
			 $("#numInformeResultadoAnalisisTB").prop("value", "");
			 $("#resultadoAnalisisCalidadTB").prop("value", "");
			 $("#numLoteFabricanteAnalizadoTB").prop("value", "");
			 $("#observacionesTB").prop("value", "");
		}
	</script>
	<!-- Java Script section ends -->
</body>
</html>
