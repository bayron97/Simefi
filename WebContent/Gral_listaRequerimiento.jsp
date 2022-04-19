
<%@ page language="java" contentType="text/html"%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="main.model.*"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
  <head>
    <meta charset="utf-8" />
    <title>Banco de Occidente - Plataforma de Fidecomisos</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description" />
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

    <!--Styles Area Ends-->
    <style>
   		#reqTable th:nth-child(1){
			   display: none;
			}
		#reqTable td:nth-child(1){
			   display: none;
			}
			
			#reqTable th:nth-child(3){
			   display: none;
			}
		#reqTable td:nth-child(3){
			   display: none;
			}
			
			#reqTable th:nth-child(7){
			   display: none;
			}
		#reqTable td:nth-child(7){
			   display: none;
			}
			#reqTable th:nth-child(15){
			   display: none;
			}
		#reqTable td:nth-child(15){
			   display: none;
			}
    </style> 
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
  </head>

  <body class="header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
   <jsp:include page="Header.jsp" flush="true" />
    <!-- Sidebar ends -->
    
    <!-- wrapper starts -->
    <div class="wrapper">
      <div class="content shadow-sm main-content-div">
   		<div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <form method="post" action="pcGeneralRouting">
                <nav class="navbar col-12 main-font">
                <input class="hide" type="submit" name="nextJsp" value ="apertura" id="aper" />
                <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
                <input class="hide" type="submit" name="nextJsp" value ="digitalizacion" id="dig" />
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <button class="btn dropdown-toggle btn-sm btn-primary" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SECCIONES</button>
                    <div class="dropdown-menu">
                      <label class="dropdown-item" for="aper">DATOS DE APERTURA</label>
                      <label class="dropdown-item" for="criteria">CRITERIOS DE EVALUACION</label>
                      <a class="dropdown-item active" href="#">VACIADO DE REQUERIMIENTO SEGUN OFICIO</a>
                      <label class="dropdown-item" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>
				  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item"><label class="nav-link" for="aper">DATOS DE APERTURA</label></li>
                    <li class="nav-item"><a class="nav-link active" href="#">VACIADO DE REQUERIMIENTO SEGUN OFICIO</a></li>
                    <li class="nav-item"><label class="nav-link" for="listaest">LISTA DE REQUERIMIENTO</label></li>
                    <li class="nav-item"><label class="nav-link" for="dig">TERMINOS DE REFERENCIA</label></li>
                  </ul>
                </nav>
                </form>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            <%
              String read = (String)session.getAttribute("read"); 
              String disable = (String)session.getAttribute("disable");
              String accion = (String)session.getAttribute("accion");             
              String type = (String)session.getAttribute("type");
              System.out.println("accion " + accion);
              int idAperturaProceso = (int)session.getAttribute("idAperturaProceso");
              System.out.println("idAperturaProceso "+ idAperturaProceso);
              
            %>
            <form id="newEditRegForm" method="post" action="Gral_listaRequerimientoServlet" enctype="multipart/form-data">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-5">
                  <h1 class="mb-0 text-white">PROCESO DE COMPRA GENERAL</h1>
                  <span class="badge badge-primary mb-5">
                    <h4 class="text-white font-weight-light ml-2 mr-3">
                      <% if (accion.toUpperCase().contentEquals("NUEVO") && accion != null) {%>
                      <i class="material-icons vm">add_circle</i>
                      <% } else if (accion.toUpperCase().contentEquals("MODIFICAR") && accion != null) {%>
                      <i class="material-icons vm">edit</i>
                      <% } else if (accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
                      <i class="material-icons vm">chrome_reader_mode</i>
                      <% } else if (accion.toUpperCase().contentEquals("REVISAR") && accion != null) {%>
                      <i class="material-icons vm">done_all</i>
                      <% } else {%>
                      <i class="material-icons vm">error</i>
                      <% } %>
                      <%=accion.toUpperCase()%>
                    </h4>
                  </span>
                </div>
                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center fixed; background-size: cover;">
                        <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">format_shapes</i>
                        <h5 id="instructionSubtitle" class="mb-3 text-center" style="font-weight: bold;"> DATOS DE APERTURA DEL PROCESO:</h5>
                       	<div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                                <!--DATA Section-->
                               <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>
                                  
                                  <div class="row">                                 
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group" style="text-align: left;">
                                            <label>NO PROCESO COMPRA</label>
                                            <input autocomplete="off" type="text" class="form-control" id="numProcesoCompra" name="numProcesoCompra" readonly="readonly" value="${numProcesoCompra}"  />
                                          </div>
                                        </div>                                      
                                     
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group" style="text-align: left;">
                                            <label>TIPO COMPRA</label>
                                            <input autocomplete="off" type="text" class="form-control" id="tipoCompra" name="tipoCompra" readonly="readonly" value="${tipoCompra}"  />
                                          </div>
                                        </div>                                    
                                  </div>
                                  
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <h6 style="font-weight: bold;">
                                          3. VACIADO DE REQUERIMIENTO SEGUN OFICIO
                                        </h6>
                                      </div>
                                    </div>
                                  </div>
                                  
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">                                    
                                      <input type="hidden" id="idlistaRequerimiento"  name="idlistaRequerimiento" value="0"/>
                                      <input type="hidden" id="idAperturaProceso"  name="idAperturaProceso" value="<%=idAperturaProceso%>"/>                                       
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                          <div class="form-group" style="text-align: left;">
                                            <label>3.1 NO. DE OFICIO*</label>
										<select autocomplete="off" class="form-control" id="idOficioBeneficiario" name="idOficioBeneficiario" required <%=disable%>>
                                       <!--  <option disabled value = "NINGUNO">SELECCIONA UNA OPCION...</option> -->
                                        <%
                                       if(accion != null){                                          
                                     	ArrayList<Gral_oficioBeneficiario> OfciosByAperturaList = (ArrayList<Gral_oficioBeneficiario>) request.getAttribute("OfciosByApertura");
                                        if (OfciosByAperturaList != null)
                                            {
                                              for(Gral_oficioBeneficiario oficio : OfciosByAperturaList){
                                             %>
                                           		<option selected value="<%=oficio.getIdOficioBeneficiario()%>"><%=oficio.getOficio().toUpperCase()%></option>
                                             <%}}}; 
                                           %>
                                        </select>                                           
                                        </div>
                                        </div>
                                       </div>
                                     
                                       <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group" style="text-align: left;">
                                            <label>3.2 BENEFICIARIO*</label>
                                            <input autocomplete="off" type="text" class="form-control" id="beneficiario" name="beneficiario" readonly="readonly" value="${beneficiario}"  required/>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row d-flex align-items-center">
                                        <div class="col-lg-9 col-md-9">
                                          <div class="form-group" style="text-align: left;">
                                            <label>3.3 NOMBRE DEL PRODUCTO*</label>
                                            <input autocomplete="off" type="hidden" class="form-control" id="idMedicamento" name="idMedicamento" required readonly/>
                                            <input autocomplete="off" type="text" class="form-control" id="nombreMedicamento" name="nombreMedicamento" required readonly/>
                                            <input autocomplete="off" type="hidden" class="form-control" id="codigoSesal" name="codigoSesal" required readonly/>
                                          </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3 align-self-end">
                                          <div class="form-group">
                                            <button type="button" class="btn btn-sm btn-success ml-2"  style="height: 60px;" data-target="#medInsumosModal" data-toggle="modal" id="medInsumosModalButton" <%=disable%>>
                                              <i class="material-icons md-18">add_box</i>
                                            </button>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.5 UNIDAD DE PRESENTACION*</label>
                                        <input class="form-control" id="unidadPresentacion" name="unidadPresentacion" readOnly/>
                                      </div>
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.6 CANTIDAD REQUERIDA*</label>
                                        <input autocomplete="off" type="text" 
		                                        onkeyup="format(this)"
		                        				onchange="format(this)"
		                        				maxlength="25"
                                         min="1" class="form-control" id="cantidadRequerida" name="cantidadRequerida" placeholder="" required <%=read%>/>
                                      </div>
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.7 CODIGO ATC*</label>
                                        <input autocomplete="off" type="text" class="form-control" id="codigoATC" name="codigoATC" placeholder="" required readonly <%=disable%>/>
                                      </div>                                      
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.8 PLAZO DE ENTREGA*</label>
                                        <input autocomplete="off"  type="text" class="form-control" id="plazosEntrega" name="plazosEntrega" placeholder="" required <%=disable%>/>
                                      </div>
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.9 VIDA ÚTIL REQUERIDA*</label>
                                        <input autocomplete="off" type="text" class="form-control" id="vidaUtil" name="vidaUtil" placeholder="" required <%=disable%>/>
                                      </div>
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.1.1 OBSERVACIONES</label>
                                        <input autocomplete="off" type="text" class="form-control" id="observacionesBeneficiario" name="observacionesBeneficiario" placeholder="" <%=disable%>/>
                                      </div>                    
				                 	 <div class="form-group" style="text-align: left">
				                          <label>MONEDA</label>
				                          <select autocomplete="off" class="form-control" id="moneda" name="moneda">
				                            <option selected disabled value="">SELECCIONA UNA OPCION...</option>
				                            <option value="USD">DOLARES AMERICANOS (USD)</option>
				                            <option value="L">LEMPIRAS (LPS.)</option>
				                          </select>
				                        </div>
				                    </div>
                                    
                                    
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group" style="text-align: left;">
                                        <label>3.4 DESCRIPCION TECNICA*</label>
                                        <textarea autocomplete="off" class="form-control" id="descripcionTecnica" name="descripcionTecnica"placeholder="" style="height: 450px;" readonly required></textarea>
                                      </div>
                                    </div>
                                  </div>

                                  
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-right">
                                        <div class="form-group">
                                          <button class="btn btn-sm btn-success ml-2" id="resetInputsButton" type="button" <%=disable%>>
                                            <i class="material-icons md-18">replay</i>REINICIAR CAMPOS
                                          </button>
                                          <button class="btn btn-sm btn-success ml-2" id="Guardar" type="button" data-toggle="modal" data-target="#confirmationModalCenter" <%=disable%>>
                                            <i class="material-icons md-18">done</i>ACEPTAR
                                          </button>
                                          <button disabled="disabled" class="btn btn-sm btn-success ml-2" id="confirmEditRegButton" type="button" data-toggle="modal" data-target="#confirmationModalCenter" <%=disable%>>
                                            <i class="material-icons md-18">done</i>CONFIRMAR EDICION
                                          </button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                               <!--DATA Section ends-->
                         </div>
                         </div>
                        </div>
                              
                        </div>
                     
                     
                       <div class="card-body main-font">
                          <div class="row" id="botontable">
                            <div class="col-lg-12 col-md-12">
                              <div class="form-group float-left">
                                <div class="form-group">
                                  <button class="btn btn-sm btn-danger ml-2" id="anularItems"  type="button" data-toggle="modal" data-target="#confirmationModalCenter" <%=disable%>>
                                    <i class="material-icons md-18">close</i>ANULAR ITEM
                                  </button>
                                  <button type="button" class="btn btn-sm btn-success ml-2" id="editRegButton"<%=disable%>>
                                    <i class="material-icons md-18">create</i>EDITAR ITEM
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                          
                         
                          
                          <div class="row">
                           <div class="col-lg-12 col-md-12">
                          	<h5 class="mb-3" style="font-weight: bold;">REPORTE GENERAL DE VACIADO DE OFICIOS</h5>
                            <!--Table Section starts-->
                            <table id="reqTable" class="table table-bordered w-100 mb-0 table-aditional-styles">
                            <thead>
                              <tr>
                                <th class="all" id="idtabla">ID LISTAREQUERMIENTO</th>
                                <th class="all" id="idtabla">NO. DE OFICIO</th>
                                <th class="min-tablet">ID BENEFICIARIO</th>
                                <th class="min-tablet">BENEFICIARIO</th>
                                <th class="min-tablet">CODIGO ATC</th>
                                <th class="min-tablet">CODIGO SESAL</th>
                                <th class="min-tablet">ID PRODUCTO</th>
                                <th class="min-tablet">PRODUCTO</th>
                                <th class="min-tablet">DESCRIPCION TECNICA</th>
                                <th class="min-desktop">UNIDAD DE PRESENTACION</th>
                                <th class="min-desktop">CANTIDAD</th>
                                <th class="min-desktop">PLAZOS DE ENTREGA</th>
                                <th class="min-desktop">VIDA ÚTIL</th>
                                <th class="min-desktop"> OBSERVACIONES</th>
                                <th class="min-desktop"> MONEDA</th>
                              </tr>
                            </thead>
                            <tbody> 
                             <%if(accion != null){                                          
                                     	ArrayList<Gral_listaRequerimientoDTO> listaRequerimientoList = (ArrayList<Gral_listaRequerimientoDTO>) request.getAttribute("listaRequerimiento");
                                        if (listaRequerimientoList != null)
                                            {
                                              for(Gral_listaRequerimientoDTO requerimiento : listaRequerimientoList){
                                             %>
                                           		<tr>
                                                    <td><%=requerimiento.getIdlistaRequerimiento()%></td>
                                                    <td><%=requerimiento.getOficio()%></td>
                                                    <td><%=requerimiento.getIdBeneficiario()%></td>
                                                    <td><%=requerimiento.getBeneficiario()%></td>
                                                    <td><%=requerimiento.getCodigoATC()%></td>
                                                    <td><%=requerimiento.getCodigoSesal()%></td>
                                                    <td><%=requerimiento.getIdMedicamento()%></td>
                                                  	<td><%=requerimiento.getNombreMedicamento()%></td>
                                                  	<td><%=requerimiento.getDescripcionTecnica()%></td>
                                                  	<td><%=requerimiento.getUnidadPresentacion()%></td>
                                                  	<td><%=  String.format("%,d", requerimiento.getCantidadRequerida()) %></td>
                                                  	<td><%=requerimiento.getPlazosEntrega()%></td>
                                                  	<td><%=requerimiento.getVidaUtil()%></td>
                                                  	<td><%=requerimiento.getObservacionesBeneficiario()%></td> 
                                                  	<td><%=requerimiento.getMoneda()%></td>                                                  	
                                                   </tr>
                                             <%}}}; 
                                           %>
                             
                            </tbody>                    
                            </table>
                            <!--Table Section ends-->
                          </div>
                          </div>
                                          
                        </div>                     
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
            </form>
            
            <form id="newConsolidado" method="post" action="Gral_listaRequerimientoServlet" enctype="multipart/form-data">
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
                <!-- Submit Float Button -->
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                  <button id="submit" style="display: none;" type="submit" name="submit"></button>
                  <button id="submitExternalButton" class="btn btn-primary btn-rounded shadow main-font" type="submit" value="guardar">
                    <span>GUARDAR Y CONTINUAR</span><i class="material-icons vm">arrow_forward</i>
                  </button>
                </div>
              </div>
            </form>
            
            <!--Form Edit Reg ends-->
          </div>
        </div>
        <!-- Main container ends -->
      </div>
      
    
    <jsp:include page="Footer.jsp" flush="true" />
    </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form method="post" action="procesoCompraGeneralServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button class="btn btn-primary btn-rounded shadow main-font" name="submit" value="cancelar" > <i class="material-icons vm">close</i>CANCELAR</button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

   
    <!--Custom New Modal-->
      <div class="modal fade main-font" id="medInsumosModal" tabindex="-1" role="dialog"  aria-hidden="true">
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Med Insumos starts-->
        <div id="medInsumosContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" class="">x</span></button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <div class="text-center pb-5" style="z-index:0;">
                <h1 class="mb-0 text-white">LISTADO DE PRODUCTOS PARAMETRIZADOS</h1>
                <h4 id="subtitleChange" class="mb-5 text-white font-weight-light">-TIPO DE MEDICAMENTO/INSUMO SELECCIONADO-</h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style=" background: url(./assets/img/BAC.png) no-repeat center center; background-size: cover;">
                      <div class="row">
                        <div class="card-body">
                           
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--Med Insumos Table Section starts-->
                              <table id="InsumosTableParam" class="table table-bordered w-100 mb-0 table-aditional-styles">
                                <thead>
                                  <tr>
                                    <th class="all">NO.</th>
                                    <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                                    <th class="min-tablet">DESCRIPCION TECNICA</th>
                                    <th class="min-tablet">CODIGO ATC</th>
                                    <th class="min-tablet">CODIGO SESAL</th>
                                    <th class="min-tablet">UNIDAD PRESENTACION</th>
                                  </tr>
                                </thead>
                                 <tbody>
                              <%
                                       if(accion != null){                                          
                                     	ArrayList<medicamentos> medicamentosList = (ArrayList<medicamentos>) request.getAttribute("medicamentos");
                                        if (medicamentosList != null)
                                            {
                                              for(medicamentos medicamento : medicamentosList){
                                             %>
                                           		<tr>
                                                    <td><%=medicamento.getCodSist()%></td><!-- id mendicamento identoty en la DB -->
                                                    <td><%=medicamento.getNombre()%></td>
                                                    <td><%=medicamento.getDescripcion()%></td>
                                                    <td><%=medicamento.getCodAtc()%></td>
                                                    <td><%=medicamento.getCodSesal()%></td>
                                                     <td><%=medicamento.getUp()%></td>
                                                   </tr>
                                             <%}}}; 
                                           %>
                              </tbody>
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
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-12 text-center">
                    <button type="button" id="cancelButton" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"> ACEPTAR </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--Med Insumos ends-->
      </div>
    </div>
    

    <!-- Modal Section ends-->
    
	  <div class="modal fade" id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <figure class="avatar avatar-100 mx-auto mb-4"><img src="./bancoccicon.png" alt="" /></figure>
              <div class="modal-body main-font" id="confirMessage">-DESCRIPCION MOTIVO DE LA MODAL-</div>
              <div>
                <button class="btn btn-primary btn-block main-font" id="confirModalButton" data-dismiss="modal">ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>


