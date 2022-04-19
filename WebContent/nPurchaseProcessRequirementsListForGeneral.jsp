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
    
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
    <style>

		
	 #reqTable th:nth-child(1){
		   display: none;
		}
	#reqTable td:nth-child(1){
		   display: none;
		}
	#medInsumosTableParam th:nth-child(1){
		   display: none;
		}
	#medInsumosTableParam td:nth-child(1){
		   display: none;
		}
    </style>
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
                <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
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
                      <label class="dropdown-item" for="criteria">CRITERIOS DE EVALUACION</label>
                      <a class="dropdown-item active" href="#">VACIADO DE REQUERIMIENTO SEGUN OFICIO</a>
                      <label class="dropdown-item" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>

                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link" for="aper">DATOS DE APERTURA</label>
                    </li>
                    <!-- <li class="nav-item">
                      <label class="nav-link" for="criteria">CRITERIOS DE EVALUACION</label>
                    </li> -->
                    <li class="nav-item">
                      <a class="nav-link active" href="#">VACIADO DE REQUERIMIENTO SEGUN OFICIO</a>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="listaest">LISTA DE REQUERIMIENTO</label>
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
              
              
              String noProcesoCompra = (String)request.getAttribute("noProcesoCompra");
              String descripcioncompra = (String)request.getAttribute("descripcioncompra");
              System.out.println(noProcesoCompra +" noProcesoCompra");
              System.out.println(descripcioncompra +" descripcioncompra");
              System.out.println("esta"+ func +" funcion");
              
            %>
            <form id="newEditRegForm">
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
                          VACIADO DE REQUERIMIENTO SEGUN OFICIO PARA EL PROCESO:
                        </h5>
                        <div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                              
                              
                                 <div id="procesoCompraDiv" class="row">
                                        <div class=" col-md-3">
                                          <div class="form-group" style="text-align: left;">
                                            <label>NO. PROCESO DE COMPRA</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="noProceso"
                                              name="noProceso"
                                              placeholder=""
                                              value="<%= noProcesoCompra%>"
                                              readonly
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      
                                       <div id="tipoCompraDiv" class="row">
                                        <div class=" col-md-3">
                                          <div class="form-group" style="text-align: left;">
                                            <label>TIPO DE COMPRA</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="tipoCompra"
                                              name="tipoCompra"
                                              placeholder=""
                                              value="${descripcioncompra}"
                                              readonly
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                <!--DATA Section-->
                                <div id="dataSection">
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <h6 style="font-weight: bold;">
                                          3. VACIADO DE REQUERIMIENTO SEGUN OFICIO
                                        </h6>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>

                                  <div class="row">
                                    <div class="col-lg-6 col-md-6">
                                      <input autocomplete="off" type="hidden" id="idp" name="idp"/>
                                      <input autocomplete="off" type="hidden" id="purchaseType" value="MEDICAMENTOS"/>
                                      
                                   
                                      
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div
                                            class="form-group"
                                            style="text-align: left;"
                                          >
                                            <label>3.1 NO. DE OFICIO*</label>

                                            <select
                                          	autocomplete="off"
                                          	class="form-control"
                                          	id="legalNumber"
                                          	name="legalNumber"
                                          	
                                        	<%=disable%>
                                        	>
                                        		<option selected disabled value="">
                                        			SELECCIONA UNA OPCION...
                                            	</option>
                                            	 <% try{ Connection con = null;
                                          		Statement state = null; 
                                          		ResultSet rs = null; 
                                          		String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                          		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          		con = DriverManager.getConnection(url,"admin","system123");
                                          		state = con.createStatement(); 
                                          		String QueryString = "SELECT oficio from dbo.oficioProcesoCompraGeneral where procesoCompra = " + co; 
                                          		rs = state.executeQuery(QueryString);
                                         	 	while(rs.next()){ %>
                                          		<option value="<%=rs.getString(1)%>"
                                            	><%=rs.getString(1).toUpperCase()%>
                                            	</option>
                                          		<%} rs.close(); state.close();
                                         		con.close(); }catch(Exception e){
                                          		System.out.println(e); } %>
                                        	</select>
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="form-group" style="text-align: left;">
                                            <label>3.2 BENEFICIARIO*</label>
                                            <input
                                              autocomplete="off"
                                              type="text"
                                              class="form-control"
                                              id="benfName"
                                              name="benfName"
                                              placeholder=""
                                              value="*SELECCIONE UN OFICIO*"
                                              readonly
                                              required
                                            />
                                          </div>
                                        </div>
                                      </div>
                                      <div class="row d-flex align-items-center">
                                        <div class="col-lg-9 col-md-9">
                                          <div
                                            class="form-group"
                                            style="text-align: left;"
                                          >
                                            <label>3.3 NOMBRE DEL PRODUCTO*</label>
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
                                        <div
                                          class="col-lg-3 col-md-3 align-self-end"
                                        >
                                          <div class="form-group">
                                            <button
                                              class="btn btn-sm btn-success ml-2"
                                              style="height: 60px;"
                                              data-target="#medInsumosModal"
                                              data-toggle="modal"
                                              id="medInsumosModalButton"
                                              <%=disable%>
                                            >
                                              <i class="material-icons md-18"
                                                >add_box</i
                                              >
                                            </button>
                                          </div>
                                        </div>
                                      </div>
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >3.5 UNIDAD DE PRESENTACION*</label
                                        >
                                        <input

                                          class="form-control"
                                          id="presentationUnit"
                                          name="presentationUnit"
                                          readOnly
                                        />
                                         
                                      </div>
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.6 CANTIDAD REQUERIDA*</label>
                                        <input
                                          autocomplete="off"
                                          type="number"
                                          min="1"
                                          class="form-control"
                                          id="requiredCant"
                                          name="requiredCant"
                                          placeholder=""
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.7 CODIGO ATC*</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="medInsumoCod"
                                          name="medInsumoCod"
                                          placeholder=""
                                          required
                                          readonly
                                          <%=disable%>
                                        />
                                      </div>
                                      
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.8 PLAZO DE ENTREGA*</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="deliveryTime"
                                          name="deliveryTime"
                                          placeholder=""
                                          required
                                          
                                          <%=disable%>
                                        />
                                      </div>
                                      
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.9 VIDA ÚTIL REQUERIDA*</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="usefulLife"
                                          name="usefulLife"
                                          placeholder=""
                                          required
                                          
                                          <%=disable%>
                                        />
                                      </div>
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.1.1 OBSERVACIONES</label>
                                        <input
                                          autocomplete="off"
                                          type="text"
                                          class="form-control"
                                          id="observation"
                                          name="observation"
                                          placeholder=""
                                          
                                          <%=disable%>
                                        />
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
                                    </div>
                                    <div class="col-lg-6 col-md-6">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>3.4 DESCRIPCION TECNICA*</label>
                                        <textarea
                                          autocomplete="off"
                                          class="form-control"
                                          id="technicDescription"
                                          name="technicDescription"
                                          placeholder=""
                                          style="height: 450px;"
                                          readonly
                                          required                      
                                        ></textarea>
                                      </div>
                                    </div>
                                  </div>

                                  
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-right">
                                        <div class="form-group">
                                          <button
                                            class="btn btn-sm btn-success ml-2"
                                            id="resetInputsButton"
                                            type="button"
                                            <%=disable%>
                                          >
                                            <i class="material-icons md-18"
                                              >replay</i
                                            >REINICIAR CAMPOS
                                          </button>

                                          <button
                                            class="btn btn-sm btn-success ml-2"
                                            id="Prueba"
                                            type="button"
                                            data-toggle="modal"
                                            data-target="#confirmationModalCenter"
                                            <%=disable%>
                                          >
                                            <i class="material-icons md-18"
                                              >done</i
                                            >ACEPTAR
                                          </button>
                                          
                                          <button
                                            class="btn btn-sm btn-success ml-2 hide"
                                            id="confirmEditRegButton"
                                            type="button"
                                            data-toggle="modal"
                                            data-target="#confirmationModalCenter"
                                            <%=disable%>
                                          >
                                            <i class="material-icons md-18"
                                              >done</i
                                            >CONFIRMAR EDICION
                                          </button>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <!--DATA Section ends-->
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="card-body main-font">
                          <div class="row" id="botontable">
                            <div class="col-lg-12 col-md-12">
                              <div class="form-group float-left">
                                <div class="form-group">
                                  <button
                                    class="btn btn-sm btn-danger ml-2"
                                    id="deleteRegButton"
                                    type="button"
                                    data-toggle="modal"
                                    data-target="#confirmationModalCenter"
                                    <%=disable%>
                                  >
                                    <i class="material-icons md-18">close</i
                                    >ELIMINAR SELECCIONADO
                                  </button>
                                  <button
                                    type="button"
                                    class="btn btn-sm btn-success ml-2"
                                    id="editRegButton"
                                    <%=disable%>
                                  >
                                    <i class="material-icons md-18">create</i
                                    >EDITAR SELECCIONADO
                                  </button>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                          	<h5 class="mb-3" style="font-weight: bold;">REPORTE GENERAL DE VACIADO DE OFICIOS</h5>
                            <!--Table Section starts-->
                            <table
                              id="reqTable"
                              class="table table-bordered w-100 mb-0 table-aditional-styles"
                            >
                            <thead>
                              <tr>
                                <th class="all" id="idtabla">NO. ITEM</th>
                                <th class="min-desktop">
                                  NO. DE OFICIO
                                </th>
                                <th class="min-tablet">
                                  BENEFICIARIO
                                </th>
                                <th class="min-tablet">
                                  CODIGO ATC
                                </th>
                                <th class="min-tablet">
                                  NOMBRE DEL PRODUCTO
                                </th>
                                <th class="min-tablet">
                                  DESCRIPCION TECNICA
                                  
                                </th>
                                <th class="min-desktop">
                                  UNIDAD DE PRESENTACION
                                  
                                </th>
                                <th class="min-desktop">
                                   CANTIDAD
                                </th>
                                <th class="min-desktop">
                                   PLAZOS DE ENTREGA
                                </th>
                                <th class="min-desktop">
                                   VIDA ÚTIL
                                </th>
                                <th class="min-desktop">
                                   OBSERVACIONES
                                </th>
                              </tr>
                            </thead>
                            <tbody> 
                            </tbody>                    
                            </table>
                            <!--Table Section ends-->
                          </div>
                          <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <p>&nbsp;</p>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <div class="form-group float-right">
                                <!--button
                                  class="btn btn-sm btn-success ml-2"
                                  id="consolidatedReportButton"
                                  type="button"
                                >
                                  <i class="material-icons md-18">assessment</i>
                                    REPORTE CONSOLIDADO
                                </button
                                <button
                                  class="btn btn-sm btn-success ml-2"
                                  id="generalReportButton"
                                  type="button"
                                >
                                  <i class="material-icons md-18">reorder</i>
                                    REPORTE GENERAL
                                </button>-->
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
                  	  id="submit"
                  	  type="submit"
                  	  name="submit"
                  	  style="display: none"
                  	></button>
                  <button
                    id="submitExternalButton"
                    type="button"
                    class="btn btn-primary btn-rounded shadow main-font"
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
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5" style="z-index:0;">
                <h1 class="mb-0 text-white">
                  LISTADO DE PRODUCTOS PARAMETRIZADOS
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  -TIPO DE MEDICAMENTO/INSUMO SELECCIONADO-
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
                             <div class="col-md-5 mx-auto">
                                <div class="form-group">
                                  <input
                                    autocomplete="off"
                                    type="text"
                                    class="form-control"
                                    id="medInsumosSearchInput"
                                    placeholder="BUSQUEDA DE MEDICAMENTOS"
                                    value=""
                                    style="z-index:100;"
                                 />
                                 </div>
                             </div>
                             <div class="col-md-2 mx-auto">
                                 <div class="form-group float-right">
                                    <button
                                     class="btn btn-sm btn-success ml-2"
                                     id="medInsumosSearchButton"
                                     type="button"
                                     style="z-index:100;"
                                    >
                                    <i class="material-icons md-18">search</i>
                                     BUSCAR
                                   </button>
                                   <button
                                     class="btn btn-sm btn-success ml-2"
                                     id="medInModalButton"
                                     type="button"
                                     style="z-index:100;"
                                    >
                                     MOSTRAR TODOS
                                   </button>
                                 </div>
                             </div>
                          </div>
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--Med Insumos Table Section starts-->
                              <table
                                id="medInsumosTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
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
                                    <th class="min-tablet">
                                      CODIGO
                                    </th>
                                    <th class="min-tablet">
                                      UNIDAD PRESENTACION
                                    </th>
                                  </tr>
                                </thead>
                              </table>
                              <!--Med Insumos Table Section ends-->
                              <!--Med Insumos 2 Table Section starts-->
                              <table
                                id="InsumosTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                              >
                              </table>
                              <!--Med Insumos 2 Table Section ends-->
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
                  <div class="col-12 col-md-12 text-center">
                    <button
                      type="button"
                      id="cancelButton"
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

    <!--Rev Aprov Reg Modal-->
    <div
      class="modal fade main-font"
      id="revAprovRegModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form id="editRegForm" method="post" action="listaRequerimientoGeneralServlet">
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
                  APERTURA DE NUEVOS PROCESOS DE COMPRA
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  REVISAR Y APROBAR
                </h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center center fixed;
                      "
                    >
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection">
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>CODIGO DE PROCESO</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="processID"
                                        name="procesID"
                                        value="${procesoCompra}"
                                        placeholder=""
                                        required
                                        readonly
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>OBSERVACIONES</label>
                                      <textarea
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="obsApert"
                                        name="obsApert"
                                        value="${observaciones}"
                                        placeholder=""
                                        style="min-height: 40px; height: 40px;"
                                      ></textarea>
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
                                      ESTADO
                                    </h5>
                                  </div>
                                </div>
                                <%
                                  String estado = (String)request.getParameter("estado");
                                  System.out.println(estado);
                                  if(estado != null && !estado.isBlank()){
                                %>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input type="checkbox" id="checkAprov" name="checkAprov" checked/>
                                      <label for="checkAprov">APROBADO</label>
                                    </div>
                                  </div>
                                  
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="checkNoAprov"
                                      />
                                      <label for="checkNoAprov"
                                        >NO APROBADO</label
                                      >
                                	</div>
                                </div>
                                <%
                                }
                                else{
                                %>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input type="checkbox" id="checkAprov" name="checkAprov"/>
                                      <label for="checkAprov">APROBADO</label>
                                    </div>
                                  </div>
                                  
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                      	checked
                                        type="checkbox"
                                        id="checkNoAprov"
                                      />
                                      <label for="checkNoAprov"
                                        >NO APROBADO</label
                                      >
                                    </div>
                                  </div>
                                </div>
                                <% 
                                }
                                %>
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
                      type="submit"
                      value=""
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
    <form
      id="regListForm"
      method="post"
      action="listaRequerimientoGeneralServlet"
      class="hide"
    ></form>
    
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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>

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
		document.getElementById("dataSection").style.display = "none";
		<%}%>
      $(document).ready(function () {
        /*Tabla de Requerimientos*/
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          pageLength: 10,
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
          dom: 'Bfrtip',
          buttons: [
               'excel', 'pdf'
          ],
        });
        <%
	 	 if(funcion != null && !funcion.contentEquals("nuevo")){
	 	 %>
       		 reqTable.ajax.url(getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=consultar" ).load();
		<%
		}
		%>
        //reqTable.column().visible( false ); 


        $('#Prueba').click(function(){
         
          $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE...");
            var url = getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=nuevo" ;
            //console.log($("#newEditRegForm").serialize())
            console.log("Enviando");
            $.ajax({                        
              type: "POST", 
              url: url,
              data: $("#newEditRegForm").serialize(), 
              success: function(data)             
              {
                reqTable.ajax.url(getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=consultar" ).load();
                $("#idp").val("")
                $("#legalNumber").val("")
                $("#medInsumoCod").val("")
                $("#productName").val("")
                $("#technicDescription").val("")
                $("#presentationUnit").val("")
                $("#requiredCant").val("")
                $("#benfName").val("")
                //console.log(data)
                //$('#resp').html(data);               
              }
            });
        });

        /*Req List Select Function*/
        $("#reqTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          const idp=$(this).find("td:eq(0)").text();
          const legalNumber = $(this).find("td:eq(1)").text();
          const benfName = $(this).find("td:eq(2)").text();
          const medInsumoCod = $(this).find("td:eq(3)").text();
          const productName = $(this).find("td:eq(4)").text();
          const technicDescription = $(this).find("td:eq(5)").text();
          const presentationUnit = $(this).find("td:eq(6)").text();
          const requiredCant = $(this).find("td:eq(7)").text();
          
          $("#editRegButton").on("click", function (event) {
            event.preventDefault();
            $("#idp").prop("value", idp);
            $("#legalNumber").prop("value", legalNumber);
            $("#benfName").prop("value", benfName);
            $("#medInsumoCod").prop("value", medInsumoCod);
            $("#productName").prop("value", productName);
            $("#technicDescription").prop("value", technicDescription);
            $("#presentationUnit").prop("value", presentationUnit);
            $("#requiredCant").prop("value", requiredCant);
            $("#confirmEditRegButton").removeClass("hide");
            $("#Prueba").addClass("hide");
          });

          const rowSelected = $(this);
	
          /*Delete Reg Function*/

          $("#deleteRegButton").on("click", function (event) {
            event.preventDefault();
            $("#confirMessage").text("EXITOSO! REGISTRO ELIMINADO CORRECTAMENTE...");   
            var url = getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=eliminar&idp="+idp ;
              console.log("enviando")
              $.ajax({                        
                type: "POST",                 
                url: url,                     
                success: function(data)             
                {
                  reqTable.row(rowSelected).remove().draw();
                  reqTable.ajax.url(getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=consultar" ).load();
                }
              });
          });

          /*Edit Reg Confirm Function*/

          $("#confirmEditRegButton").on("click", function (event) {
            event.preventDefault();
            
            if (
              $("#legalNumber").val() === "" ||
              $("#benfName").val() === "" ||
              $("#productName").val() === "" ||
              $("#presentationUnit").val() === "" ||
              $("#requiredCant").val() === "" ||
              $("#medInsumoCod").val() === "" ||
              $("#technicDescription").val() === ""
            ) {
              $("#confirMessage").text("ERROR! DEBE LLENAR TODOS LOS CAMPOS PARA EDITAR UN REGISTRO");
            } else {
              $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");   
            	var url = getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=editar" ;
              console.log("enviando")
              $.ajax({                        
                type: "POST",                 
                url: url,                     
                data: $("#newEditRegForm").serialize(), 
                success: function(data)             
                {
                  reqTable.ajax.url(getAbsolutePath() + "listaRequerimientoGeneralServlet" + "?search=consultar" ).load();
                  $("#idp").val("")
                  $("#legalNumber").val("")
                  $("#medInsumoCod").val("")
                  $("#productName").val("")
                  $("#technicDescription").val("")
                  $("#presentationUnit").val("")
                  $("#requiredCant").val("")
                  $("#benfName").val("")
                  $("#confirmEditRegButton").addClass("hide");
                  $("#Prueba").removeClass("hide");
                }
              });
              
            }
          });
        });
        
        /* Automatically add a first row of data*/

        /*Tabla de Medicamentos e Insumos Parametrizados*/
        var medInsumosTable = $("#medInsumosTableParam").DataTable({
          responsive: true,
          searching: false,
          bLengthChange: false,
          pageLength: 5,
          columnDefs: [
            {
              targets: 4,
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
          value = $(this).find("td:eq(4)").text();
          $("#presentationUnit").prop("value", value);
        });

        $("#medInsumosModalButton").on("click", function (event){
        	event.preventDefault();
            var value = $("#purchaseType").val();
            medInsumosTable.ajax.url(getAbsolutePath() + "tableEmpty").load();
            if (value === "MEDICAMENTOS") {
              $("#subtitleChange").text(
                "SELECCIONE UN MEDICAMENTO Y CIERRE LA VENTANA"
              );
            } else if (value === "OTROS") {
              $("#subtitleChange").text(
                "SELECCIONE UN INSUMO Y CIERRE LA VENTANA"
              );
            } else {
              $("#subtitleChange").text("ERROR");
            }
        });
        
        $("#medInModalButton").on("click", function (event) {
          event.preventDefault();
          var value = $("#purchaseType").val();
          var selector;
          if (value === "MEDICAMENTOS") {
            selector = "medicamentosAPI";
            medInsumosTable.ajax.url(getAbsolutePath() + selector).load();
          } else if (value === "OTROS") {
            selector = "otrosAPI";
            medInsumosTable.ajax.url(getAbsolutePath() + selector).load();
          } else {
            $("#subtitleChange").text("ERROR");
          }
        });
        
        $("#medInsumosSearchButton").on("click", function (event) {
        	event.preventDefault();
            var value = $("#purchaseType").val();
            var searchValue = $("#medInsumosSearchInput").val();
            var selector;
            if (value === "MEDICAMENTOS") {
              $("#subtitleChange").text(
                "SELECCIONE UN MEDICAMENTO Y CIERRE LA VENTANA"
              );
              selector = "medicamentosAPI";
              medInsumosTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
            } else if (value === "OTROS") {
              $("#subtitleChange").text(
                "SELECCIONE UN INSUMO Y CIERRE LA VENTANA"
              );
              selector = "otrosAPI";
              medInsumosTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
            } else {
              $("#subtitleChange").text("ERROR");
            }
        });
      });

      /*Modal Select add info in Main Form*/
      //Hotfix over here
      $("#InsumosTableParam tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(1)").text();
        $("#productName").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#technicDescription").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#medInsumoCod").prop("value", value);
      });

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

      /*If purchase type is changed: reset inputs related*/
      $("#purchaseType").on("change", function () {
        $("#productName").val("");
        $("#technicDescription").val("");
        $("#medInsumoCod").val("");
      });

    //AL
      $("#legalNumber").on("change", function (){
        var element = $(this);        		  
        debugger
    	  $.post('GeneralBenefOficioAPI', {
				search : element.val(), 	
			}, function(responseText) {
				$("#benfName").prop("value", responseText);
			});
    	  
    	  $("#productName").val("");
        $("#technicDescription").val("");
        $("#medInsumoCod").val("");
        $("#requitedCant").val("");
      });
    
      
      /*Reset inputs button*/
      $("#resetInputsButton").on("click", function (event) {
        event.preventDefault();
        $("#newEditRegForm")[0].reset();
      });
      
      $("#generalReportButton").on("click", function(event){
    	  var container = document.getElementById("reportForm");
		 	  var table = document.getElementById('reqTable');
		 	  if(table.rows.length > 0){
		 	    for (var r = 1, n = table.rows.length; r < n; r++) {
		      var inputPT = document.createElement("input");
	        inputPT.setAttribute("type", "hidden");
	        inputPT.setAttribute("name", "inputPT");
	        if(table.rows[r].cells[1].innerHTML){
	          inputPT.setAttribute("value", table.rows[r].cells[1].innerHTML);
	        }
	        container.appendChild(inputPT);
	              
	        var inputMIC = document.createElement("input");
	        inputMIC.setAttribute("type", "hidden");
	        inputMIC.setAttribute("name", "inputMIC");
	        if(table.rows[r].cells[2].innerHTML){
	          inputMIC.setAttribute("value", table.rows[r].cells[2].innerHTML);  
	        }
	        container.appendChild(inputMIC);

	        var inputNM = document.createElement("input");
	        inputNM.setAttribute("type", "hidden");
	        inputNM.setAttribute("name", "inputNM");
	        if(table.rows[r].cells[3].innerHTML){
	          inputNM.setAttribute("value", table.rows[r].cells[3].innerHTML);  
	        } 	       
	        container.appendChild(inputNM);
	              
	        var inputTD = document.createElement("input");
	        inputTD.setAttribute("type", "hidden");
	        inputTD.setAttribute("name", "inputTD");
	        if(table.rows[r].cells[4].innerHTML){
	          inputTD.setAttribute("value", table.rows[r].cells[4].innerHTML);  
	        }
	        container.appendChild(inputTD);
	              
	        var inputPU = document.createElement("input");
	        inputPU.setAttribute("type", "hidden");
	        inputPU.setAttribute("name", "inputPU");

	          if(table.rows[r].cells[5].innerHTML){
	            inputPU.setAttribute("value", table.rows[r].cells[5].innerHTML);	
	          }
	        
	        container.appendChild(inputPU);
	              
	        var inputRC = document.createElement("input");
	        inputRC.setAttribute("type", "hidden");
	        inputRC.setAttribute("name", "inputRC");
	        if(table.rows[r].cells[6].innerHTML){
	          inputRC.setAttribute("value", table.rows[r].cells[6].innerHTML);  
	        }
	        container.appendChild(inputRC);
	              
	        var inputDT = document.createElement("input");
	        inputDT.setAttribute("type", "hidden");
	        inputDT.setAttribute("name", "inputDT");

	        if(table.rows[r].cells[7].innerHTML){
	          inputDT.setAttribute("value", table.rows[r].cells[7].innerHTML);
	        }      
	        
	        container.appendChild(inputDT);    

		    }
		  }
  		event.preventDefault();
  		$("#reportForm").submit();
      });

    	/*Submit hidden form button*/
      $("#submitExternalButton").on("click", function (event) {
        var container = document.getElementById("regListForm");
        var campon=document.createElement("input");
        campon.setAttribute("type", "hidden");
        campon.setAttribute("name", "guardar");
        campon.setAttribute("value", "guardar");  
        container.appendChild(campon);
        $("#regListForm").submit();
      });

      $("#checkAprov").on("change", function () {
        $("#checkNoAprov").prop("checked", false);
      });

      $("#checkNoAprov").on("change", function () {
        $("#checkAprov").prop("checked", false);
      });
      
    </script>
    <!-- Java Script section ends -->

  </body>
</html>
