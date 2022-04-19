<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="main.model.*"%>
<%@ page import="java.util.*"%>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  String temp = "";
  temp = (String)request.getAttribute("openMode");
  String openMode = "";
	if(temp != null && !temp.isEmpty()){
		openMode = temp;
	}
	System.out.println("openMode "+openMode);
  String temp2 = (String)request.getAttribute("mProductosChecked");
  boolean isMProductos = false;
  if(temp2 != null && !temp2.isEmpty()){
		isMProductos = Boolean.valueOf(temp2);
	}
  String disableMProductos = "";
  if (isMProductos)
  {
    disableMProductos = "Disabled";
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
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description"
    />
    <meta content="Authcode" name="author" />
  
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
   <jsp:include page="Header.jsp" flush="true" />
   <!-- Sidebar ends -->

    <!-- wrapper starts -->
    <div class="wrapper">
      <div class="content shadow-sm main-content-div">
   <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="row">
            <div class="col-12 col-xs-12 col-md-12">
              <h2 class="mb-4 large-title"> NUEVA ACLARACION Y ENMIENDA</h2>
              <h5 class="font-weight-light main-font mb-4"> COMPRAS GENERALES</h5>
            </div>
          </div>
          
          <%
             /*  String read = (String)session.getAttribute("read");  */
              String disable = (String)session.getAttribute("disable");
              String accion = (String)session.getAttribute("accion");
              /* System.out.println("read v " + read); */
              System.out.println("accion v " + accion);
              int idAclaracionEnmienda = (int)session.getAttribute("idAclaracionEnmienda"); 
              
            %>
          
          <!--Content starts-->
          <div class="main-content-div main-font">
            <form id="newEditRegForm" action="Gral_aclaracionEnmiendaServlet" enctype="multipart/form-data" method="post">
              <input type="hidden" name="idAclaracionEnmienda" id="idAclaracionEnmienda" value="${idAclaracionEnmienda}">
              <div class="row">
                <div class="col-lg-7 col-md-7">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h6  id="instructionSubtitle" class="mb-3 text-center float-left" style="font-weight:bold;"> I) REGISTRO DE ACLARACIONES Y ENMIENDAS </h6>
                    </div>
                  </div>
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>1) NO. DE PROCESO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input autocomplete="off" type="text" class="form-control" id ="numProcesoCompra" name="numProcesoCompra" value="${numProcesoCompra}" readonly />
                      <input autocomplete="off" type="text" class="form-control" id ="idAperturaProceso" name="idAperturaProceso" value="${idAperturaProceso}" readonly /> 
                      <input type="text" hidden class="form-control" id="beneficiario" name="beneficiario"  value="${beneficiario}"  />
                      
                    </div>
                  </div>
                  <% } else { %>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>1) NO. DE PROCESO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input autocomplete="off" type="text" class="form-control" id ="numProcesoCompra" name="numProcesoCompra" value="${numProcesoCompra}" readonly />
                      <input autocomplete="off" hidden type="text" class="form-control" id ="idAperturaProceso" name="idAperturaProceso" value="${idAperturaProceso}" required  readonly />
                      <input type="text" hidden class="form-control" id="beneficiario" name="beneficiario"  value="${beneficiario}"  />
                    </div>
                    <div class="col-lg-2 col-md-2">
                      <div class="form-group">
                        <button class="btn btn-sm btn-success" style="height: 40px;margin-top:0px !important;" data-target="#processNumberModal" data-toggle="modal" id="processNumbersButton">
                          <i class="material-icons md-18">add_box</i>
                        </button>
                      </div>
                    </div>
                  </div>
                  <% } %>
                  <div class="row">
                    <div class="col-lg-8 col-md-8">
                      <label>2) FECHA PUBLICACIÓN ENMIENDA / ACLARACIÓN* </label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input autocomplete="off" type="date" class="form-control" id ="fecha" name="fecha" value="${fecha}" required <%=openMode%> />
                    </div>
                  </div>
                   <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>3) OFICIO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input  autocomplete="off"  type="text" class="form-control" id ="oficio" name="oficio" value="${oficio}" required  <%=openMode%> />
                    </div>
                  </div>
                  
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>4) TIPO & CORRELATIVO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <select  autocomplete="off" class="form-control" id ="aclaracionEnmienda" name="aclaracionEnmienda" value="${aclaracionEnmienda}" <%=openMode%> <%=disableMProductos%>   >
                        <option value="ENMIENDA" selected>ENMIENDA</option>
                        <option value="ACLARACION">ACLARACION</option>
                      </select>
                    </div>
                    <div class="col-lg-2 col-md-2">
                      <input  autocomplete="off"  type="text" class="form-control" id ="correlativoEnmienda" name="correlativoEnmienda" value="${correlativoEnmienda}" required  <%=openMode%> />
                    </div>
                  </div>
                  
                  
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      <input autocomplete="off" type="checkbox" class="form-control" id ="amendment1Check" name="amendment1Check" <%=openMode%> />
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <label>4.1 FECHA LIMITE. LA OFERTA PUEDE SER PRESENTADA HASTA LAS</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-4 col-md-4">
                          <input  autocomplete="off"  type="time" class="form-control" id ="horaLimite" name="horaLimite" value="${horaLimite}" required <%=openMode%> />
                        </div>
                        <div class="col-lg-2 col-md-2">
                          <label> DEL DIA </label>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <input autocomplete="off"  type="date" class="form-control" id ="diaLimite" name="diaLimite" value="${diaLimite}" required <%=openMode%> />
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col-lg-12 col-md-12">
                          <label>TODA OFERTA, FUERA DE ESTE PLAZO NO SERA ACEPTADA.</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      <input autocomplete="off" type="checkbox" class="form-control" id ="amendment2Check" name="amendment2Check" <%=openMode%> />
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <label>4.2 APERTURA DE OFERTA. LA FECHA DE APERTURA ES: </label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-6 col-md-6">
                          <input autocomplete="off" type="date" class="form-control" id ="diaApertura" name="diaApertura" value="${diaApertura}" required <%=openMode%> />
                        </div>
                        <div class="col-lg-2 col-md-2">
                          <label> A LAS </label>
                        </div>
                        <div class="col-lg-4 col-md-4">
                          <input autocomplete="off" type="time" class="form-control" id ="horaApertura" name="horaApertura" value="${horaApertura}" required <%=openMode%> />
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col-lg-2 col-md-2">
                          <label>LUGAR:</label>
                        </div>
                        <div class="col-lg-10 col-md-10">
                           <select autocomplete="off" class="form-control" id ="lugarApertura" name="lugarApertura" value="" <%=openMode%> >
                            <% try{ 
                                Connection con = null;
                                Statement state = null; 
                                ResultSet rs = null; 
                                String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                con = DriverManager.getConnection(url,"admin","system123");
                                state = con.createStatement(); 
                                String QueryString = "SELECT * from dbo.lugarApertura where estado = 'ACTIVO'"; 
                                rs = state.executeQuery(QueryString);
                                while(rs.next()){ %>
                                  <option value="<%=rs.getString(2)%>"><%=rs.getString(2).toUpperCase()%></option>
                              <%} rs.close(); 
                                  state.close();
                                  con.close(); }catch(Exception e){System.out.println(e); }
                              %>
                          </select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      <input  autocomplete="off" type="checkbox" class="form-control" id ="amendmentProductCheck" name="amendmentProductCheck" checked="${mProductosChecked}" <%=openMode%> <%=disableMProductos%> />
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <label>4.3 AGREGAR, MODIFICAR Y ANULAR UN PRODUCTO</label>
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-4 col-md-4">
                      <label>5) OBSERVACIONES</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <textarea maxlength="500" autocomplete="off" class="form-control"  id ="observaciones" name="observaciones" style="min-height:80px;" <%=openMode%> >${observaciones}</textarea>
                    </div>
                  </div>
                </div>
                <div class="col-lg-5 col-md-5">
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row">
                    <div class="col-lg-12 col-md-12">
                      <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                        <h3 class="mt-1"><i class="material-icons">cloud_download</i></h3>
                        <p>
                          ARCHIVO CARGADO
                        </p>
                      </div>
                      <iframe title="previewDocument" src="" id="previewDocumentInput" name="SubHtml" height="500" class="container-fluid hide">
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                      </iframe>
                    </div>
                  </label>
                  <% } else { %>
                  <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                    <div class="col-lg-12 col-md-12">
                      <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                        <h3 class="mt-1"><i class="material-icons">cloud_download</i></h3>
                        <p>
                          DEJA TU ARCHIVO AQUI PARA SUBIR
                        </p>
                      </div>
                      <iframe title="previewDocument" src="" id="previewDocumentInput" name="SubHtml" height="500" class="container-fluid hide">
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                      </iframe>
                      <div class="form-group mt-3">
                        <input type="file" id="documentFile" name="documentFile" accept="application/pdf" required>
                      </div>
                    </div>
                  </label>
                  <% } %>
                </div>
              </div>
              <!--Submit section starts-->
              <div class="wrap-fixed-float wrap-fixed-bottom-right">
                <% if (isMProductos) { %>
                
                <button id="submitButton" name="submit" class="btn btn-primary btn-rounded shadow main-font" type="submit" value="continuar" >
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <span id="submitButtonText">CONTINUAR </span>
                  <% } else { %>
                  <span id="submitButtonText">GUARDAR Y CONTINUAR </span>
                  <% } %>
                  <i class="material-icons vm">done</i>
                </button>

                <% } else { %>

                <button id="submitButton" name="submit" class="btn btn-primary btn-rounded shadow main-font" type="submit" value="guardar" >
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <span id="submitButtonText">FINALIZAR </span>
                  <% } else { %>
                  <span id="submitButtonText">GUARDAR Y FINALIZAR </span>
                  <% } %>
                  <i class="material-icons vm">done</i>
                </button>

                <% } %>
              </div>
              
              <!--Submit section ends-->
            </form>
          </div>
          <!--Content ends-->
        </div>
        <!-- Main container ends -->
      </div>
      <jsp:include page="Footer.jsp" flush="true" />
    </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form method="post" action="amendmentsGeneral.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button   class="btn btn-primary btn-rounded shadow main-font" name="submit" value="cancelar" >
          <i class="material-icons vm">close</i>CANCELAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
    <% if (!openMode.equalsIgnoreCase("disabled")) { %>
    <!--PROCESS NUMBER Modal-->
    <div class="modal fade main-font" id="processNumberModal" tabindex="-1" role="dialog" aria-hidden="true" >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--PROCESS NUMBER starts-->
        <div id="processNumberContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal"  aria-label="Close" >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5" style="z-index:0;">
                <h1 class="mb-0 text-white">
                  REGISTRO DE PROCESOS DE COMPRA ABIERTOS
                </h1>
                <h4 id="subtitleChange"  class="mb-5 text-white font-weight-light" >
                  UTILIZAR PROCESO
                </h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center
                          center;
                        background-size: cover;
                      "
                    >
                      <div class="row">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-8 col-md-8">
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group" style="text-align: left">
                                    <%-- <label hidden>TIPO COMPRA</label>
                                    <select autocomplete="off" class="form-control" id="aclaracionEnmienda" hidden name="aclaracionEnmienda" required="required" >
                                      
                                      <% try{ 
                                          Connection con = null;
                                          Statement state = null; 
                                          ResultSet rs = null; 
                                          String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          con = DriverManager.getConnection(url,"admin","system123");
                                          state = con.createStatement();
                                          String QueryString = "select abreviatura from tipoCompra";
                                          rs = state.executeQuery(QueryString);
                                          while(rs.next()){%>
                                            <option value="<%=rs.getString(1)%>">
                                              <%=rs.getString(1).toUpperCase()%>
                                            </option>
                                        <%} } catch(Exception e){ System.out.println(e); }
                                      %>
                                    </select> --%>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <input  autocomplete="off" type="text" class="form-control" id="processNumbersSearchInput" placeholder="INGRESE UNA BUSQUEDA..." value="" style="z-index:100;" />
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="row mt-4">
                                <div class="col-lg-12 col-md-12">
                                  <!-- <div class="form-group">
                                   <button class="btn btn-sm btn-success" id="processNumbersInModalButton" type="button" > MOSTRAR TODOS </button>
                                  </div> -->
                                </div>
                              </div>
                              <div class="row mt-1">
                                <div class="col-lg-12 col-md-12">
                                  <!-- <div class="form-group">
                                    <button  class="btn btn-sm btn-success" id="processNumbersSearchButton" type="button" > BUSCAR REGISTRO </button>
                                  </div> -->
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <!--PROCESS NUMBERS Table Section starts-->
                              <table  id="processNumbersTableParam"  class="table table-bordered w-100 mb-0 table-aditional-styles" aria-describedby="Tabla de Numeros de Proceso" >
                                <thead>
                                  <tr>
                                    <th class="all">NO.</th>
                                    <th class="min-tablet">
                                      NO. DE PROCESO
                                    </th>
                                    <th class="min-tablet">
                                      FECHA DE APERTURA
                                    </th>
                                    <th class="min-tablet">
                                      BENEFICIARIO
                                    </th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <%
                                       if(accion != null){   
                                    	   if(accion.contentEquals("nuevo")){
                                    		   
                                    		   
                                    	   
                                     	ArrayList<Gral_aperturaProceso> aperturaProcesoList = (ArrayList<Gral_aperturaProceso>) request.getAttribute("aperturaProceso");
                                        if (aperturaProcesoList != null)
                                        	System.out.println("Lista "+ aperturaProcesoList);
                                            {
                                              for(Gral_aperturaProceso aperturaProcesoE : aperturaProcesoList){
                                             %>
                                           		<tr>
                                                    <td><%=aperturaProcesoE.getIdAperturaProceso()%></td><!-- id IdAperturaProceso identoty en la DB -->
                                                    <td><%=aperturaProcesoE.getNumProcesoCompra()%></td>
                                                    <td><%=aperturaProcesoE.getFechaApertura()%></td>
                                                    <td><%=aperturaProcesoE.getbeneficiario()%></td>
                                                   </tr>
                                             <%}}}}; 
                                           %>
                                </tbody>
                              </table>
                              <!--PROCESS NUMBERS Table Section ends-->
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <%-- <jsp:include page="Footer.jsp" flush="true" /> --%>
          </div>
        </div>
        <!--Med Insumos ends-->
      </div>
    </div>
    <% } %>
    <!--Custom New Modal-->

    <!-- Modal Section ends-->

 

    <!-- Customized page level js -->
    <% if (!openMode.equalsIgnoreCase("disabled")) { %>
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

      function preparacionesIniciales() {
        /* Combinacion Javascript y Java*/
        var documento = "${documento}";
        if (documento === "")
        {
          $("#previewDocumentInput").addClass("hide");
          $("#previewDocumentInput").prop("src", "");
          $("#documentFile").prop("required", true);
        }
        else{
          var ruta = getAbsolutePath() + "assets/files/amendmentsGeneralFiles/" + documento;
          $("#previewDocumentInput").prop("src", ruta);
          $("#previewDocumentInput").removeClass("hide");
          $("#documentFile").prop("required", false);
        }
        $("#lugarApertura").prop("value","${lugarApertura}");
        $("#aclaracionEnmienda").prop("value","${aclaracionEnmienda}");
        var val = document.getElementById("aclaracionEnmienda").value;
		    if(val === "ENMIENDA"){
          const value1 = "${horaLimite}";
          const value2 = "${diaLimite}";
          if (value1=="" && value2==""){
            $("#amendment1Check").prop("disabled", false);
          }
          if (value1==""){
            $("#horaLimite").removeAttr("required");
            $("#horaLimite").prop("disabled", true);
          }
          if (value2==""){
            $("#diaLimite").removeAttr("required");
            $("#diaLimite").prop("disabled", true);
          }
          const value3 = "${diaApertura}";
          const value4 = "${horaApertura}";
          const value5 = "${lugarApertura}";
          if (value3=="" && value4=="" && value5==""){
            $("#amendment2Check").prop("disabled", false);
          }
          if (value3==""){
            $("#diaApertura").removeAttr("required");
            $("#diaApertura").prop("disabled", true);
          }
          if (value4==""){
            $("#horaApertura").removeAttr("required");
            $("#horaApertura").prop("disabled", true);
          }
          if (value5=="")
          {
            $("#lugarApertura").removeAttr("required");
            $("#lugarApertura").prop("disabled", true);
          }
		    }
		    else{
          $("#amendment1Check").prop("checked", false);
          $("#amendment2Check").prop("checked", false);
          $("#amendmentProductCheck").prop("checked", false);
			    $("#amendment1Check").prop("disabled", true);
          $("#amendment2Check").prop("disabled", true);
          $("#amendmentProductCheck").prop("disabled", true);
			    $("#horaLimite").prop("disabled", true);
			    $("#diaLimite").prop("disabled", true);
			    $("#diaApertura").prop("disabled", true);
			    $("#horaApertura").prop("disabled", true);
          $("#lugarApertura").prop("disabled", true);
        }
        val = document.getElementById("diaLimite").value;
        if(val !== ""){
          $("#amendment1Check").prop("checked", true);
        }
        val = document.getElementById("diaApertura").value;
        if(val !== ""){
          $("#amendment2Check").prop("checked", true);
        }
      }

      $(document).ready(function () {
        preparacionesIniciales();

        /* data Table */
        var processNumberTable = $("#processNumbersTableParam").DataTable({
          responsive: true,
          searching: false,
          bLengthChange: false,
          pageLength: 5,
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
		
        /* $("#processNumbersButton").on("click", function (event){
        	event.preventDefault();
        	processNumberTable.ajax.url(getAbsolutePath() + "tableEmpty").load();
          $("#subtitleChange").text(
            "SELECCIONE UN MEDICAMENTO Y CIERRE LA VENTANA"
          );
          var searchValue = $("#purchaseType").val();          
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraGeneralAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector).load();
        }); */
        
       /*  $("#processNumbersInModalButton").on("click", function (event) {
          event.preventDefault();
          var selector;
          selector = "procesosCompraGeneralAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector).load();
        }); */
        
       /*  $("#processNumbersSearchButton").on("click", function (event) {
        	event.preventDefault();
          var searchValue = $("#processNumbersSearchInput").val();
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraGeneralAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
           
        }); */

        
        $("#purchaseType").on("change", function(){
          var searchValue = $("#purchaseType").val();          
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraGeneralAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
        });
        
        $("#processNumbersButton").on("click", function (event){
          event.preventDefault();
          //medInsumosTable.ajax.url(getAbsolutePath() + "processNumbersALP").load();
          $("#subtitleChange").text(
            "SELECCIONE ITEM Y CIERRE LA VENTANA"
          );
        });

        /*Modal Select add info in Main Form*/
        $("#processNumbersTableParam tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
         
           
          $("#idAperturaProceso").prop("value", $(this).find("td:eq(0)").text());
          $("#numProcesoCompra").prop("value", $(this).find("td:eq(1)").text());
          $("#beneficiario").prop("value", $(this).find("td:eq(3)").text());
        });


	$("#aclaracionEnmienda").on("change", function(){
    var val = $(this).val();
    var purchaseNumberTemp = $("#numProcesoCompra").val();
	
    /* if(val === "ENMIENDA"){
    	$("#correlativoEnmienda").prop("readOnly", false);
    }
    else{
    	$("#correlativoEnmienda").prop("readOnly", true);
    } */
    
    if (purchaseNumberTemp != "" && val !="")
    {
      $.post('GeneralAmendmentsCorrelativeAPI', {
        type : val,
        purchaseNumber: purchaseNumberTemp,
			}, function(responseText) {
				$("#correlativoEnmienda").prop("value", responseText);
		  });
    }
    else
    {
      alert("Para generar un correlativo es necesario seleccionar un proceso de compra y un tipo de correccion!");
    }

		if(val === "ENMIENDA"){
			$("#amendment1Check").prop("disabled", false);
      $("#amendment2Check").prop("disabled", false);
      $("#amendmentProductCheck").prop("disabled", false);
		}
		else{
      $("#amendment1Check").prop("checked", false);
      $("#amendment2Check").prop("checked", false);
      $("#amendmentProductCheck").prop("checked", false);
			$("#amendment1Check").prop("disabled", true);
      $("#amendment2Check").prop("disabled", true);
      $("#amendmentProductCheck").prop("disabled", true);
			$("#horaLimite").prop("disabled", true);
			$("#diaLimite").prop("disabled", true);
			$("#diaApertura").prop("disabled", true);
			$("#horaApertura").prop("disabled", true);
      $("#lugarApertura").prop("disabled", true);
      
      $("#listEstItemNav1").addClass("hide");
      $("#listEstItemNav2").addClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y FINALIZAR");
      $("#submitButton").prop("value","guardar");
		}
	});

	$("#amendment1Check").on("change", function(){
		if($("#amendment1Check").prop("checked")){
      $("#horaLimite").prop("disabled", false);
      $("#horaLimite").prop("required", true);
      $("#diaLimite").prop("disabled", false);
      $("#diaLimite").prop("required", true);
		}
		else{
      $("#horaLimite").prop("disabled", true);
      $("#horaLimite").prop("required", false);
      $("#diaLimite").prop("disabled", true);
      $("#diaLimite").prop("required", false);
		}	
	});
	
	$("#amendment2Check").on("change", function(){
		if($("#amendment2Check").prop("checked")){
			alert("habilitado");
      $("#diaApertura").prop("disabled", false);
      $("#diaApertura").prop("required", true);
      $("#horaApertura").prop("disabled", false);
      $("#horaApertura").prop("required", true);
      $("#lugarApertura").prop("disabled", false);
      $("#lugarApertura").prop("required", true);
			
		}
		else{
      $("#diaApertura").prop("disabled", true);
      $("#diaApertura").prop("required", false);
			$("#horaApertura").prop("disabled", true);
			$("#horaApertura").prop("required", false);
      $("#lugarApertura").prop("disabled", true);
      $("#lugarApertura").prop("required", false);
		}	
  });
  
  $("#amendmentProductCheck").on("change", function(){
		if($("#amendmentProductCheck").prop("checked")){
      $("#listEstItemNav1").removeClass("hide");
      $("#listEstItemNav2").removeClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y CONTINUAR");
      $("#submitButton").prop("value","continuar");
		}
		else{
      $("#listEstItemNav1").addClass("hide");
      $("#listEstItemNav2").addClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y FINALIZAR");
      $("#submitButton").prop("value","guardar");
		}	
	});
	
      });
      
      $(document).ready(function () {
    		if($("#amendmentProductCheck").prop("checked")){
    		      $("#listEstItemNav1").removeClass("hide");
    		      $("#listEstItemNav2").removeClass("hide");
    		      $("#submitButton #submitButtonText").text("GUARDAR Y CONTINUAR");
    		      $("#submitButton").prop("value","continuar");
    				}
    				else{
    		      $("#listEstItemNav1").addClass("hide");
    		      $("#listEstItemNav2").addClass("hide");
    		      $("#submitButton #submitButtonText").text("GUARDAR Y FINALIZAR");
    		      $("#submitButton").prop("value","guardar");
    				}
    	  
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

    </script>

    <% } else { %>

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

      function preparacionesIniciales() {
        /* Combinacion Javascript y Java*/
        var documento = "${documento}";
        if (documento === "")
        {
          $("#previewDocumentInput").addClass("hide");
          $("#previewDocumentInput").prop("src", "");
          $("#documentFile").prop("required", true);
        }
        else{
          var ruta = getAbsolutePath() + "assets/files/amendmentsGeneralFiles/" + documento;
          $("#previewDocumentInput").prop("src", ruta);
          $("#previewDocumentInput").removeClass("hide");
          $("#documentFile").prop("required", false);
        }
        $("#lugarApertura").prop("value","${lugarApertura}");
        $("#aclaracionEnmienda").prop("value","${aclaracionEnmienda}");
      }

      $(document).ready(function () {
        preparacionesIniciales();
      });

    </script>
    <% } %>
    <!-- Java Script section ends -->
  </body>
</html>
