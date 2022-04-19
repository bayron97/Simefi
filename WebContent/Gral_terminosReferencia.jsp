<%@page import="main.model.Gral_terminosReferencia"%>
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


    <!--Styles Area Ends-->
    <style>
    	#documentpurchaseprocess th:nth-child(1){
			   display: none;
			}
		#documentpurchaseprocess td:nth-child(1){
			   display: none;
			}
		#documentpurchaseprocess th:nth-child(2){
		   display: none;
		}
		#documentpurchaseprocess td:nth-child(2){
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
              <form action ="pcGeneralRouting" method="post">
                <!-- Submenu section starts -->
                <nav class="navbar col-12 main-font">
                <input class="hide" type="submit" name="nextJsp" value ="apertura" id="aper"/>
                <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest"/>
                <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                <input class="hide" type="submit" name="nextJsp" value ="requerimientos" id="req"/>
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <button  class="btn dropdown-toggle btn-sm btn-primary" type="button"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">SECCIONES</button>
                    <div class="dropdown-menu">
                      <label class="dropdown-item" for="aper">DATOS DE APERTURA</label>
                      <label class="dropdown-item" for="criteria">CRITERIOS DE EVALUACION</label>
                      <label class="dropdown-item" for="req" >VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                      <label class="dropdown-item" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                      <a class="dropdown-item active" href="#">TERMINOS DE REFERENCIA</a>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item"><label class="nav-link" for="aper">DATOS DE APERTURA</label></li>
                  	<li class="nav-item"><label class="nav-link" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label></li> 
                    <li class="nav-item"><label class="nav-link" for="listaest">LISTA DE REQUERIMIENTO</label></li>
                    <li class="nav-item"><a class="nav-link active" href="#">TERMINOS DE REFERENCIA</a></li>
                  </ul>
                </nav>
                </form>
             </div>
             </div>
            </div>
                <!-- Submenu section ends -->
        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            <%
              String read = (String)session.getAttribute("read"); 
              String disable = (String)session.getAttribute("disable");
              String accion = (String)session.getAttribute("accion");             
              String type = (String)session.getAttribute("t");
              
              String estado = (String)session.getAttribute("estado");
             //int id = (int)session.getAttribute("noCompra");
              String Modal="";
              
              String noProcesoCompra=(String)session.getAttribute("numProcesoCompra");
              String observaciones=(String)session.getAttribute("observaciones");
              
              System.out.println("noProcesoCompra "+ noProcesoCompra);
              System.out.println("observaciones "+ observaciones);
              
              
              if(estado.contentEquals("EN PROCESO") || estado.contentEquals("RECHAZADO")){
            	  Modal="AprobacionModal";
              }
              else if(estado.contentEquals("EN REVISION")){
            	  Modal="AprobacionCorreccionModal";
              }
              
              
              

            
            
            %>
            <form id="digForm" method="post" action="Gral_indexAperturaProcesoServlet" enctype="multipart/form-data">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;"><img src="./assets/img/BAC_LOGIN.png" alt="" /> </div>
                <div class="text-center pb-5">
                  <h1 class="mb-0 text-white">PROCESO DE COMPRA A LARGO PLAZO </h1>
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
                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div class="card-body text-center" style=" background: url(./assets/img/BAC.png) center center fixed;">
                        <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">assignment</i>
                        <h5 id="instructionSubtitle" class="mb-3 text-center"style="font-weight: bold;">TERMINOS DE REFERENCIA:</h5>
                        <div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                                <!--DATA Section-->
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
                                
                                <div id="dataSection">
                                <% if (accion.toUpperCase().contentEquals("NUEVO") || accion.toUpperCase().contentEquals("MODIFICAR")) {%>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-right">
                                        <!--label class="btn btn-sm btn-success text-white">SUBIR ARCHIVO: </label-->
                                        <button class="btn btn-sm btn-success ml-3" data-target="#documentsModal" data-toggle="modal" type = "button" id="benFinalParamModalButton">SUBIR ARCHIVO: </button>
                                      </div>
                                    </div>
                                  </div>
                                <% } %>
                                  <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                      	<input type="hidden" id="archivos" />
                                      	<input type="hidden" id="MyFormatDocument" />
                                        <!--Ben Final Table Section starts-->
                                        <table id="documentpurchaseprocess" class="table table-bordered w-100 mb-0 table-aditional-styles" aria-describedby="Tabla de Beneficiarios y Oficios">
                                          <thead>
                                            <tr>
                                              <th class="all">ID SESION</th>
                                              <th class="all">ID</th>
                                              <th class="min-tablet">DESCRIPCION ARCHIVO</th>
                                              <th class="min-tablet">ARCHIVO</th>
                                              <th class="min-tablet">ACCIONES</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                                          
                                           <%if(accion != null){                                          
                                     	ArrayList<Gral_terminosReferencia> terminoList = (ArrayList<Gral_terminosReferencia>) request.getAttribute("terminos");
                                        if (terminoList != null)
                                            {
                                              for(Gral_terminosReferencia termino : terminoList){
                                             %>
                                           		<tr>
                                           			<td>-1</td>
                                                    <td><%=termino.getIdterminosReferencia()%></td>
                                                    <td><%=termino.getDescripcion()%></td>
                                                    <td><%=termino.getNombreDocumento()%></td>                                                    
                                                    <td>
                                                    <button class="btn btn-sm btn-success previewButton" title="MOSTRAR" onclick="event.preventDefault();" value="assets/files/buyProcessGeneralFiles/digitizedDocument/<%=termino.getNombreDocumento()%>">
                                                      <i class="material-icons">receipt</i>
                                                    </button>
                                                    <a class="btn btn-sm btn-success" target="_blank" title="EXPORTAR" href="assets/files/buyProcessGeneralFiles/digitizedDocument/<%=termino.getNombreDocumento()%>">
                                                      <i class="material-icons">input</i>
                                                    </a></td>                                          	
                                                   </tr>
                                             <%}}}; 
                                           %>
                                          
                       					            <%-- <%
                       					              if(accion != null && !accion.contentEquals("nuevo")){
                       						              try{ 
                                                  Connection con = null;
                                                  Statement state = null;
                                                  ResultSet rs = null;
                                                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                  con = DriverManager.getConnection(url,"admin","system123");
                                                  state = con.createStatement();
                                                  int buyCod = 0;
                                                  if(id > 0 ){
                                                    buyCod = id;
                                                  }
                                                  String QueryString = "select * from dbo.digitizedDocumentsForALP where buyProcessID = " + buyCod;
                                                  rs = state.executeQuery(QueryString); %> 
                                                  <% while(rs.next()){ %>
                                                	<tr>
                                                    <td>-1</td>
                                                    <td><%=rs.getInt(1)%></td>
                                                    <td><%=rs.getString(4).toUpperCase()%></td>
                                                    <td><%=rs.getString(3).toUpperCase()%></td>
                                                    <td>
                                                    <button class="btn btn-sm btn-success previewButton" title="MOSTRAR" onclick="event.preventDefault();" value="assets/files/buyProcessALPFiles/digitizedDocument/<%=rs.getString(3)%>">
                                                      <i class="material-icons">receipt</i>
                                                    </button>
                                                    <a class="btn btn-sm btn-success" target="_blank" title="EXPORTAR" href="assets/files/buyProcessALPFiles/digitizedDocument/<%=rs.getString(3)%>">
                                                      <i class="material-icons">input</i>
                                                    </a></td>
                                                  </tr>
                                                <%} 
                                                  rs.close();
                                                  state.close();
                                                  con.close();
                                                }catch(Exception e){System.out.println(e);}
                       				                }%> --%>
                                          </tbody>
                                        </table>
                                        <!--Ben Final Table Section ends-->
                                      </div>
                                    </div>
                                    
                                    <div class="col-lg-4 col-md-4">
                                      <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                            <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                            <p>SELECCIONE EL ARCHIVO A PREVISUALIZAR </p>
                                          </div>
                                          <iframe title="document preview" src="" id="previewDocumentInput1" name="SubHtml" height="520" class="container-fluid hide"><p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p></iframe>
                                        </div>
                                      </label>
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
                 <%if(accion.contentEquals("modificar") || accion.contentEquals("nuevo") || accion.contentEquals("revisar")){%>
                 <button type="button" class="btn btn-primary btn-rounded shadow main-font" id="submitExternalButton" name="submitExternalButton" value="guardar" data-target="#<%=Modal%>" data-toggle="modal"> <span>GUARDAR</span><i class="material-icons vm">done</i></button>
                  <%} else{%>
                 <button type="button" style="display: none;" class="btn btn-primary btn-rounded shadow main-font" id="submitExternalButton" name="submitExternalButton" value="consultar" data-target="#<%=Modal%>" data-toggle="modal"><span>FINALIZAR</span><i class="material-icons vm">done</i></button> 
                 <button id="submitaprobacion" value="" class="btn btn-primary btn-rounded shadow main-font" data-dismiss="modal" aria-label="Close" ><span>FINALIZAR</span><i class="material-icons vm">done</i></button>
                <%}%>                  
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

    <!-- Modal Subida de archivos-->
    <div class="modal fade main-font" id="documentsModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close" onclick="limpiariframe();"><span aria-hidden="true" class="">x</span></button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">SUBIR ARCHIVO</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">INGRESE LOS DATOS</h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-10 col-md-10">
                                <div class="form-group">
                                  <label>NOMBRE DEL ARCHIVO</label>
                                  <input autocomplete="off" type="text" class="form-control" id="namedocument" name="namedocument" placeholder="" value="" required/>
                                </div>
                              </div>
                              <div class="col-lg-2 col-md-2">
                                <div class="form-group" style="text-align: right;">
                                <button id="botonsubir" class="btn btn-sm btn-success ml-2">SUBIR ARCHIVO </button>
                                </div>
                              </div> 
                               <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                <label>DESCRIPCION DEL ARCHIVO</label>
                                <input autocomplete="off" type="text" class="form-control" id="descriptiondocument" name="descriptiondocument" placeholder="" value="" required/>
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
                                    <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml" height="520" class="container-fluid hide">
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
              </div>
            </div>
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-6 text-center">
                    <button type="button" id="cancelButton" onclick="limpiariframe();" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button id="submitParamBens" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      GUARDAR
                    </button>
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
    <!-- End Modal Subida de Archivos-->
    <!-- Modal Aprobacion de Proceso de Compra-->
    <div class="modal fade main-font" id="AprobacionModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--Aprobacion Param starts-->
        <div id="AprobacionContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">SOLICITAR APROBACION</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">&iquest;ESTA SEGURO QUE DESEA ENVIAR A APROBACION?</h5>
                      <p>UNA VEZ ENVIADO, YA NO SE PODRA MODIFICAR EL PROCESO DE COMPRA</p>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>CODIGO DE PROCESO</label>
                            <input autocomplete="off" type="text" class="form-control" id="processID" name="procesID" value="<%=noProcesoCompra%>" required readonly/>
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
                  <div class="col-12 col-md-4 text-center">
                    <button type="button" id="cancelButton" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitenviar" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-sm btn-success">
                      GUARDAR Y SEGUIR MODIFICANDO
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitaprobacion" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-sm btn-success">
                      GUARDAR Y ENVIAR A APROBACION
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--Aprobacion Param ends-->
      </div>
    </div>
    <!-- End Modal Aprobacion Proceso de Compra-->
    <!-- Modal AprobacionCorreccion de Proceso de Compra-->
    <div class="modal fade main-font" id="AprobacionCorreccionModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--AprobacionCorreccion Param starts-->
        <div id="AprobacionCorreccionContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">APROBACION DE PROCESO DE COMPRA</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">&iquest;ESTA SEGURO DE APROBAR EL PROCESO DE COMPRA?</h5>
                      <p>UNA VEZ APROBADO, YA NO SE PODRA MODIFICAR EL PROCESO DE COMPRA</p>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>CODIGO DE PROCESO</label>
                            <input autocomplete="off" type="text" class="form-control" id="processID" name="procesID" value="<%=noProcesoCompra%>" placeholder="" required readonly/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>OBSERVACIONES</label>
                            <textarea  autocomplete="off" type="text" class="form-control" id="obsApert" name="obsApert" value="<%=observaciones%>" placeholder="" style="min-height: 40px; height: 40px;"></textarea>
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
                  <div class="col-12 col-md-4 text-center">
                    <button type="button" id="cancelButton" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitaprobar" value="" onclick="actualizarestado('APROBADO');" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      APROBAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitrechazar" value="" onclick="actualizarestado('RECHAZADO')" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      RECHAZAR
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--AprobacionCorreccion Param ends-->
      </div>
    </div>
    <!-- End Modal AprobacionCorreccion Proceso de Compra-->
    <!-- Modal Section ends-->

