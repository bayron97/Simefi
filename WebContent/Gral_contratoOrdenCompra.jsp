<%@page import="main.model.distribuidor"%>
<%@page import="main.model.Gral_aperturaProceso"%>
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
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description"/>
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

  
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
            String type = (String)session.getAttribute("t");
            System.out.println("accion " + accion);            
            //int cod = (Integer)session.getAttribute("idcontratoOrdenCompra");
          
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">CONTRATOS Y ÓRDENES DE COMPRA</h2>
              <h5 class="font-weight-light main-font mb-4">PROCESO DE COMPRAS GENERALES</h5>
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
          <form id="formContratoSuministro" action="Gral_contratoOrdenCompraIndexServlet" method="post" enctype="multipart/form-data">
            <div class="card border-0 shadow-sm mb-4 main-content-div">
              <div class="card-header border-0 bg-none">
                <div class="card-body">
                  <div class="col-md-12">
                    <div id="dataSection">
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="float-left"></div>
                                </div>
                              </div>
                              <!--Inputs Section starts-->
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <input type="hidden" id="idcontratoOrdenCompra" name="idcontratoOrdenCompra" value="${idcontratoOrdenCompra}"/>
                                    <input type="hidden" id="myfileName" name="myfileName" value="${myfile}"/>
                                    <label>NO. PROCESO DE COMPRA</label>
                                    <select autocomplete="off" class="form-control" id="idAperturaProceso" name="idAperturaProceso" required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                        <%if(accion != null){                                          
                                     	ArrayList<Gral_aperturaProceso> numProcesoList = (ArrayList<Gral_aperturaProceso>) session.getAttribute("numProcesoAperturaList");
                                        if (numProcesoList != null)
                                            {
                                              for(Gral_aperturaProceso num : numProcesoList){
                                              if(!accion.contentEquals("nuevo")){
                                       			 int idApertura = (int)request.getAttribute("idAperturaProceso");
                                       			  if(num.getIdAperturaProceso() == idApertura){%>
                                           			<option selected value="<%=num.getIdAperturaProceso()%>"><%=num.getNumProcesoCompra()%></option>
                                              <%}else{%>
                                           			<option value="<%=num.getIdAperturaProceso()%>"><%=num.getNumProcesoCompra()%></option>
                                           		<%}}
                                       		  else{%>
                                       			  <option value="<%=num.getIdAperturaProceso()%>"><%=num.getNumProcesoCompra()%></option>
                                       		<%}}}}; 
                                           %>
                                        </select>
                                  </div>
                                </div>
                              </div>

							<div class="form-group" style="text-align: left">
								<label>BENEFICIARIO</label> 
								<input type="text" id="beneficiario" readonly="readonly" name="beneficiario" value="${beneficiario}" class="form-control"/> 								
							</div>
							
							<div class="row">
                                <div class="col-lg-12 col-md-12">
                                <div class="form-group" style="text-align: left">
                          		<label>PROVEEDOR</label>
                          		<input type="hidden" id="nombreProveedor" name="nombreProveedor" value="${nombreproveedor}"/> 
                          		<select autocomplete="off" class="form-control" id="idProveedor" name="idProveedor" required <%=disable%>>                  		  
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                        <%if(accion != null){                                          
                                     	ArrayList<distribuidor> provList = (ArrayList<distribuidor>) session.getAttribute("proveedoresList");
                                        if (provList != null)
                                            {
                                              for(distribuidor proveedor : provList){
                                              if(!accion.contentEquals("nuevo")){
                                       			 int idproveedor = (int)request.getAttribute("idProveedor");
                                       			  if(proveedor.getId() == idproveedor){%>
                                           			<option selected value="<%=proveedor.getId()%>"><%=proveedor.getDenominacion()%></option>
                                              <%}else{%>
                                           			<option value="<%=proveedor.getId()%>"><%=proveedor.getDenominacion()%></option>
                                           		<%}}
                                       		  else{%>
                                       			  <option value="<%=proveedor.getId()%>"><%=proveedor.getDenominacion()%></option>
                                       		<%}}}}; 
                                           %>
                                        </select>             
                       		 		</div>                                 
                                </div>
                             </div>
                              
                            <div class="row">
                             <div class="col-lg-12 col-md-12">                                
                            	<div class="form-group" style="text-align: left">
		                         	<label>TIPO DE DOCUMENTO</label>                  
		                         	<input type="hidden" name="tdocuemto" id="tdocuemto" value="${tipoDocuemnto}" />        		                  		  
		                              <select autocomplete="off" class="form-control" id="tipoDocuemnto" name="tipoDocuemnto" <%=disable%>>
									     <option selected disabled value="">SELECCIONA UNA OPCION...</option>
									     <option value="CONTRATO DE SUMINISTRO">CONTRATO DE SUMINISTRO</option>
									     <option value="CONTRATO DE SERVICIOS">CONTRATO DE SERVICIOS</option>
									     <option value="CONTRATO DE COMODATO">CONTRATO DE COMODATO</option>
									     <option value="ORDEN DE COMPRA">ORDEN DE COMPRA</option>
									     <option value="CONTRATO DE SUMINISTRO Y COMODATO">CONTRATO DE SUMINISTRO Y COMODATO</option>
									</select>
                         		</div>
                              </div>
                              </div>
							<div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>NO. DE DOCUMENTO</label>
                                    <input type="text" id="numDocumento" name="numDocumento" value="${numDocumento}" class="form-control" <%=read%>/>    
                                  </div>
                                </div>
                            </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>FECHA DE SUSCRIPCION</label>
                                    <input id="fechaSuscripcion" value="${fechaSuscripcion}" required name="fechaSuscripcion" type="date" class="form-control" <%=read%>/>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>OBSERVACIONES</label>
                                    <textarea  id="observaciones"  name="observaciones" type="text" class="form-control" style="min-height:125px"<%=read%>>${observaciones}</textarea>
                                  </div>
                                </div>
                              </div>
                              <!--Inputs Section ends-->
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                              <div class="col-lg-12 col-md-12">
                                <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                  <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                  <p>
                                    SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                  </p>
                                  <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
                                  <input type="file" id="myfile" name="myfile" required>
                                  <%} %>
                                </div>
                                <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                                  height="520" class="container-fluid hide">
                                  <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                                </iframe>
                              </div>
                            </label>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
        </div>
        <!-- Main container ends -->
      </div>
    <jsp:include page="Footer.jsp" flush="true" />
   </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="contratoSuministroGeneral.jsp">
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
    <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="submitExternalButton"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
        hidden
        form="formContratoSuministro">      
        
      </button>
    
    
      <button
        id="submitExternalButtonTemp"
        class="btn btn-primary btn-rounded shadow main-font"
        type="button"
        form="formContratoSuministro"
      >
        GUARDAR
        <i class="material-icons vm">done</i>
      </button>
    </div>
   <%--  <% } %> --%>
   
    <!-- Confirmation Modal -->
    <div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-5">
                <img src="./bancoccicon.png" alt="">
              </figure>
              <div class="modal-body main-font mt-2" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>           
              <div>
                <button 
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
   

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Modal Section ends-->

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
        <% if (!accion.toUpperCase().contentEquals("NUEVO") && accion != null) {%>
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
	        
	        
	        $("#myfile").prop('required',false);
	        
	        
	        
	        var options = document.getElementById("tipoDocuemnto").options;
      	  	for (var i = 0; i < options.length; i++) {
      	    	if (options[i].value ==  document.getElementById("tdocuemto").value) {
      	      	options[i].selected = true;
      	      	break;
      	    	}
      	  	}
	        
        <%}%>
        
      });
      
      
      $("#idAperturaProceso").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	  
	        var combo = document.getElementById("idAperturaProceso");
		    var selected = combo.options[combo.selectedIndex].value;
	
		     $.post("Gral_contratoOrdenCompraAPI",
          		{
        	  		accion: 'GetBeneficiario', idAperturaProceso : selected
          		},
          		function (responseText) {        	  	
        	  	$("#beneficiario").val(responseText);            	
           		}
        	);
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
	
     
	    $("#idProveedor").change(function() {			 
			  $("#nombreProveedor").val( $(this).find('option:selected').text());
			});
	    
	    $('#submitExternalButtonTemp').click(function (){
	    	
	    	
	    	var url = getAbsolutePath() + "Gral_contratoOrdenCompraAPI" + "?accion=validarNumDocumento";
      	  
      	 
          	$.ajax({
              type: "POST",
              url: url,
              data: $("#formContratoSuministro").serialize(),
              success: function(data)          
              {
              	
                if (data == "0"){
                	document.getElementById("submitExternalButton").click();  
                }
                else{
              	  $("#confirMessage").text("ERROR! ESTE NUMERO DE DOCUMENTO YA ESTA REGISTRADO");
                    $("#confirmationModalCenter").modal('show');
                }
              },
              error : function() {
                $("#confirMessage").text(
                  "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
                );
                $("#confirmationModalCenter").modal('show');
              }
            }); 
                
	        });
	    
	    
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
