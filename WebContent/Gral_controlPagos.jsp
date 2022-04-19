<%@page import="main.model.Gral_contratoOrdenCompra"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
  <head>
    <meta charset="utf-8" />
    <title>Banco de Occidente - Plataforma de Fidecomisos</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta
      content="Plataforma de Fidecomisos de Banco de Occidente"
      name="description"
    />
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

  <style>
		#InsumosTableParam th:nth-child(1){
			   display: none;
			}
		#InsumosTableParam td:nth-child(1){
			   display: none;
			}
			#InsumosTableParam th:nth-child(5){
			   display: none;
			}
		#InsumosTableParam td:nth-child(5){
			   display: none;
			}
			#InsumosTableParam th:nth-child(6){
			   display: none;
			}
		#InsumosTableParam td:nth-child(6){
			   display: none;
			}
			#InsumosTableParam th:nth-child(7){
			   display: none;
			}
		#InsumosTableParam td:nth-child(7){
			   display: none;
			}
			#InsumosTableParam th:nth-child(8){
			   display: none;
			}
		#InsumosTableParam td:nth-child(8){
			   display: none;
			}
			#InsumosTableParam th:nth-child(9){
			   display: none;
			}
		#InsumosTableParam td:nth-child(9){
			   display: none;
			}
			#InsumosTableParam th:nth-child(8){
			   display: none;
			}
		#InsumosTableParam td:nth-child(8){
			   display: none;
			}
			#InsumosTableParam th:nth-child(9){
			   display: none;
			}
		#InsumosTableParam td:nth-child(9){
			   display: none;
			}
			#InsumosTableParam th:nth-child(10){
			   display: none;
			}
		#InsumosTableParam td:nth-child(10){
			   display: none;
			}
			#InsumosTableParam th:nth-child(12){
			   display: none;
			}
		#InsumosTableParam td:nth-child(12){
			   display: none;
			}
			#InsumosTableParam th:nth-child(13){
			   display: none;
			}
		#InsumosTableParam td:nth-child(13){
			   display: none;
			}
			
			
	</style>
	<script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
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
            String read = (String)session.getAttribute("read"); 
            String disable = (String)session.getAttribute("disable");
            String accion = (String)session.getAttribute("accion");
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTROL DE PAGOS
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO GENERAL
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-5">
	              <h4 class="text-white font-weight-light ml-2 mr-3">
	              <% if (accion.toUpperCase().contentEquals("NUEVO")) {%>
	                <i class="material-icons vm">add_circle</i>
	              <% } else if (accion.toUpperCase().contentEquals("MODIFICAR")) {%>
	                <i class="material-icons vm">edit</i>
	              <% } else if (accion.toUpperCase().contentEquals("CONSULTAR")) {%>
	                <i class="material-icons vm">chrome_reader_mode</i>
	              <% } else if (accion.toUpperCase().contentEquals("REVISAR")) {%>
	                <i class="material-icons vm">done_all</i>
	              <% } else {%>
	                <i class="material-icons vm">error</i>
	              <% } %>
	                <%=accion.toUpperCase()%>
	              </h4>
	            </span>
            </div>
          </div>
         
            <div class="card border-0 shadow-sm mb-4 main-content-div">
              <div class="card-header border-0 bg-none">
                <div class="card-body">
                
                
                	<div class="col-md-12">
                	  
                      <div class="row">
														<div class="col-lg-12 col-md-12">
															<div class="row">
																<div class="col-lg-6 col-md-6">
																	<div class="form-group">	
																	<!-- <input type="hidden" id="idcontratacionDetalle" name="idcontratacionDetalle"/>	
																	<input type="hidden" id="idContratacionVaciado" name="idContratacionVaciado"/>
																	<input type="hidden" id="fechaLimiteEntrega" name="fechaLimiteEntrega"/>
																	<input type="hidden" id="numeroEntrega" name="numeroEntrega"/> -->																
																		<label>1. NO. PROCESO DE COMPRA</label>
																	<input type="text" 
																		  		id="procesoCompra" 
																		 		class="form-control"
																				name="procesoCompra"
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
											                        	 		  required >
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
											                        	 		 required>
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
                            
                         
                          <hr noshade="noshade" size="10" width="100%" />   
                          
													<div id="dataSection">
														<ul class="nav nav-pills mb-3" id="pills-tab"
															role="tablist">
															<li class="nav-item"><a class="nav-link active"
																id="pills-home-tab" data-toggle="pill"
																href="#pills-home" role="tab" aria-controls="pills-home"
																aria-selected="true">GENERAR ORDEN DE PAGO</a></li>
															<li class="nav-item"><a class="nav-link"
																id="pills-profile-tab" data-toggle="pill"
																href="#pills-profile" role="tab"
																aria-controls="pills-profile" aria-selected="false">RESUMEN ORDEN DE PAGO
																	</a></li>
														</ul>
														<div class="tab-content" id="pills-tabContent">
															<div class="tab-pane fade show active" id="pills-home"
																role="tabpanel" aria-labelledby="pills-home-tab">
																
																  <form id="DatosPago" action="Gral_controlPagosServlet" method="post">   
                           <input type="hidden" id="idcontratacionDetalle" name="idcontratacionDetalle"/>                
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>NO. FACTURA</label>
                                 <select autocomplete="off" 
									 class="form-control" 
									 id="numFactura" 
									 name="numFactura" 
									required <%=disable%>>
									 <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
								</select> 
                                </div>
                            </div>
		                   	 <div class="col-lg-4 col-md-4">
		                        <div class="form-group">
		                          <label>NO. ITEM</label>
		                          <input type="text" 
					                     id="numItem" 
					                     name="numItem" 
					                     class="form-control" 
					                     readonly="readonly"
					                     />  
		                        </div>
		                     </div>
		                      <div class="col-lg-2 col-md-2 align-self-end">
		                           <div class="form-group">
		                                <button type="button" class="btn btn-sm btn-success ml-2"  style="height: 60px;" data-target="#medInsumosModal" data-toggle="modal" id="medInsumosModalButton" <%=disable%>>
		                                  <i class="material-icons md-18">add_box</i>
		                                 </button>
		                             </div>
		                      </div>
                    	 </div>
                          <div class="row">
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA LIMITE ENTREGA</label>
                                <input type="text" 
                                		id="fechaLimiteEntrega" 
                                		name="fechaLimiteEntrega"
                                		readonly="readonly"
                                		 class="form-control"/>
                              </div>
                            </div>
                           <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA RECEPCION</label>
                                <input type="text" 
                                		id="fechaRecepcion" 
                                		name="fechaRecepcion"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA SOLICITUD</label>
                                <input type="text" 
                                		id="fechaSolicitudCita" 
                                		name="fechaSolicitudCita"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>DIAS ATRASO ENTREGA</label>
                                <input type="text" 
                                		id="diasAtrasoEntrega" 
                                		name="diasAtrasoEntrega"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>                            
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>DIAS EXONERADOS MULTA</label>
                                <input type="text" 
                                		id="diasExoneradosMulta" 
                                		name="diasExoneradosMulta"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>MULTA POR ENTREGA TARDIA</label>
                                <input type="text" 
                                		id="multaEntrega" 
                                		name="multaEntrega"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>TOTAL ENTREGA</label>
                                <input type="text" 
                                		id="totalEntregado" 
                                		name="totalEntregado"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>VALOR NETO A PAGAR</label>
                                <input type="text" 
                                		id="valorNetoPagar" 
                                		name="valorNetoPagar"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>NUM. ACTA RECEPCION</label>
                                <input type="text" 
                                		id="numActaRecepcion" 
                                		name="numActaRecepcion"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>NUM. GARIANTIA DE CIMPLIMIENTO/CALIDAD</label>
                                <input type="text" 
                                		id="numCagarantiaCumplimientoCalidad" 
                                		name="numCagarantiaCumplimientoCalidad"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>                            
                          </div>
                          
                           <hr noshade="noshade" size="10" width="100%" /> 
                            <h3 style="text-align:center">TASA DE CAMBIO</h3>
                          
                          <div id="tasaCambio" class="row">
                           <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FACTOR CAMBIO</label>
                                <input type="text" 
                                		id="factorCambio" 
                                		name="factorCambio"
                                		value="0"
                                		<%=disable%>
                                		class="form-control validanumericos decimales"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA FACTOR CAMBIO</label>
                                <input type="date" 
                                		id="fechafactorCambio" 
                                		name="fechafactorCambio"
                                		<%=disable%>
                                		class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>VARLO FACTURA(LEMPIRAS)</label>
                                <input type="text" 
                                		id="valorFactLPS" 
                                		name="valorFactLPS"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>MULTA ENTREGA TARDIA(LEMPIRAS)</label>
                                <input type="text" 
                                		id="multaEntregaTardiaLPS" 
                                		name="multaEntregaTardiaLPS"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>VALOR NETO PAGAR(LEMPIRAS)</label>
                                <input type="text" 
                                		id="valorNetoPagarLPS" 
                                		name="valorNetoPagarLPS"
                                		readonly="readonly" class="form-control"/>
                              </div>
                            </div>
                          </div>
                          
                           <hr noshade="noshade" size="10" width="100%" /> 
                           <h3 style="text-align:center">DETALLE DE PAGO</h3>
                           
                           <div class="row">
                           <div id="chequeDiv" class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>CHEQUE</label>
                                <input type="text" 
                                		id="cheque" 
                                		name="cheque"
                                		<%=disable%>
                                		class="form-control validanumericos decimales"/>
                              </div>
                            </div>
                            <div id="bancoDiv" class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>BANCO</label>
                                <input type="text" 
                                		id="banco" 
                                		name="banco"
                                		readonly="readonly"
                                		class="form-control"/>
                              </div>
                            </div>
                            <div id="numCuentaDiv" class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>NUM. CUENTA</label>
                                <input type="text" 
                                		id="numCuenta" 
                                		name="numCuenta"
                                		readonly="readonly"
                                		class="form-control"/>
                              </div>
                            </div>                             
                          </div>
                          <div class="row">
                          <div class="form-group"> 
                            <button class="btn btn-sm btn-success ml-2"
                              id="Guardar"
                              <%=disable%>
                              data-toggle="modal" data-target="#confirmationModalCenter" 
                              type="button">
                              <i class="material-icons md-10">done</i>
                              GUARDAR
                            </button>
                            </div>
                          </div>
                           
                          
                          <!--Table Section Starts-->
												<div class="card-body main-font" style="overflow-x: auto;">

													<table id="controlPago"
														class="table table-bordered w-100 mb-0 table-aditional-styles"
														style="overflow-x: auto; width: 100px;"
														aria-describedby="Tabla de recomendaciones por ofertas">
														<thead>
															<tr>
											   <th class="all">BENEFICIARIO</th>
												<th class="min-desktop">NUM. PROCESO COMPRA</th>
												<th class="min-desktop">MONEDA DE LA COMPRA</th>
												<th class="min-desktop">PROVEEDOR</th>
												<th class="min-desktop">NUM FACTURA</th>
												<th class="min-desktop">VALOR FACTURA(TOTAL ENTREGADO)</th>
												<th class="min-desktop">MULTA POR ENTREGA TARDIA</th>
												<th class="min-desktop">VALOR NETO PAGADO</th>
												<th class="min-desktop">FACTOR CAMBIO</th>
												<th class="min-desktop">VALOR FACTURA(LPS)</th>
												<th class="min-desktop">MULTA POR ENTREGA TARDIA(LPS)</th>
												<th class="min-desktop">VALOR NETO A PAGAR(LPS)</th>
													</tr>
														</thead>
														<tbody>
														</tbody>
														
													</table>
												</div>
												<!--Table Section ends-->
                          
                          
                         
                          <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                      
                  </form>
                          
                          </div>
															
															<!-- Paso 2 -->
							<div class="tab-pane fade" id="pills-profile"
								 role="tabpanel" aria-labelledby="pills-profile-tab">
										
										
										
										<table id="reqTable" class="table table-bordered w-100 mb-0 table-aditional-styles">
                                <thead>
                                  <tr>
                                    <th class="min-tablet">NUM ITEM</th>
                                    <th class="min-tablet">NUM. FACTURA</th>
                                    <th class="min-tablet">FECHA LIMITE ENTREGA</th>
                                    <th class="min-tablet">FECHA RECEPCION</th>
                                    <th class="min-tablet">FECHA SOLICITUD CITA</th>
                                    <th class="min-tablet">DIAS ATRASADOS ENTREGA</th>
                                    <th class="min-tablet">DIAS EXONERADOS MULTA</th>
                                    <th class="min-tablet">MONEDA DE LA COMPRA</th>
                                    <th class="min-tablet">VALOR FACTURA</th>
                                    <th class="min-tablet">MULTA POR ENTREGA TARDIA</th>
                                    <th class="min-tablet">VALOR NETO A PAGAR</th>
                                    <th class="min-tablet">FACTOR CAMBIO</th>
                                    <th class="min-tablet">FECHA FACTOR CAMBIO</th>
                                    <th class="min-tablet">VALOR FACTURA(LPS)</th>
                                    <th class="min-tablet">MULTA POR ENTREGA TARDIA(LPS)</th>
                                    <th class="min-tablet">VALOR NETO A PAGAR(LPS)</th>
                                  </tr>
                                </thead>                                
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
</div>  
</div>
 <!-- wrapper ends -->
    
    <form target="_blank"
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="controlPagosGeneral.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="backwardApertura"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

    <% if (!accion.toUpperCase().contentEquals("CONSULTAR")) {%>
    <!-- Submit Button -->
    <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="reportepago"
        class="btn btn-primary btn-rounded shadow main-font"
        type="button"
        style="display:none;"
      >
        GENERAR REPORTE DE PAGO 
        <i class="material-icons vm">done</i>
      </button>
    </div>
    <% } %>


    <div class="modal fade main-font" id="medInsumosModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-xl modal-dialog-centered" style="max-width: 100%;padding-left: 15%;padding-right: 15%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="">x</span></button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">PRODUCTOS ENTREGADOS</h1>
                <h4 id="subtitleChange" class="mb-5 text-white font-weight-light">REGISTRAR PAGO</h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center; background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">  SELECCIONE ITEM A PAGAR:</h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-12 col-md-12">
                                <table id="InsumosTableParam" class="table table-bordered w-100 mb-0 table-aditional-styles">
                                <thead>
                                  <tr>
                                    <th class="all">ID CONTRATACION DETALLE</th>
                                    <th class="min-tablet">NUM ITEM</th>
                                    <th class="min-tablet">PRODUCTO</th>
                                    <th class="min-tablet">FECHA LIMITE ENTREGA</th>
                                    <th class="min-tablet">FECHA RECEPCION</th>
                                    <th class="min-tablet">FECHA SOLICITUD CITA</th>
                                    <th class="min-tablet">DIAS ATRASADOS ENTREGA</th>
                                    <th class="min-tablet">DIAS EXONERADOS MULTA</th>
                                    <th class="min-tablet">MULTA EN LA ENTREGA</th>
                                    <th class="min-tablet">TOTAL ENTREGADO</th>
                                    <th class="min-tablet">VALOR NETO</th>
                                    <th class="min-tablet">NUM. ACTA RECEPCION</th>
                                    <th class="min-tablet">NUM. GARANTIA CUMPLIMINETO CALIDAD</th>
                                     <th class="min-tablet">PAGADA</th>
                                  </tr>
                                </thead>                                
                              </table>       
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
            
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">                
                  <div class="col-12 col-md-6 text-center">
                    <button id="SelecionarItem" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">ACEPTAR</button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--Ben Final Param ends-->
      </div>
    </div>
    
     <div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <figure class="avatar avatar-100 mx-auto mb-5"> <img src="./bancoccicon.png" alt=""></figure>
              <div class="modal-body main-font mt-2" id="confirMessage">-DESCRIPCION MOTIVO DE LA MODAL- </div>
              <div>
                <button class="btn btn-primary btn-block main-font" id="confirModalButton" data-dismiss="modal">
                ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> 
    
    
    

    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
    <!-- Customized page level js -->
    <script>
    
    function getAbsolutePath() {
        var loc = window.location;
        var pathName = loc.pathname.substring(
          0,
          loc.pathname.lastIndexOf("/") + 1
        );
        return loc.href.substring(
          0,
          loc.href.length -
            ((loc.pathname + loc.search + loc.hash).length - pathName.length)
        );
      }
    
    $(document).ready(function () {    	
    	var controlPago = $("#controlPago").DataTable({
	        responsive: true,
	        searching: true,
	        bLengthChange: true,
	        pageLength: 10,
	        columnDefs: [
	          {
	            targets: 11,
	            orderable: false,
	          },
	        ],
	        language: {
	          emptyTable: "No hay datos disponibles en la tabla.",
	          info: "Del _START_ al _END_ de _TOTAL_ ",
	          infoEmpty: "Mostrando 0 registros de un total de 0 ",
	          infoFiltered: "(filtrados de un total de _MAX_ registros)",
	          infoPostFix: "(Actualizados)",
	          lengthMenu: "Mostrar: _MENU_",
	          loadingRecords: "Cargando...",
	          processing: "Procesando...",
	          search: "",
	          searchPlaceholder: "Buscar registro...",
	          zeroRecords: "No se han encontrado coincidencias.",
	          paginate: {
	            first: "Primera",
	            last: "Ultima",
	            next: "Siguiente",
	            previous: "Anterior",
	          },
	        },
	        lengthMenu: [
	          [10, 20, 25, 50, -1],
	          [10, 20, 25, 50, "Todos"],
	        ],
	        order: [[0, "asc"]],
	        dom: 'Bfrtip',
	          buttons: [
	               'excel', 'pdf'
	          ],
	      });	
    	
		    var reqTable = $("#reqTable").DataTable({
		        responsive: true,
		        searching: true,
		        bLengthChange: true,
		        pageLength: 10,
		        columnDefs: [
		          {
		            targets: 15,
		            orderable: false,
		          },
		        ],
		        language: {
		          emptyTable: "No hay datos disponibles en la tabla.",
		          info: "Del _START_ al _END_ de _TOTAL_ ",
		          infoEmpty: "Mostrando 0 registros de un total de 0 ",
		          infoFiltered: "(filtrados de un total de _MAX_ registros)",
		          infoPostFix: "(Actualizados)",
		          lengthMenu: "Mostrar: _MENU_",
		          loadingRecords: "Cargando...",
		          processing: "Procesando...",
		          search: "",
		          searchPlaceholder: "Buscar registro...",
		          zeroRecords: "No se han encontrado coincidencias.",
		          paginate: {
		            first: "Primera",
		            last: "Ultima",
		            next: "Siguiente",
		            previous: "Anterior",
		          },
		        },
		        lengthMenu: [
		          [10, 20, 25, 50, -1],
		          [10, 20, 25, 50, "Todos"],
		        ],
		        order: [[0, "asc"]],
		        dom: 'Bfrtip',
		          buttons: [
		               'excel', 'pdf'
		          ],
		      });	
		   
		    
		     var medInsumosTable = $("#InsumosTableParam").DataTable({
              responsive: true,
              searching: true,
              bLengthChange: false,
              pageLength: 5,
              columnDefs: [
                {
                  targets: 12,
                  orderable: false,
                },
              ],
              language: {
                emptyTable: "No hay datos disponibles en la tabla.",
                info: "Del _START_ al _END_ de _TOTAL_ ",
                infoEmpty: "Mostrando 0 registros de un total de 0 ",
                infoFiltered: "(filtrados de un total de _MAX_ registros)",
                infoPostFix: "(Actualizados)",
                lengthMenu: "Mostrar: _MENU_",
                loadingRecords: "Cargando...",
                processing: "Procesando...",
                search: "",
                searchPlaceholder: "Buscar registro...",
                zeroRecords: "No se han encontrado coincidencias.",
                paginate: {
                  first: "Primera",
                  last: "Ultima",
                  next: "Siguiente",
                  previous: "Anterior",
                },
              },
              lengthMenu: [
                [10, 20, 25, 50, -1],
                [10, 20, 25, 50, "Todos"],
              ],
              order: [[0, "asc"]],
              }); 
		    
    
			    $('#Guardar').click(function(){					 
			        var url = getAbsolutePath() + "Gral_controlPagosAPI" + "?accion=updatePago" ;           
			          $.ajax({                        
			            type: "POST", 
			            url: url,
			            data: $("#DatosPago").serialize(), 
			            success: function(data)             
			            {
			              $("#confirmationModalCenter").modal('show');	
			              $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
			              medInsumosTable.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getPagosJson&idContratacion="+ $("#idContratacion").value() +"&numFactura="+ $("#numFactura").value()).load();  
			  		    controlPago.ajax.url(getAbsolutePath() + "Gral_controlPagosAPI" + "?accion=GetControlPago&idContratacion="+ $("#idContratacion").value() +"&numFactura="+$("#numFactura").value()).load();  
			  		    reqTable.ajax.url(getAbsolutePath() + "Gral_controlPagosAPI" + "?accion=GetResumenPago&idContratacion="+ $("#idContratacion").value() +"&numFactura="+$("#numFactura").value()).load();  
			  		
			            }
			          }); 
			          cleanInputs() 
			     });
    
    $("#InsumosTableParam tbody").on("click", "tr", function (){
        $(this).addClass("selected").siblings().removeClass("selected");    	        
        $("#idcontratacionDetalle").prop("value", $(this).find("td:eq(0)").text());    	        
        $("#numItem").prop("value", $(this).find("td:eq(1)").text());
        $("#fechaLimiteEntrega").prop("value", $(this).find("td:eq(3)").text());
        $("#fechaRecepcion").prop("value", $(this).find("td:eq(4)").text());
        $("#fechaSolicitudCita").prop("value", $(this).find("td:eq(5)").text());
        $("#diasAtrasoEntrega").prop("value", $(this).find("td:eq(6)").text());   
        $("#diasExoneradosMulta").prop("value", $(this).find("td:eq(7)").text());   
        $("#multaEntrega").prop("value", $(this).find("td:eq(8)").text());   
        $("#totalEntregado").prop("value", $(this).find("td:eq(9)").text());   
        $("#valorNetoPagar").prop("value", $(this).find("td:eq(10)").text());   
        $("#numActaRecepcion").prop("value", $(this).find("td:eq(11)").text());   
        $("#numCagarantiaCumplimientoCalidad").prop("value", $(this).find("td:eq(12)").text());    
        
      });
   
     
      
      
      $("#idProveedor").change(function(){
	    	var idContratacion = $("#idContratacion");       
	        var combo = document.getElementById("idProveedor");
		    var idProveedor = combo.options[combo.selectedIndex].value;			        
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
	                    datosProveedor(idProveedor);
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
      		var r = responseText.split(";")
      			$("#beneficiario").val(r[0]); 
    	  		$("#moneda").val(r[1]);  
    	  		
    	  		if(r[1] == 'DOLARES AMERICANOS (USD)'){    	  			
    	  			document.getElementById("tasaCambio").style.display = "block";
    	  		}else{
    	  			document.getElementById("tasaCambio").style.display = "none";
    	  		}
    	  	}
      	);
		     getFacturas(idContratacion);
		});
      
      $("#numFactura").change(function(){	 
    	  var combo = document.getElementById("idContratacion");
		    var idContratacion = combo.options[combo.selectedIndex].value;	
		    medInsumosTable.ajax.url(getAbsolutePath() + "Gral_recepcionAPI" + "?accion=getPagosJson&idContratacion="+ idContratacion+"&numFactura="+this.value).load();  
		    controlPago.ajax.url(getAbsolutePath() + "Gral_controlPagosAPI" + "?accion=GetControlPago&idContratacion="+ idContratacion+"&numFactura="+this.value).load();  
		    reqTable.ajax.url(getAbsolutePath() + "Gral_controlPagosAPI" + "?accion=GetResumenPago&idContratacion="+ idContratacion+"&numFactura="+this.value).load();  
		});
       
    })
       function getFacturas(idContratacion) {
    	   var numFactura = $("#numFactura");  
     	  $.post("Gral_controlPagosAPI",
     	      		{
     	    	  		accion: 'getFacturas', idContratacion : idContratacion
     	      		},
     	      		function (responseText) {     
     	      			console.log(responseText)
     	      		var r = responseText.split(";")
     	      		 	numFactura.prop('disabled', false);
     	      			numFactura.find('option').remove();
     	      			numFactura.append('<option>SELECCIONE UNA OPCION...</option>');
 	                    $(r).each(function(i, v){ 		                	
 		                	if(r[i]!=''){
 		                		numFactura.append(r[i]);
 		                	}
 	                    })	
 	                    numFactura.prop('disabled', false); 	
     	    	  	}
     	  );
	}
    
      function datosProveedor(idProveedor){
    	  $.post("Gral_controlPagosAPI",
    	      		{
    	    	  		accion: 'GetBanco', idProveedor : idProveedor
    	      		},
    	      		function (responseText) {    
    	      		var r = responseText.split(";")
    	      		
    	    	  		if(r[2] == "CHEQUE"){    	    	  			
        	    	  		document.getElementById("chequeDiv").style.display = "block";
        	    	  		document.getElementById("bancoDiv").style.display = "none";
        	    	  		document.getElementById("numCuentaDiv").style.display = "none";
        	    	  		$("#numCuenta").val("NO APLICA"); 
        	    	  		$("#banco").val("NO APLICA");   	
        	    	  		$("#cheque").val(""); 
    	    	  		}else if(r[2] === "TRANSFERENCIA BANCARIA"){
    	    	  			document.getElementById("chequeDiv").style.display = "none";
        	    	  		document.getElementById("bancoDiv").style.display = "block";
        	    	  		document.getElementById("numCuentaDiv").style.display = "block";  
        	    	  		$("#numCuenta").val(r[0]); 
        	    	  		$("#banco").val(r[1]);   	
        	    	  		$("#cheque").val("NO APLICA"); 
        	    	  	}else{
    	    	  			alert("ESTE PROVEEDOR NO TIENEN NUNGUN METODO DE PAGO ASIGNADO")
    	    	  			document.getElementById("chequeDiv").style.display = "none";
        	    	  		document.getElementById("bancoDiv").style.display = "none";
        	    	  		document.getElementById("numCuentaDiv").style.display = "none";
    	    	  		}
    	      		
    	    	  			
    	    	  	}
    	  );
      }
      
      
	    
	    $("#informeCalidadcheck").on("change", function () {	    	
	    	 if ($("#informeCalidadcheck").prop("checked")){	    	
	    		$("#informeCalidad").val('APLICA');
	    	 }else{
	    		 $("#informeCalidad").val('NO APLICA'); 		
	    	 }
	    });
	    
      $("#actaRecepcioncheck").on("change", function () {	    	
	    	 if ($("#actaRecepcioncheck").prop("checked")){
	    		 $("#actaRecepcion").val('APLICA');
	    	 }else{
	    		 $("#actaRecepcion").val('NO APLICA');
	    	 }
	    });
      
      $(".decimales").on("keypress keyup blur", function (event) {
          var patt = new RegExp(/[0-9]*[.]{1}[0-9]{4}/i);
          var matchedString = $(this).val().match(patt);
          if (matchedString) {
              $(this).val(matchedString);
          }
          if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
              event.preventDefault();
          }
      });
      
      onload = function () {
          var ele = document.querySelectorAll('.validanumericos')[0];
          ele.onkeypress = function (e) {
              if (isNaN(this.value + String.fromCharCode(e.charCode)))
                  return false;
          }
          ele.onpaste = function (e) {
              e.preventDefault();
          }
      }
      
      $('#factorCambio').on('keyup change', function() {
    	  var vFactura = document.getElementById("totalEntregado").value*this.value
    	  var mEntregaTarde = document.getElementById("multaEntrega").value*this.value
    	  var valorNeto = document.getElementById("valorNetoPagar").value*this.value
          $("#valorFactLPS").prop("value",vFactura);  
    	  $("#multaEntregaTardiaLPS").prop("value",mEntregaTarde);  
    	  $("#valorNetoPagarLPS").prop("value",valorNeto);  
    	});
      
      function cleanInputs() {
    	  $("#idcontratacionDetalle").prop("value", "");    	        
          $("#numItem").prop("value", "");
          $("#fechaLimiteEntrega").prop("value", "");
          $("#fechaRecepcion").prop("value", "");
          $("#fechaSolicitudCita").prop("value", "");
          $("#diasAtrasoEntrega").prop("value", "");   
          $("#diasExoneradosMulta").prop("value", "");   
          $("#multaEntrega").prop("value", "");   
          $("#totalEntregado").prop("value", "");   
          $("#valorNetoPagar").prop("value", "");   
          $("#numActaRecepcion").prop("value", "");   
          $("#numCagarantiaCumplimientoCalidad").prop("value", ""); 
          $("#factorCambio").prop("value", "0"); 
          $("#fechafactorCambio").prop("value", ""); 
          $("#valorFactLPS").prop("value", ""); 
          $("#multaEntregaTardiaLPS").prop("value", ""); 
          $("#valorNetoPagarLPS").prop("value", ""); 
	}
    
	    
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
