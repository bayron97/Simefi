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

  <body class="header-fixed-top body-general-styles">
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
                <form method="post" action="pcGeneralRouting">
                <nav class="navbar col-12 main-font">
                <input class="hide" type="submit" name="nextJsp" value ="apertura" id="aper" />
                <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
                <input class="hide" type="submit" name="nextJsp" value ="requerimientos" id="req" />
                <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                <input class="hide" type="submit" name="nextJsp" value ="digitalizacion" id="dig" />
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
                      <label class="dropdown-item" for="aper">DATOS DE APERTURA</label>
                      <a class="dropdown-item active" href="#">CRITERIOS DE EVALUACION</a>
                      <label class="dropdown-item" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                      <label class="dropdown-item" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>

                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link" for="aper">DATOS DE APERTURA</label>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">CRITERIOS DE EVALUACION</a>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="dig">TERMINOS DE REFERENCIA</label>
                    </li>
                  </ul>
                </nav>
                </form>
                <!-- Submenu section ends -->
              </div>
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
              String funcion = (String)session.getAttribute("funcion");
              String func = (String)session.getAttribute("funcion");
              String type = (String)session.getAttribute("type");
              int co = (int)session.getAttribute("noCompra");
              String criterio1 = (String)session.getAttribute("criterio1");
              System.out.println(criterio1);

            %>
            <form id="newEditRegForm" method="post" action="CriterioEvaluacionGeneralServlet">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-5">
                  <h1 class="mb-0 text-white">
                    PROCESO DE COMPRA GENERAL
                  </h1>
                  <span class="badge badge-primary mb-5">
                    <h4 class="text-white font-weight-light ml-2 mr-3">
                      <% if (func.toUpperCase().contentEquals("NUEVO")) {%>
                      <i class="material-icons vm">add_circle</i>
                      <% } else if (func.toUpperCase().contentEquals("MODIFICAR")) {%>
                      <i class="material-icons vm">edit</i>
                      <% } else if (func.toUpperCase().contentEquals("CONSULTAR")) {%>
                      <i class="material-icons vm">chrome_reader_mode</i>
                      <% } else if (func.toUpperCase().contentEquals("REVISAR")) {%>
                      <i class="material-icons vm">done_all</i>
                      <% } else {%>
                      <i class="material-icons vm">error</i>
                      <% } %>
                      <%=func.toUpperCase()%>
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
                        <i
                          id="infoIcon"
                          class="avatar avatar-60 md-36 material-icons text-template-primary"
                          >assignment</i
                        >
                        <h5
                          id="instructionSubtitle"
                          class="mb-3 text-center"
                          style="font-weight: bold;"
                        >
                          CRITERIOS DE EVALUACION
                        </h5>
                        <div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                                <!--DATA Section-->
                                <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                        <label class="mb-3" style="font-weight: bold;">REGISTRO DE PROVEEDOR</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio1"
                                          name="criterio1"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">DESCRIPCION TECNICA</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio2"
                                          name="criterio2"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">CANTIDAD</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio3"
                                          name="criterio3"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">ICOTERM</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio4"
                                          name="criterio4"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">REGISTRO SANITARIO/RECONOCIMIENTO MUTUO/OTROS/CONSTANCIA/SOLICITUD</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio5"
                                          name="criterio5"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">CERTIFICADO BUENAS PRACTICAS DE MANUFACTURA/CPP/ISO/OTROS/CONSTANCIA/SOLICITUD</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio6"
                                          name="criterio6"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">GARANTIA DE MANTENIMIENTO DE OFERTA</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio7"
                                          name="criterio7"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">TIEMPOS DE ENTREGA</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio8"
                                          name="criterio8"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">VIDA UTIL</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio9"
                                          name="criterio9"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">MANTENIMIENTO DE CAPACITACION</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio10"
                                          name="criterio10"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">GARANTIA DE FABRICA</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio11"
                                          name="criterio11"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">CARTA DE COMPROMISO DE REPUESTOS/ACCESORIOS Y SOPORTE TECNICO</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio12"
                                          name="criterio12"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">ASEGURAMIENTO DE CALIDAD</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio13"
                                          name="criterio13"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">HISTORIAL DE CUMPLIMIENTO DE CONTRATOS</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio14"
                                          name="criterio14"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <label class="mb-3" style="font-weight: bold;">RAZONABILIDAD DE PRECIOS</label>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="criterio15"
                                          name="criterio15"
                                        >
                                          <option selected value="">
                                            SELECCIONA UNA OPCION...
                                          </option>
                                          <% try{ 
                                              Connection con = null;
                                              Statement state = null; 
                                              ResultSet rs = null; 
                                              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                              con = DriverManager.getConnection(url,"admin","system123");
                                              state = con.createStatement(); 
                                              String QueryString = "select * from CriteriosEvaluacionPurchaseProcess";
                                              rs = state.executeQuery(QueryString);
                                              while(rs.next()){%>
                                                <option value="<%=rs.getString(2)%>">
                                                  <%=rs.getString(3).toUpperCase() %>
                                                </option>
                                          <%} } catch(Exception e){ System.out.println(e); }
                                          %>
                                        </select>
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
                <!-- Submit Float Button -->
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                  <button
                    id="submitExternalButton"
                    name="submit"
                    type="submit"
                    class="btn btn-primary btn-rounded shadow main-font"
                    <% if(funcion != null && funcion.contentEquals("revisar")){
                    %>
                    data-target="#revAprovRegModal"
                    data-toggle="modal"
                    <%
                    }
                    %>
                  >
                    <span> GUARDAR Y CONTINUAR</span>
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
    <form method="post" action="nPurchaseProcessGeneral.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Confirmation Modal -->
    <div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="">
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
                ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!--Custom New Modal Here-->

    <!-- Modal Section ends-->

    <!--Special Section starts-->
    <!--form
      id="regListForm"
      method="post"
      action="CriterioEvaluacionGeneralServlet"
      class="hide"
    ></form-->
    
    <form target="_blank"
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!--Special Section ends-->

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
      <%if(!funcion.contentEquals("nuevo") && !funcion.contentEquals("modificar")){%>
	      document.getElementById("criterio1").disabled = true;
	      document.getElementById("criterio2").disabled = true;
	      document.getElementById("criterio3").disabled = true;
	      document.getElementById("criterio4").disabled = true;
	      document.getElementById("criterio5").disabled = true;
	      document.getElementById("criterio6").disabled = true;
	      document.getElementById("criterio7").disabled = true;
	      document.getElementById("criterio8").disabled = true;
	      document.getElementById("criterio9").disabled = true;
	      document.getElementById("criterio10").disabled = true;
	      document.getElementById("criterio11").disabled = true;
	      document.getElementById("criterio12").disabled = true;
	      document.getElementById("criterio13").disabled = true;
	      document.getElementById("criterio14").disabled = true;
	      document.getElementById("criterio15").disabled = true;
      <%}%>
    </script>
    <!-- Java Script section ends -->

    <% if(funcion != null && !funcion.contentEquals("nuevo")){
        try{ 
          Connection con = null;
          Statement state = null;
          ResultSet rs = null;
          String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          con = DriverManager.getConnection(url,"admin","system123");
          state = con.createStatement();
          int co1 = -1;
          if(co > 0 ){
            co1 = co;
          }
          String QueryString = "SELECT * FROM dbo.CriterioEvaluacionGeneral where cod=" + co;
          rs = state.executeQuery(QueryString);
          while(rs.next()){ 
          %>
            <script>
                $("#criterio1").val(<%=rs.getString(2)%>)
                $("#criterio2").val(<%=rs.getString(3)%>)
                $("#criterio3").val(<%=rs.getString(4)%>)
                $("#criterio4").val(<%=rs.getString(5)%>)
                $("#criterio5").val(<%=rs.getString(6)%>)
                $("#criterio6").val(<%=rs.getString(7)%>)
                $("#criterio7").val(<%=rs.getString(8)%>)
                $("#criterio8").val(<%=rs.getString(9)%>)
                $("#criterio9").val(<%=rs.getString(10)%>)
                $("#criterio10").val(<%=rs.getString(11)%>)
                $("#criterio11").val(<%=rs.getString(12)%>)
                $("#criterio12").val(<%=rs.getString(13)%>)
                $("#criterio13").val(<%=rs.getString(14)%>)
                $("#criterio14").val(<%=rs.getString(15)%>)
                $("#criterio15").val(<%=rs.getString(16)%>)
            </script>
          <%
              } 
          rs.close();
          state.close();
          con.close();
        }catch(Exception e){System.out.println(e);}
    }
  %>
  </body>
</html>
