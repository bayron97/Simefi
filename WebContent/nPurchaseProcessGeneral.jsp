
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
   		#benFinalTable th:nth-child(1){
			   display: none;
			}
		#benFinalTable td:nth-child(1){
			   display: none;
			}
    </style>
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
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <input type="hidden" name="prevJsp" value="apertura" />
                    <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
                    <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                    <input class="hide" type="submit" name="nextJsp" value ="requerimientos" id="req" />
                    <input class="hide" type="submit" name="nextJsp" value ="digitalizacion" id="dig" />
                    <button class="btn dropdown-toggle btn-sm btn-primary" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SECCIONES </button>
                    
                    <div class="dropdown-menu">
                      <a type="button" class="dropdown-item active" href="#">DATOS DE APERTURA</a>
                      <label class="dropdown-item" for="criteria">CRITERIOS DE EVALUACION</label>
                      <label class="dropdown-item" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                      <label class="dropdown-item" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item"><a class="nav-link active" href="#">DATOS DE APERTURA</a></li>
                    <li class="nav-item"><label class="nav-link" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label></li>
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
              int idAperturaProceso = (int)request.getAttribute("idAperturaProceso");
              
            %>
            <form id="newEditRegForm" method="post" action="Gral_aperturaProcesoServlet" enctype="multipart/form-data">
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
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.1 NO. DE PROCESO DE COMPRA</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                      <!-- Usaar este NumProceso  -->
                                        <input type="hidden" id="nupro" value="<%=idAperturaProceso %>"/>
                                        <input type="hidden" id="archivos" />
                                        <input type="hidden" id="MyFormatDocument" />
                                        <%  if(!accion.contentEquals("nuevo")){
                                    	  String numProcesoCompra = (String)request.getAttribute("numProcesoCompra");%>
                                    	<input readonly  id="numProcesoCompra" class="form-control"   name="numProcesoCompra" value="<%=numProcesoCompra%>"/>
                                    	<%}else{
                                    	ArrayList<numeroProcesoCompra> numeroProcesoCompraList = (ArrayList<numeroProcesoCompra>)request.getAttribute("numProcesoCompraList");
                                        if (numeroProcesoCompraList != null){%>
                                     	<input list="browsers" id="numProcesoCompra" autocomplete="off"  class="form-control"  name="numProcesoCompra">
     								 	<datalist id="browsers">
                                        <%for(numeroProcesoCompra numlist : numeroProcesoCompraList){%>
                      					<option  class="form-control" value="<%=numlist.getCod()%>">
                                      	<%}}}%>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.1.2 TIPO DE COMPRA</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                        <select autocomplete="off" class="form-control" id="descripcionCompra" name="descripcionCompra" required <%=disable%>>
                                        <option disabled value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                        <%
                                       if(accion != null){                                          
                                     	ArrayList<descripcioncompra> desCompraList = (ArrayList<descripcioncompra>) request.getAttribute("descripcionCompraList");
                                        if (desCompraList != null)
                                            {
                                              for(descripcioncompra descList : desCompraList){
                                              	if(!accion.contentEquals("nuevo")){
                                       			 String d = (String)request.getAttribute("descripcionCompra");
                                       			  if(descList.getNombreCompra().contentEquals(d)){%>
                                           			<option selected value="<%=descList.getNombreCompra()%>"><%=descList.getNombreCompra().toUpperCase()%></option>
                                              <%}else{%>
                                           			<option value="<%=descList.getNombreCompra()%>"><%=descList.getNombreCompra().toUpperCase()%></option>
                                           		<%}}
                                       		  else{%>
                                       			  <option value="<%=descList.getNombreCompra()%>"><%=descList.getNombreCompra().toUpperCase()%></option>
                                       	<%}}}}; 
                                           %>
                                        </select>
                                      </div>                                      
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-9 col-md-19">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.2 LIMITE DE PRESENTACION: ESTA OFERTA PUEDE SER PRESENTADA HASTA LAS</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                      <div class="form-group">
                                        <input autocomplete="off" type="time" class="form-control" id="horaLimiteView" name="horaLimiteView" placeholder="" alue="${horaLimite}" required <%=read%>/>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-1 col-md-1" style="padding: 0px 0px 0px 15px !important;">
                                      <div class="form-group" style="text-align: left;">
                                        <label>DEL DIA</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                        <input autocomplete="off" type="date" class="form-control" id="fechaLimiteView" name="fechaLimiteView" placeholder="" value="${fechaLimite}" required  <%=read%>/>
                                      </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                      <div class="form-group" style="text-align: left;">
                                        <label>TODA OFERTA, FUERA DE ESTE PLAZO NO SERA ACEPTADA.</label>
                                      </div>
                                    </div>
                                  </div>
                                 
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.3 LA FECHA DE APERTURA DE ESTA OFERTA ES:</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                        <input autocomplete="off" type="date" class="form-control" id="fechaAperturaView" name="fechaAperturaView"  placeholder="" value="${fechaApertura}" required <%=read%>/>
                                      </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2" style=" padding: 0px 15px 0px 0px !important;">
                                      <div class="form-group">
                                        <label>A LAS </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-3 col-md-3">
                                      <div class="form-group">
                                        <input autocomplete="off" type="time" class="form-control" id="horaAperturaView" name="horaAperturaView" placeholder="" value="${horaApertura}" required <%=read%>/>
                                      </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2">
                                      <div class="form-group" style="text-align: left;">
                                        <label>EN EL LUGAR</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                      <div class="form-group">
                                        <select autocomplete="off" class="form-control" id="lugar" name="lugar" required <%=disable%>>
                                        <option disabled value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                        <%
                                       if(accion != null){                                          
                                     	ArrayList<lugarApertura> lugarAperturaList = (ArrayList<lugarApertura>) request.getAttribute("lugarList");
                                        if (lugarAperturaList != null)
                                            {
                                              for(lugarApertura lugarAList : lugarAperturaList){
                                              if(!accion.contentEquals("nuevo")){
                                       			 String l = (String)request.getAttribute("lugar");
                                       			  if(lugarAList.getLugarApertura().contentEquals(l)){%>
                                           			<option selected value="<%=lugarAList.getLugarApertura()%>"><%=lugarAList.getLugarApertura().toUpperCase()%></option>
                                              <%}else{%>
                                           			<option value="<%=lugarAList.getLugarApertura()%>"><%=lugarAList.getLugarApertura().toUpperCase()%></option>
                                           		<%}}
                                       		  else{%>
                                       			  <option value="<%=lugarAList.getLugarApertura()%>"><%=lugarAList.getLugarApertura().toUpperCase()%></option>
                                       	<%}}}}; 
                                           %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                 
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.4 EL PERIODO DE VALIDEZ DE LA OFERTA PARA SU ACEPTACION POR BANCOCCI (EL FIDUCIARIO) SERA DE</label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-2 col-md-2">
                                      <div class="form-group">
                                        <input autocomplete="off" type="number" min="1" max="120" class="form-control" id="periodoValidez" name="periodoValidez" placeholder=""  value="${periodoValidez}" required <%=read%>/>
                                      </div>
                                    </div>
                                    <div class="col-lg-10 col-md-10">
                                      <div class="form-group" style="text-align: left;">
                                        <label>DIAS CALENDARIOS A PARTIR DE LA FECHA DE APERTURA DE LA OFERTA.</label>
                                      </div>
                                    </div>
                                  </div>                               
                                  
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group" style="text-align: left;">
                                        <label>1.5 LA FECHA DE PUBLICACION DE ESTA OFERTA ES: </label>
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                        <input autocomplete="off" type="date" class="form-control" id="fechaPublicacion" name="fechaPublicacion" placeholder="" value="${fechaPublicacion}" required <%=read%>/>
                                      </div>
                                    </div>
                                  </div>
                                 
                                                                 
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <h6 style="font-weight: bold;"><strong>2.DOCUMENTACION DEL REQUERIMIENTO DE COMPRA</strong></h6>
                                      </div>
                                    </div>
                                  </div>
                                
                                  <div class="row">
                                    <div class="col-lg-3 col-md-3">
                                      <div class="form-group" style="text-align: left;">
                                        <label>2.1 BENEFICIARIOS</label>
                                        <button class="btn btn-sm btn-success ml-3" data-target="#benFinalModal" data-toggle="modal" type = "button" id="benFinalParamModalButton" <%=disable%>>
                                          <i class="material-icons md-18">list</i> VINCULAR <br/> OFICIO-BENEFICIARIO
                                        </button>
                                        <button type = "button" class="btn btn-sm btn-success ml-3" id="deletRegButton"<%=disable%>>
                                          <i class="material-icons md-18">delete</i> ANULAR OFICIO
                                        </button>
                                      </div>
                                    </div>
                                    
                                   <div class="col-lg-9 col-md-9">
                                   
                                   <div class="col-lg-2 col-md-2">
                                      <div class="form-group" style="text-align: left;">
                                        <label>BENEFICIARIO</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                      <div class="form-group">
                                        <select autocomplete="off" class="form-control" id="idBeneficiario" name="idBeneficiario" required <%=disable%>>
                                        <option disabled value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                        <%
                                       if(accion != null){                                          
                                     	ArrayList<distribuidor> beneficiariosList = (ArrayList<distribuidor>) request.getAttribute("beneficiarios");
                                        if (beneficiariosList != null)
                                            {
                                              for(distribuidor benficiario : beneficiariosList){
                                              if(!accion.contentEquals("nuevo")){
                                       			 String l = (String)request.getAttribute("lugar");
                                       			  if(benficiario.getId() == Integer.parseInt(l)){%>
                                           			<option selected value="<%=benficiario.getId()%>"><%=benficiario.getDenominacion().toUpperCase()%></option>
                                              <%}else{%>
                                           			<option value="<%=benficiario.getId()%>"><%=benficiario.getDenominacion().toUpperCase()%></option>
                                           		<%}}
                                       		  else{%>
                                       			  <option value="<%=benficiario.getId()%>"><%=benficiario.getDenominacion().toUpperCase()%></option>
                                       	<%}}}}; 
                                           %>
                                        </select>
                                      </div>
                                    </div>
                                   
                                   
                                      <div class="form-group">
                                        <table id="benFinalTable" class="table table-bordered w-100 mb-0 table-aditional-styles" aria-describedby="Tabla de Beneficiarios y Oficios">
                                          <thead>
                                            <tr>
                                              <th class="all">ID</th>
                                              <th class="min-tablet">NO. OFICIO</th>
                                              <th class="min-tablet">OFICIO CARGADO</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                       					            
                       				<%
                                       if(accion != null){                                          
                                     	ArrayList<Gral_oficioBeneficiario> oficiosList = (ArrayList<Gral_oficioBeneficiario>) request.getAttribute("beneficiarios");
                                        if (oficiosList != null)
                                            {
                                        	 if(!accion.contentEquals("nuevo")){
                                              for(Gral_oficioBeneficiario oficio : oficiosList){
                                            	  %>
                                            	  <tr>
                                                    <td><%=oficio.getIdOficioBeneficiario()%></td>
                                                     <td><%=oficio.getOficio()%></td>
                                                    <td><a href="assets/files/buyProcessALPFiles/legalDocumentForBeneficiary/<%=oficio.getnombreArchivo()%>" target="_blank"><%=oficio.getnombreArchivo()%></td>
                                                    </tr>
                                            	  <%
                                              }}}}; 
                                           %>
                       					          
                                          </tbody>
                                        </table>
                                        <!--Ben Final Table Section ends-->
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!--DATA Section ends-->
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
                <!-- Submit Float Button -->
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                  <button id="submit" style="display: none;" type="submit" name="submit"></button>
                  <button id="submitExternalButton" class="btn btn-primary btn-rounded shadow main-font" type="button" value="guardar">
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

    <!--Ben Final Modal-->
    <div class="modal fade main-font" id="benFinalModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-xl modal-dialog-centered" style="max-width: 100%;padding-left: 15%;padding-right: 15%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close" onclick="limpiariframe();"><span aria-hidden="true" class="">x</span></button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">BENEFICIARIOS PARAMETRIZADOS DISPONIBLES</h1>
                <h4 id="subtitleChange" class="mb-5 text-white font-weight-light">AGREGAR A LOS DATOS DE APERTURA</h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center; background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">  SELECCIONE LOS BENEFICIARIOS A AGREGAR:</h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-4 col-md-4">
                                <div class="form-group" style="text-align: right;"> <label>OFICIO DE SOLICITUD</label></div>
                              </div>
                              <div class="col-lg-6 col-md-6">
                                <div class="form-group">
                                  <input autocomplete="off" type="text" class="form-control" id="oficio" name="oficio" placeholder="" value="" required/>
                                </div>
                              </div>
                              <div class="col-lg-2 col-md-2">
                                <div class="form-group" style="text-align: right;">
                                <button id="botonsubir" class="btn btn-sm btn-success ml-2">SUBIR ARCHIVO</button>
                                </div>
                              </div> 
                            </div>
                          </div>
                          <div class="row">                          
                            <div class="col-md-12">
                                <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                      <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                      <p>SELECCIONE EL ARCHIVO A PREVISUALIZAR</p>
                                    </div>
                                    <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml" height="520" class="container-fluid hide"><p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p></iframe>
                                  </div>
                                </label>
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
                    <button type="button" id="cancelButton" onclick="limpiariframe();" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">CANCELAR</button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button id="submitParamBens" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">GUARDAR</button>
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
    
    <!--Custom New Modal-->

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
	  var archivos="";	 
      var contador=0;     
      
      function limpiariframe(){
          var iframe = document.getElementById("previewDocumentInput");
            var html = "";

            iframe.contentWindow.document.open();
            iframe.contentWindow.document.write(html);
            iframe.contentWindow.document.close();
      	    $("#archivos").val("");
      }
      
      $(document).ready(function () {
    	  
    	  <%
    	  String error = (String)request.getAttribute("mostrarmensaje");
    	  if(error != null && !error.isEmpty()){   	
    		 
    		  if(error.contentEquals("PROCESOFALSE") ){
    			  %>
        		  $("#confirMessage").text("ALERT! EL NUMERO DE PROCESO DE COMPRA SELECCIONADO ENTRO EN USO HACE UNOS MOMENTOS, POR FAVOR SELECCIONE OTRO");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }else if(error.contentEquals("RTNExiste") )
    		  {
    			  
    			  %>
        		  $("#confirMessage").text("ERROR! AL REGISTRAR POR FAVOR INTENTE DE NUEVO O CONTACTE AL ADMINISTRADOR");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }
    	  }
    	  %>
    	  

        /* Preparativos iniciales*/
       
    	  var container = document.getElementById("newEditRegForm")
			  
		    var inputPT = document.createElement("input");
	      inputPT.setAttribute("type", "hidden");
	      inputPT.setAttribute("name", "projectPath");
	      inputPT.setAttribute("value", getAbsolutePath());
	      container.appendChild(inputPT);

        /*Tabla de Beneficiarios Finales del Documento*/
        var reqTable = $("#benFinalTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: false,
          pageLength: 3,
          columnDefs: [
            {
			  targets: 2,
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
        
        $("#botonsubir").click(function () {        	
              var container = document.getElementById("newEditRegForm")
              var inputPT = document.createElement("input");
              inputPT.setAttribute("type", "file");
              inputPT.setAttribute("name", "oficioFiles_"+document.getElementById("oficio").value);
              inputPT.setAttribute("id", "oficioFiles_"+document.getElementById("oficio").value);
              inputPT.setAttribute("style","display:none");
              container.appendChild(inputPT);
              $("#oficioFiles_"+document.getElementById("oficio").value).trigger('click');
              $("#oficioFiles_"+document.getElementById("oficio").value).change(function(){
        		  if(!this.files.length == 0){
        			  $("#archivos").val("HAYARCHIVO");
					  var extencionArchivo = inputPT.value;    				  
    				  var separaNombreDoc = extencionArchivo.split('.');    				  
    				  var formarDocumento = separaNombreDoc[separaNombreDoc.length - 1];
    				  
    				  $("#MyFormatDocument").val(formarDocumento);
        		  }
        		  else{
        			  $("#archivos").val("NOHAYARCHIVO");
        		  }
      		   
      	  });
        });
         

        $("#submitParamBens").click(function(){       	
          var oficio = document.getElementById("oficio").value;
          var archivo = document.getElementById("archivos").value;
          
          
          if(oficio!="" && oficio!=null ){
        	  if(archivo=="HAYARCHIVO"){
        		  
        		  var tbody = document.getElementById("benFinalTable").getElementsByTagName("TBODY")[0];
                  var row = document.createElement("TR")
                  var td1 = document.createElement("TD")
                  td1.appendChild(document.createTextNode(0))
                  var td2 = document.createElement("TD")
                  td2.appendChild (document.createTextNode(oficio))
                  var td3 = document.createElement("TD")
                  td3.appendChild(document.createTextNode("NO DISPONIBLE"))
                
                  row.appendChild(td1);
                  row.appendChild(td2);
                  row.appendChild(td3);
                 
                  reqTable.row.add(row).draw();
        		  
        		  //document.getElementById("benFinalTable").insertRow(-1).innerHTML = '<td>'+0+'</td><td>'+oficio+'</td><td>'+oficio+ "."+document.getElementById("MyFormatDocument").value+'</td>';
                  
                  var iframe = document.getElementById("previewDocumentInput");
                  var html = "";

                  iframe.contentWindow.document.open();
                  iframe.contentWindow.document.write(html);
                  iframe.contentWindow.document.close();
            	    $("#archivos").val("");
        	  }
        	  else{
        		  alert("INGRESE EL ARCHIVO");
        	  }
  		   
        	}
          else{
            alert("INGRESE EL OFICIO")
          }
  	    }); 
        
     
        $('#submitExternalButton').click(function (){
  		  var container = document.getElementById("newEditRegForm");
  		  var table = document.getElementById('benFinalTable');
  		    if(reqTable.data().any()){
  		    	for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
                var cell = reqTable.row(r).data();
					console.log(cell)
  		          var inputPT = document.createElement("input");
  			        inputPT.setAttribute("type", "hidden");
  			        inputPT.setAttribute("name", "idOficioBeneficiarioTB");
  			        inputPT.setAttribute("value", cell[0]);
  			        container.appendChild(inputPT);
  			        
  			        var inputBF = document.createElement("input");
  			        inputBF.setAttribute("type", "hidden");
  			        inputBF.setAttribute("name","OficioTB");
  			      	inputBF.setAttribute("value",cell[1]);
  			      	container.appendChild(inputBF);

                var inputBC = document.createElement("input");
  			        inputBC.setAttribute("type", "hidden");
  			        inputBC.setAttribute("name","nombreArchivoTB");
  			      	inputBC.setAttribute("value",cell[2]);
  			      	container.appendChild(inputBC);
  		    	}
  		    }
  		    
  		    
            		   
  		   document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
      	  document.getElementById("submit").click();  
        });
        
        $("#benFinalTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          const rowSelected = $(this);
          $("#deletRegButton").on("click", function (event) {
            event.preventDefault();
            reqTable.row(rowSelected).remove().draw();
	        });
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
        
        
      });
     
      
      /* $("#oficio").on("change", function (e){
    	  var ofi = $("#oficio").val();
          if(ofi){
          	document.getElementById("hayOfi").style.display = "inline";
          	document.getElementById("noHayOfi").style.display = "none";
          }
          else{
          	document.getElementById("hayOfi").style.display = "none";
          	document.getElementById("noHayOfi").style.display = "inline";
          }
      }); */
      
      /* $("#uploadFileButton").on("click", function (e) {
        $("#oficio").trigger("click");
        var ofi = $("#oficio").val();
        if(ofi){
        	document.getElementById("hayOfi").style.display = "inline";
        	document.getElementById("noHayOfi").style.display = "none";
        }
        else{
        	document.getElementById("hayOfi").style.display = "none";
        	document.getElementById("noHayOfi").style.display = "inline";
        }
      }); */
      
      $('#upload').click(function (){
      	var url = getAbsolutePath() + "fileLoader" + "?noProcesoCompra=" +$('#purchaseNum').val()+"&oficioCOD="+$('#legalRequestCod').val()+"&submit=insert";
      	
      	var sampleFile = document.getElementById("oficio").files[0];

        var formdata = new FormData();


        formdata.append("oficio", sampleFile);

        var xhr = new XMLHttpRequest();       

        xhr.open("POST",url, true);

        xhr.send(formdata);

        xhr.onload = function(e) {

            if (this.status == 200) {
               alert("Oficio subido exitosamente!");
            }
            else{
            	alest("ERROR: No se pudo subir el oficio");
            }

        }; 
      
      <%
	  if(accion != null && !accion.contentEquals("nuevo")){
	  %>
      /*Load File*/
     $('#verOficio').click(function (){
    	var url = getAbsolutePath() + "fileLoader" + "?noProcesoCompra=" +$('#purchaseNum').val()+"&oficio="+$('#legalRequestCod').val();
    	 var xhr = new XMLHttpRequest();
    	 xhr.open('POST', url, true);
    	 xhr.responseType = 'arraybuffer';
    	 xhr.onload = function () {
    	     if (this.status === 200) {
    	         var filename = "";
    	         var disposition = xhr.getResponseHeader('Content-Disposition');
    	         if (disposition && disposition.indexOf('attachment') !== -1) {
    	             var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
    	             var matches = filenameRegex.exec(disposition);
    	             if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
    	         }
    	         var type = xhr.getResponseHeader('Content-Type');

    	         var blob;
    	         if (typeof File === 'function') {
    	             try {
    	                 blob = new File([this.response], filename, { type: type });
    	             } catch (e) { /* Edge */ }
    	         }
    	         if (typeof blob === 'undefined') {
    	             blob = new Blob([this.response], { type: type });
    	         }

    	         if (typeof window.navigator.msSaveBlob !== 'undefined') {
    	             // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
    	             window.navigator.msSaveBlob(blob, filename);
    	         } else {
    	             var URL = window.URL || window.webkitURL;
    	             var downloadUrl = URL.createObjectURL(blob);

    	             if (filename) {
    	                 // use HTML5 a[download] attribute to specify filename
    	                 var a = document.createElement("iframe");
    	                 // safari doesn't support this yet
    	                 if (typeof a.download === 'undefined') {
    	                	 a.src = downloadUrl;
    	                     a.title = filename;
							
    	                	 window.open(downloadUrl);
    	                 } else {
    	                     a.src = downloadUrl;
    	                     a.title = filename;
    	                     var win = window.open();
    	                     win.document.write(a);
    	                     //a.download = filename;
    	                     //document.body.appendChild(a);
    	                     //a.click();
    	                 }
    	             } else {
    	                 window.location.href = downloadUrl;
    	             }

    	             setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
    	         }
    	     }
    	 };
    	 xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    	 xhr.send();
      });
      <%
	  }
      
      %>
      });
      
      $(function(){
    	  $("input[id^='chk_']").on("click",function(){
		  $("input[id^='chk_']").not(this).prop('checked', false);
			});
		});
      
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
