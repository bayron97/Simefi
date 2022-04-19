<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	String isModif = (String)request.getAttribute("isModif");
	String mod = "false";
	if(isModif != null && !isModif.isEmpty()){
		mod = isModif;
	}
	String isConsultar = (String)request.getAttribute("isConsultar");
	String cons = "false";
	if(isConsultar != null && !isConsultar.isEmpty()){
		cons = isConsultar;
	}
  String revision = (String)request.getAttribute("isRev");
	String rev = "false";
	if(revision != null && !revision.isEmpty()){
		rev = revision;
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
                      <a class="dropdown-item active" href="#"
                        >DATOS GENERALES</a
                      >
                      <a class="dropdown-item" href="#"
                        >REPRESENTANTES LEGALES</a
                      >
                      <a class="dropdown-item" href="#"
                        >COMITE TECNICO</a
                      >
                      <a class="dropdown-item" href="#"
                        >CONTACTOS</a
                      >
                      <a class="dropdown-item" href="#"
                        >HISTORICO</a
                      >
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">DATOS GENERALES</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">REPRESENTANTES LEGALES</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">COMITE TECNICO</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">CONTACTOS</a>
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
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            <form  id="editRegForm" action="beneficirioServlet" method="post">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-4">
                  <h1 class="mb-0 text-white">
                    BENEFICIARIOS
                  </h1>
                  <h2 class="mb-0 text-white">
                    ADMINISTRACION DE DATOS / BENEFICIARIOS
                  </h2>
                  <span class="badge badge-primary mb-5">
                    <h4 class="text-white font-weight-light ml-2 mr-3">
                      <% if(mod.contentEquals("true")) {%>
                      <i class="material-icons vm">edit</i> MODIFICAR
                      <% } else if(cons.contentEquals("true")) {%>
                      <i class="material-icons vm">chrome_reader_mode</i> CONSULTAR
                      <% } else if(rev.contentEquals("true")) {%>
                      <i class="material-icons vm">done_all</i> REVISAR & APROBAR
                      <% } else {%>
                      <i class="material-icons vm">add_circle</i> NUEVO
                      <% } %>
                    </h4>
                  </span>
                </div>
                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div
                        class="card-body text-center"
                        style="
                          background: url(./assets/img/BAC.png) no-repeat center center fixed;
                          background-size: cover;
                        "
                      >
                        <div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                                <% if(rev.contentEquals("true")){ %>

                                <!--DATA Section starts-->
                                <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <h6
                                        id="instructionSubtitle"
                                        class="mb-3 text-center"
                                        style="font-weight: bold;"
                                      >
                                        I. DATOS GENERALES
                                      </h6>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #1 COLUMNA #1 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DENOMINACION O RAZON SOCIAL*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="denominacion"
                                              name="denominacion"
                                              placeholder=""
                                              value="${modifId}"
                                              required
                                              readonly
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DIRECCION Y/O UBICACION*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="direccion" 
                                              name="direccion"
                                              placeholder=""
                                              value="${modifDireccion}"
                                              required
                                              readonly
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #1 ends-->

                                    <!--FILA #1 COLUMNA #2 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>PAIS*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="pais"
                                              name="pais" 
                                              placeholder=""
                                              value="${modifPais}"
                                              required
                                              readonly
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>NUMERO DE FIDECOMISO*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="fideicomiso"
                                              name="fideicomiso"
                                              value="${modifFideicomiso}"
                                              placeholder=""
                                              required
                                              readonly
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #2 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center"
                                              style="font-weight: bold;"
                                            >
                                              II. SUSCRIPCION DE CONTRATOS
                                            </h6>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <div class="card-body main-font">
                                              <!--Contracts Table Section starts-->
                                              <table
                                                id="datatable"
                                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                              >
                                                <thead>
                                                  <tr>
                                                    <th class="all">No.</th>
                                                    <th class="min-tablet">FECHA DE SUSCRIPCION</th>
                                                    <th class="min-tablet">FECHA DE VENCIMIENTO</th>
                                                    <th class="none">OBSERVACIONES</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <%
							                                      try{
							                                        Connection con = null;
							                                        Statement state = null;
							                                        int i = 1;
							                                        ResultSet rs = null;
							                                        String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							                                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							                                        con = DriverManager.getConnection(url,"admin","system123");
							                                        String idModif = (String)request.getAttribute("modifBeneficiarioFinal");
							                                        state = con.createStatement();
							                                        String QueryString = "SELECT * from dbo.suscripcionContratos where padre = '" + idModif + "'";
							                                        rs = state.executeQuery(QueryString);

							                                        while(rs.next()){
								                                        String fs = rs.getString(1);
								                                        if(rs.wasNull()){
									                                        fs = " ";
								                                        }
								                                        String fv = rs.getString(2);
								                                        if(rs.wasNull()){
									                                        fv = " ";
								                                        }
								                                        String ob = rs.getString(3);
								                                        if(rs.wasNull()){
									                                        ob = " ";
								                                        }
							                                    %>
							                                      <tr>
								                                      <td><%=i%></td>
								                                      <td><%=fs%></td>
								                                      <td><%=fv%></td>
								                                      <td><%=ob.toUpperCase()%></td>
							                                      </tr>
						                                      <%i = i + 1;
						                                          }
						                                          rs.close();
						                                          state.close();
						                                          con.close();
						                                        }catch(Exception e){System.out.println(e);}
					                                      	%>
                                                </tbody>
                                              </table>
                                              <!--Contracts Table Section ends-->
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                </div>
                                <!--DATA Section ends-->

                                <% } else if(mod.contentEquals("true")) { %>

                                <!--DATA Section starts-->
                                <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <h6
                                        id="instructionSubtitle"
                                        class="mb-3 text-center"
                                        style="font-weight: bold;"
                                      >
                                        I. DATOS GENERALES
                                      </h6>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #1 COLUMNA #1 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DENOMINACION O RAZON SOCIAL*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="denominacion"
                                              name="denominacion"
                                              placeholder=""
                                              value="${modifId}"
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DIRECCION Y/O UBICACION*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="direccion" 
                                              name="direccion"
                                              placeholder=""
                                              value="${modifDireccion}"
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #1 ends-->

                                    <!--FILA #1 COLUMNA #2 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>PAIS*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="pais"
                                              name="pais" 
                                              placeholder=""
                                              value="${modifPais}"
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>NUMERO DE FIDECOMISO*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="fideicomiso"
                                              name="fideicomiso"
                                              placeholder=""
                                              value="${modifFideicomiso}"
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #2 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center float-left"
                                              style="font-weight: bold;"
                                            >
                                              II. SUSCRIPCION DE CONTRATOS
                                            </h6>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <button 
                                              class="btn btn-sm btn-success ml-2 float-right"
                                              data-target="#editReg"
                                              data-toggle="modal"
                                              onclick="event.preventDefault();"
                                            >
                                              <i class="material-icons md-18">sync</i>
                                              MODIFICAR
                                            </button>
                                            <button 
                                              class="btn btn-sm btn-success ml-2 float-right"
                                              data-target="#newReg"
                                              data-toggle="modal"
                                              onclick="event.preventDefault();"
                                            >
                                              <i class="material-icons md-18">add_circle</i>
                                              NUEVO CONTRATO
                                            </button>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <div class="card-body main-font">
                                              <!--Contracts Table Section starts-->
                                              <table
                                                id="datatable"
                                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                              >
                                                <thead>
                                                  <tr>
                                                    <th class="all">No.</th>
                                                    <th class="min-tablet">FECHA DE SUSCRIPCION</th>
                                                    <th class="min-tablet">FECHA DE VENCIMIENTO</th>
                                                    <th class="none">OBSERVACIONES:</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                  <%
							                                      try{
							                                        Connection con = null;
							                                        Statement state = null;
							                                        int i = 1;
							                                        ResultSet rs = null;
							                                        String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							                                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							                                        con = DriverManager.getConnection(url,"admin","system123");
							                                        String idModif = (String)request.getAttribute("modifBeneficiarioFinal");
                                                      System.out.println(idModif);
							                                        state = con.createStatement();
							                                        String QueryString = "SELECT * from dbo.suscripcionContratos where padre = '" + idModif + "' order by fechaSubs ASC";
							                                        rs = state.executeQuery(QueryString);

							                                        while(rs.next()){
								                                        String fs = rs.getString(1);
								                                        if(rs.wasNull()){
									                                        fs = " ";
								                                        }
								                                        String fv = rs.getString(2);
								                                        if(rs.wasNull()){
									                                        fv = " ";
								                                        }
								                                        String ob = rs.getString(3);
								                                        if(rs.wasNull()){
									                                        ob = " ";
								                                        }
							                                    %>
							                                      <tr>
								                                      <td><%=i%></td>
								                                      <td><%=fs%></td>
								                                      <td><%=fv%></td>
								                                      <td><%=ob.toUpperCase()%></td>
							                                      </tr>
						                                      <%i = i + 1;
						                                          }
						                                          rs.close();
						                                          state.close();
						                                          con.close();
						                                        }catch(Exception e){System.out.println(e);}
					                                      	%>
                                                </tbody>
                                              </table>
                                              <!--Contracts Table Section ends-->
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                </div>
                                <!--DATA Section ends-->

                                <% } else { %>

                                <!--DATA Section starts-->
                                <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <h6
                                        id="instructionSubtitle"
                                        class="mb-3 text-center"
                                        style="font-weight: bold;"
                                      >
                                        I. DATOS GENERALES
                                      </h6>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #1 COLUMNA #1 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DENOMINACION O RAZON SOCIAL*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="denominacion"
                                              name="denominacion"
                                              placeholder=""
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>DIRECCION Y/O UBICACION*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="direccion" 
                                              name="direccion"
                                              placeholder=""
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #1 ends-->

                                    <!--FILA #1 COLUMNA #2 starts-->
                                    <div class="col-lg-6 col-md-6">
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>PAIS*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="pais"
                                              name="pais" 
                                              placeholder=""
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group">
                                            <label>NUMERO DE FIDECOMISO*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id ="fideicomiso"
                                              name="fideicomiso"
                                              placeholder=""
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                    <!--FILA #1 COLUMNA #2 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center float-left"
                                              style="font-weight: bold;"
                                            >
                                              II. SUSCRIPCION DE CONTRATOS
                                            </h6>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <button 
                                              class="btn btn-sm btn-success ml-2 float-right"
                                              data-target="#newReg"
                                              data-toggle="modal"
                                              onclick="event.preventDefault();"
                                            >
                                              <i class="material-icons md-18">add_circle</i>
                                              NUEVO CONTRATO
                                            </button>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <div class="card-body main-font">
                                              <!--Contracts Table Section starts-->
                                              <table
                                                id="datatable"
                                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                              >
                                                <thead>
                                                  <tr>
                                                    <th class="all">No.</th>
                                                    <th class="min-tablet">FECHA DE SUSCRIPCION</th>
                                                    <th class="min-tablet">FECHA DE VENCIMIENTO</th>
                                                    <th class="none">OBSERVACIONES</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                              </table>
                                              <!--Contracts Table Section ends-->
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                </div>
                                <!--DATA Section ends-->
                                <% } %>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--Hidden data for wizard section starts-->
              <input autocomplete="off" type="hidden" name="isModif" value="${isModif}">
		    		  <input autocomplete="off" type="hidden" name="isRev" value="${isRev}">
		    		  <input autocomplete="off" type="hidden" name="modifId" value="${modifId}">
		    		  <input autocomplete="off" type="hidden" name="tipo" value="beneficiario">
		    		  <input autocomplete="off" type="hidden" name="modifTipo" value="BENEFICIARIO">
		    		  <input autocomplete="off" type="hidden" name="isConsultar" value="${isConsultar}">
              <!--Hidden data for wizard section ends-->
              <div
                class="modal-footer border-0 pt-0"
                style="background-color: #f1f1f1;"
              >
                <!-- Submit Float Button -->
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                  <button
                    id="submitButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="button"
                    name="submitBtn"
                  >
                    <% if(cons.contentEquals("true") || rev.contentEquals("true")){ %>
                    <span>CONTINUAR</span>
                    <% } else{ %>
                    <span>GUARDAR & CONTINUAR</span>
                    <% } %>
                    <i class="material-icons vm">arrow_forward</i>
                  </button>
                </div>
              </div>
            </form>
            <!--Form Edit Reg ends-->
          </div>
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
    <form method="post" action="beneficirioServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="back"
        >
          <i class="material-icons vm">close</i>CANCELAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--New Reg Modal-->
    <div
      class="modal fade main-font"
      id="newReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form action="" id="newRegForm" method="post">
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
                  FORMULARIO PARA CONTRATOS DE BENEFICIARIOS
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  NUEVO REGISTRO DE CONTRATO
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
                        >format_shapes</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):
                      </h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection">
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>FECHA DE SUSCRIPCION*</label>
                                      <input
                                        autocomplete="off"
                                        type="date"
                                        class="form-control"
                                        id="Fs"
                                        name="Fs"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>FECHA DE VENCIMIENTO*</label>
                                      <input
                                        autocomplete="off"
                                        type="date"
                                        class="form-control"
                                        id="Fv"
                                        name="Fv"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>OBSERVACIONES*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="Obs"
                                        name="Obs"
                                        placeholder=""
                                        required
                                        onkeyup="javascript:this.value=this.value.toUpperCase();"
                                      />
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
                      onclick="event.preventDefault();"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center" id="submitButtonDiv">
                    <button
                      type="button"
                      id="enviar"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      onclick="event.preventDefault();"
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

    <!--Custom New Modal-->

    <!-- Modal Section ends-->
    
    <!-- Modal Section starts-->

    <!--Edit Reg Modal-->
    <div
      class="modal fade main-font"
      id="editReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form action="" id="newRegForm" method="post">
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
                  FORMULARIO PARA EDITAR CONTRATOS DE BENEFICIARIOS
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  EDITAR REGISTRO DE CONTRATO
                </h4>
              </div>
			 <input type="hidden" id="modIndex" name="modIndex"/>
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
                        >format_shapes</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):
                      </h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection">
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>FECHA DE SUSCRIPCION*</label>
                                      <input
                                        autocomplete="off"
                                        type="date"
                                        class="form-control"
                                        id="FsEdit"
                                        name="FsEdit"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>FECHA DE VENCIMIENTO*</label>
                                      <input
                                        autocomplete="off"
                                        type="date"
                                        class="form-control"
                                        id="FvEdit"
                                        name="FvEdit"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>OBSERVACIONES*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="ObsEdit"
                                        name="ObsEdit"
                                        placeholder=""
                                        required
                                        onkeyup="javascript:this.value=this.value.toUpperCase();"
                                      />
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
                      onclick="event.preventDefault();"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center" id="submitButtonDiv">
                    <button
                      type="button"
                      id="enviarEdit"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      onclick="event.preventDefault();"
                    >
                      MODIFICAR
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

    <!--Custom New Modal-->

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

    <!-- DataTables js -->
    <script src="./assets/vendor/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.responsive.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedHeader.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedColumns.min.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      "use strict";

      function setinputFilter(textbox, inputFilter) {
	      ["input", "keydown", "keyup", "mousedown", "mouseup", "select", "contextmenu", "drop"].forEach(function(event){
	        textbox.addEventListener(event, function(){
	          if (inputFilter(this.value)) {
	            this.oldValue = this.value;
	            this.oldSelectionStart = this.selectionStart;
	            this.oldSelectionEnd = this.selectionEnd;
	          } 
            else if (this.hasOwnProperty("oldValue")){
	            this.value = this.oldValue;
	            this.setSelectionRange(this.oldSelectionStart, this.oldSelectionEnd);
	          } 
            else{
	            this.value = "";
	          }
	        });
	      });
	    }

      $(document).ready(function () {
    	  
    	  <%
    	  String error = (String)request.getAttribute("mostrarmensaje");
    	  if(error != null && !error.isEmpty()){
    		  %>
    		  $("#confirMessage").text("ERROR! AL REGISTRAR POR FAVOR INTENTE DE NUEVO O CONTACTE AL ADMINISTRADOR");
    	        $("#confirmationModalCenter").modal('show');
    		  <%
    	  }
    	  %>
    	  
        setinputFilter(document.getElementById("fideicomiso"), function(value) {return /^\d*$/.test(value);});

        /* data Table */
        var t = $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          paging: false,
          iDisplayLength: -1,
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

        var counter = document.getElementById('datatable').rows.length;
        $('#enviar').on( 'click', function () {
        	var pos = counter;
        	var cell = t.row(0).data();
        	if (cell === undefined){
        		pos = 1;
        	}
       	    if(document.getElementById("Fs").value && document.getElementById("Fv").value){
    		 
    		    var fs = document.getElementById("Fs").value.split("-");
    		    var fv = document.getElementById("Fv").value.split("-");
    		 	
    		    var fechaS = fs[2] + '/' + fs[1] + '/' + fs[0];
    		    var fechaV = fv[2] + '/' + fv[1] + '/' + fv[0];
    		    t.row.add( [
              pos,
              fechaS,
              fechaV,
              document.getElementById("Obs").value
            ]).draw( false );
    		    counter++;
            $("#newRegForm")[0].reset();
    	    }            
    	    else{
    		    alert("Error, Debe llenar ambas fechas");
    	    }
        });
        
        $("#submitButton").on("click", function(){
        	var container = document.getElementById("editRegForm");
        	if (t.data().any()) {
                for (var r = 0, n = t.rows().count(); r < n; r++) {
                  var cell = t.row(r).data();
                  var inputN = document.createElement("input");
                  inputN.setAttribute("type", "hidden");
                  inputN.setAttribute("name", "fsCont");
                  if (cell[1]) {
                    inputN.setAttribute("value", cell[1]);
                  }
                  container.appendChild(inputN);

                  var inputC = document.createElement("input");
      		      inputC.setAttribute("type", "hidden");
      		      inputC.setAttribute("name", "fvCont");
      		      if (cell[2]){
                    inputC.setAttribute("value", cell[2]);
                  }
      		      container.appendChild(inputC);
      		    
      		      var inputD = document.createElement("input");
      		      inputD.setAttribute("type", "hidden");
      		      inputD.setAttribute("name", "obsCont");
      		      if (cell[3]) {
                    inputD.setAttribute("value", cell[3]);
                  }
      		      container.appendChild(inputD);
                }
              }
        	document.getElementById("submitButton").value = "else";
        	document.getElementById("editRegForm").submit();
        });
        
        $("#enviarEdit").on("click", function(){
        	if($("#modIndex").prop("value")){
        		var fs = document.getElementById("FsEdit").value.split("-");
    		    var fv = document.getElementById("FvEdit").value.split("-");
    		 	
    		    var fechaS = fs[2] + '/' + fs[1] + '/' + fs[0];
    		    var fechaV = fv[2] + '/' + fv[1] + '/' + fv[0];
    		    var index = $("#modIndex").prop("value");
    		    t.cell(index, 1).data(fechaS).draw();
    		    t.cell(index, 2).data(fechaV).draw();
    		    t.cell(index, 3).data($("#ObsEdit").prop("value")).draw();
        	}	
        });
      });
      
      $("#datatable tr").click(function() {
			$(this).addClass("selected").siblings().removeClass("selected");
			$("#modIndex").prop("value",$(this).index());
			var value;
			value = $(this).find("td:eq(1)").text();
			var fs = value.split("/");
			var fechaS = fs[2] + '-' + fs[1] + '-' + fs[0];
			$("#FsEdit").prop("value", fechaS);
			value = $(this).find("td:eq(2)").text();
			fs = value.split("/");
			fechaS = fs[2] + '-' + fs[1] + '-' + fs[0];
			$("#FvEdit").prop("value", fechaS);
			value = $(this).find("td:eq(3)").text();
			$("#ObsEdit").prop("value", value);	
		});

    </script>

    <!-- Java Script section ends -->
  </body>
</html>
