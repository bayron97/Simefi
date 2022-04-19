<%@page import="main.model.Gral_contratacionDetalleDTO"%>
<%@page import="main.model.Gral_contratacionVaciado"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  String temp = "";
  temp = (String)request.getAttribute("openMode");
  String openMode = "";
	if(temp != null && !temp.isEmpty()){
		openMode = temp;
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
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description" />
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

   
    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->
    
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>

	   <style>
	    #reqTable th:nth-child(1){
		    display: none;
		  }
	    #reqTable td:nth-child(1){
		    display: none;
		  }
		 #reqTable th:nth-child(2){
		    display: none;
		  }
	    #reqTable td:nth-child(2){
		    display: none;
		  }  
    </style> 
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
            String read = (String)session.getAttribute("read"); 
            String disable = (String)session.getAttribute("disable");
            String accion = (String)session.getAttribute("accion");           
            String type = (String)session.getAttribute("type");
            int idContratacion = (int)session.getAttribute("idContratacion");
           
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                ORDEN DE COMPRA
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
            <div class="card-body">
              <form id="newEditRegForm" action="contratacionesGeneralServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" id="idContratacion" name="idContratacion" value="<%=idContratacion%>"/> 
              <input type="hidden" id="myfileName" name="myfileName" value="${myfile}"/>
              

              <!--DATA Section-->
              <div id="dataSection">
                <div class="row">
                  <div class="col-lg-6 col-md-6">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                          <label>NO. PROCESO DE COMPRA</label>
                          <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numProcesoCompra" 
			                      		 name="numProcesoCompra" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${numProcesoCompra}"/>  
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group" style="text-align: left">
                      <label>MONEDA DE LA COMPRA</label>
                              <input type="text" 
			                      		 readonly="readonly"
			                      		 id="monedaCompra" 
			                      		 name="monedaCompra" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${monedaCompra}"/>         
                    </div>
                    	  
                    
                    
                    <div class="form-group" style="text-align: left">
                      <label>BENEFICIARIO</label>
                     <input type="text" 
                      		 readonly="readonly"
                      		 id="beneficiario" 
                      		 name="beneficiario" 
                      		 class="form-control" 
                      		 value="${beneficiario}"/> 
                    </div>
                    
                   
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>PROVEEDOR</label>
                           <input type="text" 
			                      		 readonly="readonly"
			                      		 id="nombreProveedor" 
			                      		 name="nombreProveedor" 
			                      		 class="form-control" 
			                      		 value="${nombreProveedor}"/>                        
                        </div>
                      </div>
                    </div>
                    
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>TIPO DE DOCUMENTO</label>
                          <input type="text" 
		                         		   class="form-control" 
		                         		   readonly="readonly" 
		                         		   name="tipoDocuemnto" 
		                         		   id="tipoDocuemnto" 
		                         		   value="${tipoDocuemnto}" /> 
                        </div>
                      </div>
                    </div> 
                    
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>NO. DOCUMENTO</label>
                           <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numDocumento" 
			                      		 name="numDocumento" 
			                      		 class="form-control" 
			                      		 value="${numDocumento}"/>   
                        </div>
                      </div>
                    </div>
                    
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>FECHA DE SUSCRIPCION DE ORDEN DE COMPRA</label>
                          	<input autocomplete="off"
	                        	   type="text"
	                        	   class="form-control"
	                        	   id="fechaSuscripcion"
	                        	   name="fechaSuscripcion"
	                        	   readonly="readonly"
	                        	   placeholder=""
	                        	   required
	                        	   value="${fechaSuscripcion}"
	                        	  <%=read%>/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                       <div class="col-lg-12 col-md-12">
                         <div class="form-group"> 
                           <label>OBSERVACIONES</label>
                           <textarea id="observaciones" 
                           			 name="observaciones" 
                           			 type="text" 
                           			  maxlength="500"
                           			 class="form-control" 
                           			 readonly="readonly"
                           			 <%=read%>>${observacion}
                           	</textarea>
                           </div>
                       </div>
                     </div>   
                     
                     <div class="row">
                       <div class="col-lg-12 col-md-12">
                         <div class="form-group"> 
                           <label>NO. ITEM</label>
                           <select autocomplete="off" 
                        	 		  class="form-control" 
                        	 		  id="idContratacionVaciadoItem" 
                        	 		  name="idContratacionVaciadoItem" 
                        	 		  required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                     <%ArrayList<Gral_contratacionVaciado> ItemProductoList = (ArrayList<Gral_contratacionVaciado>) request.getAttribute("ItemProducto");
                                        if (ItemProductoList != null){
                                              for(Gral_contratacionVaciado item : ItemProductoList){%>
                                       			  <option value="<%=item.getIdContratacionVaciado()%>"><%=item.getNombreMedicamento()%></option>
                                       	<%}};%>
                                        </select>   
                           
                           <br />
                           <input type="button" id="AbririModal" value="Agregar item" class="btn btn-sm btn-success ml-2">
                         </div>
                       </div>                                                                    
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" id="myDropzone" for="myfile" style="height:700px;">
                      <div class="col-lg-12 col-md-12">
                        <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                          <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                          <p>
                            SELECCIONE EL ARCHIVO A PREVISUALIZAR
                          </p>
                          <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
                          <input type="file" id="myfile" name="myfile" required>
                          <% } %>
                        </div>
                        <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                          height="520" class="container-fluid hide"
                        >
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                        </iframe>
                      </div>
                    </label>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-right mr-2">
                      <button 
                        id="submit"
		                  	style="display:none;"
		                  	type="submit"
		                  	name="submit"
		                  >
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!--DATA Section ends-->
              </form>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
             
              
              <!--Table Section starts-->
             
              <div class="card-body main-font" style="overflow-x:auto">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width: 100px;"
                  aria-describedby="Tabla de ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">ID CONTRATACION DETALLE</th>
                      <th class="all">ID VACIADO</th>
                      <th class="min-desktop">NUM ITEM</th>
                      <th class="min-desktop">NOMBRE DEL PRODUCTO</th>
                      <th class="min-desktop">TIEMPOS ENTREGA</th>
                      <th class="min-desktop">CANTIDAD COMPRADA</th>
                      <th class="min-desktop">CANTIDAD ENTREGADO SEGUN PLAZOS</th>
                      <th class="min-desktop">FECHA LIMITE ENTREGA</th>
                      <th class="min-desktop">NUM. ENTREGA</th>
                    </tr>
                  </thead>
                  <tbody>
                  <%if(accion != null){       
                     ArrayList<Gral_contratacionDetalleDTO> detalle = (ArrayList<Gral_contratacionDetalleDTO>) request.getAttribute("detalle");
                       if (detalle != null)
                          {
                            for(Gral_contratacionDetalleDTO d : detalle){%>
                               <tr>
                                  <td><%=d.getIdcontratacionDetalle()%></td>
                                  <td><%=d.getIdContratacionVaciado()%></td>
                                  <td><%=d.getNumItem()%></td>
                                  <td><%=d.getNombreMedicamento()%></td>
                                  <td><%=d.getTiemposEntrega()%></td>
                                  <td><%=d.getCantidadComprada()%></td>
                                  <td><%=d.getCantidadEntregarSegunPlazos()%></td>
                                  <td><%=d.getFechaLimiteEntrega()%></td>
                                  <td><%=d.getNumeroEntrega()%></td>
                                  
                                </tr><%}}};%>  
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
            </div>
          </div>
        </div>
        <!-- Main container ends -->
      </div>
     <jsp:include page="Footer.jsp" flush="true" />
    </div>

    <!-- wrapper ends -->

    <form
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="contrataciones.jsp">
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

   <%--  <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%> --%>
    <!-- Submit Button -->
     <form id="finalizar" action="Gral_contratacionIndexServlet" method="post" enctype="multipart/form-data">
     <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="submitExternalButton"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
      >
        FINALIZAR
        <i class="material-icons vm">done</i>
      </button>
    </div>
     </form>
     
    
    <%-- <% } %> --%>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
   
    <!--Custom New Modal-->

    <!-- Confirmation Modal -->
    <div
      class="modal fade"
      id="confirmationModalCenter"
      style="position: absolute;"
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

    <!--Item Modal-->
   <div
      class="modal fade main-font"
      id="newEditReg"
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
                COMPRAS GENERALES       
               </h1>
               <h4
                  class="mb-5 text-white font-weight-light"
                >
                  EDITAR ITEM
                </h4>
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
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD COMPRADA FALTANTE</label>
                              <input type="text"  readonly="readonly" id="cantidadFaltante" name="cantidadFaltante" class="form-control"/>
                             <div hidden>
                             <label>CANTIDAD ENTREGADA</label>
                              <input type="text"  readonly="readonly" id="cantidadEntregadaPlazos" name="cantidadEntregadaPlazos" class="form-control"/>
                          	   <label>ID CONTRATO VACIADO</label>
                          	  <input type="text"  readonly="readonly" id="idContratacionVaciado" name="idContratacionVaciado" class="form-control"/>
                           </div>
                              
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD COMPRADO UNIDADES</label>
                              <input type="number" min="1" readonly="readonly" id="cantidadComprada" name="cantidadComprada" class="form-control"/>
                            </div>
                          </div>
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD A ENTREGAR SEGUN PLAZOS ENTREGA*</label>
                              <label id="Messagevalidate" >La cantidad a entregar deve ser menor o igual a la cantidad de unidades</label>
                              <input
                                autocomplete="off"
                                type="number"
                                min="1"
                                onclick="OcultarValidacion();"
                                class="form-control"
                                id="cantidadEntregarSegunPlazos"
                                name="cantidadEntregarSegunPlazos"
                                 onkeyup="format(this)"
                                placeholder=""
                                required
                              />
                            </div>
                            <script>
                            function OcultarValidacion(){
                          	  document.getElementById('Messagevalidate').style.display = 'none';
                            }                            
                            </script>
                          </div>
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>FECHA LIMITE ENTREGA*</label>
                              <input
                                autocomplete="off"
                                type="date"
                                class="form-control"
                                id="fechaLimiteEntrega"
                                name="fechaLimiteEntrega"
                                placeholder=""
                                required
                              />
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>NUM ENTREGA</label>
                              <input type="number" min="1" id="numeroEntrega" name="numeroEntrega" class="form-control"/>
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
                  <div class="col-12 col-md-6 text-center">
                    <button
                      type="button"
                      id="cancelButton"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center" id="submitButtonDiv">
                                      
                    <button
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      id="Editar"
                      type="button"
                      
                    >
                      GUARDAR
                    </button>  
                    
                  <button
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      id="Guardar"
                      type="button"
                      
                    >
                      GUARDAR
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
    
    
    <div class="modal fade" id="editarItem" style="position: absolute;" tabindex="-1" role="dialog"  aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body"  style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>             
              <div>              
                <button 
                  class="btn btn-primary btn-block main-font" id="btneditarItems"  data-dismiss="modal" data-toggle="modal" data-target="#newEditReg">
                  EDITAR ITEM <i class="material-icons md-18">edit</i>
                </button>               
                <button
                  class="btn btn-primary btn-block main-font" id="cancelarAccion" data-dismiss="modal">
                  CANCELAR <i class="material-icons md-18">cancel</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Modal Section ends-->

    <!-- Java Script section starts -->
	
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
  
    <!-- Customized page level js -->
    <script>
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
      
      
      
      function cleanFields(){
    	  
    	  $("#idcontratacionDetalle").prop("value", "");
    	  $("#idcontratacionDetalle").prop("value", "");
          $("#idContratacionVaciado").prop("value", "");
          $("#cantidadEntregarSegunPlazos").prop("value", "");
          $("#fechaLimiteEntrega").prop("value", "");
          $("#numeroEntrega").prop("value", "");          
        }
      
      $(document).ready(function () {
          var reqTable = $("#reqTable").DataTable({
              responsive: true,
              searching: true,
              bLengthChange: false,
              pageLength: 10,
              columnDefs: [
                {
    			  targets: 4,
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
          
          var nombreDocumento = "${myfile}";
	        if (nombreDocumento === "")
	        {
	          $("#previewDocumentInput").addClass("hide");
	          $("#previewDocumentInput").prop("src", "");
	          $("#documentFile").prop("required", true);
	        }
	        else{
	          var ruta = getAbsolutePath() + "assets/files/contractSupplyFiles/" + nombreDocumento;
	          $("#previewDocumentInput").prop("src", ruta);
	          $("#previewDocumentInput").removeClass("hide");
	          $("#documentFile").prop("required", false);
	        }
          
        
          
          //const rowSelected = null;
          $("#reqTable tbody").on("click", "tr", function () {
        	  document.getElementById('Editar').style.display = 'block';
        	  document.getElementById('Guardar').style.display = 'none'; 
        	  $('#editarItem').modal('show');
            $(this).addClass("selected").siblings().removeClass("selected");
            $("#idcontratacionDetalle").val($(this).find("td:eq(0)").text());
            $("#cantidadEntregarSegunPlazos").val($(this).find("td:eq(6)").text());
  			$("#fechaLimiteEntrega").val($(this).find("td:eq(7)").text());
  			$("#numeroEntrega").val($(this).find("td:eq(8)").text());
  			
            $.post("Gral_contratacionAPI",
              		{accion: 'getCantidades', idContratacionVaciado :  $(this).find("td:eq(1)").text()},
              		function (responseText) {    
              		var r = responseText.split(";")        
              			$("#cantidadComprada").val(r[0]); 
              			var cantidadFaltante = r[0]-r[1];
              			var cantidadpedida = document.getElementById("cantidadEntregarSegunPlazos").value;
              			
              			$("#cantidadEntregadaPlazos").val(r[1]);
              			$("#cantidadFaltante").val(parseInt(cantidadFaltante) + parseInt(cantidadpedida));
              			$("#idContratacionVaciado").val($(this).find("td:eq(1)").text());
              			
               		}
            	);
            
            document.getElementById('Messagevalidate').style.display = 'none';
        	document.getElementById('Guardar').style.display = 'none';
        	document.getElementById('Editar').style.display = 'block';  
            
		});
          
          $("#AbririModal").on("click", function (event) {  
        	var combo = document.getElementById("idContratacionVaciadoItem");
  		    var idContratacionVaciadoItem = combo.options[combo.selectedIndex].value;
  		    
  		    if(idContratacionVaciadoItem == "NINGUNO"){
  		    	alert("POR FAVOR SELECCIONE UN ITEM")
  		    }else{
  		      document.getElementById('Messagevalidate').style.display = 'none';
          	  document.getElementById('Editar').style.display = 'none';
          	  document.getElementById('Guardar').style.display = 'block';        	
          	  $('#newEditReg').modal('show'); 
  		    }
  		    	       	  
            });
          
          $('#Guardar').click(function(){       	  
        	if(document.getElementById("cantidadEntregarSegunPlazos").value > document.getElementById("cantidadFaltante").value)  {        		  
          		  document.getElementById('Messagevalidate').style = "color: red";
          		  document.getElementById('Messagevalidate').style.display = 'block';
          		  return false;
          	  } 
          	  else  if(document.getElementById("cantidadEntregarSegunPlazos").value == 0)  {        		  
          		  
          		  document.getElementById('Messagevalidate').style = "color: red";
          		  document.getElementById('Messagevalidate').style.display = 'block';
          		  return false;
          	  } else{
          		var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=saveDetalle";           
                $.ajax({                        
                  type: "POST", 
                  url: url,
                  data: $("#compraForm").serialize(), 
                  success: function(data)             
                  {                 	 
                 	 reqTable.ajax.url(getAbsolutePath() + "Gral_contratacionAPI" + "?accion=getDetalleContratacionJson&idContratacion="+document.getElementById("idContratacion").value).load(); 
    	             $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
                 	$('#newEditReg').modal('hide');
                 	$("#idContratacionVaciadoItem").val("NINGUNO");
                  }
                });
                cleanFields() 
          	  }
                
        	  
        	  
              
           });
       
       $('#Editar').click(function(){    	   
    	   if(document.getElementById("cantidadEntregarSegunPlazos").value > document.getElementById("cantidadFaltante").value)  {        		  
       		  document.getElementById('Messagevalidate').style = "color: red";
       		  document.getElementById('Messagevalidate').style.display = 'block';
       		  return false;
       	  } 
       	  else  if(document.getElementById("cantidadEntregarSegunPlazos").value == 0)  {        		  
       		  
       		  document.getElementById('Messagevalidate').style = "color: red";
       		  document.getElementById('Messagevalidate').style.display = 'block';
       		  return false;
       	  } else{
       		var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=updateDetalle";           
            $.ajax({                        
              type: "POST", 
              url: url,
              data: $("#compraForm").serialize(), 
              success: function(data)             
              {
            	reqTable.ajax.url(getAbsolutePath() + "Gral_contratacionAPI" + "?accion=getDetalleContratacionJson&idContratacion="+document.getElementById("idContratacion").value).load();
                $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
                $('#newEditReg').modal('hide');
                $("#idContratacionVaciadoItem").val("NINGUNO");
              }
            });
            cleanFields() 
       	  }
    	   
           });        
        });
    

      $("#idContratacionVaciadoItem").change(function(){     	  
    	  var idContratacionVaciado = document.getElementById("idContratacionVaciadoItem").value;    	  
    	  $.post("Gral_contratacionAPI",
          		{accion: 'getCantidades', idContratacionVaciado : idContratacionVaciado},
          		function (responseText) {    
          		var r = responseText.split(";")        
          			$("#cantidadComprada").val(r[0]); 
          			$("#cantidadEntregadaPlazos").val(r[1]);
          			$("#cantidadFaltante").val(r[0]-r[1]);
          			$("#idContratacionVaciado").val(idContratacionVaciado);
          			
           		}
        	);
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
