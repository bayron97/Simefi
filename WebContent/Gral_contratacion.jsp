<%@page import="main.model.Gral_contratoOrdenCompraDTO"%>
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
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description"/>
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

    <!-- Customized template style mandatory ends-->

	  <style>
	    #reqTable th:nth-child(7){
		    display: none;
		  }
	    #reqTable td:nth-child(7){
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
            int idContratacion = (int)session.getAttribute("idContratacion");
            
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title"> CONTRATACIONES </h2>
              <h5 class="font-weight-light main-font mb-4">PROCESO DE COMPRAS GENERALES </h5>
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
              <form id="newEditRegForm" action="Gral_contratacionVaciadoServlet" method="post" enctype="multipart/form-data">
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
                          <%if(accion.contentEquals("nuevo")){
                        	  %>
                        	  <select autocomplete="off" 
                        	 		  class="form-control" 
                        	 		  id="idAperturaProceso" 
                        	 		  name="idAperturaProceso" 
                        	 		  required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                     <%ArrayList<Gral_contratoOrdenCompraDTO> procesoList = (ArrayList<Gral_contratoOrdenCompraDTO>) request.getAttribute("procesosWhitcontratoOrdenCompraList");
                                        if (procesoList != null){
                                              for(Gral_contratoOrdenCompraDTO proceso : procesoList){%>
                                       			  <option value="<%=proceso.getIdAperturaProceso()%>"><%=proceso.getNumProcesoCompra().toUpperCase()%></option>
                                       	<%}};%>
                                        </select>                       	                         	  
                        	  <%}else{ %>
                        		  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numProcesoCompra" 
			                      		 name="numProcesoCompra" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${numProcesoCompra}"/>   
                        		  <%}%>               	 
                        </div>
                      </div>
                    </div>
                    
                    <div class="form-group" style="text-align: left">
                      <label>MONEDA DE LA COMPRA</label>
                      <%if(accion.contentEquals("nuevo")){%>
                      <select autocomplete="off" class="form-control" id="monedaCompra" name="monedaCompra">
				         <option selected disabled value="">SELECCIONA UNA OPCION...</option>
				         <option value="DOLARES AMERICANOS (USD)">DOLARES AMERICANOS (USD)</option>
				         <option value="LEMPIRAS (LPS.)">LEMPIRAS (LPS.)</option>
				         <!-- <option value="USD">DOLARES AMERICANOS (USD)</option>
				         <option value="L">LEMPIRAS (LPS.)</option> -->
				      </select>                   
                    </div><%}else{%>
                    	<input type="text" 
			                      		 readonly="readonly"
			                      		 id="monedaCompra" 
			                      		 name="monedaCompra" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${monedaCompra}"/>   
                        		  <%}%>   
                    	
               
                    
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
                           <%if(accion.contentEquals("nuevo")){%>
                           <select autocomplete="off" 
                        	 		 class="form-control" 
                        	 		 id="idProveedor" 
                        	 		 name="idProveedor" 
                        	 		 required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                         </select>  
                           <%}else{%>
                        	    <input type="text" 
			                      		 readonly="readonly"
			                      		 id="nombreProveedor" 
			                      		 name="nombreProveedor" 
			                      		 class="form-control" 
			                      		 value="${nombreProveedor}"/>                    
                    </div>
                            <%}%>
                                    		  
                         </div>
                      </div>
                    </div>
                    
                    <div class="row">
                             <div class="col-lg-12 col-md-12">                                
                            	<div class="form-group" style="text-align: left">
		                         	<label>TIPO DE DOCUMENTO</label>                  
		                         	<input type="text" 
		                         		   class="form-control" 
		                         		   readonly="readonly" 
		                         		   name="tipoDocuemnto" 
		                         		   id="tipoDocuemnto" 
		                         		   value="${tipoDocuemnto}" />        		                  		  
		                             <%--  <select autocomplete="off" class="form-control" id="tipoDocuemnto" name="tipoDocuemnto" <%=disable%>>
									     <option selected disabled value="">SELECCIONA UNA OPCION...</option>
									     <option value="CONTRATO DE SUMINISTRO">CONTRATO DE SUMINISTRO</option>
									     <option value="CONTRATO DE SERVICIOS">CONTRATO DE SERVICIOS</option>
									     <option value="CONTRATO DE COMODATO">CONTRATO DE COMODATO</option>
									     <option value="ORDEN DE COMPRA">ORDEN DE COMPRA</option>
									     <option value="CONTRATO DE SUMINISTRO Y COMODATO">CONTRATO DE SUMINISTRO Y COMODATO</option>
									</select> --%>
                         		</div>
                              </div>
                              </div>
                    
                    
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>NO. DOCUMENTO</label>
                          <%if(accion.contentEquals("nuevo")){%>
                          <select autocomplete="off" 
                        	 		 class="form-control" 
                        	 		 id="idcontratoOrdenCompra" 
                        	 		 name="idcontratoOrdenCompra" 
                        	 		 required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                         </select>    
                          <%}else{%>
                           <input type="hidden" id="idcontratoOrdenCompra" name="idcontratoOrdenCompra" value="${idcontratoOrdenCompra}"/>   
                        	  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numDocumento" 
			                      		 name="numDocumento" 
			                      		 class="form-control" 
			                      		 value="${numDocumento}"/>  
                           <%}%>
                                  		  
                         </div>
                      </div>
                    </div> 
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>FECHA SUSCRIPCION</label>
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
                           			  maxlength="4000"
                           			 class="form-control" 
                           			 <%=read%>>${observacion}
                           	</textarea>
                         </div>
                       </div>
                     </div>                       
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" id="myDropzone" for="myfile" style="height:700px;">
                      <div class="col-lg-12 col-md-12">
                      <%--   <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                          <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                          <p>SELECCIONE EL ARCHIVO A PREVISUALIZAR</p>
                          <% if (!accion.toUpperCase().contentEquals("CONSULTAR")) {%>
                          <input type="file" id="myfile" name="myfile" required>
                          <% } %>
                        </div> --%>
                        <iframe title="document preview" 
                        		src="" 
                        		id="previewDocumentInput" 
                        		name="SubHtml"
                         	    height="520" 
                         	    class="container-fluid hide">
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                        </iframe>
                      </div>
                    </label>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-right mr-2">
                      <button id="submit"
		                  	  style="display:none;"
		                  	  type="submit"
		                  	  name="submit">
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              
             <%--  <% if (!accion.toUpperCase().contentEquals("CONSULTAR")) {%> --%>
    <!-- Submit Button -->
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
   <%--  <% } %> --%>
              <!--DATA Section ends-->
              </form>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
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
    <div class="modal fade" id="confirmationModalCenter" style="position: absolute;" tabindex="-1" role="dialog" aria-hidden="true" >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4"><img src="./bancoccicon.png" alt="" /></figure>
              <div class="modal-body main-font" id="confirMessage">-OPERACION EN PROCESO-</div>
              <div>
                <button class="btn btn-primary btn-block main-font" id="confirModalButton" data-dismiss="modal">
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    

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
          $("#cantidadcompradoinput").prop("value", "");
          $("#cantidadentregarinput").prop("value", "");
          $("#fechalimiteentregainput").prop("value", "");
        }
      
      $(document).ready(function () {        
          
          <% if (!accion.toUpperCase().contentEquals("NUEVO") && accion != null) {%>
	         var nombreDocumento = "${myfile}"; 
	        /* var nombreDocumento = document.getElementById("myfileName").value;; */
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
	        $("#myfile").prop('required',false);	        
	       	
        <%}%>
          
        });
      
      $(document).on('change', 'input[type=file]', function(e) {
          if (e.target.files[0])
          {
            // Obtenemos la ruta temporal mediante el evento
            var TmpPath = URL.createObjectURL(e.target.files[0]);
            // Mostramos la ruta temporal en el Iframe dedicado
            $("#previewDocumentInput").prop("src",TmpPath);
            $("#previewDocumentInput").removeClass("hide");
          }
          else
          {
            $("#previewDocumentInput").prop("src","");
            $("#previewDocumentInput").addClass("hide");
          }
      });

      $("#idAperturaProceso").change(function(){
	    	var idproveedor = $("#idProveedor");
	        // Guardamos el select de solicitudcomprainput	       
	        var combo = document.getElementById("idAperturaProceso");
		    var idAperturaProceso = combo.options[combo.selectedIndex].value;			
	        // Guardamos el select de procesocomprainput	        
	        var procesocomprainput = $(this);
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=GetProveedores&idAperturaProceso="+idAperturaProceso;
	           
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
	                    idproveedor .prop('disabled', false);
	                    idproveedor .find('option').remove();
	                    idproveedor .append('<option>SELECCIONE UNA OPCION...</option>');
	                    $(m).each(function(i, v){ 		                	
		                	if(m[i]!=''){
		                		idproveedor.append(m[i]);
		                	}
	                    })	
	                    idproveedor.prop('disabled', false);
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
	    
	    $("#idProveedor").change(function(){
	    	var idcontratoOrdenCompra = $("#idcontratoOrdenCompra");
	        // Guardamos el select de solicitudcomprainput	       
	        var combo = document.getElementById("idProveedor");
		    var idProveedor = combo.options[combo.selectedIndex].value;	
		    
		    var proceso = document.getElementById("idAperturaProceso");
		    var idAperturaProceso = proceso.options[proceso.selectedIndex].value;	
	        // Guardamos el select de procesocomprainput	        
	        var procesocomprainput = $(this);
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "Gral_contratacionAPI" + "?accion=GetcontratoOrdenCompra&idProveedor="+idProveedor+"&idAperturaProceso="+idAperturaProceso;
	            console.log(url);
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
	                	console.log(m)
	                    procesocomprainput.prop('disabled', false);
	                	idcontratoOrdenCompra.prop('disabled', false);
	                	idcontratoOrdenCompra.find('option').remove();
	                	idcontratoOrdenCompra.append('<option>SELECCIONE UNA OPCION...</option>');
	                    $(m).each(function(i, v){ 		                	
		                	if(m[i]!=''){
		                		idcontratoOrdenCompra.append(m[i]);
		                	}
	                    })	
	                    idcontratoOrdenCompra.prop('disabled', false);
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
	    
	   
	    
	     $("#idAperturaProceso").change(function(){	    	
	        var combo = document.getElementById("idAperturaProceso");
		    var selected = combo.options[combo.selectedIndex].value;	
		     $.post("Gral_contratacionAPI",
          		{
        	  		accion: 'GetBeneficiario', idAperturaProceso : selected
          		},
          		function (responseText) {        	  	
        	  	$("#beneficiario").val(responseText);            	
           		}
        	);
		});
      
      
      $("#idcontratoOrdenCompra").change(function(){	    	
	        var combo = document.getElementById("idcontratoOrdenCompra");
		    var idcontratoOrdenCompra = combo.options[combo.selectedIndex].value;	
		     $.post("Gral_contratoOrdenCompraAPI",
        		{
      	  		accion: 'GetDatosByidcontratoOrdenCompra', idcontratoOrdenCompra : idcontratoOrdenCompra
        		},
        		function (responseText) {     
        			console.log(responseText)
        		var r = responseText.split(",")
        		
        			$("#tipoDocuemnto").val(r[0]); 
      	  			$("#fechaSuscripcion").val(r[1]);   
      	  			
      	  		 var nombreDocumento = r[2]; 
     	      
     	        if (nombreDocumento === "")
     	        {
     	          $("#previewDocumentInput").addClass("hide");
     	          $("#previewDocumentInput").prop("src", "");
     	          
     	        }
     	        else{
     	          var ruta = getAbsolutePath() + "assets/files/contractSupplyFiles/" + nombreDocumento;
     	          $("#previewDocumentInput").prop("src", ruta);
     	          $("#previewDocumentInput").removeClass("hide");
     	         
     	        }
         		}
      	);
		});
      
     
      
  	</script>
    <!-- Java Script section ends -->
  </body>
</html>