<div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-5"><img src="./bancoccicon.png" alt=""></figure>
              <div class="modal-body main-font mt-2" id="confirMessage">-DESCRIPCION MOTIVO DE LA MODAL-</div>
              <div>
                <button  class="btn btn-primary btn-block main-font" id="confirModalButton" data-dismiss="modal">
                ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
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

      function actualizarestado(newestado){
    	  var hoy=new Date();
    	  var fecha=hoy.getDate()+'-'+(hoy.getMonth()+1)+'-'+hoy.getFullYear();
    	  var hora=hoy.getHours()+':'+hoy.getMinutes()+':'+hoy.getSeconds();
    	  var fechaYHora=fecha+' '+hora;
    	  
          var container = document.getElementById("digForm");
          var inputES = document.createElement("input");
          inputES.setAttribute("type", "hidden");
          inputES.setAttribute("name","estado");
          inputES.setAttribute("value",newestado);
          container.appendChild(inputES);

          var observacion=$("#obsApert").val();
          var container = document.getElementById("digForm");
          var inputOB = document.createElement("input");
          inputOB.setAttribute("type", "hidden");
          inputOB.setAttribute("name","observaciones");
          inputOB.setAttribute("value",observacion);
          container.appendChild(inputOB);
		  
          var inputPC = document.createElement("input");
	      inputPC.setAttribute("type", "hidden");
	      inputPC.setAttribute("name","noProcCompra");
	      inputPC.setAttribute("value","<%=noProcesoCompra%>");
	      container.appendChild(inputPC);
	      
	      var inputF = document.createElement("input");
	      inputF.setAttribute("type", "hidden");
	      inputF.setAttribute("name","fecha");
	      inputF.setAttribute("value",fechaYHora);
	      container.appendChild(inputF);
          
          document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
          document.getElementById("submit").click();

      }

      $(document).ready(function () {

      /* Preparativos iniciales*/

      var container = document.getElementById("digForm")

      var inputPT = document.createElement("input");
      inputPT.setAttribute("type", "hidden");
      inputPT.setAttribute("name", "projectPath");
      inputPT.setAttribute("value", getAbsolutePath());
      container.appendChild(inputPT);

      /*Tabla de Beneficiarios Finales del Documento*/
      var reqTable = $("#documentpurchaseprocess").DataTable({
        responsive: true,
        searching: true,
        bLengthChange: false,
        pageLength: 6,
        columnDefs: [
          {
            targets: 3,
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
          
          if(reqTable.data().length == 0){
      		  contador = 0;
      	  }else{
      		  contador = reqTable.data().length;
      	  }
      	  
          
          
          var container = document.getElementById("digForm")
          var inputPT = document.createElement("input");
          inputPT.setAttribute("type", "file");
          inputPT.setAttribute("name", "oficioFiles_"+contador);
          inputPT.setAttribute("id", "oficioFiles_"+contador);
          inputPT.setAttribute("style","display:none");
          container.appendChild(inputPT);
          $("#oficioFiles_"+contador).trigger('click');
          $("#oficioFiles_"+contador).change(function(){
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
        debugger
        
        var fomateoDocumento = document.getElementById("MyFormatDocument").value;
        var nombredeDocumento = document.getElementById("namedocument").value;
        
        var nombrearchivo =nombredeDocumento+"."+fomateoDocumento;
        var descripcionarchivo = document.getElementById("descriptiondocument").value;
        var arch = document.getElementById("archivos").value;
        if(nombrearchivo!="" && nombrearchivo!=null || descripcionarchivo!="" && descripcionarchivos!=null){
        	if(arch=="HAYARCHIVO"){
                var tbody = document.getElementById("documentpurchaseprocess").getElementsByTagName("TBODY")[0];
                var row = document.createElement("TR")
                var td1 = document.createElement("TD")
                td1.appendChild(document.createTextNode(contador))
                var td2 = document.createElement("TD")
                td2.appendChild (document.createTextNode(""))
                var td3 = document.createElement("TD")
                td3.appendChild(document.createTextNode(descripcionarchivo.toUpperCase()))
                var td4 = document.createElement("TD")
                td4.appendChild (document.createTextNode(nombrearchivo.toUpperCase()))
                var td5 = document.createElement("TD")
                td5.appendChild (document.createTextNode("NO DISPONIBLE"))
                row.appendChild(td1);
                row.appendChild(td2);
                row.appendChild(td3);
                row.appendChild(td4);
                row.appendChild(td5);
                reqTable.row.add(row).draw();
                $("#namedocument").val("");
                $("#MyFormatDocument").val("");
                $("#descriptiondocument").val("");
                var iframe = document.getElementById("previewDocumentInput");
                var html = "";
                iframe.contentWindow.document.open();
                iframe.contentWindow.document.write(html);
                iframe.contentWindow.document.close();
        	}
        	else{
                $("#confirmationModalCenter").modal('show');				 				 
				 $("#confirMessage").text("INGRESE EL ARCHIVO...");
				 
        	}
        }
        else{
          $("#confirmationModalCenter").modal('show');				 				 
			 $("#confirMessage").text("INGRESE LOS DATOS SOLICITADOS...");
        }
      }); 

      $('#submitenviar').click(function (){
    	debugger
      var container = document.getElementById("digForm");
      var table = document.getElementById('documentpurchaseprocess');
      //console.log(table.rows[2].cells[1].innerHTML);
        if(reqTable.data().any()){
          for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();

              var inputPT = document.createElement("input");
              inputPT.setAttribute("type", "hidden");
              inputPT.setAttribute("name", "nombresarchivos");
              inputPT.setAttribute("value", cell[3]);
              container.appendChild(inputPT);
              
              var inputBF = document.createElement("input");
              inputBF.setAttribute("type", "hidden");
              inputBF.setAttribute("name","descripcionesarchivos");
              inputBF.setAttribute("value",cell[2]);
              container.appendChild(inputBF);

              var inputBC = document.createElement("input");
              inputBC.setAttribute("type", "hidden");
              inputBC.setAttribute("name","iddocumentos");
              inputBC.setAttribute("value",cell[0]);
              container.appendChild(inputBC);

              
          }
        }
        var inputES = document.createElement("input");
        inputES.setAttribute("type", "hidden");
        inputES.setAttribute("name","estado");
        inputES.setAttribute("value","EN PROCESO");
        container.appendChild(inputES);
        document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
        document.getElementById("submit").click();
      });
	  
      $('#submitaprobacion').click(function (){
    	debugger
      var container = document.getElementById("digForm");
      var table = document.getElementById('documentpurchaseprocess');
      //console.log(table.rows[2].cells[1].innerHTML);
        if(reqTable.data().any()){
          for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();

              var inputPT = document.createElement("input");
              inputPT.setAttribute("type", "hidden");
              inputPT.setAttribute("name", "nombresarchivos");
              inputPT.setAttribute("value", cell[3]);
              container.appendChild(inputPT);
              
              var inputBF = document.createElement("input");
              inputBF.setAttribute("type", "hidden");
              inputBF.setAttribute("name","descripcionesarchivos");
              inputBF.setAttribute("value",cell[2]);
              container.appendChild(inputBF);

              var inputBC = document.createElement("input");
              inputBC.setAttribute("type", "hidden");
              inputBC.setAttribute("name","iddocumentos");
              inputBC.setAttribute("value",cell[0]);
              container.appendChild(inputBC);

             
          }
        }
        var inputES = document.createElement("input");
        inputES.setAttribute("type", "hidden");
        inputES.setAttribute("name","estado");
        inputES.setAttribute("value","EN REVISION");
        container.appendChild(inputES);
        
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

      $("button.previewButton").on('click', function(e) {
          const TmpPath = getAbsolutePath() + $(this).val();
          $("#previewDocumentInput1").prop("src",TmpPath);
          $("#previewDocumentInput1").removeClass("hide");
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
      <% if(estado.contentEquals("APROBADO")){ %>
	  $('#submitExternalButton').click(function (){
		  var container = document.getElementById("digForm");
	      var inputES = document.createElement("input");
	      inputES.setAttribute("type", "hidden");
	      inputES.setAttribute("name","estado");
	      inputES.setAttribute("value","APROBADO");
	      container.appendChild(inputES);
	      
		  document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
	      document.getElementById("submit").click();
	  });
	      
	  <%}%>
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