<!-- Confirmation Modal -->
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

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>

    <!-- Customized page level js -->
    <script>
    var idlistaRequerimientoP = 0;    	
	 var nombreMedicamentoP = "";    	 
	 var unidadPresentacionP = "";
	 var cantidadRequeridaP = 0;
	 var codigoATCP = "";
	 var plazosEntregaP = 0;
	 var vidaUtilP = "";
	 var observacionesBeneficiarioP = "";
	 var monedaP = "";
	 var descripcionTecnicaP = "";
    
    $(document).ready(function () {
    	"use strict";
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
    	
    	var reqTable = $("#reqTable").DataTable({
            responsive: true,
            searching: true,
            bLengthChange: true,
            pageLength: 10,
            columnDefs: [
              {
                targets: 7,
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
                targets: 5,
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
    	
    		$("#InsumosTableParam tbody").on("click", "tr", function (){
    	        $(this).addClass("selected").siblings().removeClass("selected");    	        
    	        $("#idMedicamento").prop("value", $(this).find("td:eq(0)").text());    	        
    	        $("#nombreMedicamento").prop("value", $(this).find("td:eq(1)").text());
    	        $("#descripcionTecnica").prop("value", $(this).find("td:eq(2)").text());
    	        $("#codigoATC").prop("value", $(this).find("td:eq(3)").text());
    	        $("#codigoSesal").prop("value", $(this).find("td:eq(4)").text());
    	        $("#unidadPresentacion").prop("value", $(this).find("td:eq(5)").text());    	        
    	      });
    	 
    		$("#reqTable tbody").on("click", "tr", function () {
    	        $(this).addClass("selected").siblings().removeClass("selected");
    	       	  idlistaRequerimientoP = $(this).find("td:eq(0)").text();
    	          nombreMedicamentoP = $(this).find("td:eq(7)").text();
    	          unidadPresentacionP = $(this).find("td:eq(9)").text();
    	          cantidadRequeridaP = $(this).find("td:eq(10)").text();
    	    	  codigoATCP = $(this).find("td:eq(4)").text();
    	    	  plazosEntregaP = $(this).find("td:eq(11)").text();
    	    	  vidaUtilP = $(this).find("td:eq(12)").text();
    	    	  observacionesBeneficiarioP = $(this).find("td:eq(13)").text();
    	    	  monedaP = $(this).find("td:eq(14)").text();
    	    	  descripcionTecnicaP = $(this).find("td:eq(8)").text();
    	      });
    	
	    	 $('#Guardar').click(function(){
	    		 $("#idlistaRequerimiento").prop("value", "0"); 
	             var url = getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=nuevo" ;           
	               $.ajax({                        
	                 type: "POST", 
	                 url: url,
	                 data: $("#newEditRegForm").serialize(), 
	                 success: function(data)             
	                 {
	                   $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
	                   reqTable.ajax.url(getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=GetlistaRequerimientoTB&idAperturaProceso="+ <%=idAperturaProceso%>).load();
	                 }
	               });
	               cleanInputs() 
	          });
	    	 
	    	 $('#anularItems').click(function(){
	    		 $("#idlistaRequerimiento").prop("value", idlistaRequerimientoP); 
	    		 let confirmAction = confirm("Seguro de anular este  item?");
	   	        if (confirmAction) {
	   	        	var url = getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=anularItem" ;   
	   	    		 var idlistaRequerimiento = $("#idlistaRequerimiento").val();
	   	    		 if(idlistaRequerimiento > 0){
	   	    			$.ajax({                        
	   	   	               type: "POST", 
	   	   	               url: url,
	   	   	               data: {idlistaRequerimiento:idlistaRequerimiento}, 
	   	   	               success: function(data)             
	   	   	               {
	   	   	                 $("#confirMessage").text("EXITOSO! REGISTRO ANULADO CORRECTAMENTE...");
	   	   	                 reqTable.ajax.url(getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=GetlistaRequerimientoTB&idAperturaProceso="+ <%=idAperturaProceso%>).load();
	   	   	          		}
	   	   	             });
	   	    		 cleanInputs() 
	   	    		 }else{
	   	    			 $("#confirMessage").text("SELECCIONE EL ITEM A ELIMINAR...");
	   	    		 }
	   	        } else {
	   	        	  $("#confirMessage").text("ERROR AL ANULAR ITEM...");
	   	        }
	           });
    	 
	    	 $('#confirmEditRegButton').click(function(){    		
	   	        	var url = getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=editar" ;   
	   	    		 var idlistaRequerimiento = $("#idlistaRequerimiento").val();
	   	    		 var cantidadRequerida = $("#cantidadRequerida").val();
	   	             $.ajax({                        
	   	               type: "POST", 
	   	               url: url,
	   	               data: {idlistaRequerimiento:idlistaRequerimiento, cantidadRequerida:cantidadRequerida}, 
	   	               success: function(data)             
	   	               {
	   	                 $("#confirMessage").text("EXITOSO! REGISTRO ANULADO CORRECTAMENTE...");
	   	                 reqTable.ajax.url(getAbsolutePath() + "Gral_listaRequerimientoAPI" + "?accion=GetlistaRequerimientoTB&idAperturaProceso="+ <%=idAperturaProceso%>).load();
	   	              	}
	   	             });  
	   	          cleanInputs() 
	   	          document.getElementById("Guardar").disabled = false;
	   	       document.getElementById("confirmEditRegButton").disabled = true;
	   	       
	   	    document.getElementById("idOficioBeneficiario").disabled = false;
  	    	document.getElementById("plazosEntrega").disabled = false;
  	    	document.getElementById("vidaUtil").disabled = false;
  	    	document.getElementById("observacionesBeneficiario").disabled = false;
  	    	document.getElementById("moneda").disabled = false;
	           });
    	     	 
	    	 $('#editRegButton').click(function(){
	    		 if(idlistaRequerimientoP > 0){
	    		$("#idlistaRequerimiento").prop("value", idlistaRequerimientoP); 
	  	       	$("#cantidadRequerida").prop("value", cantidadRequeridaP); 
	  	      	$("#nombreMedicamento").prop("value", nombreMedicamentoP); 
	  	    	$("#unidadPresentacion").prop("value", unidadPresentacionP); 
	  	    	$("#codigoATC").prop("value", codigoATCP);
	  	    	$("#plazosEntrega").prop("value", plazosEntregaP);
	  	    	$("#vidaUtil").prop("value", vidaUtilP);
	  	    	$("#observacionesBeneficiario").prop("value", observacionesBeneficiarioP);
	  	    	$("#moneda").prop("value", monedaP);
	  	    	$("#descripcionTecnica").prop("value", descripcionTecnicaP);
	  	    	document.getElementById("Guardar").disabled = true;
	  	    	document.getElementById("confirmEditRegButton").disabled = false;
	  	    	
	  	    	document.getElementById("idOficioBeneficiario").disabled = true;
	  	    	document.getElementById("plazosEntrega").disabled = true;
	  	    	document.getElementById("vidaUtil").disabled = true;
	  	    	document.getElementById("observacionesBeneficiario").disabled = true;
	  	    	document.getElementById("moneda").disabled = true;	  
	    		 }
	    		 else{
	    			 $("#confirMessage").text("SELECCIONE ITEM A MODIFICAR...");
	    			 $("#confirmationModalCenter").modal('show');				 				 
					
	    		 }
	  	      });
    	 
	    	 function cleanInputs() {
	    		$("#idlistaRequerimiento").prop("value", ""); 
	   	       	$("#cantidadRequerida").prop("value", ""); 
	   	      	$("#nombreMedicamento").prop("value", ""); 
	   	    	$("#unidadPresentacion").prop("value", ""); 
	   	    	$("#codigoATC").prop("value", "");
	   	    	$("#plazosEntrega").prop("value", "");
	   	    	$("#vidaUtil").prop("value", "");
	   	    	$("#observacionesBeneficiario").prop("value", "");
	   	    	$("#moneda").prop("value", "");
	   	    	$("#descripcionTecnica").prop("value", "");
	   	    	
	   	    	idlistaRequerimientoP = 0;    	
	       	 	nombreMedicamentoP = "";    	 
	       	 	unidadPresentacionP = "";
	       	 	cantidadRequeridaP = 0;
	       	 	codigoATCP = "";
	       	 	plazosEntregaP = 0;
	       	 	vidaUtilP = "";
	       	 	observacionesBeneficiarioP = "";
	       	 	monedaP = "";
	       	 	descripcionTecnicaP = "";
			}
	    	 
	    	 $('#resetInputsButton').click(function(){
	    		 cleanInputs()
	    	 });
    });
    
    $('input[name=cantidadRequerida]').bind('keypress', function(event) {
  	  var regex = new RegExp("^[0-9]+$");
  	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
  	  if (!regex.test(key)) {
  	    event.preventDefault();
  	    return false;
  	 }
  	});
     
    function format(input)
    {
    var num = input.value.replace(/\,/g,"");
    if(!isNaN(num)){
    num = num.toString().split("").reverse().join("").replace(/(?=\d*\,?)(\d{3})/g,'$1,');
    num = num.split("").reverse().join("").replace(/^[\,]/, "");
    input.value = num;
    }

    else{ alert("Solo se permiten numeros");
    input.value = input.value.replace(/[^\d\.]*/g,"");
    }
    }
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
