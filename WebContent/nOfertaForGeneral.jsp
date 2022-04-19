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
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-12">
                    <h2 class="mb-4 large-title">
                      VACIADO DE OFERTAS RECIBIDAS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      COMPRAS GENERALES
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-body main-font">
              <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
              <!--DATA Section-->
              <div id="dataSection">
                <div class="row">
                  <div class="col-lg-6 col-md-6">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>PROCESO DE COMPRA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="purchaseProc"
                            name="purchaseProc"
                            value="${buyProcessNumber}"
                            required
                            readonly
                          />
                        </div>
                      </div>
                    </div>
                    <div class="form-group" style="text-align: left">
                      <label>FECHA DE OFERTA</label>
                      <input
                        autocomplete="off"
                        type="date"
                        class="form-control"
                        id="date"
                        name="date"
                        placeholder=""
                        required
                      />
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>DISTRIBUIDOR/FABRICANTE</label>
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="distributor"
                            name="distributor"
                          >
                            <option selected disabled value="">
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
                              String QueryString = "select denominacion from distribuidor where estado2 = 'ACTIVO' and distribuidor != 'BENEFICIARIO'";
                              rs = state.executeQuery(QueryString);
                              while(rs.next()){%>
                                <option value="<%=rs.getString(1)%>">
                                  <%=rs.getString(1).toUpperCase()%>
                                </option>
                            <%} } catch(Exception e){ System.out.println(e); }
                            %>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>MONEDA</label>
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="currency"
                            name="currency"
                          >
                            <option selected disabled value="">SELECCIONA UNA OPCION...</option>
                            <option value="USD">DOLARES AMERICANOS (USD)</option>
                            <option value="L">LEMPIRAS (LPS.)</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-9 col-md-9">
                        <div class="form-group" style="text-align: left">
                          <label>NOMBRE DEL PRODUCTO ESTIMADO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="productName"
                            name="productName"
                            required
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-3 col-md-3 align-self-end">
                        <div class="form-group">
                          <button
                            class="btn btn-sm btn-success ml-2"
                            style="height: 60px"
                            data-target="#medInsumosModal"
                            data-toggle="modal"
                            id="medInsumosEstModalButton"
                          >
                            <i class="material-icons md-18">add_box</i>
                          </button>
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>CODIGO ATC</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="medInsumoCod"
                            name="medInsumoCod"
                            placeholder=""
                            required
                            readonly
                          />
                        </div>
                      </div>
                    </div>
                    <div class="form-group" style="text-align: left">
                      <label>UNIDAD DE PRESENTACION OFERTADA</label>
                      <select
                        autocomplete="off"
                        class="form-control"
                        id="presentationUnit"
                        name="presentationUnit"
                      >
                        <option selected disabled value="">
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
                            String QueryString = "SELECT * from dbo.up where estado = 'ACTIVO'"; 
                            rs = state.executeQuery(QueryString);
                            while(rs.next()){ %>
                              <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                        <%} rs.close(); 
                        state.close();
                        con.close(); }catch(Exception e){System.out.println(e);} %>
                        <option value="NINGUNO">NINGUNO</option>
                      </select>
                    </div>
                    <div class="form-group" style="text-align: left">
                      <label>PRECIO UNITARIO OFERTADO</label>
                      <input
                        autocomplete="off"
                        type="number"
                        min="1"
                        class="form-control"
                        id="price"
                        name="price"
                        placeholder=""
                        required
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>NOMBRE DEL PRODUCTO OFERTADO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="offeredMed"
                            name="offeredMed"
                            placeholder=""
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label
                            >DESCRIPCION / ESPECIFICACION TECNICA
                            OFERTADA</label
                          >
                          <textarea
                            autocomplete="off"
                            class="form-control"
                            id="technicDescriptionOffered"
                            name="technicDescription"
                            placeholder=""
                            style="height: 530px"
                          ></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-right mr-2">
                      <button
                        class="btn btn-sm btn-success ml-2"
                        id="resetInputsButton"
                        type="button"
                      >
                        <i class="material-icons md-18">replay</i>
                        REINICIAR CAMPOS
                      </button>
                      <button
                        class="btn btn-sm btn-success ml-2"
                        id="addRegButton"
                        type="button"
                        data-toggle="modal"
                        data-target="#confirmationModalCenter"
                      >
                        <i class="material-icons md-18">done</i>ACEPTAR
                      </button>
                      <button
                        class="btn btn-sm btn-success ml-2 hide"
                        id="confirmEditRegButton"
                        type="button"
                        data-toggle="modal"
                        data-target="#confirmationModalCenter"
                      >
                        <i class="material-icons md-18">done</i>CONFIRMAR
                        EDICION
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <!--DATA Section ends-->
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left ml-2">
                    <button
                      class="btn btn-sm btn-danger ml-2"
                      id="deleteRegButton"
                      type="button"
                      data-toggle="modal"
                      data-target="#confirmationModalCenter"
                    >
                      <i class="material-icons md-18">close</i>ELIMINAR
                      SELECCIONADO
                    </button>
                    <button
                      type="button"
                      class="btn btn-sm btn-success ml-2"
                      id="editRegButton"
                    >
                      <i class="material-icons md-18">create</i>EDITAR
                      SELECCIONADO
                    </button>
                  </div>
                </div>
              </div>
              <% } else { %>
              <!--DATA Section starts-->
              <div id="dataSection">
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group" style="text-align: left">
                      <label>PROCESO DE COMPRA</label>
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="purchaseProc"
                        name="purchaseProc"
                        value="${buyProcessNumber}"
                        required
                        readonly
                      />
                    </div>
                  </div>
                </div>
              </div>
              <!--DATA Section ends-->
              <% } %>
              <!--Table Section starts-->
              <% int codPadre = (int)session.getAttribute("codPadre"); %>
              <div class="card-body main-font">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: scroll; width: 100px;"
                  aria-describedby="Tabla de ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">NO. ITEM</th>
                      <th class="min-desktop">DISTRIBUIDOR/FABRICANTE</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">
                        NOMBRE DEL PRODUCTO ESTIMADO
                      </th>
                      <th class="min-desktop">
                        NOMBRE DEL PRODUCTO OFERTADO
                      </th>
                      <th class="min-desktop">
                        DESCRIPCION/ESPECIFICACION TECNICA OFERTADA
                      </th>
                      <th class="min-desktop">
                        UNIDAD DE PRESENTACION OFERTADA
                      </th>
                      <th class="min-desktop">
                        PRECIO UNITARIO OFERTADO
                      </th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">FECHA</th>
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
                      state = con.createStatement();
                      String QueryString = "SELECT distribuidor, codATC, medicamentoEstimado, medicamentoOfertado, descripcionTecnica, up, precio, moneda, fechaOferta from dbo.ofertaGeneral where codPadre = " + codPadre; 
                      rs = state.executeQuery(QueryString);
                    %>
                    <% while(rs.next()){
                      String td = rs.getString(5);
                      if(td == null || td.isEmpty())
                      { 
                        td = "-"; 
                      }
                      String up = rs.getString(6);
                      if(up == null || up.isEmpty())
                      {
                        up = "-";
                      }
                      String fecha = rs.getString(9); 
                      if(fecha == null || fecha.isEmpty())
                      { 
                        fecha = "-";
                      } 
                    %>
                      <tr>
                        <td><%=i%></td>
                        <td><%=rs.getString(1).toUpperCase()%></td>
                        <td><%=rs.getString(2).toUpperCase()%></td>
                        <td><%=rs.getString(3).toUpperCase()%></td>
                        <td><%=rs.getString(4).toUpperCase()%></td>
                        <td><%=td.toUpperCase()%></td>
                        <td><%=up.toUpperCase()%></td>
                        <td><%=rs.getString(7).toUpperCase()%></td>
                        <td><%=rs.getString(8).toUpperCase()%></td>
                        <td><%=fecha.toUpperCase()%></td>
                      </tr>
                    <%i = i + 1; } 
                      rs.close(); 
                      state.close(); 
                      con.close();
                      }catch(Exception e){ System.out.println(e); } 
                    %>
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-right mr-4">
                    <button
                      class="btn btn-sm btn-success ml-2"
                      id="generalReportButton"
                      type="button"
                    >
                      <i class="material-icons md-18">reorder</i>
                      REPORTE GENERAL
                    </button>
                  </div>
                </div>
              </div>
            </div>
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
	  <form
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <form class="main-font" action="ofertaGeneralServlet" method="post" id="newEditRegForm">

      <!--*****Total Form Info Here*****-->

      <!-- Cancel Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>

      <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
      <!-- Submit Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
        <button
          id="submitButton"
          name="submit"
          type="submit"
          value="newOffers"
          class="btn btn-primary btn-rounded shadow"
        >
          <span> GUARDAR</span>
          <i class="material-icons vm">done</i>
        </button>
      </div>
      <% } %>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
    <!--Med Insumos Modal-->
    <div
      class="modal fade main-font"
      id="medInsumosModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Med Insumos starts-->
        <div id="medInsumosContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5" style="z-index: 0">
                <h1 class="mb-0 text-white">
                  LISTADO DE PRODUCTOS ESTIMADOS EN PROCESO DE COMPRA
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  SELECCIONE UN PRODUCTO
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
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--Med Insumos Table Section starts-->
                              <table
                                id="medInsumosTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de productos Estimados"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">NO.</th>
                                    <th class="min-tablet">
                                      NOMBRE DEL PRODUCTO
                                    </th>
                                    <th class="min-tablet">
                                      DESCRIPCION TECNICA
                                    </th>
                                    <th class="min-tablet">CODIGO</th>
                                    <th class="min-tablet">CANTIDAD DE OFERTAS</th>
                                  </tr>
                                </thead>
                                </tbody></tbody>
                              </table>
                              <!--Med Insumos Table Section ends-->
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
              style="background-color: #f1f1f1"
            >
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-12 text-center">
                    <button
                      type="button"
                      id="cancelModalButton"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      ACEPTAR
                    </button>
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
    <% } %>
    <!--Custom New Modal-->

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
    <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
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
        $("#productName").prop("value", "");
        $("#presentationUnit").prop("value", "");
        $("#price").prop("value", "");
        $("#currency").prop("value", "");
        $("#medInsumoCod").prop("value", "");
        $("#offeredMed").prop("value", "");
        $("#technicDescriptionOffered").prop("value", "");
      }

      $(document).ready(function () {
        /* data Table */
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 7,
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
          scrollX: true,
        });
        
      //Generador de Reporte
        $("#generalReportButton").on("click", function(event){
      	  var container = document.getElementById("reportForm");
      	 if(reqTable.data().any()){
		    for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
		    var cell = reqTable.row(r).data();
  		    var inputNo = document.createElement("input");
  	        inputNo.setAttribute("type", "hidden");
  	        inputNo.setAttribute("name", "no");
  	        if(cell[0]){
  	          inputNo.setAttribute("value", cell[0]);
  	        }
  	        container.appendChild(inputNo);
  	              
  	        var inputDIST = document.createElement("input");
  	        inputDIST.setAttribute("type", "hidden");
  	        inputDIST.setAttribute("name", "distribuidor");
  	        if(cell[1]){
  	          inputDIST.setAttribute("value", cell[1]);  
  	        }
  	        container.appendChild(inputDIST);
  	        var inputATC = document.createElement("input");
  	        inputATC.setAttribute("type", "hidden");
  	        inputATC.setAttribute("name", "atc");
  	        if(cell[2]){
  	          inputATC.setAttribute("value", cell[2]);  
  	        } 	       
  	        container.appendChild(inputATC);
  	              
  	        var inputMR = document.createElement("input");
  	        inputMR.setAttribute("type", "hidden");
  	        inputMR.setAttribute("name", "medicamentoReg");
  	        if(cell[3]){
  	          inputMR.setAttribute("value", cell[3]);  
  	        }
  	        container.appendChild(inputMR);
  	              
  	        var inputMO = document.createElement("input");
  	        inputMO.setAttribute("type", "hidden");
  	        inputMO.setAttribute("name", "medicamentoOFF");
  	          if(cell[4]){
  	            inputMO.setAttribute("value", cell[4]);	
  	          }
  	        
  	        container.appendChild(inputMO);
  	              
  	        var inputDesc = document.createElement("input");
  	        inputDesc.setAttribute("type", "hidden");
  	        inputDesc.setAttribute("name", "descripcion");
  	        if(cell[5]){
  	          inputDesc.setAttribute("value", cell[5]);  
  	        }
  	        container.appendChild(inputDesc);
  	              
  	        var inputUP = document.createElement("input");
  	        inputUP.setAttribute("type", "hidden");
  	        inputUP.setAttribute("name", "up");
  	          if(cell[6]){
  	            inputUP.setAttribute("value", cell[6]);
  	          }      
  	        
  	        container.appendChild(inputUP);    
  		    }
		    
		    var inputPU = document.createElement("input");
  	        inputPU.setAttribute("type", "hidden");
  	        inputPU.setAttribute("name", "precio");
  	        if(cell[7]){
  	          inputPU.setAttribute("value", cell[7]);  
  	        }
  	        container.appendChild(inputPU);
  		  }
      		var inputOrigin = document.createElement("input");
  	        inputOrigin.setAttribute("type", "hidden");
  	        inputOrigin.setAttribute("name", "origin");
  	      	inputOrigin.setAttribute("value", "oferta");
  	      	container.appendChild(inputOrigin);
    		event.preventDefault();
    		$("#reportForm").submit();
        });

         /*Req List Select Function*/
        $("#reqTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          const distributor = $(this).find("td:eq(1)").text();
          const medInsumoCod = $(this).find("td:eq(2)").text();
          const productName = $(this).find("td:eq(3)").text();
          const offeredMed = $(this).find("td:eq(4)").text();
          const technicDescriptionOffered = $(this).find("td:eq(5)").text();
          const presentationUnit = $(this).find("td:eq(6)").text();
          const price = $(this).find("td:eq(7)").text();
          const currency = $(this).find("td:eq(8)").text();
          const date = $(this).find("td:eq(9)").text();

          $("#editRegButton").on("click", function (event) {
            event.preventDefault();
            $("#date").prop("value", date);
            $("#distributor").prop("value", distributor);
            $("#medInsumoCod").prop("value", medInsumoCod);
            $("#productName").prop("value", productName);
            $("#offeredMed").prop("value", offeredMed);
            $("#technicDescriptionOffered").prop("value", technicDescriptionOffered);
            $("#presentationUnit").prop("value", presentationUnit);
            $("#price").prop("value", price);
            $("#currency").prop("value", currency);
            $("#confirmEditRegButton").removeClass("hide");
            $("#addRegButton").addClass("hide");
          });

          const rowSelected = $(this);

          /*Delete Reg Function*/

          $("#deleteRegButton").on("click", function (event) {
            event.preventDefault();
            reqTable.row(rowSelected).remove().draw();
            $("#confirMessage").text("EXITOSO! REGISTRO BORRADO CORRECTAMENTE...");
          });

          /*Edit Reg Confirm Function*/

          $("#confirmEditRegButton").on("click", function (event) {
            event.preventDefault();
            if (
              $("#purchaseProc").val() === "" ||
              $("#date").val() === "" ||
              $("#distributor").val() === "" ||
              $("#productName").val() === "" ||
              $("#presentationUnit").val() === "" ||
              $("#price").val() === "" ||
              $("#currency").val() === "" ||
              $("#medInsumoCod").val() === "" ||
              $("#offeredMed").val() === "" ||
              $("#technicDescriptionOffered").val() === ""
            ) {
              $("#confirMessage").text("ERROR! DEBE LLENAR TODOS LOS CAMPOS PARA EDITAR UN REGISTRO");
            } else {
            	if (
            		$("#distributor").val() != rowSelected.find("td:eq(1)").text()||
            		$("#medInsumoCod").val() != rowSelected.find("td:eq(2)").text() ||
            		$("#productName").val() != rowSelected.find("td:eq(3)").text() ||
            		$("#offeredMed").val().toUpperCase() != rowSelected.find("td:eq(4)").text() ||
            		$("#technicDescriptionOffered").val().toUpperCase() != rowSelected.find("td:eq(5)").text() ||
            		$("#presentationUnit").val() != rowSelected.find("td:eq(6)").text() ||
            		$("#price").val() != rowSelected.find("td:eq(7)").text()
            		) {
            		reqTable.row(rowSelected).remove().draw();
                    reqTable.row
                      .add([
                        rowSelected.find("td:eq(0)").text(),
                        $("#distributor").val(),
                        $("#medInsumoCod").val(),
                        $("#productName").val(),
                        $("#offeredMed").val().toUpperCase(),
                        $("#technicDescriptionOffered").val().toUpperCase(),
                        $("#presentationUnit").val(),
                        $("#price").val(),
                        $("#currency").val(),
                        $("#date").val()
                      ])
                      .draw();
                    }
            	
              $("#confirmEditRegButton").addClass("hide");
              $("#addRegButton").removeClass("hide");

              cleanFields();

              $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
              
            }
          });
        });

        /* Automatically add a first row of data*/

        $("#addRegButton").on("click", function (event) {
          event.preventDefault();
          var counter = $("#reqTable tr").length;
          counter++;
          if (
            $("#purchaseProc").val() === "" ||
            $("#date").val() === "" ||
            $("#distributor").val() === "" ||
            $("#productName").val() === "" ||
            $("#presentationUnit").val() === "" ||
            $("#price").val() === "" ||
            $("#currency").val() === "" ||
            $("#medInsumoCod").val() === "" ||
            $("#offeredMed").val() === "" ||
            $("#technicDescriptionOffered").val() === ""
          ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL NUEVO MEDICAMENTO..."
            );
          } else {
            reqTable.row
              .add([
                counter,
                $("#distributor").val(),
                $("#medInsumoCod").val(),
                $("#productName").val(),
                $("#offeredMed").val().toUpperCase(),
                $("#technicDescriptionOffered").val().toUpperCase(),
                $("#presentationUnit").val(),
                $("#price").val(),
                $("#currency").val(),
                $("#date").val()
              ])
              .draw();

            cleanFields();

            $("#confirMessage").text(
              "EXITOSO! REGISTRO AGREGADO CORRECTAMENTE..."
            );
          }
        });

        $("#submitButton").on("click", function () {
          var container = document.getElementById("newEditRegForm");
          if (reqTable.data().any()) {
            for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();
              var inputDF = document.createElement("input");
              inputDF.setAttribute("type", "hidden");
              inputDF.setAttribute("name", "inputDF");
              inputDF.setAttribute("value", cell[1]);
              container.appendChild(inputDF);

              var inputATC = document.createElement("input");
              inputATC.setAttribute("type", "hidden");
              inputATC.setAttribute("name", "inputATC");
              inputATC.setAttribute("value", cell[2]);
              container.appendChild(inputATC);

              var inputMR = document.createElement("input");
              inputMR.setAttribute("type", "hidden");
              inputMR.setAttribute("name", "inputMR");
              inputMR.setAttribute("value", cell[3]);
              container.appendChild(inputMR);

              var inputMO = document.createElement("input");
              inputMO.setAttribute("type", "hidden");
              inputMO.setAttribute("name", "inputMO");
              inputMO.setAttribute("value", cell[4]);
              container.appendChild(inputMO);

              var inputDT = document.createElement("input");
              inputDT.setAttribute("type", "hidden");
              inputDT.setAttribute("name", "inputDT");
              inputDT.setAttribute("value", cell[5]);
              container.appendChild(inputDT);

              var inputUP = document.createElement("input");
              inputUP.setAttribute("type", "hidden");
              inputUP.setAttribute("name", "inputUP");
              inputUP.setAttribute("value", cell[6]);
              container.appendChild(inputUP);

              var inputPU = document.createElement("input");
              inputPU.setAttribute("type", "hidden");
              inputPU.setAttribute("name", "inputPU");
              inputPU.setAttribute("value", cell[7]);
              container.appendChild(inputPU);

              var inputMN = document.createElement("input");
              inputMN.setAttribute("type", "hidden");
              inputMN.setAttribute("name", "inputMN");
              inputMN.setAttribute("value", cell[8]);
              container.appendChild(inputMN);

              var inputFC = document.createElement("input");
              inputFC.setAttribute("type", "hidden");
              inputFC.setAttribute("name", "inputFC");
              inputFC.setAttribute("value", cell[9]);
              container.appendChild(inputFC);
            }
          }
          var inputPROC = document.createElement("input");
          inputPROC.setAttribute("type", "hidden");
          inputPROC.setAttribute("name", "inputPROC");
          inputPROC.setAttribute("value", $("#purchaseProc").val());
          container.appendChild(inputPROC);
        });
      });

      var medInsumosTable = $("#medInsumosTableParam").DataTable({
        responsive: true,
        searching: true,
        bLengthChange: false,
        pageLength: 5,
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

      /*Modal Select add info in Main Form*/
      $("#medInsumosTableParam tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(1)").text();
        $("#productName").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#technicDescription").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#medInsumoCod").prop("value", value);
      });

      $("#medInsumosEstModalButton").on("click", function (event) {
        event.preventDefault();
        var searchValue = $("#purchaseProc").val();
        medInsumosTable.ajax.url(getAbsolutePath() + "generalMedEstForOffersAPI?searchByBuyProcess=" + searchValue).load();
      });

      /*Modal Select add info in Main Form*/

      $("#medInsumosTableParam tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(1)").text();
        $("#productName").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#technicDescription").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#medInsumoCod").prop("value", value);
      });

      $("#resetInputsButton").on("click", function (event) {
        event.preventDefault();
        cleanFields();
        $("#confirmEditRegButton").addClass("hide");
        $("#addRegButton").removeClass("hide");
      });

    </script>
    <% } else { %>
    <script>
      "use strict";
      $(document).ready(function () {
        /* data Table */
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 7,
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
          scrollX: true,
        });
        
        //Generador de Reporte
        $("#generalReportButton").on("click", function(event){
      	  var container = document.getElementById("reportForm");
      	 if(reqTable.data().any()){
		    for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
		    var cell = reqTable.row(r).data();
  		    var inputNo = document.createElement("input");
  	        inputNo.setAttribute("type", "hidden");
  	        inputNo.setAttribute("name", "no");
  	        if(cell[0]){
  	          inputNo.setAttribute("value", cell[0]);
  	        }
  	        container.appendChild(inputNo);
  	              
  	        var inputDIST = document.createElement("input");
  	        inputDIST.setAttribute("type", "hidden");
  	        inputDIST.setAttribute("name", "distribuidor");
  	        if(cell[1]){
  	          inputDIST.setAttribute("value", cell[1]);  
  	        }
  	        container.appendChild(inputDIST);
  	        var inputATC = document.createElement("input");
  	        inputATC.setAttribute("type", "hidden");
  	        inputATC.setAttribute("name", "atc");
  	        if(cell[2]){
  	          inputATC.setAttribute("value", cell[2]);  
  	        } 	       
  	        container.appendChild(inputATC);
  	              
  	        var inputMR = document.createElement("input");
  	        inputMR.setAttribute("type", "hidden");
  	        inputMR.setAttribute("name", "medicamentoReg");
  	        if(cell[3]){
  	          inputMR.setAttribute("value", cell[3]);  
  	        }
  	        container.appendChild(inputMR);
  	              
  	        var inputMO = document.createElement("input");
  	        inputMO.setAttribute("type", "hidden");
  	        inputMO.setAttribute("name", "medicamentoOFF");
  	          if(cell[4]){
  	            inputMO.setAttribute("value", cell[4]);	
  	          }
  	        
  	        container.appendChild(inputMO);
  	              
  	        var inputDesc = document.createElement("input");
  	        inputDesc.setAttribute("type", "hidden");
  	        inputDesc.setAttribute("name", "descripcion");
  	        if(cell[5]){
  	          inputDesc.setAttribute("value", cell[5]);  
  	        }
  	        container.appendChild(inputDesc);
  	              
  	        var inputUP = document.createElement("input");
  	        inputUP.setAttribute("type", "hidden");
  	        inputUP.setAttribute("name", "up");
  	          if(cell[6]){
  	            inputUP.setAttribute("value", cell[6]);
  	          }      
  	        
  	        container.appendChild(inputUP);    
  		    }
		    
		    var inputPU = document.createElement("input");
  	        inputPU.setAttribute("type", "hidden");
  	        inputPU.setAttribute("name", "precio");
  	        if(cell[7]){
  	          inputPU.setAttribute("value", cell[7]);  
  	        }
  	        container.appendChild(inputPU);
  		  }
      		var inputOrigin = document.createElement("input");
  	        inputOrigin.setAttribute("type", "hidden");
  	        inputOrigin.setAttribute("name", "origin");
  	      	inputOrigin.setAttribute("value", "oferta");
  	      	container.appendChild(inputOrigin);
    		event.preventDefault();
    		$("#reportForm").submit();
        });
      });
    </script>
    <% } %>
    <!-- Java Script section ends -->
  </body>
</html>
