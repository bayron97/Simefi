<%@page import="main.model.Gral_contratacionVaciado"%>
<%@page import="main.model.distribuidor"%>
<%@page import="main.model.Gral_listaRequerimientoConsolidada"%>
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

	  <style>
	    #reqTable th:nth-child(1){
		    display: none;
		  }
	    #reqTable td:nth-child(1){
		    display: none;
		  }
		#reqTable th:nth-child(8){
		    display: none;
		  }
	    #reqTable td:nth-child(8){
		    display: none;
		  }
		#reqTable th:nth-child(9){
		    display: none;
		  }
	    #reqTable td:nth-child(9){
		    display: none;
		  }  
		#reqTable th:nth-child(10){
		    display: none;
		  }
	    #reqTable td:nth-child(10){
		    display: none;
		  }
		#reqTable th:nth-child(11){
		    display: none;
		  }
	    #reqTable td:nth-child(11){
		    display: none;
		  }		
		#reqTable th:nth-child(15){
		    display: none;
		  }
	    #reqTable td:nth-child(15){
		    display: none;
		  }   
		#reqTable th:nth-child(16){
		    display: none;
		  }
	    #reqTable td:nth-child(16){
		    display: none;
		  }            
		#reqTable th:nth-child(17){
		    display: none;
		  }
	    #reqTable td:nth-child(17){
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
            String tipoCompra = (String)request.getAttribute("tipoCompra");
            int idContratacion = (int)session.getAttribute("idContratacion");
           
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                ORDEN DE COMPRA
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                PROCESO DE COMPRA GENERAL
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
              <form id="newEditRegForm" action="Gral_contratacionDetalleServlet" method="post" enctype="multipart/form-data">            
             <input type="hidden" id="idContratacionVaciado" name="idContratacionVaciado"/> 
              <input type="hidden" id="idContratacion" name="idContratacion" value="<%=idContratacion%>"/>  
              <!--DATA Section-->
              <div id="dataSection">
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="row">
                      <div class="col-lg-2 col-md-2">
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
                      <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>NOMBRE PRODUCTO</label>
                              <input type="text" 
                              		 id="nombreMedicamento" 
			                      	 name="nombreMedicamento" 
			                      	 maxlength="50"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     
                     <%if(tipoCompra.contentEquals("MEDICAMENTOS")){%> 
                    	 <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>CODIGO ATC</label>
                              <input type="text" 
                              		 id="codigoATC" 
                              		 maxlength="120"
			                      	 name="codigoATC" 
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CODIGO SESAL</label>
                          <input type="text" 
			                     id="codigoSesal" 
			                     maxlength="120"
			                     name="codigoSesal" 
			                     class="form-control" 
			                     <%=disable%>
			                     />  
                        </div>
                    	 <%}else{%>
                    		 <div class="col-lg-4 col-md-4">
                      	<div hidden class="form-group" style="text-align: left">
                      		  <label>CODIGO ATC</label>
                              <input type="text" 
                              		 id="codigoATC" 
                              		 maxlength="120"
			                      	 name="codigoATC" 
			                      	 value="NO APLICA"
			                      	 readonly="readonly"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div hidden class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CODIGO SESAL</label>
                          <input type="text" 
			                     id="codigoSesal" 
			                     maxlength="120"
			                      value="NO APLICA"
			                      readonly="readonly"
			                     name="codigoSesal" 
			                     class="form-control" 
			                     <%=disable%>
			                     />  
                        </div>
                    	  <%}%>
                     
                     
                      </div>
                      <div class="col-lg-12 col-md-12">
                      	<div class="form-group" style="text-align: left">
                      		  <label>DESCRIPCION TECNICA DEL PRODUCTO</label>
                              <textarea type="text" 
                              		 id="descripcionTecnica" 
			                      	 name="descripcionTecnica"
			                      	 maxlength="8000" 
			                      	 class="form-control" 
			                      	 <%=disable%>> </textarea>         
                    	</div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>UNIDAD DE PRESENTACION</label>
                              <input type="text" 
                              		 id="unidadPresentacion" 
			                      	 name="unidadPresentacion" 
			                      	 maxlength="80"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div><div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>FABRICANTE</label>
                          
                          <select autocomplete="off" class="form-control" id="nombreFabricante" name="nombreFabricante" required <%=disable%>>
                            <option disabled selected="selected" value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                               <%ArrayList<distribuidor> fabricantesList = (ArrayList<distribuidor>) request.getAttribute("fabricantes");
                                 if (fabricantesList != null){
                                    for(distribuidor fabricante : fabricantesList){%>
                                        <option value="<%=fabricante.getDenominacion().toUpperCase()%>"><%=fabricante.getDenominacion().toUpperCase()%></option>
                                <%}};%>
                             </select>
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>PAIS ORIGEN</label>
                      		   <select autocomplete="off" class="form-control" id="paisOrigen" name="paisOrigen" required <%=disable%>>
                            <option disabled selected="selected" value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                               <% if (!accion.toUpperCase().contentEquals("CONSULTAR")) {
                            	   ArrayList<String> paises = (ArrayList<String>) request.getAttribute("paises");
		                               for (int i = 0; i < paises.size(); i++) {%>
		                            	      <option value="<%=paises.get(i)%>"><%=paises.get(i)%></option>
		                            	  <%}}%>                               
                             </select>
                                  
                    	</div>
                     </div>
                     
                       <%if(tipoCompra.contentEquals("EQUIPOS MÉDICOS") || tipoCompra.contentEquals("INSTRUMENTAL MÉDICO")){%> 
                    	   <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>MARCA</label>
                              <input type="text" 
                              		 id="marca" 
			                      	 name="marca" 
			                      	 maxlength="100"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>MODELO</label>
                          <input type="text" 
			                     id="modelo" 
			                     name="modelo" 
			                     class="form-control" 
			                     maxlength="100"
			                     <%=disable%>
			                     />  
                        </div>
                      </div>
                       <%}else{%>
                    	   <div  hidden class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>MARCA</label>
                              <input type="text" 
                              		 id="marca" 
			                      	 name="marca" 
			                      	 readonly="readonly"
			                      	 value="NO APLICA"
			                      	 maxlength="100"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div hidden class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>MODELO</label>
                          <input type="text" 
			                     id="modelo" 
			                     name="modelo" 
			                     readonly="readonly"
			                     value="NO APLICA"
			                     class="form-control" 
			                     maxlength="100"
			                     <%=disable%>
			                     />  
                        </div>
                      </div>
                       <%}%> 
                     
                     
                      <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>CANTIDAD COMPRADA</label>
                              <input type="text" 
                              		 id="cantidadComprada" 
			                      	 name="cantidadComprada" 
			                      	 onkeyup="format(this)"
		                        	 onchange="format(this)"
			                      	 maxlength="10"
			                      	 class="form-control" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>PRECIO UNITARIO</label>
                              <input type="text" 
                              		 id="precioUnitario" 
			                      	 name="precioUnitario" 
			                      	 class="form-control validanumericos decimales" 
			                      	 maxlength="10"
			                      	 <%=disable%>/>         
                    	</div>
                     </div><div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>PRECIO TOTAL</label>
                          <input type="text" 
			                     id="total" 
			                     readonly="readonly"
			                     name="total"
			                     maxlength="20" 
			                     class="form-control" 
			                     <%=disable%>
			                     />  
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>TIEMPOS DE ENTREGA</label>
                              <input type="text" 
                              		 id="tiemposEntrega" 
			                      	 name="tiemposEntrega" 
			                      	 class="form-control"
			                      	 maxlength="500" 
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                     <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>VIDA UTIL</label>
                              <input type="text" 
                              		 id="vidaUtil" 
			                      	 name="vidaUtil" 
			                      	 class="form-control" 
			                      	 maxlength="120"
			                      	 <%=disable%>/>         
                    	</div>
                     </div>
                      <div class="col-lg-4 col-md-4">
                      	<div class="form-group" style="text-align: left">
                      		  <label>OBSERVACIONES</label>
                              <input type="text" 
                              		 id="observaciones" 
			                      	 name="observaciones" 
			                      	 class="form-control" 			                      	 
			                      	 maxlength="120"
			                      	 <%=disable%>/>         
                    	</div>
                     </div>                    
                    </div>
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
              <div class="row" id="recommendationSection">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left ml-2">                   
                    <button type="button"  class="btn btn-sm btn-success ml-2" data-target="#confirmationModalCenter" data-toggle="modal" id="Guardar">
                      <i class="material-icons md-18">create</i>
                      GUARDAR
                    </button>
                    <button type="button"  class="btn btn-sm btn-success ml-2" data-target="#confirmationModalCenter" data-toggle="modal" id="Editar">
                      <i class="material-icons md-18">edit</i>
                      GUARDAR
                    </button>
                    <button type="button"  class="btn btn-sm btn-success ml-2"  id="Cancelar">
                      <i class="material-icons md-18">cancel</i>
                      CANCELAR
                    </button>
                  </div>
                </div>
              </div>
              
              <!--Table Section starts-->
              <% int codPadre = 0; %>
              <div class="card-body main-font" style="overflow-x:auto">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width: 100px;"
                  aria-describedby="Tabla de ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">ID CONTRATACION VACIADO</th>
                      <th class="min-desktop">NUM. ITEM</th>
                      <th class="min-desktop">PRODUCTO</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">CODIGO SESAL</th>
                      <th class="min-desktop">DESCRIPCION TECNICA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION</th>
                      <th class="min-desktop">FABRICANTE</th>
                      <th class="min-desktop">PAIS ORIGEN</th>
                      <th class="min-desktop">MARCA</th>
                      <th class="min-desktop">MODELO</th>
                      <th class="min-desktop">CANTIDAD COPRADA</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">TIEMPO ENTREGA</th>
                      <th class="min-desktop">VIDA UTIL</th>
                      <th class="min-desktop">OBSERVACIONES</th>
                      <!--  <th class="min-desktop">ACCIONES</th> -->
                    </tr>
                  </thead>
                  <tbody>
                  <%if(accion != null){       
                     ArrayList<Gral_contratacionVaciado> vaciadoList = (ArrayList<Gral_contratacionVaciado>) request.getAttribute("vaciadoList");
                       if (vaciadoList != null)
                          {
                            for(Gral_contratacionVaciado vaciado : vaciadoList){%>
                               <tr>
                                  <td><%=vaciado.getIdContratacionVaciado()%></td><!-- id mendicamento identoty en la db -->
                                  <td><%=vaciado.getNumItem()%></td>
                                  <td><%=vaciado.getNombreMedicamento()%></td>
                                  <td><%=vaciado.getCodigoATC()%></td>
                                  <td><%=vaciado.getCodigoSesal()%></td>
                                  <td><%=vaciado.getDescripcionTecnica()%></td>
                                  <td><%=vaciado.getUnidadPresentacion()%></td>
                                  <td><%=vaciado.getNombreFabricante()%></td>
                                  <td><%=vaciado.getPaisOrigen()%></td>
                                  <td><%=vaciado.getMarca()%></td>
                                  <td><%=vaciado.getModelo()%></td>
                                  <td><%= String.format("%,d", vaciado.getCantidadComprada())%></td>
                                  <td><%=vaciado.getPrecioUnitario()%></td>
                                  <td><%=vaciado.getPrecioTotal()  %></td>
                                  <td><%=vaciado.getTiemposEntrega()%></td>
                                  <td><%=vaciado.getVidaUtil()%></td>
                                  <td><%=vaciado.getObservaciones()%></td>
                                  <!-- <td> 
				                  		<button type="button" class="editar-item btn btn-sm btn-success ml-2">EDITAR</button>
				                  		<button type="button" class="anular-item btn btn-sm btn-danger ml-2">ANULAR</button>
                  				  </td> -->
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
    
    <%-- <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%> --%>
    <!-- Submit Button -->
     <form id="newEditRegForm" action="Gral_contratacionDetalleServlet" method="post" enctype="multipart/form-data"> 
     <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="submitExternalButton"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
      >
        GUARDAR
        <i class="material-icons vm">done</i>
      </button>
    </div>
     </form>
   
   <%--  <% } %> --%>

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
    
    
    <div class="modal fade" id="editarAnular" style="position: absolute;" tabindex="-1" role="dialog"  aria-hidden="true">
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
                  class="btn btn-primary btn-block main-font" id="editarItem" data-dismiss="modal">
                  EDITAR ITEM <i class="material-icons md-18">edit</i>
                </button>
                <button
                  class="btn btn-primary btn-block main-font" id="anularItem" data-dismiss="modal">
                  ANULAR ITEM<i class="material-icons md-18">edit</i>
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
                                    <th class="all">NO. ITEM</th>
                                    <th class="min-tablet">CODIGO ATC</th>
                                    <th class="min-tablet">CODIGO SESAL</th>
                                    <th class="min-tablet">PRODUCTO</th>
                                    <th class="min-tablet">DESCRIPCION TECNICA</th>
                                    <th class="min-tablet">UNIDAD PRESENTACION</th>
                                  </tr>
                                </thead>
                                 <tbody>
                               <%
                                       if(accion != null){       
                                    	ArrayList<Gral_listaRequerimientoConsolidada> consolidadolist = (ArrayList<Gral_listaRequerimientoConsolidada>) request.getAttribute("consolidadaList");
                                     	if (consolidadolist != null)
                                            {
                                              for(Gral_listaRequerimientoConsolidada consolidado : consolidadolist){
                                             %>
                                           		<tr>
                                                    <td><%=consolidado.getNumItem()%></td><!-- id mendicamento identoty en la db -->
                                                    <td><%=consolidado.getCodigoATC()%></td>
                                                    <td><%=consolidado.getCodigoSesal()%></td>
                                                    <td><%=consolidado.getNombreMedicamento()%></td>
                                                    <td><%=consolidado.getDescripcionTecnica()%></td>
                                                    <td><%=consolidado.getUnidadPresentacion()%></td>
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
    
    <!-- Java Script section starts -->

  
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
      
      
      
    
      $(document).ready(function () {
    	  document.getElementById('Guardar').style.display = 'block';
    	  document.getElementById('Editar').style.display = 'none'; 
    	  
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
          
          
          $('#Guardar').click(function(){
        	  var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=validarProductoXProveedor";           
              $.ajax({                        
                type: "POST", 
                url: url,
                data: $("#newEditRegForm").serialize(), 
                success: function(data)             
                {
                	
               	 if(data == "0"){
               		 var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=saveVaciado";           
  	               $.ajax({                        
  	                 type: "POST", 
  	                 url: url,
  	                 data: $("#newEditRegForm").serialize(), 
  	                 success: function(data)             
  	                 {
  	                	 
  	                	 reqTable.ajax.url(getAbsolutePath() + "Gral_contratacionAPI" + "?accion=getVaciadoXContratacionJson&idContratacion="+document.getElementById("idContratacion").value).load();
  		                   $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
  	                 }
  	               });
  	               cleanInputs() 
               	 }else{
               		$("#confirMessage").text("ERROR! ESTE PROVEEDOR YA TIENE REGISTRADO ESTE PRODUCTO PARA ESTA CONTRATACION...");
               	 }
              		 
                }
              });   
        	  
        	  
        	 
	          });
          
          $('#Editar').click(function(){
        	  
        	  var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=validarProductoXProveedorUpdate";           
              $.ajax({                        
                type: "POST", 
                url: url,
                data: $("#newEditRegForm").serialize(), 
                success: function(data)             
                {
               	 if(data == "0"){
               		var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=updateVaciado";           
 	               $.ajax({                        
 	                 type: "POST", 
 	                 url: url,
 	                 data: $("#newEditRegForm").serialize(), 
 	                 success: function(data)             
 	                 {
 	                	 reqTable.ajax.url(getAbsolutePath() + "Gral_contratacionAPI" + "?accion=getVaciadoXContratacionJson&idContratacion="+document.getElementById("idContratacion").value).load();
 	                   $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
 	                  
 	                  
 	                 }
 	               });
 	               cleanInputs() 
               	 }else{
               		$("#confirMessage").text("ERROR! ESTE PROVEEDOR YA TIENE REGISTRADO ESTE PRODUCTO PARA ESTA CONTRATACION...");
               	 }
              		 
                }
              });   
        	  
	             
	          });
          
          
          
          $("#InsumosTableParam tbody").on("click", "tr", function (){
  	        $(this).addClass("selected").siblings().removeClass("selected");   
  	      	$("#numItem").prop("value", $(this).find("td:eq(0)").text());  	           	        
  	        $("#nombreMedicamento").prop("value", $(this).find("td:eq(3)").text());
  	        $("#descripcionTecnica").prop("value", $(this).find("td:eq(4)").text());
  	        $("#codigoATC").prop("value", $(this).find("td:eq(1)").text());
  	        $("#codigoSesal").prop("value", $(this).find("td:eq(2)").text());
  	        $("#unidadPresentacion").prop("value", $(this).find("td:eq(5)").text());    	        
  	      });
          
          
            
         
          var idContratacionVaciadoP = "";
          var numItemP = "";
          var nombreMedicamentoP = "";
          var codigoATCP = "";
          var codigoSesalP = "";
          var descripcionTecnicaP = "";
          var unidadPresentacionP = "";
          var nombreFabricanteP = "";
          var paisOrigenP = "";
          var marcaP = "";
          var modeloP = "";
          var cantidadCompradaP = "";
          var precioUnitarioP = "";
          var totalP = "";
          var tiemposEntregaP = "";
          var vidaUtilP = "";
          var observacionesP = "";
                    
          $("#reqTable tbody").on("click", "tr", function () {
        	  $('#editarAnular').modal('show');
        	 	$(this).addClass("selected").siblings().removeClass("selected");           
             	idContratacionVaciadoP = $(this).find("td:eq(0)").text();
        	 	numItemP = $(this).find("td:eq(1)").text();
        	 	nombreMedicamentoP = $(this).find("td:eq(2)").text();
        	 	codigoATCP = $(this).find("td:eq(3)").text();
        	 	codigoSesalP = $(this).find("td:eq(4)").text();
        	 	descripcionTecnicaP = $(this).find("td:eq(5)").text();
        	 	unidadPresentacionP = $(this).find("td:eq(6)").text();
        	 	nombreFabricanteP = $(this).find("td:eq(7)").text();
        	 	paisOrigenP = $(this).find("td:eq(8)").text();
        	 	marcaP =  $(this).find("td:eq(9)").text();
        	 	modeloP = $(this).find("td:eq(10)").text();
        	 	cantidadCompradaP = $(this).find("td:eq(11)").text();
        	 	precioUnitarioP = $(this).find("td:eq(12)").text().split(" ");
        	 	totalP = $(this).find("td:eq(13)").text();
        	 	tiemposEntregaP = $(this).find("td:eq(14)").text();
      			vidaUtilP = $(this).find("td:eq(15)").text();
      			observacionesP =  $(this).find("td:eq(16)").text();         		
             });
             
               
             $('#editarItem').click(function(){
            	$("#idContratacionVaciado").prop("value", idContratacionVaciadoP);
                $("#numItem").prop("value", numItemP);
          	    $("#nombreMedicamento").prop("value", nombreMedicamentoP);
          	    $("#codigoATC").prop("value", codigoATCP);
          	    $("#codigoSesal").prop("value", codigoSesalP);
          	    $("#descripcionTecnica").prop("value", descripcionTecnicaP);
          	    $("#unidadPresentacion").prop("value", unidadPresentacionP);
          	    $("#nombreFabricante").prop("value", nombreFabricanteP);
          	    $("#paisOrigen").prop("value", paisOrigenP);
          	    $("#marca").prop("value", marcaP);
          	    $("#modelo").prop("value", modeloP);
          	    $("#cantidadComprada").prop("value", cantidadCompradaP);          	    
          	    $("#precioUnitario").prop("value", precioUnitarioP[1]);
          	    $("#total").prop("value", totalP);
          	    $("#tiemposEntrega").prop("value", tiemposEntregaP);
          	    $("#vidaUtil").prop("value", vidaUtilP);
          	    $("#observaciones").prop("value", observacionesP); 
	          	  document.getElementById('Editar').style.display = 'block';
	        	  document.getElementById('Guardar').style.display = 'none'; 
             });
             
             $('#anularItem').click(function(){
             	$("#idContratacionVaciado").prop("value", idContratacionVaciadoP);
                 $("#numItem").prop("value", numItemP);
           	    $("#nombreMedicamento").prop("value", nombreMedicamentoP);
           	    $("#codigoATC").prop("value", codigoATCP);
           	    $("#codigoSesal").prop("value", codigoSesalP);
           	    $("#descripcionTecnica").prop("value", descripcionTecnicaP);
           	    $("#unidadPresentacion").prop("value", unidadPresentacionP);
           	    $("#nombreFabricante").prop("value", nombreFabricanteP);
           	    $("#paisOrigen").prop("value", paisOrigenP);
           	    $("#marca").prop("value", marcaP);
           	    $("#modelo").prop("value", modeloP);
           	    $("#cantidadComprada").prop("value", cantidadCompradaP);
           	    $("#precioUnitario").prop("value", precioUnitarioP);
           	    $("#total").prop("value", totalP);
           	    $("#tiemposEntrega").prop("value", tiemposEntregaP);
           	    $("#vidaUtil").prop("value", vidaUtilP);
           	    $("#observaciones").prop("value", observacionesP); 
           	    
           	 if (confirm("SEGURO DE ANULAR ESTE ITEM!") == true) {
           		 var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=anularVaciado";           
	               $.ajax({                        
	                 type: "POST", 
	                 url: url,
	                 data: $("#newEditRegForm").serialize(), 
	                 success: function(data)             
	                 {
	                	 
	                	 reqTable.ajax.url(getAbsolutePath() + "Gral_contratacionAPI" + "?accion=getVaciadoXContratacionJson&idContratacion="+document.getElementById("idContratacion").value).load();
		                   $("#confirMessage").text("EXITOSO! REGISTRO ANULADO CORRECTAMENTE...");
	                 }
	               });
	               cleanInputs() 
           	  } else {
           		alert("ITEM NO CANCELADO")
           	  }
           	    
              });
             
             $('#cancelarAccion').click(function(){
            	 cleanInputs()             	 
              });
             
             
             function cleanInputs() {
             	$("#idContratacionVaciado").prop("value", "");
           	    $("#numItem").prop("value", "");
           	    $("#nombreMedicamento").prop("value", "");
           	    $("#codigoATC").prop("value", "");
           	    $("#codigoSesal").prop("value", "");
           	    $("#descripcionTecnica").prop("value", "");
           	    $("#unidadPresentacion").prop("value", "");
           	    $("#nombreFabricante").prop("value", "");
           	    $("#paisOrigen").prop("value", "");
           	    $("#marca").prop("value", "");
           	    $("#modelo").prop("value", "");
           	    $("#cantidadComprada").prop("value", "");
           	    $("#precioUnitario").prop("value", "");
           	  	$("#total").prop("value", "");
           	    $("#tiemposEntrega").prop("value", "");
           	    $("#vidaUtil").prop("value", "");
           	    $("#observaciones").prop("value", "");  
           	    
           	 document.getElementById('Guardar').style.display = 'block';
       	  	 document.getElementById('Editar').style.display = 'none'; 
         	  
         	  idContratacionVaciadoP = "";
              numItemP = "";
              nombreMedicamentoP = "";
              codigoATCP = "";
              codigoSesalP = "";
              descripcionTecnicaP = "";
              unidadPresentacionP = "";
              nombreFabricanteP = "";
              paisOrigenP = "";
              marcaP = "";
              modeloP = "";
              cantidadCompradaP = "";
              precioUnitarioP = "";
              totalP = "";
              tiemposEntregaP = "";
              vidaUtilP = "";
              observacionesP = "";
         	}
             
          
          $(".editar-item").click(function() {
      	    var row = $(this).closest("tr");
      	    $("#idContratacionVaciado").prop("value", row.find("td:nth-child(1)").text());
      	    $("#numItem").prop("value", row.find("td:nth-child(2)").text());
      	    $("#nombreMedicamento").prop("value", row.find("td:nth-child(3)").text());
      	    $("#codigoATC").prop("value", row.find("td:nth-child(4)").text());
      	    $("#codigoSesal").prop("value", row.find("td:nth-child(5)").text());
      	    $("#descripcionTecnica").prop("value", row.find("td:nth-child(6)").text());
      	    $("#unidadPresentacion").prop("value", row.find("td:nth-child(7)").text());
      	    $("#nombreFabricante").prop("value", row.find("td:nth-child(8)").text());
      	    $("#paisOrigen").prop("value", row.find("td:nth-child(9)").text());
      	    $("#marca").prop("value", row.find("td:nth-child(10)").text());
      	    $("#modelo").prop("value", row.find("td:nth-child(11)").text());
      	    $("#cantidadComprada").prop("value", row.find("td:nth-child(12)").text());
      	    $("#precioUnitario").prop("value", row.find("td:nth-child(13)").text());
      	    $("#total").prop("value", row.find("td:nth-child(14)").text());
      	    $("#tiemposEntrega").prop("value", row.find("td:nth-child(15)").text());
      	    $("#vidaUtil").prop("value", row.find("td:nth-child(17)").text());
      	    $("#observaciones").prop("value", row.find("td:nth-child(17)").text());   	   
      	    
      	});
          
//FIN DOCUMENT ready          
})           
      $('#Cancelar').click(function(){cleanInputs()});
	    
      $('input[name=cantidadComprada]').bind('keypress', function(event) {
    	  var regex = new RegExp("^[0-9]+$");
    	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    	  if (!regex.test(key)) {
    	    event.preventDefault();
    	    return false;
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
      
      $("#precioUnitario").change(function() {
          var $this = $(this);
          $this.val(parseFloat($this.val()).toFixed(4));        
      });
      
      
      
      $('#precioUnitario').on('keyup change', function() {
    	  total()
    	});
      
      $('#cantidadComprada').on('keyup change', function() {
    	  total()
    	});
      
      
      function total() {   	
    	 var cantidadComprada = document.getElementById("cantidadComprada").value;
    	 var precioUnitario = document.getElementById("precioUnitario").value;
    	 var totalFinal = (parseInt(cantidadComprada.replace(",",""))* parseFloat(precioUnitario));
    	 //$("#total").prop("value",totalFinal);  parseFloat("1,234,567.89".replace(/,/g,''))
    	 
    	
    	 
    	 
    	 
		    $("#total").prop("value", new Intl.NumberFormat('es-HN').format(totalFinal));
    	 //$("#total").prop("value", totalFinal.toString().replace(/\B(?=(\d{4})+(?!\d))/g, ""));
      }
      
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
