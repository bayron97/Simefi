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
	String modifTipo = (String)request.getAttribute("modifTipo");
	String tipo = "";
	if(modifTipo != null && !modifTipo.isEmpty()){
		tipo = modifTipo;
	}
	String per = (String)request.getAttribute("persona");
	String personeria = "";
	if(per != null && !per.isEmpty()){
		personeria = per;
	}
	String revision = (String)request.getAttribute("isRev");
	String rev = "false";
	if(revision != null && !revision.isEmpty()){
		rev=revision;
	}
  String pago = (String)request.getAttribute("modifTipoPago");
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
                      <a class="dropdown-item active" href="#"
                        >DATOS GENERALES</a
                      >
                      <a class="dropdown-item" href="#"
                        >REPRESENTANTES LEGALES</a
                      >
                      <a class="dropdown-item" href="#"
                        >ACCIONISTAS DIRECTOS</a
                      >
                      <a class="dropdown-item" href="#"
                        >ACCIONISTAS INDIRECTOS</a
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
                      <a class="nav-link" href="#">ACCIONISTAS DIRECTOS</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">ACCIONISTAS INDIRECTOS</a>
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
            <form id="editRegForm" action="FabricanteServlet" method="post">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-4">
                  <h1 class="mb-0 text-white">
                    FABRICANTE
                  </h1>
                  <h2 class="mb-0 text-white">
                    ADMINISTRACION DE DATOS / DISTRIBUIDOR / FABRICANTE
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
                                    <div class="col-lg-6 col-md-6">
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
                                    <div class="col-lg-6 col-md-6">
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
                                        <label>DIRECCION Y/O UBICACION</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="direccion" 
                                          name="direccion"
                                          placeholder=""
                                          value="${modifDireccion}"
                                          readonly
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <label>TIPO DE PERSONA</label>
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="persona"
                                          name="persona"
                                          disabled
                                        >
                                          <% if(personeria.contentEquals("PERSONA NATURAL")){ %>

                                            <option value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option selected value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } else if(personeria.contentEquals("COMERCIANTE INDIVIDUAL")){ %>

                                            <option value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option selected value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } else { %>

                                            <option selected value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } %>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group hide" id="rtnInput">
                                        <label>RTN DE LA EMPRESA</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="rtn"
                                          name="rtn" 
                                          placeholder=""
                                          readonly
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--II. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center"
                                              style="font-weight: bold;"
                                            >
                                              II. DETALLES DE PAGO
                                            </h6>
                                          </div>
                                        </div>
                                        <% if(pago != null && !pago.isEmpty()){ %>
                                        <% if(pago.contentEquals("TRANSFERENCIA BANCARIA")){ %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                disabled
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                                disabled
                                                checked
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                                value="${modifBanco}"
                                                readonly
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                                value="${modifCuenta}"
                                                readonly
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } else { %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                disabled
                                                checked
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                                disabled
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row hide" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                                readonly
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                                readonly
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } } else { %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                disabled
                                                checked
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                                disabled
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row hide" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                                value="${modifBanco}"
                                                readonly
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                                value="${modifCuenta}"
                                                readonly
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } %>
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #3 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DATOS DE CONSTITUCION section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-8 col-md-8">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center float-left"
                                              style="font-weight: bold;"
                                            >
                                              III. DATOS DE CONSTITUCION - SOLO DISTRIBUIDORES
                                            </h6>
                                          </div>
                                          <div class="col-lg-4 col-md-4">
                                            <div class="form-group mt-2 float-right"> 
                                              <label for="isDistribuidor">VOLVER DISTRIBUIDOR&nbsp;</label>
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                id="isDistribuidor" 
                                                name="isDistribuidor"
                                                disabled
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section starts-->
                                        <div class="row hide" id="incorporationDataInputs">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>FECHA DE CONSTITUCION*</label>
                                              <input
                                                autocomplete="off"
                                                type="date"
                                                class="form-control"
                                                id="fechaConstitucion"
                                                name="fechaConstitucion"
                                                placeholder=""
                                                readonly
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NO. DE INSCRIPCION DE MATRICULA*</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="matricula"
                                                name="matricula"
                                                placeholder=""
                                                readonly
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section ends-->
                                      </div>
                                      <!--III. DATOS DE CONSTITUCION section ends-->
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
                                    <div class="col-lg-6 col-md-6">
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
                                    <div class="col-lg-6 col-md-6">
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
                                        <label>DIRECCION Y/O UBICACION</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="direccion" 
                                          name="direccion"
                                          placeholder=""
                                          value="${modifDireccion}"
                                          
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <label>TIPO DE PERSONA</label>
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="persona"
                                          name="persona"
                                          required
                                        >
                                          <% if(personeria.contentEquals("PERSONA NATURAL")){ %>

                                            <option value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option selected value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } else if(personeria.contentEquals("COMERCIANTE INDIVIDUAL")){ %>

                                            <option value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option selected value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } else { %>

                                            <option selected value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                            <option value="PERSONA NATURAL">PERSONA NATURAL</option>
								                            <option value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>

                                          <% } %>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group hide" id="rtnInput">
                                        <label>RTN DE LA EMPRESA</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="rtn"
                                          name="rtn" 
                                          placeholder=""
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--II. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center"
                                              style="font-weight: bold;"
                                            >
                                              II. DETALLES DE PAGO
                                            </h6>
                                          </div>
                                        </div>
                                        <% if(pago != null && !pago.isEmpty()){ %>
                                        <% if(pago.contentEquals("TRANSFERENCIA BANCARIA")){ %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                                checked
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                                value="${modifBanco}"
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                                value="${modifCuenta}"
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } else { %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                checked
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row hide" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } } else { %>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                checked
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco" 
                                                name="tipoPago"
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row hide" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                        <% } %>
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #3 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DATOS DE CONSTITUCION section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-8 col-md-8">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center float-left"
                                              style="font-weight: bold;"
                                            >
                                              III. DATOS DE CONSTITUCION - SOLO DISTRIBUIDORES
                                            </h6>
                                          </div>
                                          <div class="col-lg-4 col-md-4">
                                            <div class="form-group mt-2 float-right"> 
                                              <label for="isDistribuidor">VOLVER DISTRIBUIDOR&nbsp;</label>
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                id="isDistribuidor" 
                                                name="isDistribuidor"
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section starts-->
                                        <div class="row hide" id="incorporationDataInputs">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>FECHA DE CONSTITUCION*</label>
                                              <input
                                                autocomplete="off"
                                                type="date"
                                                class="form-control"
                                                id="fechaConstitucion"
                                                name="fechaConstitucion"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NO. DE INSCRIPCION DE MATRICULA*</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="matricula"
                                                name="matricula"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section ends-->
                                      </div>
                                      <!--III. DATOS DE CONSTITUCION section ends-->
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
                                    <div class="col-lg-6 col-md-6">
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
                                    <div class="col-lg-6 col-md-6">
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
                                        <label>DIRECCION Y/O UBICACION</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="direccion" 
                                          name="direccion"
                                          placeholder=""
                                          
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group">
                                        <label>TIPO DE PERSONA</label>
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="persona"
                                          name="persona"
                                          required
                                        >
                                          <option selected value="PERSONA JURIDICA">PERSONA JURIDICA</option>
								                          <option value="PERSONA NATURAL">PERSONA NATURAL</option>
								                          <option value="COMERCIANTE INDIVIDUAL">COMERCIANTE INDIVIDUAL</option>
                                        </select>
                                      </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div class="form-group hide" id="rtnInput">
                                        <label>RTN DE LA EMPRESA</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="rtn"
                                          name="rtn" 
                                          placeholder=""
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <!--FILA #2 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--II. DETALLES DE PAGO section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center"
                                              style="font-weight: bold;"
                                            >
                                              II. DETALLES DE PAGO
                                            </h6>
                                          </div>
                                        </div>
                                        <div class="row">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="cheque"
                                                name="cheque"
                                                checked
                                              />
                                              <label for="cheque">CHEQUE</label>
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="banco"
                                                name="tipoPago"
                                              />
                                              <label for="banco">TRANSFERENCIA BANCARIA</label>
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA starts-->
                                        <div class="row hide" id="transData">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NOMBRE DEL BANCO</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="nombrebanco"
                                                name="banco"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NUMERO DE CUENTA</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="numbanco"
                                                name="noCuenta"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--DATOS DE TRANSFERENCIA BANCARIA ends-->
                                      </div>
                                      <!--III. DETALLES DE PAGO section ends-->
                                    </div>
                                    <!--FILA #2 COLUMNA #1 ends-->
                                  </div>
                                  <div class="row">
                                    <!--FILA #3 COLUMNA #1 starts-->
                                    <div class="col-lg-12 col-md-12">
                                      <!--III. DATOS DE CONSTITUCION section starts-->
                                      <div id="DPSection" class="card-body">
                                        <div class="row">
                                          <div class="col-lg-8 col-md-8">
                                            <h6
                                              id="instructionSubtitle"
                                              class="mb-3 text-center float-left"
                                              style="font-weight: bold;"
                                            >
                                              III. DATOS DE CONSTITUCION - SOLO DISTRIBUIDORES
                                            </h6>
                                          </div>
                                          <div class="col-lg-4 col-md-4">
                                            <div class="form-group mt-2 float-right"> 
                                              <label for="isDistribuidor">VOLVER DISTRIBUIDOR&nbsp;</label>
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                id="isDistribuidor" 
                                                name="isDistribuidor"
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section starts-->
                                        <div class="row hide" id="incorporationDataInputs">
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>FECHA DE CONSTITUCION*</label>
                                              <input
                                                autocomplete="off"
                                                type="date"
                                                class="form-control"
                                                id="fechaConstitucion"
                                                name="fechaConstitucion"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                          <div class="col-lg-6 col-md-6">
                                            <div class="form-group">
                                              <label>NO. DE INSCRIPCION DE MATRICULA*</label>
                                              <input
                                                autocomplete="off"
                                                type="text"
                                                class="form-control"
                                                id="matricula"
                                                name="matricula"
                                                placeholder=""
                                              />
                                            </div>
                                          </div>
                                        </div>
                                        <!--CONDITIONAL DATA section ends-->
                                      </div>
                                      <!--III. DATOS DE CONSTITUCION section ends-->
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
		          <input autocomplete="off" type="hidden" name="modifId" value="${modifId}">
		          <input autocomplete="off" type="hidden" id="tipo" name="tipo" value="fabricante">
		          <input autocomplete="off" type="hidden" id="modifTipo" name="modifTipo" value="FABRICANTE">
		          <input autocomplete="off" type="hidden" name="isRev" value="${isRev}">
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
                    type="submit"
                    name="submit"
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
    <form method="post" action="FabricanteServlet">
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

    <!-- NO modals-->

    <!--Custom New Modal-->

    <!-- Modal Section ends-->

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
    	  System.out.println("Error " + error );
    	  if(error != null && !error.isEmpty()){    	
    		  %>
    		  $("#confirMessage").text("ERROR! DENOMINACION INGRESADA YA ESTA REGISTRADA. INGRESE UNO NUEVO");
    	        $("#confirmationModalCenter").modal('show');
    		  <%
    		  if(error.contentEquals("RTNExiste") ){
    			  %>
    			  
        		  $("#confirMessage").text("ERROR! DENOMINACION INGRESADA YA ESTA REGISTRADA. INGRESE UNO NUEVO");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }else
    		  {
    			  
    			  %>
        		  $("#confirMessage").text("ERROR! AL REGISTRAR POR FAVOR INTENTE DE NUEVO O CONTACTE AL ADMINISTRADOR");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }
    	  }
    	  %>
        /* setinputFilter(document.getElementById("rtn"), function(value) {return /^\d*$/.test(value);}); */
	      /* setinputFilter(document.getElementById("matricula"), function(value) {return /^\d*$/.test(value);}); */
      });

      $("#isDistribuidor").on("change", function () {
        if ($("#isDistribuidor").prop("checked"))
        {
          $("#editRegForm #tipo").prop("value", "distribuidor");
          $("#editRegForm #modifTipo").prop("value", "DISTRIBUIDOR/FABRICANTE");
          $("#editRegForm #rtnInput").removeClass("hide");
          $("#editRegForm #rtnInput input").prop("required", true);
          $("#editRegForm #incorporationDataInputs").removeClass("hide");
          $("#editRegForm #incorporationDataInputs input").prop("required", true);
        }
        else
        {
          $("#editRegForm #tipo").prop("value", "fabricante");
          $("#editRegForm #modifTipo").prop("value", "FABRICANTE");
          $("#editRegForm #rtnInput").addClass("hide");
          $("#editRegForm #rtnInput input").removeAttr("required");
          $("#editRegForm #incorporationDataInputs").addClass("hide");
          $("#editRegForm #incorporationDataInputs input").removeAttr("required");
        }
      });
      
      $("#cheque").on("change", function () {
        $("#cheque").prop("checked", true);
        $("#banco").prop("checked", false);
        $("#editRegForm #transData").addClass("hide");
        $("#nombrebanco").removeAttr("required");
	      $("#numbanco").removeAttr("required");
      });

      $("#banco").on("change", function () {
        $("#cheque").prop("checked", false);
        $("#banco").prop("checked", true);
        $("#editRegForm #transData").removeClass("hide");
        $("#nombrebanco").prop("required", true);
        $("#numbanco").prop("required", true);
      });
      
      
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
