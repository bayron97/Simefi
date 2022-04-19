<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  String isModif = (String)request.getAttribute("isModify");
  String modifId = (String)request.getAttribute("modifId");
	String mod = "false";
	if(isModif != null && !isModif.isEmpty()){
		mod = isModif;
	}
  String isCons = (String)request.getAttribute("isConsulta");
	String cons = "false";
	if(isCons != null && !isCons.isEmpty()){
		cons = isCons;
	}
  String revision = (String)request.getAttribute("isRev");
  String rev = "false";
  if(revision != null && !revision.isEmpty()){
		rev = revision;
	}	

	String modifCa = (String)request.getAttribute("modifCat");
  String modifU = (String)request.getAttribute("modifUp");
	String modifCat = "";
	String modifUp = "";

	if(modifCa != null && !modifCa.isEmpty()){
		modifCat = modifCa;
	}
	if(modifU != null && !modifU.isEmpty()){
		modifUp = modifU;
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
                            <h6 class="username" style="font-weight: bold;">
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
                              style="z-index: 10; background-color: #ffffff;"
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
          <div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <nav class="navbar col-12 main-font">
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <button
                      class="btn dropdown-toggle btn-sm btn-primary"
                      type="button"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      SECCIONES
                    </button>
                    <div class="dropdown-menu">
                      <a type="button" class="dropdown-item active" href="#"
                        >OTROS INSUMOS</a
                      >
                      <a type="button" class="dropdown-item" href="#"
                        >FICHA TECNICA (DIGITAL)</a
                      >
                      <a type="button" class="dropdown-item" href="#"
                        >HISTORICO</a
                      >
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">OTROS INSUMOS</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">FICHA TECNICA (DIGITAL)</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">HISTORICO</a>
                    </li>
                  </ul>
                </nav>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mt-1 mb-4 large-title">
                OTROS
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                MEDICAMENTOS Y OTROS / OTROS
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-1">
                <h6 class="text-white font-weight-bold ml-2 mr-3">
                  <% if(mod.contentEquals("true")) {%>
                  <i class="material-icons vm">edit</i> MODIFICAR
                  <% } else if(cons.contentEquals("true")) {%>
                  <i class="material-icons vm">chrome_reader_mode</i> CONSULTAR
                  <% } else if(rev.contentEquals("true")) {%>
                  <i class="material-icons vm">done_all</i> REVISAR & APROBAR
                  <% } else {%>
                  <i class="material-icons vm">add_circle</i> NUEVO
                  <% } %>
                </h6>
              </span>
            </div>
          </div>
          <!--Content starts-->
          <div class="main-content-div main-font">
            <form id="newEditRegForm" action="otrosServlet" method="post">
              	<input type="hidden" value="${modifId}" id="modifId" name="modifId">
		          <input type="hidden" value="<%=mod%>" name="isModify">
		          <input type="hidden" value="<%=rev%>" name="isRev">
		          <input type="hidden" value="<%=cons%>" name="isConsulta">
              <div class="row">
                <% if(rev.contentEquals("true") || cons.contentEquals("true")){ %>
                <!-- First Column starts-->
                <div class="col-lg-12 col-md-12">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h5
                        id="instructionSubtitle"
                        class="mb-3 text-center float-left"
                        style="font-weight:bold;"
                      >
                        I) DATOS GENERALES (* ES OBLIGATORIO)
                      </h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6 col-md-6">
                      <div class="form-group">
                        <label>CATEGORIA*</label>
                        <select
                          class="form-control"
                          id ="up"
                          name="up"
                          required
                          disabled
                        >
                        <%
						              try{
							              Connection con = null;
							              Statement state = null;
							              ResultSet rs = null;
							              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							              con = DriverManager.getConnection(url,"admin","system123");
							              state = con.createStatement();
							              String QueryString = "SELECT * from dbo.categorias where estado = 'ACTIVO'";
							              rs = state.executeQuery(QueryString);
						            %>
						            <% 	
						                while(rs.next()){
							                if(modifCat.contentEquals(rs.getString(1))){
							          %>
							                  <option selected value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							          <%
							                }
							                else{
							          %>
							                  <option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							              <%}
						                } 
						                rs.close();
						                state.close();
						                con.close();
						              }catch(Exception e){System.out.println(e);}
						            %>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <div class="form-group">
                        <label>UNIDAD DE PRESENTACION*</label>
                        <select
                          class="form-control"
                          id ="up"
                          name="up"
                          required
                          disabled
                        >
                        <%
						              try{
							              Connection con = null;
							              Statement state = null;
							              ResultSet rs = null;
							              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							              con = DriverManager.getConnection(url,"admin","system123");
							              state = con.createStatement();
							              String QueryString = "SELECT * from dbo.up where estado = 'ACTIVO'";
							              rs = state.executeQuery(QueryString);
						            %>
						            <% 	
					  	              while(rs.next()){
							                if(modifUp.contentEquals(rs.getString(1))){
							          %>
							                  <option value='<%=rs.getString(1)%>' selected><%=rs.getString(1).toUpperCase()%></option>
							          <%
							                }
							                else{
							          %>
							                  <option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							              <%}
						                } 
						                rs.close();
						                state.close();
						                con.close();
						              }catch(Exception e){System.out.println(e);}
						            %>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <div class="form-group">
                        <label>NOMBRE*</label>
                        <input
                          autocomplete="off"
                          type="text"
                          class="form-control"
                          id ="nombre"
                          name="nombre"
                          value="${modifNombre}"
                          required
                          disabled
                        />
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-12 col-md-12">
                      <label>DESCRIPCION TECNICA*</label>
                      <textarea
                        autocomplete="off"
                        class="form-control"
                        id ="descripcion"
                        name="descripcion"
                        style="min-height:150px;"
                        required
                        readonly
                      >${modifDesc}</textarea>
                    </div>
                  </div>
                  <div class="row mb-5">
                    <div class="col-lg-12 col-md-12">
                      <label>OBSERVACIONES DEL ARTICULO</label>
                      <textarea
                        autocomplete="off"
                        class="form-control"
                        id ="observacion"
                        name="observacion"
                        style="min-height:150px;"
                        readonly
                      >${modifObs}</textarea>
                    </div>
                  </div>
                </div>
                <!-- First Column ends-->

                <% } else { %>

                <!-- First Column starts-->
                <div class="col-lg-12 col-md-12">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h5
                        id="instructionSubtitle"
                        class="mb-3 text-center float-left"
                        style="font-weight:bold;"
                      >
                        I) DATOS GENERALES (* ES OBLIGATORIO)
                      </h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6 col-md-6">
                      <div class="form-group">
                        <label>CATEGORIA*</label>
                        <select
                          class="form-control"
                          id ="categoria"
                          name="categoria"
                          required
                        >
                        <%
						              try{
							              Connection con = null;
							              Statement state = null;
							              ResultSet rs = null;
							              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							              con = DriverManager.getConnection(url,"admin","system123");
							              state = con.createStatement();
							              String QueryString = "SELECT * from dbo.categorias where estado = 'ACTIVO'";
							              rs = state.executeQuery(QueryString);
						            %>
						            <% 	
						                while(rs.next()){
							                if(modifCat.contentEquals(rs.getString(1))){
							          %>
							                  <option selected value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							          <%
							                }
							                else{
							          %>
							                  <option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							              <%}
						                } 
						                rs.close();
						                state.close();
						                con.close();
						              }catch(Exception e){System.out.println(e);}
						            %>
                        </select>
                      </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <div class="form-group">
                        <label>UNIDAD DE PRESENTACION*</label>
                        <select
                          class="form-control"
                          id ="up"
                          name="up"
                          required
                        >
                        <%
						              try{
							              Connection con = null;
							              Statement state = null;
							              ResultSet rs = null;
							              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							              con = DriverManager.getConnection(url,"admin","system123");
							              state = con.createStatement();
							              String QueryString = "SELECT * from dbo.up where estado = 'ACTIVO'";
							              rs = state.executeQuery(QueryString);
						            %>
						            <%
					  	              while(rs.next()){
							                if(modifUp.contentEquals(rs.getString(1))){
							          %>
							                  <option value='<%=rs.getString(1)%>' selected><%=rs.getString(1).toUpperCase()%></option>
							          <%
							                }
							                else{
							          %>
							                  <option value='<%=rs.getString(1)%>'><%=rs.getString(1).toUpperCase()%></option>
							              <%}
						                } 
						                rs.close();
						                state.close();
						                con.close();
						              }catch(Exception e){System.out.println(e);}
						            %>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <div class="form-group">
                        <label>NOMBRE*</label>
                        <input
                          autocomplete="off"
                          type="text"
                          class="form-control"
                          id ="nombre"
                          name="nombre"
                          value="${modifNombre}"
                          required
                        />
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-12 col-md-12">
                      <label>DESCRIPCION TECNICA*</label>
                      <textarea
                        autocomplete="off"
                        class="form-control"
                        id ="overlayObs"
                        name="overlayObs"
                        placeholder="INGRESE UNA DESCRIPCION TECNICA..."
                        style="min-height:150px;"
                        required
                      >${modifDesc}</textarea>
                    </div>
                  </div>
                  <div class="row mb-5">
                    <div class="col-lg-12 col-md-12">
                      <label>OBSERVACIONES DEL ARTICULO</label>
                      <textarea
                        autocomplete="off"
                        class="form-control"
                        id ="articulo"
                        name="articulo"
                        style="min-height:150px;"
                      >${modifObs}</textarea>
                    </div>
                  </div>
                </div>
                <!-- First Column ends-->
                <% } %>
              </div>
              <!--Submit section starts-->
              <div class="wrap-fixed-float wrap-fixed-bottom-right">
                <% if(rev.contentEquals("true")){ %>
                  <button
                    id="submitButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="submit"
                    name="submit"
                    value="revisarFicha"
                  >
                    <span>CONTINUAR</span>
                    <i class="material-icons vm">done</i>
                  </button>
                <% } else if(cons.contentEquals("true")){ %>
                  <button
                    id="submitButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="submit"
                    name="submit"
                    value="ConsultarFicha"
                  >
                    <span>CONTINUAR </span>
                    <i class="material-icons vm">done</i>
                  </button>
                <% } else { %>
                  <button
                    id="submitButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="button"
                    name="submitButton"
                    value="else"
                  >
                    <span>GUARDAR & FINALIZAR </span>
                    <i class="material-icons vm">done</i>
                  </button>
                  <input class="hide" type="submit" id="submit"
										name="submit" value="else" />
                <% } %>
              </div>
              <!--Submit section ends-->
            </form>
          </div>
          <!--Content ends-->
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
    <form method="post" action="otrosServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="back"
        >
          <i class="material-icons vm">close</i> CANCELAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
    <% if(rev.contentEquals("true")){ %>
    <!--Rev Aprov Reg Modal-->
    <div
      class="modal fade main-font"
      id="revAprovReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form action="otrosServlet" id="revAprovRegForm" method="post">
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
                  ESTADO DE OTROS INSUMOS REGISTRADOS
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  REVISAR & APROBAR
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
                      "
                    >
                      <i
                        id="infoIcon"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >done_all</i
                      >
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection">
                                <input type="hidden" name="modifId" value="${modifId}"/>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>NOMBRE</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayNombre"
                                        name="overlayNombre"
                                        value="${modifNombre}"
                                        required
                                        readonly
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--DATA Section ends-->

                              <!--STATE Section-->
                              <div
                                id="stateSection"
                                class="state-section-aditional-styles"
                              >
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <h5
                                      class="mb-3 text-center"
                                      style="font-weight: bold;"
                                    >
                                      ESTADO 1*
                                    </h5>
                                  </div>
                                </div>
                                <%
                                  String es1 = "";
                                  String es2 = "";
                                  String ob = "";

                                  try{
                                    Connection con = null;
                                    Statement state = null;
                                    ResultSet rs = null;
                                    String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
		                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		                                con = DriverManager.getConnection(url,"admin","system123");
                                    state = con.createStatement();
                                    String id = (String)request.getAttribute("modifId");
                                    String n = "";
                                    if(id != null && !id.isEmpty()){
                                      n = id;
                                    }
                                    String QueryString = "SELECT estado1, estado2, observacion from dbo.otros where num = '" + n + "'";
                                    rs = state.executeQuery(QueryString);

                                    String obs = "";

                                    while(rs.next()){
                                      es1 = rs.getString(1);
                                      es2 = rs.getString(2);
                                      obs = rs.getString(3);
                                    }
                                    if(obs != null && !obs.isEmpty()){
                                      ob = obs;
                                    }

                                    if(es1 != null && es1.contentEquals("APROBADO")){
                                %>
                                      <div class="row">
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="activ1"
                                              name="ap1"
                                              value="true"
                                              checked
                                              enabled
                                            />
                                            <label for="activ1">APROBADO</label>
                                          </div>
                                        </div>
                                         <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="pendienteAprobar"
                                              name="pendienteAprobar"
                                              value="false"
                                              enabled
                                            />
                                            <label for="in1">PENDIENTE DE APROBAR</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="in1"
                                              name="in1"
                                              value="false"
                                              enabled
                                            />
                                            <label for="in1">RECHAZADO</label>
                                          </div>
                                        </div>
                                      </div>
                                <%
                                    }
                                    else if(es1 != null && es1.contentEquals("PENDIENTE DE APROBAR")){
                                %>
                                      <div class="row">
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="activ1"
                                              name="ap1"
                                              value="false"
                                              enabled
                                            />
                                            <label for="activ1">APROBADO</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="pendienteAprobar"
                                              name="pendienteAprobar"
                                              value="true"
                                              enabled
                                              checked
                                            />
                                            <label for="in1">PENDIENTE DE APROBAR</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="in1"
                                              name="in1"
                                              value="false"                                              
                                              enabled
                                            />
                                            <label for="in1">RECHAZADO</label>
                                          </div>
                                        </div>
                                      </div>
                                <%  }else{
                                	%>
                                	<div class="row">
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="activ1"
                                              name="ap1"
                                              value="false"
                                              enabled
                                            />
                                            <label for="activ1">APROBADO</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="pendienteAprobar"
                                              name="pendienteAprobar"
                                              value="false"
                                              enabled
                                              
                                            />
                                            <label for="in1">PENDIENTE DE APROBAR</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-3 col-md-3">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="in1"
                                              name="in1"
                                              value="true"                                              
                                              enabled
                                              checked
                                            />
                                            <label for="in1">RECHAZADO</label>
                                          </div>
                                        </div>
                                      </div>
                                	<%
                                	
                                } 
                                	%>
                                    <div class="row">
                                      <div class="col-lg-12 col-md-12">
                                        <h5
                                          class="mb-3 text-center"
                                          style="font-weight: bold;"
                                        >
                                          ESTADO 2*
                                        </h5>
                                      </div>
                                    </div>
                                <%  if(es2 != null && es2.contentEquals("ACTIVO")){ %>
                                      <div class="row">
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="activ2"
                                              name="act2"
                                              value="true"
                                              checked
                                              enabled
                                            />
                                            <label for="activ2">ACTIVO</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="in2"
                                              name="in2"
                                              value="false"
                                              enabled
                                            />
                                            <label for="in2">INACTIVO</label>
                                          </div>
                                        </div>
                                      </div>
                                <%
                                    }
                                    else{
                                %>
                                      <div class="row">
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="activ2"
                                              name="act2"
                                              value="true"
                                              enabled
                                            />
                                            <label for="activ2">ACTIVO</label>
                                          </div>
                                        </div>
                                        <div class="col-lg-6 col-md-6">
                                          <div class="form-group">
                                            <input
                                              type="checkbox"
                                              id="in2"
                                              name="in2"
                                              value="false"
                                              checked
                                              enabled
                                            />
                                            <label for="in2">INACTIVO</label>
                                          </div>
                                        </div>
                                      </div>
                                  <%}
                                  }
                                  catch(Exception e){System.out.println(e);}
                                  %>
                              </div>
                              <div class="row mt-4">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <label>OBSERVACIONES</label>
                                    <textarea
                                      autocomplete="off"
                                      class="form-control"
                                      id="overlayObs"
                                      name="overlayObs"
                                      style="min-height:150px;"
                                    ><%=ob%></textarea>
                                  </div>
                                </div>
                              </div>
                              <!--STATE Section ends-->
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
                  <div class="col-12 col-md-6 text-center">
                    <button
                      id="submitButton"
                      name="submit"
                      type="submit"
                      value="rev"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
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
    <% } %>
    <!-- Modal Section ends-->
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

    <!-- Java Script section starts -->

    <!-- JQuery -->
    <script src="./assets/js/jquery-3.5.1.js"></script>

    <!-- Utils -->
    <script src="./assets/js/utils.js"></script>

    <!-- Next-navbar -->
    <script src="./assets/js/next-navbar.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      "use strict";

      <% if(rev.contentEquals("true")){ %>

      $("#activ1").on("change", function () {
        $("#in1").prop("checked", false);
        $("#pendienteAprobar").prop("checked", false);
      });

      $("#in1").on("change", function () {
        $("#activ1").prop("checked", false);
        $("#pendienteAprobar").prop("checked", false);
      });
      
      $("#pendienteAprobar").on("change", function () {
          $("#activ1").prop("checked", false);
          $("#in1").prop("checked", false);
        });

      //
      $("#activ2").on("change", function () {
        $("#in2").prop("checked", false);
      });

      $("#in2").on("change", function () {
        $("#activ2").prop("checked", false);
      });

      <%} %>
      
      function getAbsolutePath() {
			var loc = window.location;
			var pathName = loc.pathname.substring(0, loc.pathname
					.lastIndexOf("/") + 1);
			return loc.href
					.substring(
							0,
							loc.href.length
									- ((loc.pathname + loc.search + loc.hash).length - pathName.length));
		}
      
      $("#submitButton").on("click", function(){
    	 
			var url = getAbsolutePath() + "ValidaroOtroExiteAPI";			
			var modifId = document.getElementById("modifId").value;	
			if(document.getElementById("modifId").value == "" ){
				modifId = 0;
			}		
			var nombre = document.getElementById("nombre").value;	
			$.ajax({
						url : url,
						type : "POST",
						dataType : 'json',
						data : {
							nombre : nombre,
							modifId : modifId
						},
						success : function(data) {

							if (parseInt(data) == 0) {
								$("#submit").trigger(
								"click");
							} else {
								$("#confirMessage")
										.text(
												"ALERTA! EL NOMBRE INGRESADO YA SE ENCUENTRA REGISTRADO. POR FAVOR INGRESE UNO NUEVO");
								$("#confirmationModalCenter")
										.modal('show');
								return false;
							}

						},
					});
      });
      
      
    </script>
    <!-- Java Script section ends -->
  </body>
</html>
