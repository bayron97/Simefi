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

    <!--Styles Area Starts-->
    <!--External fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap"
      rel="stylesheet"
    />

    <!-- Material icons -->
    <link
      href="./assets/vendor/Material-icons/material-icons.css"
      rel="stylesheet"
    />

    <!-- DataTables picker -->
    <link
      href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css"
      rel="stylesheet"
    />
    <link
      href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css"
      rel="stylesheet"
    />

    <!-- General styles -->
    <link href="./assets/css/general.css" rel="stylesheet" />

    <!-- NavBar Styles -->
    <link href="./assets/css/next-navbar.css" rel="stylesheet" />

    <!-- Bootstrap4 Theme-->
    <link
      href="./assets/css/bootstrap4-style-orange-light.css"
      rel="stylesheet"
      id="stylelink"
    />

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
    <jsp:include page="Menu.jsp" flush="true" />
    <!-- Sidebar ends -->

    <!-- wrapper starts -->
    <div class="wrapper">
      <div class="content shadow-sm main-content-div">
        <div class="container-fluid header-container">
          <div class="row header">
            <div class="container-fluid" id="header-container">
              <div class="row">
                <!-- Header starts -->
                <nav class="navbar col-12 navbar-expand main-font">
                  <button class="menu-btn btn btn-link btn-sm" type="button">
                    <i class="material-icons">menu</i>
                  </button>
                  <div
                    class="collapse navbar-collapse"
                    id="navbarSupportedContent"
                  >
                    <!-- icons dropwdowns starts -->
                    <ul class="navbar-nav ml-auto">
                      <!-- Message dropdown-->
                      <li class="nav-item dropdown">
                        <a
                          class="nav-link dropdown-toggle"
                          href="#"
                          id="navbarDropdown5"
                          role="button"
                          data-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="material-icons">email</i>
                          <span class="counter bg-primary">1</span>
                        </a>
                        <div
                          class="dropdown-menu dropdown-menu-sm-left dropdown-menu-center no-defaults pt-0 overflow-hidden"
                          aria-labelledby="navbarDropdown5"
                        >
                          <div class="position-relative text-center rounded">
                            <div class="background">
                              <img src="./assets/img/BAC_LOGIN.png" alt="" />
                            </div>
                            <div class="py-3 text-white">
                              <h5 class="font-weight-normal">MENSAJES</h5>
                              <p>ACTUALIZACIONES Y ESTADOS</p>
                            </div>
                          </div>
                          <div class="scroll-y h-320 d-block">
                            <a class="dropdown-item border-top" href="#">
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i
                                    class="material-icons text-template-primary"
                                    >mail</i
                                  >
                                </div>
                                <div class="col pl-0">
                                  <div class="row mb-1">
                                    <div class="col">
                                      <p class="mb-0">BIENVENIDO</p>
                                    </div>
                                    <div class="col-auto pl-0">
                                      <p
                                        class="small text-mute text-trucated mt-1"
                                      >
                                        2/12/2019
                                      </p>
                                    </div>
                                  </div>
                                  <p class="small text-mute">
                                    BIENVENIDO A LA PLATAFORMA DE FIDECOMISOS DE
                                    BANCO DE OCCIDENTE.
                                  </p>
                                </div>
                              </div>
                            </a>
                          </div>
                        </div>
                      </li>

                      <!-- Profile dropdown-->
                      <li class="nav-item dropdown ml-0 ml-sm-4">
                        <a
                          class="nav-link dropdown-toggle profile-link"
                          href="#"
                          id="navbarDropdown6"
                          role="button"
                          data-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <figure
                            class="rounded avatar avatar-40 rounded-circle"
                          >
                            <img src="userIcon.png" alt="" />
                          </figure>
                          <div
                            class="username-text ml-2 mr-2 d-none d-lg-inline-block"
                          >
                            <h6 class="username" style="font-weight: bold">
                              <span>BIENVENIDO:</span>${sessionScope.usuario}
                            </h6>
                          </div>
                          <figure
                            class="rounded avatar avatar-30 d-none d-md-inline-block"
                          >
                            <i class="material-icons">expand_more</i>
                          </figure>
                        </a>
                        <div
                          class="dropdown-menu dropdown-menu-right w-300 pt-0 overflow-hidden"
                          aria-labelledby="navbarDropdown6"
                        >
                          <div
                            class="position-relative text-center rounded py-5"
                          >
                            <div class="background">
                              <img src="./assets/img/BAC_LOGIN.png" alt="" />
                            </div>
                          </div>
                          <div class="text-center mb-3 top-60 z-2">
                            <figure
                              class="avatar avatar-120 mx-auto shadow rounded-circle"
                              style="z-index: 10; background-color: #ffffff"
                            >
                              <img src="userIcon.png" alt="" />
                            </figure>
                          </div>
                          <h5 class="text-center mb-0">
                            ${sessionScope.usuario}
                          </h5>
                          <p class="text-center">USUARIO</p>
                          <p class="text-center text-secondary fs13">
                            HONDURAS
                          </p>
                          <a class="dropdown-item border-top" href="#">
                            <div class="row">
                              <div class="col-auto align-self-center">
                                <i class="material-icons text-success"
                                  >account_box</i
                                >
                              </div>
                              <div class="col pl-0">
                                <p class="mb-0">MI PERFIL</p>
                                <p class="small text-mute text-trucated">
                                  ACTUALIZAR DATOS DEL USUARIO
                                </p>
                              </div>
                              <div
                                class="col-auto align-self-center text-right pl-0"
                              >
                                <i class="material-icons text-mute small"
                                  >chevron_right</i
                                >
                              </div>
                            </div>
                          </a>
                          <form action="logout" method="post">
                            <button
                              class="dropdown-item border-top"
                              type="submit"
                            >
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i class="material-icons text-danger"
                                    >exit_to_app</i
                                  >
                                </div>
                                <div class="col pl-0">
                                  <p class="mb-0 text-danger">CERRAR SESION</p>
                                </div>
                                <div
                                  class="col-auto align-self-center text-right pl-0"
                                >
                                  <i
                                    class="material-icons text-mute small text-danger"
                                    >chevron_right</i
                                  >
                                </div>
                              </div>
                            </button>
                          </form>
                        </div>
                      </li>
                    </ul>
                    <!-- icons dropwdowns ends -->
                  </div>
                </nav>
                <!-- Header ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <%
            String read = (String)session.getAttribute("read"); 
            String disable = (String)session.getAttribute("disable");
            String funcion = (String)session.getAttribute("funcion");
            String func = (String)session.getAttribute("funcion");
            String type = (String)session.getAttribute("type");
            int cod = (Integer)session.getAttribute("procesocompra");
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTRATO DE SUMINISTROS
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO A LARGO PLAZO (ALP)
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-5">
	              <h4 class="text-white font-weight-light ml-2 mr-3">
	              <% if (func.toUpperCase().contentEquals("NUEVO") && func != null) {%>
	                <i class="material-icons vm">add_circle</i>
	              <% } else if (func.toUpperCase().contentEquals("MODIFICAR") && func != null) {%>
	                <i class="material-icons vm">edit</i>
	              <% } else if (func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
	                <i class="material-icons vm">chrome_reader_mode</i>
	              <% } else if (func.toUpperCase().contentEquals("REVISAR") && func != null) {%>
	                <i class="material-icons vm">done_all</i>
	              <% } else {%>
	                <i class="material-icons vm">error</i>
	              <% } %>
	                <%=func.toUpperCase()%>
	              </h4>
	            </span>
            </div>
          </div>
          <form id="formContratoSuministro" action="contratoSuministroServlet" method="post" enctype="multipart/form-data">
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
                                  <div class="float-left"><label class="float-right">GARANTIA DE CUMPLIMIENTO Y CALIDAD</label></div>
                                </div>
                              </div>
                              <!--Inputs Section starts-->
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <input type="hidden" id="Id" name="Id" value="${Id}"/>
                                    <input type="hidden" id="procesocompracod" name="procesocompracod" value="${procesocompracod}"/>
                                    <input type="hidden" id="myfileName" name="myfileName" value="${myfile}"/>
                                    <label>NO. PROCESO DE COMPRA</label>
                                    <%
                                      try{ 
                                        Connection con = null;
                                        Statement state = null; 
                                        int i = 1;
                                        ResultSet rs = null; 
                                        String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                        con = DriverManager.getConnection(url,"admin","system123");
                                        state = con.createStatement(); 
                                        String QueryString = "SELECT * FROM procesoCompraALP where estado1='APROBADO'"; 
                                        if(func != null && !func.contentEquals("nuevo")){
                                          QueryString = "SELECT * from dbo.procesoCompraALP where cod = " + cod; 
                                        }
                                        rs = state.executeQuery(QueryString);
                                      %>
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="procesocompra"
                                          name="procesocompra"
                                          required
                                          onchange="ShowSelected();"
                                          <%if(!funcion.contentEquals("nuevo")){%> readonly="readonly"<%}%>
                                        >
                                        <option selected disabled value="">
                                        SELECCIONA UNA OPCION...
                                      	</option>
                                        <%
                                          while(rs.next()){ 
                                            if(!funcion.contentEquals("nuevo")){
                                               
                                        %>
                                          <option selected value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
                                        <%  } else{ %>
                                          <option value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
                                        <%}i = i + 1;} %>
                                        </select>
                                      <%
                                        rs.close(); 
                                        state.close();
                                        con.close(); 
                                        }catch(Exception e){System.out.println(e); }
                                      %>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>NO. DE CONTRATO</label>
                                     
                                    <input id="ordencompra" value="${ordencompra}" required <%if(!funcion.contentEquals("nuevo")){%> readonly="readonly"<%}%> name="ordencompra" type="text" class="form-control" <%=read%>/>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>PROVEEDOR</label>
                                    <%-- <input type="text" id="proveedor" required value="${proveedor}" name="proveedor" class="form-control" <%=read%>> --%>
                                    
                                           <%if(funcion.contentEquals("nuevo")){%>
                          <select autocomplete="off" 
                        	 		 class="form-control" 
                        	 		 id="proveedor" 
                        	 		 name="proveedor" 
                        	 		 required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                         </select>    
                          <%}else{%>
                           <input type="hidden" id="proveedor" name="proveedor" value="${proveedor}"/>   
                        	  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="proveedor" 
			                      		 name="proveedor" 
			                      		 class="form-control" 
			                      		 value="${proveedor}"/>  
                           <%}%>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>FECHA DE SUSCRIPCION</label>
                                    <input id="fechasuscripcion" value="${fechasuscripcion}" required name="fechasuscripcion" type="date" class="form-control" <%=read%>/>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>OBSERVACIONES</label>
                                    <textarea 
                                      id="observaciones"
                                      name="observaciones"
                                      type="text"
                                      class="form-control"
                                      style="min-height:125px"
                                      <%=read%>
                                    >${observaciones}</textarea>
                                  </div>
                                </div>
                              </div>
                              <!--Inputs Section ends-->
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                          
                          
                         <%if(!funcion.contentEquals("consultar")){%> <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-center">
                                        <!--label class="btn btn-sm btn-success text-white">SUBIR ARCHIVO: </label-->
                                        <button
                                          class="btn btn-sm btn-success ml-3 float-center"
                                          data-target="#documentsModal"
                                          data-toggle="modal"
                                          type = "button"
                                          id="benFinalParamModalButton"
                                        >SUBIR ARCHIVO: </button>
                                      </div>
                                    </div>
                                  </div><%}%>
                                  
                                  
                                  
                          <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                      	<input type="hidden" id="archivos" />
                                      	<input type="hidden" id="MyFormatDocument" />
                                        <!--Ben Final Table Section starts-->
                                        <table
                                          id="documentpurchaseprocess"
                                          class="table table-bordered w-100 mb-0 table-aditional-styles"
                                          aria-describedby="Tabla de Beneficiarios y Oficios"
                                        >
                                          <thead>
                                            <tr>
                                             
                                              <th class="min-tablet">ARCHIVO</th>
                                              <th class="min-tablet">DESCRIPCION ARCHIVO</th>
                                              <th class="min-tablet">ACCIONES</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                       					             <%
                       					             int idContrato = (Integer)request.getAttribute("Id");
                       					            int id = 0;
                       					              if(funcion != null && !funcion.contentEquals("nuevo")){
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
                                                  String QueryString = "select * from dbo.contratosuministrodocumento where idContrato = "+ idContrato;
                                                  rs = state.executeQuery(QueryString); %> 
                                                  <% while(rs.next()){ %>
                                                	<tr>
                                                   <!--  <td>-1</td> -->
                                                    
                                                    <td><%=rs.getString(4).toUpperCase()%></td>
                                                    <td><%=rs.getString(5).toUpperCase()%></td>
                                                    <td>
                                                    <button class="btn btn-sm btn-success previewButton" title="MOSTRAR" onclick="event.preventDefault();" value="/assets/files/contractSupplyFiles/<%=idContrato%>_<%=rs.getString(4).toUpperCase()%>">
                                                      <i class="material-icons">receipt</i>
                                                    </button>
                                                    <a class="btn btn-sm btn-success" target="_blank" title="EXPORTAR" href="./assets/files/contractSupplyFiles/<%=idContrato%>_<%=rs.getString(4).toUpperCase()%>">
                                                      <i class="material-icons">input</i>
                                                    </a></td>
                                                  </tr>
                                                <%} 
                                                  rs.close();
                                                  state.close();
                                                  con.close();
                                                }catch(Exception e){System.out.println(e);}
                       				                }%>
                                          </tbody>
                                        </table>
                                        <!--Ben Final Table Section ends-->
                                      </div>
                                    </div>
                                    
                                    <div class="col-lg-12 col-md-12">
                                      <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                            <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                            <p>
                                              SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                            </p>
                                          </div>
                                          <iframe title="document preview" src="" id="previewDocumentInput1" name="SubHtml"
                                            height="520" class="container-fluid hide">
                                            <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                                          </iframe>
                                        </div>
                                      </label>
                                    </div>
                                  </div>
                            <%-- <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                              <div class="col-lg-12 col-md-12">
                                <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                  <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                  <p>
                                    SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                  </p>
                                  <% if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
                                  <input type="file" id="myfile" name="myfile" required>
                                  <%} %>
                                </div>
                                <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                                  height="520" class="container-fluid hide">
                                  <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                                </iframe>
                              </div>
                            </label> --%>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
                
                <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
                
                 <%
     
     System.out.println(funcion);
                 
                 
                
                  if(funcion.contentEquals("modificar") || funcion.contentEquals("nuevo")){
                	  %>
                	  
                	  
                	  
                	  <button 
                    type="button"
                    class="btn btn-primary btn-rounded shadow main-font float-right"
                    id="submitExternalButton"
                    name="submitExternalButton"
                    value="guardar"
                    data-target=""
                    data-toggle="modal"
                  >
                    <span>GUARDAR</span
                    ><i class="material-icons vm">done</i>
                  </button>
                  
                 
                  
                	 <%
                  }
                  else{
                	  %>
                	<!-- <button
                    type="button"
                    class="btn btn-primary btn-rounded shadow main-font"
                    id="submitExternalButton"
                    name="submitExternalButton"
                    value="guardar"
                    data-target=""
                    data-toggle="modal"
                  >
                    <span>FINALIZAR</span
                    ><i class="material-icons vm">done</i>
                  </button> -->
                
                 	 <%                	  
                  }
                  %>
                
              </div>
            </div>
          </form>
        </div>
        <!-- Main container ends -->
      </div>
      <footer class="footer main-font">
        <div class="container-fluid">
          <div class="row">
            <div
              class="col-12 col-md text-center text-md-left align-self-center"
            >
              <p>TODOS LOS DERECHOS RESERVADOS POR <a href="">BANCOCCI</a></p>
            </div>
            <div class="col-12 col-md-auto text-center text-md-right">
              <ul class="nav justify-content-center justify-md-content-end">
                <li class="nav-item">
                  <a class="nav-link active" href="/term-use1"
                    >TERMINOS DE USO</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/policy2">POLITICA DE PRIVACIDAD</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/contactus3">CONTACTANOS</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="pContratoSuministro">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="salir"
        >
          <i class="material-icons vm">arrow_back</i> SALIR
        </button>
      </div>
    </form>
    
    
    

    <%-- <% if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
    <!-- Submit Button -->
    <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="submitExternalButton"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
        form="formContratoSuministro"
      >
        GUARDAR
        <i class="material-icons vm">done</i>
      </button> 
      
      <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
      
      <button id="submitaprobacion" 
                  value="" 
                  class="btn btn-primary btn-rounded shadow main-font"
                  data-dismiss="modal" 
                  aria-label="Close" >
					<span>GUARDAR</span>
					<i class="material-icons vm">done</i>
                    </button>
    </div>
    
    
    <% } %> --%>
    <div class="modal fade main-font" id="documentsModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close" onclick="limpiariframe();">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">SUBIR ARCHIVO</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                      INGRESE LOS DATOS
                      </h5>
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

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Modal Section ends-->

    <!-- Java Script section starts -->

    <!-- JQuery -->
    <script src="./assets/js/jquery-3.5.1.js"></script>

    <!-- Utils -->
    <script src="./assets/js/utils.js"></script>

    <!-- Next-navbar -->
    <script src="./assets/js/next-navbar.js"></script>

    <!-- DataTables js -->
    <script src="./assets/vendor/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.responsive.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedHeader.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedColumns.min.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

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
    
    var archivos="";
    var contador=-1;
    $("#botonsubir").click(function () {
    	
        contador++;
        var container = document.getElementById("formContratoSuministro")
        var inputPT = document.createElement("input");
        inputPT.setAttribute("type", "file");
        inputPT.setAttribute("name", "contratoSuministrosFiles_"+contador);
        inputPT.setAttribute("id", "contratoSuministrosFiles_"+contador);
        inputPT.setAttribute("style","display:none");
        container.appendChild(inputPT);
        $("#contratoSuministrosFiles_"+contador).trigger('click');
        $("#contratoSuministrosFiles_"+contador).change(function(){
  		  if(!this.files.length == 0){
  			  
  			  $("#archivos").val("HAYARCHIVO");
  			  
  			  
  			  var extencionArchivo = inputPT.value;
  				  
  				  var separaNombreDoc = extencionArchivo.split('.');    				  
  				  var formarDocumento = separaNombreDoc[separaNombreDoc.length - 1];
  				  
  				  $("#MyFormatDocument").val(formarDocumento);
  			  
  		  }
  		  else{
  			  alert("vacio");
  			  $("#archivos").val("NOHAYARCHIVO");
  		  }
  		   
  	  });
    });
    
    function limpiariframe(){
    	
        var iframe = document.getElementById("previewDocumentInput");
          var html = "";

          iframe.contentWindow.document.open();
          iframe.contentWindow.document.write(html);
          iframe.contentWindow.document.close();
    	    $("#archivos").val("");
    }
    
    
      $(document).ready(function () {
    	  
    	  
    	  /* Preparativos iniciales*/

          var container = document.getElementById("formContratoSuministro")

          var inputPT = document.createElement("input");
          inputPT.setAttribute("type", "hidden");
          inputPT.setAttribute("name", "projectPath");
          inputPT.setAttribute("value", getAbsolutePath());
          container.appendChild(inputPT);
    	  
    	  
    	  /*Tabla de Beneficiarios Finales del Documento*/
          var reqTable = $("#documentpurchaseprocess").DataTable({
            responsive: true,
            searching: false,
            bLengthChange: false,
            pageLength: 6,
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
    	  
    	  
          $('#submitenviar').click(function (){
            	
              var container = document.getElementById("formContratoSuministro");
              var table = document.getElementById('documentpurchaseprocess');
              //console.log(table.rows[2].cells[1].innerHTML);
              console.log(reqTable.data().any());
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
                      inputBF.setAttribute("value",cell[4]);
                      container.appendChild(inputBF);

                      var inputBC = document.createElement("input");
                      inputBC.setAttribute("type", "hidden");
                      inputBC.setAttribute("name","iddocumentos");
                      inputBC.setAttribute("value",cell[2]);
                      container.appendChild(inputBC);

                      
                  }
                }
                
                document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
                document.getElementById("submit").click();
              });
          
           $('#submitExternalButton').click(function (){
        	  
        	   
        	   var combo = document.getElementById("procesocompra");
        	   var verificcar = ""
        	   <% if (!func.toUpperCase().contentEquals("NUEVO")) {%>
        	   verificcar = "NO";
        	   <%}else{%>
        	   verificcar = "SI";
        	   <%}%>
        	   
      		     $.post("contratoSuministros",
                		{
      		    	buyProcessId : combo.options[combo.selectedIndex].value,
                    buyOrderId : document.getElementById("ordencompra").value,
                    submit : "validarNoContrato",
                    verificar : verificcar,
                		},
                		function (responseText) {        	  	
                			
              	  	        	if(responseText == "0"){
              	  	        
              	  	        	var container = document.getElementById("formContratoSuministro");
              	               var table = document.getElementById('documentpurchaseprocess');
              	               //console.log(table.rows[2].cells[1].innerHTML);
              	                 if(reqTable.data().any()){
              	                   for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              	                       var cell = reqTable.row(r).data();

              	                       var inputPT = document.createElement("input");
              	                       inputPT.setAttribute("type", "hidden");
              	                       inputPT.setAttribute("name", "nombresarchivos");
              	                       inputPT.setAttribute("value", cell[0]);
              	                       container.appendChild(inputPT);
              	                       
              	                       var inputBF = document.createElement("input");
              	                       inputBF.setAttribute("type", "hidden");
              	                       inputBF.setAttribute("name","descripcionesarchivos");
              	                       inputBF.setAttribute("value",cell[1]);
              	                       container.appendChild(inputBF);

              	                       var inputBC = document.createElement("input");
              	                       inputBC.setAttribute("type", "hidden");
              	                       inputBC.setAttribute("name","iddocumentos");
              	                       inputBC.setAttribute("value",cell[2]);
              	                       container.appendChild(inputBC);

              	                      
              	                   }
              	                 }
              	                 document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
              	                 document.getElementById("submit").click(); 
              	  	        	}else{
              	  	        		alert("ERROR! ESTE NUMERO DE CONTRATO YA ESTA REGISTRADO PARA ESTE PROCESO")
              	  	        	}
                 		}
              	);
        	   
         
             
              }); 
	
    	  
        <% if (!func.toUpperCase().contentEquals("nuevo") && func != null) {%>
	        var nombreDocumento = "${myfile}";
	        if (nombreDocumento === "")
	        {
	          $("#previewDocumentInput").addClass("hide");
	          $("#previewDocumentInput").prop("src", "");
	          $("#documentFile").prop("required", true);
	        }
	        else{
	          var ruta = getAbsolutePath() + "assets/files/contractSupplyFiles/" + nombreDocumento;
	          console.log("url " + "  " + ruta);
	          $("#previewDocumentInput").prop("src", ruta);
	          $("#previewDocumentInput").removeClass("hide");
	          $("#documentFile").prop("required", false);
	        }
	        
	        var ordencomprainput = $("#ordencompra");
	        var ordencompravariable="${ordencompra}";
	        ordencomprainput.append('<option selected value="' + ordencompravariable + '">' + ordencompravariable + '</option>');
	        
	        $("#myfile").prop('required',false);
        <%}%>
        
        
        $("#submitParamBens").click(function(){
            
            
            var fomateoDocumento = document.getElementById("MyFormatDocument").value;
            var nombredeDocumento = document.getElementById("namedocument").value;
            
            var nombrearchivo =nombredeDocumento+"."+fomateoDocumento;
            var descripcionarchivo = document.getElementById("descriptiondocument").value;
            var arch = document.getElementById("archivos").value;
            if(nombrearchivo!="" && nombrearchivo!=null || descripcionarchivo!="" && descripcionarchivos!=null){
            	if(arch=="HAYARCHIVO"){
                    var tbody = document.getElementById("documentpurchaseprocess").getElementsByTagName("TBODY")[0];
                    var row = document.createElement("TR")
                   /*  var td1 = document.createElement("TD")
                    td1.appendChild(document.createTextNode(contador))
                    var td2 = document.createElement("TD")
                    td2.appendChild (document.createTextNode("")) */
                    var td3 = document.createElement("TD")
                    td3.appendChild(document.createTextNode(descripcionarchivo.toUpperCase()))
                    var td4 = document.createElement("TD")
                    td4.appendChild (document.createTextNode(nombrearchivo.toUpperCase()))
                    var td5 = document.createElement("TD")
                    td5.appendChild (document.createTextNode("NO DISPONIBLE"))
                   /*  row.appendChild(td1);
                    row.appendChild(td2); */
                    row.appendChild(td4);
                    row.appendChild(td3);
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
        
      });
      
      
      $("#procesocompra").change(function(){
    	  var proveedor = $("#proveedor");
	        // Guardamos el select de solicitudcomprainput
	       
	        var combo = document.getElementById("procesocompra");
		    var procesocompra = combo.options[combo.selectedIndex].text;
	
	        // Guardamos el select de procesocomprainput
	        var proveedorinput = $(this);
	
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "contratoSuministros" + "?submit=ConsultarProveedores&procesocompra="+procesocompra;
	            console.log(url);
	        	$.ajax({
	                //data: { id : procesocomprainput.val() },
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                	proveedorinput.prop('disabled', true);
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(";");
	                	proveedorinput.prop('disabled', false);
	                	proveedor.prop('disabled', false);
	                	proveedor.find('option').remove();
	                	proveedor.append('<option>SELECCIONE UNA OPCION...</option>');

	                	$(m).each(function(i, v){ 		                	
	                    	if(m[i]!=''){
	                    		proveedor.append(m[i]);
	                    		console.log(m[i]);
	                    	}
	                    })	
	
	                    proveedor.prop('disabled', false);
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    proveedorinput.prop('disabled', false);
	                }
	            });
	        }
	        else
	        {
	        	console.log("Test");
	        	proveedorinput.find('option').remove();
	        	proveedorinput.prop('disabled', true);
	        }
	    })
	    
	    
	          $("#ordencompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var proveedorinput = $("#proveedor");
	        var combo = document.getElementById("ordencompra");
		    var selected = combo.options[combo.selectedIndex].text;
	
	        // Guardamos el select de procesocomprainput
	        var procesocomprainput = $(this);
	
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "contratoSuministros" + "?submit=ConsultarProveedores&noOrden="+selected;
	            console.log(url);
	        	$.ajax({
	                //data: { id : procesocomprainput.val() },
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                    procesocomprainput.prop('disabled', true);
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(";");
	                    procesocomprainput.prop('disabled', false);
	                    proveedorinput.prop('disabled', false);
	                    // Limpiamos el select
	                    proveedorinput.find('option').remove();
	                    proveedorinput.append('<option>SELECCIONE UNA OPCION...</option>');

	                    $(m).each(function(i, v){ // indice, valor
		                	console.log(m[i])
		                	if(m[i]!=''){
		                		proveedorinput.append('<option value="' + m[i] + '">' + m[i] + '</option>');
		                	}
	                    })
	
	                    proveedorinput.prop('disabled', false);
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
	
      function ShowSelected(){
	      /* Para obtener el valor */
	      var cod = document.getElementById("procesocompra").value;
	      /* Para obtener el texto */
	      var combo = document.getElementById("procesocompra");
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#procesocompracod").val(selected);
	    }
      
      
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
       
  	/*   $('#submitExternalButton').click(function (){
  		debugger
  		  var container = document.getElementById("formContratoSuministro"); 
  		  console.log("trae" + container);
  		  document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
  	      document.getElementById("submit").click();
  	  }); */
  	  
  	  
  	  
      
      
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
