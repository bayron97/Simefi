<%@page import="main.model.CriteriosEvaluacionDetalle"%>
<%@page import="main.dao.CriterioEvalucionDao"%>
<%@page import="main.model.CriterioEvaluacionDTO"%>
<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
    <style>

		
	 #DistFabTableParam th:nth-child(3){
		   display: none;
		}
		#DistFabTableParam td:nth-child(3){
		   display: none;
		}
		
	  #reqTable th:nth-child(2){
        display: none;
      }
      #reqTable td:nth-child(2){
        display: none;
      }
      
       #reqTable th:nth-child(39){
        display: none;
      }
      #reqTable td:nth-child(39){
        display: none;
      }
      
       #reqTable th:nth-child(40){
        display: none;
      }
      #reqTable td:nth-child(40){
        display: none;
      }
      
      
      
      
      #reqTable td:nth-child(36){
        text-transform: uppercase;
      }
      
       #reqTable td:nth-child(19){
        text-transform: uppercase;
      }
      #reqTable td:nth-child(23){
        text-transform: uppercase;
      }
      
      #criteriosEvalaucionTableParam option{
        dtext-transform: uppercase;
      }
      #criteriosEvalaucionTableParam select{
        text-transform: uppercase;
      }
      
      
      
      
	
    </style>
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
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
                      ACUERDO A LARGO PLAZO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
    
          
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-body main-font">
              <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
              <form id="newEditRegForm">
              <input type="hidden" id="offerState" name="offerState" value="EN PROCESO"/>
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
                    <%                   
  				 Date dNow = new Date();
  				 SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
  				 String fecha = ft.format(dNow);
				%>                    
                    <div class="form-group" style="text-align: left">
                      <label>FECHA DE OFERTA</label>
                      <input
                        autocomplete="off"
                        value="<%=fecha%>"
                        class="form-control"
                        readonly="readonly"
                        id="date"
                        name="date"
                        placeholder=""
                        required
                      />
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-6 col-md-6">
                        <div class="form-group" style="text-align: left">
                          <label>DISTRIBUIDOR/FABRICANTE</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="distributor"
                            name="distributor"
                            value="${provSaved}"
                            required
                            readonly
                          />
                          
                        </div>
                      </div>
                      <div class="col-lg-3 col-md-3">
                        <div class="form-group" style="text-align: left">
                          <label>NO. OFERTA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="noOfertaIngresada"
                            name="noOfertaIngresada"
                            value=""
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
                            data-target="#DistFabModal"
                            data-toggle="modal"
                            id="DistFabModalButton"
                          >
                            <i class="material-icons md-18">add_box</i>
                          </button>
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
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label class="hide" >NO. ITEM</label>
                          <input type="text" aria-describedby="ID numerico de medicamento requerido" 
                          id="reqID" 
                          name="reqID"
                           class="form-control hide"                           
                            placeholder=""
                            required
                            readonly/>
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label class="hide">CODIGO ATC</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control hide"
                            id="medInsumoCod"
                            name="medInsumoCod"
                            placeholder=""
                            required
                            readonly
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-9 col-md-9">
                        <div class="form-group" style="text-align: left">
                          <label>NOMBRE DEL PRODUCTO REQUERIDO / CANT. OFERTAS</label>
                          <input type="hidden" aria-describedby="ID numerico de la oferta ingresada para edicion" id="itemID" name="itemID"/>                         
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
                      <label>CANTIDAD ESTIMADA OFERTA</label>
                      <input
                        autocomplete="off"
                        type="text"
                        min="1"
                        class="form-control"
                        id="cantestimadaofer"
                        name="cantestimadaofer"
                        onkeyup="format(this)"
                        onchange="format(this)"
                        placeholder=""
                        required
                      />
                    </div>
                    <div class="form-group" style="text-align: left">
                      <label>PRECIO UNITARIO OFERTADO</label>
                      <input
                        autocomplete="off"
                        type="text"
                        min="1"
                        class="form-control validanumericos decimales"
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
                            name="technicDescriptionOffered"
                            placeholder=""
                            style="height: 530px"
                          ></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <hr style="width:100%;text-align:left;margin-left:0">
              <div style="background-color: #7ebd8d">
              <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-left mr-2">
                      <button
                        class="btn btn-sm btn-success ml-2"
                        id="btnPaso1"
                        type="button"
                        style="background-color: #9dd0a0"
                      >
                        PASO 1
                      </button>
                      <button
                        class="btn btn-sm btn-success ml-2"
                        id="btnPaso2"
                        type="button"
                      >
						            PASO 2
                      </button>
						          <button
                        class="btn btn-sm btn-success ml-2"
                        id="btnPaso3"
                        type="button"
                      >
						            PASO 3
                      </button>
                    </div>
                  </div>
                </div>
              
              <!--DATA Section starts-->
              <div id="dataSection">
              	<div id="paso1">
              	<div class="col-lg-12 col-md-12">
              		<!--Inputs Option 1 Begins-->
                	<!-- Row 1 -->
                	<div class="row">
                  		<div class="col-lg-4 col-md-4">
                    		<div class="form-group" style="text-align: left">
                    		<input name="noOferta" type="hidden" id="noOferta"/>
                      			<label>NOMBRE DEL FABRICANTE</label>
                      			<select
                              autocomplete="off"
                              class="form-control"
                              id="nombreFabricante"
                              name="nombreFabricante"
                            >
                              <option value="" selected>SELECCIONA UNA OPCION...</option>
                              <% try{ 
                                  Connection con = null;
                                  Statement state = null; 
                                  ResultSet rs = null; 
                                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                  con = DriverManager.getConnection(url,"admin","system123");
                                  state = con.createStatement(); 
                                  //String QueryString = "select * from fabricantes";
                                  String QueryString = "select denominacion, distribuidor from dbo.distribuidor where  distribuidor != 'BENEFICIARIO' and distribuidor !='DISTRIBUIDOR'  and estado1 = 'APROBADO' and estado2 ='ACTIVO'";
                                  rs = state.executeQuery(QueryString);
                                  while(rs.next()){%>
                                    <option value="<%=rs.getString(1).toUpperCase()%>"><%=rs.getString(1).toUpperCase() %></option>
                            <%} } catch(Exception e){ System.out.println(e); } %>
                            </select>
                    		</div>
                  		</div>
                  		
                  		
                 		<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>PAIS DE ORIGEN</label>
                      					<select class="form-control" name="paisOrigen" id="paisOrigen">
                                  <option value="" selected>SELECCIONE UN PAIS...</option>
											            <option value="AFGANISTAN">AFGANISTAN</option>
											            <option value="ALBANIA">ALBANIA</option>
											            <option value="ALEMANIA">ALEMANIA</option>
											            <option value="ANDORRA">ANDORRA</option>
											            <option value="ANGOLA">ANGOLA</option>
											            <option value="ANGUILLA">ANGUILLA</option>
											            <option value="ANTARTIDA">ANTARTIDA</option>
											            <option value="ANTIGUA Y BARBUDA">ANTIGUA Y BARBUDA</option>
											            <option value="ANTILLAS HOLANDESAS">ANTILLAS HOLANDESAS</option>
											            <option value="ARABIA SAUDI">ARABIA SAUDI</option>
											            <option value="ARGELIA">ARGELIA</option>
											            <option value="ARGENTINA">ARGENTINA</option>
											            <option value="ARMENIA">ARMENIA</option>
											            <option value="ARUBA">ARUBA</option>
											            <option value="AUSTRALIA">AUSTRALIA</option>
											            <option value="AUSTRIA">AUSTRIA</option>
											            <option value="AZERBAIYAN">AZERBAIYAN</option>
											            <option value="BAHAMAS">BAHAMAS</option>
											            <option value="BAHREIN">BAHREIN</option>
											            <option value="BANGLADESH">BANGLADESH</option>
											            <option value="BARBADOS">BARBADOS</option>
											            <option value="BELGICA">BELGICA</option>
											            <option value="BELICE">BELICE</option>
											            <option value="BENIN">BENIN</option>
											            <option value="BERMUDAS">BERMUDAS</option>
											            <option value="BIELORRUSIA">BIELORRUSIA</option>
											            <option value="BIRMANIA">BIRMANIA</option>
											            <option value="BOLIVIA">BOLIVIA</option>
											            <option value="BOSNIA Y HERZEGOVINA">BOSNIA Y HERZEGOVINA</option>
											            <option value="BOTSWANA">BOTSWANA</option>
											            <option value="BRASIL">BRASIL</option>
											            <option value="BRUNEI">BRUNEI</option>
											            <option value="BULGARIA">BULGARIA</option>
											            <option value="BURKINA FASO">BURKINA FASO</option>
											            <option value="BURUNDI">BURUNDI</option>
											            <option value="BUTAN">BUTAN</option>
											            <option value="CABO VERDE">CABO VERDE</option>
											            <option value="CAMBOYA">CAMBOYA</option>
											            <option value="CAMERUN">CAMERUN</option>
											            <option value="CANADA">CANADA</option>
											            <option value="CHAD">CHAD</option>
											            <option value="CHILE">CHILE</option>
											            <option value="CHINA">CHINA</option>
											            <option value="CHIPRE">CHIPRE</option>
											            <option value="CIUDAD DEL VATICANO (SANTA SEDE)">CIUDAD DEL VATICANO (SANTA SEDE)</option>
											            <option value="COLOMBIA">COLOMBIA</option>
											            <option value="COMORES">COMORES</option>
											            <option value="CONGO">CONGO</option>
											            <option value="REPUBLICA DEMOCRATICA DEL CONGO">REPUBLICA DEMOCRATICA DEL CONGO</option>
											            <option value="COREA">COREA</option>
											            <option value="COREA DEL NORTE">COREA DEL NORTE</option>
											            <option value="COSTA DE MARFIL">COSTA DE MARFIL</option>
											            <option value="COSTA RICA">COSTA RICA</option>
											            <option value="CROACIA (HRVATSKA)">CROACIA (HRVATSKA)</option>
											            <option value="CUBA">CUBA</option>
											            <option value="DINAMARCA">DINAMARCA</option>
											            <option value="DJIBOUTI">DJIBOUTI</option>
											            <option value="DOMINICA">DOMINICA</option>
											            <option value="ECUADOR">ECUADOR</option>
											            <option value="EGIPTO">EGIPTO</option>
											            <option value="EL SALVADOR">EL SALVADOR</option>
											            <option value="EMIRATOS ARABES UNIDOS">EMIRATOS ARABES UNIDOS</option>
											            <option value="ERITREA">ERITREA</option>
											            <option value="ESLOVENIA">ESLOVENIA</option>
											            <option value="ESPAÃA">ESPAÃA</option>
											            <option value="ESTADOS UNIDOS">ESTADOS UNIDOS</option>
											            <option value="ESTONIA">ESTONIA</option>
											            <option value="ETIOPIA">ETIOPIA</option>
											            <option value="FIJI">FIJI</option>
											            <option value="FILIPINAS">FILIPINAS</option>
											            <option value="FINLANDIA">FINLANDIA</option>
											            <option value="FRANCIA">FRANCIA</option>
											            <option value="GABON">GABON</option>
											            <option value="GAMBIA">GAMBIA</option>
											            <option value="GEORGIA">GEORGIA</option>
											            <option value="GHANA">GHANA</option>
											            <option value="GIBRALTAR">GIBRALTAR</option>
											            <option value="GRANADA">GRANADA</option>
											            <option value="GRECIA">GRECIA</option>
											            <option value="GROENLANDIA">GROENLANDIA</option>
											            <option value="GUADALUPE">GUADALUPE</option>
											            <option value="GUAM">GUAM</option>
											            <option value="GUATEMALA">GUATEMALA</option>
										            	<option value="GUAYANA">GUAYANA</option>
											            <option value="GUAYANA FRANCESA">GUAYANA FRANCESA</option>
											            <option value="GUINEA">GUINEA</option>
											            <option value="GUINEA ECUATORIAL">GUINEA ECUATORIAL</option>
											            <option value="GUINEA-BISSAU">GUINEA-BISSAU</option>
											            <option value="HAITI">HAITI</option>
											            <option value="HONDURAS">HONDURAS</option>
											            <option value="HUNGRIA">HUNGRIA</option>
											            <option value="INDIA">INDIA</option>
											            <option value="INDONESIA">INDONESIA</option>
											            <option value="IRAK">IRAK</option>
											            <option value="IRAN">IRAN</option>
											            <option value="IRLANDA">IRLANDA</option>
											            <option value="ISLA BOUVET">ISLA BOUVET</option>
											            <option value="ISLA DE CHRISTMAS">ISLA DE CHRISTMAS</option>
											            <option value="ISLANDIA">ISLANDIA</option>
											            <option value="ISLAS CAIMAN">ISLAS CAIMAN</option>
											            <option value="ISLAS COOK">ISLAS COOK</option>
											            <option value="ISLAS DE COCOS O KEELING">ISLAS DE COCOS O KEELING</option>
											            <option value="ISLAS FAROE">ISLAS FAROE</option>
											            <option value="ISLAS HEARD Y MCDONALD">ISLAS HEARD Y MCDONALD</option>
											            <option value="ISLAS MALVINAS">ISLAS MALVINAS</option>
											            <option value="ISLAS MARIANAS DEL NORTE">ISLAS MARIANAS DEL NORTE</option>
											            <option value="ISLAS MARSHALL">ISLAS MARSHALL</option>
											            <option value="ISLAS MENORES DE ESTADOS UNIDOS">ISLAS MENORES DE ESTADOS UNIDOS</option>
											            <option value="ISLAS PALAU">ISLAS PALAU</option>
											            <option value="ISLAS SALOMON">ISLAS SALOMON</option>
											            <option value="ISLAS SVALBARD Y JAN MAYEN">ISLAS SVALBARD Y JAN MAYEN</option>
											            <option value="ISLAS TOKELAU">ISLAS TOKELAU</option>
											            <option value="ISLAS TURKS Y CAICOS">ISLAS TURKS Y CAICOS</option>
											            <option value="ISLAS VIRGENES (EEUU)">ISLAS VIRGENES (EEUU)</option>
											            <option value="ISLAS VIRGENES (REINO UNIDO)">ISLAS VIRGENES (REINO UNIDO)</option>
											            <option value="ISLAS WALLIS Y FUTUNA">ISLAS WALLIS Y FUTUNA</option>
											            <option value="ISRAEL">ISRAEL</option>
											            <option value="ITALIA">ITALIA</option>
											            <option value="JAMAICA">JAMAICA</option>
											            <option value="JAPON">JAPON</option>
											            <option value="JORDANIA">JORDANIA</option>
											            <option value="KAZAJISTAN">KAZAJISTAN</option>
											            <option value="KENIA">KENIA</option>
											            <option value="KIRGUIZISTAN">KIRGUIZISTAN</option>
											            <option value="KIRIBATI">KIRIBATI</option>
											            <option value="KUWAIT">KUWAIT</option>
											            <option value="LAOS">LAOS</option>
											            <option value="LESOTHO">LESOTHO</option>
											            <option value="LETONIA">LETONIA</option>
											            <option value="LIBANO">LIBANO</option>
											            <option value="LIBERIA">LIBERIA</option>
											            <option value="LIBIA">LIBIA</option>
											            <option value="LIECHTENSTEIN">LIECHTENSTEIN</option>
											            <option value="LITUANIA">LITUANIA</option>
											            <option value="LUXEMBURGO">LUXEMBURGO</option>
											            <option value="EX-REPUBLICA YUGOSLAVA DE MACEDONIA">EX-REPUBLICA YUGOSLAVA DE MACEDONIA</option>
											            <option value="MADAGASCAR">MADAGASCAR</option>
											            <option value="MALASIA">MALASIA</option>
											            <option value="MALAWI">MALAWI</option>
											            <option value="MALDIVAS">MALDIVAS</option>
											            <option value="MALI">MALI</option>
											            <option value="MALTA">MALTA</option>
											            <option value="MARRUECOS">MARRUECOS</option>
											            <option value="MARTINICA">MARTINICA</option>
											            <option value="MAURICIO">MAURICIO</option>
											            <option value="MAURITANIA">MAURITANIA</option>
											            <option value="MAYOTTE">MAYOTTE</option>
											            <option value="MEXICO">MEXICO</option>
											            <option value="MICRONESIA">MICRONESIA</option>
											            <option value="MOLDAVIA">MOLDAVIA</option>
											            <option value="MONACO">MONACO</option>
											            <option value="MONGOLIA">MONGOLIA</option>
											            <option value="MONTSERRAT">MONTSERRAT</option>
											            <option value="MOZAMBIQUE">MOZAMBIQUE</option>
											            <option value="NAMIBIA">NAMIBIA</option>
											            <option value="NAURU">NAURU</option>
											            <option value="NEPAL">NEPAL</option>
											            <option value="NICARAGUA">NICARAGUA</option>
											            <option value="NIGER">NIGER</option>
											            <option value="NIGERIA">NIGERIA</option>
											            <option value="NIUE">NIUE</option>
											            <option value="NORFOLK">NORFOLK</option>
											            <option value="NNORUEGAO">NORUEGA</option>
											            <option value="NUEVA CALEDONIA">NUEVA CALEDONIA</option>
											            <option value="NUEVA ZELANDA">NUEVA ZELANDA</option>
											            <option value="OMAN">OMAN</option>
											            <option value="PAISES BAJOS">PAISES BAJOS</option>
											            <option value="PANAMA">PANAMA</option>
											            <option value="PAPUA NUEVA GUINEA">PAPUA NUEVA GUINEA</option>
											            <option value="PAKISTAN">PAKISTAN</option>
											            <option value="PARAGUAY">PARAGUAY</option>
											            <option value="PERU">PERU</option>
											            <option value="PITCAIRN">PITCAIRN</option>
											            <option value="POLINESIA FRANCESA">POLINESIA FRANCESA</option>
											            <option value="POLONIA">POLONIA</option>
											            <option value="PORTUGAL">PORTUGAL</option>
											            <option value="PUERTO RICO">PUERTO RICO</option>
											            <option value="QATAR">QATAR</option>
											            <option value="REINO UNIDO">REINO UNIDO</option>
											            <option value="EPUBLICA CENTROAFRICANA">REPUBLICA CENTROAFRICANA</option>
											            <option value="REPUBLICA CHECA">REPUBLICA CHECA</option>
											            <option value="REPUBLICA DE SUDAFRICA">REPUBLICA DE SUDAFRICA</option>
											            <option value="REPUBLICA DOMINICANA">REPUBLICA DOMINICANA</option>
											            <option value="REPUBLICA ESLOVACA">REPUBLICA ESLOVACA</option>
											            <option value="REUNION">REUNION</option>
											            <option value="RUANDA">RUANDA</option>
											            <option value="RUMANIA">RUMANIA</option>
											            <option value="RUSIA">RUSIA</option>
											            <option value="SAHARA OCCIDENTAL">SAHARA OCCIDENTAL</option>
											            <option value="SAINT KITTS Y NEVIS">SAINT KITTS Y NEVIS</option>
											            <option value="SAMOA">SAMOA</option>
											            <option value="SAMOA AMERICANA">SAMOA AMERICANA</option>
											            <option value="SAN MARINO">SAN MARINO</option>
											            <option value="SAN VICENTE Y GRANADINAS">SAN VICENTE Y GRANADINAS</option>
											            <option value="SANTA HELENA">SANTA HELENA</option>
										                <option value="SANTA LUCIA">SANTA LUCIA</option>
											            <option value="SANTO TOME Y PRINCIPE">SANTO TOME Y PRINCIPE</option>
											            <option value="SENEGAL">SENEGAL</option>
											            <option value="SEYCHELLES">SEYCHELLES</option>
											            <option value="SIERRA LEONA">SIERRA LEONA</option>
											            <option value="SINGAPUR">SINGAPUR</option>
											            <option value="SIRIA">SIRIA</option>
											            <option value="SOMALIA">SOMALIA</option>
											            <option value="SRI LANKA">SRI LANKA</option>
											            <option value="ST PIERRE Y MIQUELON">ST PIERRE Y MIQUELON</option>
											            <option value="SUAZILANDIA">SUAZILANDIA</option>
											            <option value="SUDAN">SUDAN</option>
											            <option value="SUECIA">SUECIA</option>
										                <option value="SUIZA">SUIZA</option>
											            <option value="SURINAM">SURINAM</option>
											            <option value="TAILANDIA">TAILANDIA</option>
											            <option value="TAIWAN">TAIWAN</option>
											            <option value="TANZANIA">TANZANIA</option>
											            <option value="TAYIKISTAN">TAYIKISTAN</option>
											            <option value="TERRITORIOS FRANCESES DEL SUR">TERRITORIOS FRANCESES DEL SUR</option>
											            <option value="TIMOR ORIENTAL">TIMOR ORIENTAL</option>
											            <option value="TOGO">TOGO</option>
											            <option value="TONGA">TONGA</option>
										            	<option value="TRINIDAD Y TOBAGO">TRINIDAD Y TOBAGO</option>
											            <option value="TUNEZ">TUNEZ</option>
											            <option value="TURKMENISTAN">TURKMENISTAN</option>
											            <option value="TURQUIA">TURQUIA</option>
											            <option value="TUVALU">TUVALU</option>
											            <option value="UCRANIA">UCRANIA</option>
											            <option value="UGANDA">UGANDA</option>
											            <option value="URUGUAY">URUGUAY</option>
											            <option value="UZBEKISTAN">UZBEKISTAN</option>
											            <option value="VANUATU">VANUATU</option>
											            <option value="VENEZUELA">VENEZUELA</option>
											            <option value="VIETNAM">VIETNAM</option>
											            <option value="YEMEN">YEMEN</option>
											            <option value="YUGOSLAVIA">YUGOSLAVIA</option>
											            <option value="ZAMBIA">ZAMBIA</option>
											            <option value="ZIMBABUE">ZIMBABUE</option>
											          </select>
                    				</div>
                  				</div>
                			</div>
              			</div>
                	</div>
                	<!-- Row 2 -->
                	<div class="row">
                  		<div class="col-lg-4 col-md-4">
                    		<div class="form-group" style="text-align: left">
                      			<label>REGISTRO SANITARIO</label>
                      				<select id="tipo1" name="tipo1" class="form-control">
                      					<option value="" selected>SELECCIONA UNA OPCION...</option>
                      					<option value="REGISTRO SANITARIO">REGISTRO SANITARIO</option>
                      					<option value="RECONOCIMIENTO MUTUO">RECONOCIMIENTO MUTUO</option>
                      					<option value="CONSTANCIA">CONSTANCIA</option>
                      					<option value="SOLICITUD">SOLICITUD</option>
                      					<option value="OTROS">OTROS</option>
                      					<option value="NO PRESENTO">NO PRESENTO</option>	 
                      				</select>
                    		</div>
                  		</div>
                  		<div class="col-lg-2 col-md-2">
                      <div class="row">
                  			<div class="col-lg-12 col-md-12">
                    	    <div class="form-group" style="text-align: left">
                      	    <label>NUMERO</label>
                            <input
                              autocomplete="off"
                        			type="text"
                        			class="form-control"
                        			id="numSanitario"
                        			name="numSanitario"
                        			maxlength="100"
                            />
                          </div>
                        </div>
                    	</div>
                  	</div>
                 		<div class="col-lg-3 col-md-3">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>FECHA DE VENCIMIENTO</label>
                      						<input
                        					autocomplete="off"
                       	 					type="date"
                        					class="form-control"
                        					id="dateVencimiento1"
                        					name="dateVencimiento1"
                       		 				placeholder=""

                      						/>                
                    				</div>
                  				</div>
                			</div>
              			</div>
              			<div class="col-lg-3 col-md-3">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>FECHA DE EMISION</label>
                      						<input
                       						autocomplete="off"
                       	 					type="date"
                        					class="form-control"
                        					id="dateEmision1"
                        					name="dateEmision1"
                       		 				placeholder=""
                        					
                      						/>            
                    				</div>
                  				</div>
                			</div>
              			</div>
                	</div>
                	<!-- Row 3 -->
                	<div class="row">
                  		<div class="col-lg-4 col-md-4">
                    		<div class="form-group" style="text-align: left">
                      			<label>CERTIFICADO DE BUENAS PRACTICAS DE MANUFACTURA</label>
                      				<select id="tipo2" name="tipo2" class="form-control">
                      					<option value="" selected>SELECCIONA UNA OPCION...</option>
                      					<option value="CERTIFICADO DE BUENAS PRACTICAS DE MANUFACTURA">CERTIFICADO DE BUENAS PRACTICAS DE MANUFACTURA</option>
                      					<option value="CPP">CPP</option>
                      					<option value="ISO">ISO</option>
                      					<option value="CONSTANCIA">CONSTANCIA</option>
                      					<option value="SOLICITUD">SOLICITUD</option>
                      					<option value="OTROS">OTROS</option>
                      					<option value="NO PRESENTO">NO PRESENTO</option>	 
                      				</select>
                    		</div>
                  		</div>
                  		<div class="col-lg-2 col-md-2">
                			<div class="row">
                  			<div class="col-lg-12 col-md-12">
                    			<div class="form-group" style="text-align: left">
                      			<label>NUMERO</label>
                            	<input
                                autocomplete="off"
                        				type="text"
                        				class="form-control"
                        				id="numCertif"
                        				name="numCertif"
                        				maxlength="100"
                              />
                    			</div>
                  			</div>
                			</div>
              		  </div>
                 		<div class="col-lg-3 col-md-3">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>FECHA DE VENCIMIENTO</label>
                      						<input
                        					autocomplete="off"
                       	 					type="date"
                        					class="form-control"
                        					id="dateVencimiento2"
                        					name="dateVencimiento2"
                       		 				placeholder=""
                      						/>
                    				</div>
                  				</div>
                			</div>
              			</div>
              			<div class="col-lg-3 col-md-3">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>FECHA DE EMISION</label>
                      						<input
                       						autocomplete="off"
                       	 					type="date"
                        					class="form-control"
                        					id="dateEmision2"
                        					name="dateEmision2"
                       		 				placeholder=""
                      						/>            
                    				</div>
                  				</div>
                			</div>
              			</div>
                	</div>
                	<!-- Row 4 -->
                	<div class="row">
                  	<div class="col-lg-4 col-md-4">
                      <div class="row">
                  			<div class="col-lg-12 col-md-12">
                    	    <div class="form-group" style="text-align: left">
                      	    <label>ETIQUETADO Y EMPAQUE PRIMARIO</label>
                            <select id="primario" name="primario" class="form-control">
                      		    <option value="NO CUMPLE" selected>NO CUMPLE</option>
                      	      <option value="CUMPLE">CUMPLE</option>	 
                      	    </select>
                          </div>
                        </div>
                    	</div>
                      <div class="row" id="razonPrimarioRow">
                  			<div class="col-lg-12 col-md-12">
                    	    <div class="form-group" style="text-align: left">
                      		  <label>RAZON</label>
                      		  <input
                        		  autocomplete="off"
                        		  type="text"
                        		  class="form-control"
                        		  id="razonPrimario"
                        		  name="razonPrimario"
                        		  maxlength="500"
                      		  />
                          </div>
                        </div>
                      </div>
                  	</div>
                 		<div class="col-lg-4 col-md-4">
                			<div class="row">
                  			<div class="col-lg-12 col-md-12">
                    			<div class="form-group" style="text-align: left">
                      			<label>ETIQUETADO Y EMPAQUE SECUNDARIO</label>
                            <select id="secundario" name="secundario" class="form-control">
                      				<option value="NO CUMPLE" selected>NO CUMPLE</option>
                      				<option value="CUMPLE">CUMPLE</option>	 
                      			</select>
                    			</div>
                  			</div>
                			</div>
                      <div class="row" id="razonSecundarioRow">
                  			<div class="col-lg-12 col-md-12">
                          <div class="form-group" style="text-align: left">
                      			<label>RAZON</label>
                      			<input
                        			autocomplete="off"
                        			type="text"
                        			class="form-control"
                        			id="razonSecundario"
                        			name="razonSecundario"
                        			maxlength="500"
                      			/>
                          </div>
                        </div>
                      </div>
              			</div>
              			<div class="col-lg-4 col-md-4">
                			<div class="row">
                  			<div class="col-lg-12 col-md-12">
                    			<div class="form-group" style="text-align: left">
                      			<label>ETIQUETADO Y EMPAQUE TERCIARIO</label>
                      			<select id="terciario" name="terciario" class="form-control">
                      				<option value="NO CUMPLE" selected>NO CUMPLE</option>
                      				<option value="CUMPLE">CUMPLE</option>	 
                      			</select>     
                    			</div>
                  			</div>
                			</div>
                      <div class="row" id="razonTerciarioRow">
                  			<div class="col-lg-12 col-md-12">
                    			<div class="form-group" style="text-align: left">
                      			<label>RAZON</label>
                      			<input
                        			autocomplete="off"
                        			type="text"
                        			class="form-control"
                        			id="razonTerciario"
                        			name="razonTerciario"
                        			maxlength="500"
                      			/>
                          </div>
                        </div>
                      </div>
              			</div>
                	</div>
                	<!-- Row 6 -->
                	
                	
                </div>
              <!--Inputs Option 1 Ends-->
              </div>
              
              <!--Inputs Option 2 Begins-->
              <div id="paso2" style="display: none">
              <div class="col-lg-12 col-md-12">
                	<!-- Row 1 -->
                	<div class="row">
                  	<div class="col-lg-4 col-md-4">
                    	<div class="form-group" style="text-align: left">
                      	<label>MUESTRA PRESENTADA</label>
                      	<input
                        	autocomplete="off"
                        	type="text"
                        	class="form-control"
                        	id="muestraPresentada"
                        	name="muestraPresentada"
                        	value=""
                      	/>
                    	</div>
                  	</div>
                 		<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>NO. FOLIOS DE LA OFERTA</label>
                      						<input
                        					autocomplete="off"
                        					type="text"
                        					class="form-control"
                        					id="noFolios"
                        					name="noFolios"
                        					value=""
                        					onkeyup="format(this)"
                                          onchange="format(this)"
                      						/>
                    				</div>
                  				</div>
                			</div>
              			</div>
              			<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>OBSERVACIONES OFERTAS DE PROVEEDORES</label>
                      						<input
                        					autocomplete="off"
                        					type="text"
                        					class="form-control"
                        					id="obsOferProv"
                        					name="obsOferProv"
                        					value=""
                      						/>
                    				</div>
                  				</div>
                			</div>
              			</div>
                	</div>
                	<!-- Row 2 -->
                	<div class="row">
                  	<div class="col-lg-4 col-md-4">
                    	<div class="form-group" style="text-align: left">
                      	<label>CONSULTAS/OBSERVACIONES AL ARSA</label>
                      	<input
                        	autocomplete="off"
                        	type="text"
                        	class="form-control"
                        	id="consultaArsa"
                        	name="consultaArsa"
                        	maxlength="4000"
                        	value=""
                      	/>
                    	</div>
                  	</div>
                 		<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>CONSULTAS AL BENEFICIARIO</label>
                      						<input
                        					autocomplete="off"
                        					class="form-control"
                        					id="consultaBenef"
                        					name="consultaBenef"
                        					maxlength="1000"
                       		 				placeholder=""
                      						/>                
                    				</div>
                  				</div>
                			</div>
              			</div>
              			<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>HISTORIAL CUMPLIMIENTO DE CALIDAD</label>
                      						<input
                       						autocomplete="off"
                        					class="form-control"
                        					id="historialCal"
                        					name="historialCal"
                       		 				placeholder="VER REPORTE"
                        					readOnly
                      						/>            
                    				</div>
                  				</div>
                			</div>
              			</div>
                	</div>
                	<!-- Row 3 -->
                	<div class="row">
                  		<div class="col-lg-4 col-md-4">
                    		<div class="form-group" style="text-align: left">
                      			<label>HISTORIAL CUMPLIMIENTO DE CONTRATO</label>
                      				<input
                       				autocomplete="off"
                        			class="form-control"
                        			id="historialCont"
                        			name="historialCont"
                       		 		placeholder="VER REPORTE"
                        			readOnly
                      				/>    
                    		</div>
                  		</div>
                 		<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>SOLICITUDES DE ACLARACION</label>
                      					<div class="row">
                      						<div class="col-lg-4 col-md-4">
                      							<label>ACTIVAR</label>
                      						</div>
                      						<div class="col-lg-4 col-md-4">
                      							<input
                        						autocomplete="off"
                       	 						type="checkbox"
                        						class="form-control"
                        						id="solicitudAclaracion"
                        						name="solicitudAclaracion"
                      							/>
                      						</div>
                      					</div>
                    				</div>
                  				</div>
                			</div>
              			</div>
              			<div class="col-lg-4 col-md-4">
                			<div class="row">
                  				<div class="col-lg-12 col-md-12">
                    				<div class="form-group" style="text-align: left">
                      					<label>RESPUESTA A SOLICITUDES DE ACLARACION</label>
                      						<div class="row">
                      						<div class="col-lg-4 col-md-4">
                      							<label>ACTIVAR</label>
                      						</div>
                      						<div class="col-lg-4 col-md-4">
                      							<input
                        						autocomplete="off"
                       	 						type="checkbox"
                        						class="form-control"
                        						id="resSolicitudAclaracion"
                        						name="resSolicitudAclaracion"
                      							/>
                      						</div>
                      					</div>           
                    				</div>
                  				</div>
                			</div>
              			</div>
              			
              			
              			<div class="col-lg-12 col-md-12">
                    	<div class="form-group" style="text-align: left">
                      	<label>OBSERVACIONES A LA OFERTA DEL CEO</label>
                      	<input
                        	autocomplete="off"
                        	type="text"
                        	class="form-control"
                        	id="obsOfertaCEO"
                        	name="obsOfertaCEO"
                        	maxlength="8000"
                        	value=""
                      	/>
                    	</div>
                  	</div>
              			
                	</div>               	             	
              </div>
              </div>
              <!-- Input Option 2 Ends -->
              <%
              String regProv = "";
    			    String descTec = "";
    			    String cant = "";
    			    String icoterm = "";
				      String regSan = "";
				      String cert = "";
				      String garant = "";
				      String tiempoEntrega = "";
				      String vidaUtil = "";
				      String cap = "";
				      String grantaFab = "";
				      String carta = "";
				      String calidad = "";
    			    String historial = "";
    			    String razon = "";
              try{ 
                  Connection con = null;
                  Statement state = null;
                  ResultSet rs = null;
                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                  con = DriverManager.getConnection(url,"admin","system123");
                  state = con.createStatement();
                  String bp = (String)request.getAttribute("buyProcessNumber");
                  int co = 0;
				          System.out.println(bp + " <- BP");
                  String QueryString = "select cod from dbo.procesoCompraALP where noProcesoCompra Like '" + bp + "'";
                  rs = state.executeQuery(QueryString);
                  while(rs.next()){
                	  co = rs.getInt(1);
                  }
                  System.out.println(co + " <- co");
              /*     QueryString = "SELECT * FROM dbo.CriterioEvaluacionALP where cod=" + co;
                  rs = state.executeQuery(QueryString);
                  
                  while(rs.next()){ 
                  		 regProv = rs.getString(2).contentEquals("1") ? "block" : "none";                  		
                  		descTec = rs.getString(3).contentEquals("1") ? "block" : "none";
                  		historial = rs.getString(15).contentEquals("1") ? "block" : "none";
                  		cant = rs.getString(4).contentEquals("1") ? "block" : "none";
                  		icoterm = rs.getString(5).contentEquals("1") ? "block" : "none";
						          regSan = rs.getString(6).contentEquals("1") ? "block" : "none";
						          garant = rs.getString(8).contentEquals("1") ? "block" : "none";
						          tiempoEntrega = rs.getString(9).contentEquals("1") ? "block" : "none";
						          vidaUtil = rs.getString(10).contentEquals("1") ? "block" : "none";
						          grantaFab = rs.getString(12).contentEquals("1") ? "block" : "none";						
						          carta = rs.getString(13).contentEquals("1") ? "block" : "none";
						          calidad = rs.getString(14).contentEquals("1") ? "block" : "none";			
						          cap = rs.getString(11).contentEquals("1") ? "block" : "none";
                  		razon = rs.getString(16).contentEquals("1") ? "block" : "none";
                  		cert = rs.getString(7).contentEquals("1") ? "block" : "none"; 
                      } 
                  rs.close(); */
                  state.close();
                  con.close();                 
                %>
              
              <!--Inputs Option 3 Begins-->
              <div id="paso3" style="display: none">
              <div class="col-lg-12 col-md-12">
                	    <table
                        id="criteriosEvalaucionTableParam"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de Oficios"
                      >
                        <thead>
                          <tr>
                            <th class="all">NO.</th>
                            <th class="min-tablet">CRITERIOS</th>
                            <th class="min-tablet">OPCION</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%                        
                        String cod = (String)session.getAttribute("cod");                        
                        ArrayList<CriterioEvaluacionDTO> Criterios = (ArrayList<CriterioEvaluacionDTO>) request.getAttribute("CriteriosAplica");
                        
                        if (Criterios != null)
                          {
                            for(CriterioEvaluacionDTO criterio : Criterios){
                            	System.out.print(criterio.getidC());
                            	System.out.print(criterio.getNombreCriterio());
                        %>
                            <tr>
                            
                            <td><input name="idCriterio" style="border: 0; background: transparent;" value="<%=criterio.getidC()%>" /> </td>
                            <td><%=criterio.getNombreCriterio()%></td>
                            <td>
                            	 <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="opcion"
                                          name="opcion"
                                        >
                                        <option value="" selected>SELECCIONA UNA OPCION...</option>
                                          <%
                                          if(criterio.getlistDetalle() != null){
                                        	  for(CriteriosEvaluacionDetalle opcion : criterio.getlistDetalle()){
                                            	  %>                                            	  
                                            	    <option value="<%=opcion.getId()%>">
                                                  <%=opcion.getNombreCriterioDetalle()%>
                                                </option>                                              	  
                                            	  <%                                        		  
                                              }                                        	  
                                          }
                                          
                                          %>    
                                   </select>                                           
                            </td>
							</tr>
                        <%
                            }
                          }
                        %>
                        </tbody>
                      </table>     
                      <br />          
              </div>
              </div>
              <!-- Input Option 3 Ends -->
              
              <%}catch(Exception e){System.out.println(e);} %>
              </div>
              </div>
              <!--DATA Section ends-->
              <hr style="width:100%;text-align:left;margin-left:0">
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
                        data-target="#newRegStateModalCenter"
                      >
                        <i class="material-icons md-18">done</i>ACEPTAR
                      </button>
                      <button
                        class="btn btn-sm btn-success ml-2 hide"
                        id="confirmEditRegButton"
                        type="button"
                        data-toggle="modal"
                        data-target="#editRegStateModalCenter"
                      >
                        <i class="material-icons md-18">done</i>CONFIRMAR
                        EDICION
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!--DATA Section ends-->
              </form>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left ml-2">
                    <button
                      class="btn btn-sm btn-danger ml-2"
                      id="deleteRegButton"
                      type="button"
                      data-toggle="modal"
                      data-target="#deleteModalCenter"
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
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-right" id="instructionsMessage">
                    <label class="mr-3">NOTA: USE LAS TECLAS DE DESPLAZAMIENTO PARA MOVERSE POR LA TABLA</label>
                  </div>
                </div>
              </div>
              <!--Table Section starts-->
              <% int codPadre = (int)session.getAttribute("codPadre"); 
              System.out.println(codPadre + " codPadre codPadre");
              %>
              <div class="card-body main-font" style="overflow-x:auto">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  aria-describedby="Tabla de ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">CORRELATIVO</th>
                       <th class="min-desktop">NO. OFERTA DB</th>
                      <th class="all">NO. OFERTA DEL PROVEEDOR</th>
                      <th class="min-desktop">PROVEEDOR</th>
                      <th class="min-desktop">NO. ITEM</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">CODIGO SESAL</th>
                      <th class="min-desktop">PRODUCTO REQUERIDO</th>
                      <th class="min-desktop">PRODUCTO OFERTADO</th>
                      <th class="min-desktop">DESCRIPCION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCRIPCION TECNICA OFERTADA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION OFERTADA</th>                      
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">FABRICANTE</th>
                      <th class="min-desktop">PAIS ORIGEN</th>
                      <th class="min-desktop">REGISTRO SANITARIO/OTROS</th>                      
                      <th class="min-desktop">NO. REGISTRO SANITARIO/OTROS</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>
                      <th class="min-desktop">FECHA DE EMISION</th>                      
                      <th class="min-desktop">CERTIFICADO DE BUENAS PRACTICAS/OTROS</th>
                      <th class="min-desktop">NO. CERTIFICADO DE BUENAS PRACTICAS/OTROS</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>                      
                      <th class="min-desktop">FECHA DE EMISION</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUE PRIMARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUE SECUNDARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUE TERCIARIO OFERTADO</th>
                      <th class="min-desktop">OBSERVACION DE OFERTA DE PROVEEDOR</th>                      
                      <th class="min-desktop">NO. FOLIO DE LA OFERTA</th>
                      <th class="min-desktop">MUESTRA PRESENTADA</th>
                      <th class="min-desktop">SOLICITUDES DE ACLARACION</th>                                             
                      <th class="min-desktop">RESPUESTA DE SOLICITUD DE ACLARACION</th>
                      <th class="min-desktop">CONSULTAS/OBSERVACIONES ARSA</th>
                      <th class="min-desktop">CONSULTAS AL BENEFICIARIO</th> 
                      <th class="min-desktop">OBSERVACIONES A LA OFERTA DEL CEO</th>
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CALIDAD</th>    
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CONTRATO</th>                                        
                      <th class="min-desktop">ESTADO</th>
                      <th class="min-desktop">FECHA OFERTA</th>
                      <th  class="min-desktop">MONEDA</th>
                      <!-- <th class="min-desktop">CRITERIOS DE EVALUACION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.</th>     -->
                      <%
                      int ColumnasDefault = 43;
                      int canCtiterios = 0;
                      int totalColumnas = ColumnasDefault + canCtiterios;
                      
                      String cod = (String)session.getAttribute("cod");                        
                      ArrayList<CriterioEvaluacionDTO> Criterios = (ArrayList<CriterioEvaluacionDTO>) request.getAttribute("CriteriosAplica");
                      if (Criterios != null)
                      {
                        for(CriterioEvaluacionDTO criterio : Criterios){
                        	canCtiterios++;
                    %>
                       
                        
                        <th class="min-desktop"><%=criterio.getNombreCriterio()%></th>
                      
                    <%
                        }
                      }
                    %>
                      
               
                      
                      
                      <th class="min-desktop">ESTADO</th>
                      <th class="min-desktop">FECHA OFERTA</th>
               
                     
                      
                      
                     
                    </tr>
                  </thead>
                   <tbody>
                   <%--  <% 
                    try{
                    	
                      int count = 1;	
                      Connection con = null;
                      Statement state = null;
                      ResultSet rs = null;
                      String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                      con = DriverManager.getConnection(url,"admin","system123");
                      state = con.createStatement(); 
                      String QueryString = "SELECT noOfertaIngresada, distribuidor, idItem, codATC, codSesal, medicamentoEstimado, medicamentoOfertado,"
                      + "descripcionTecnicaRequerida, descripcionTecnica, up, canEstimadaOferta, precio," 
                      + "nombreFabricante, paisOrigen, registroSanitario, numSanitario, fechaVencSan, fechaEmisionSan, certificadoManufactura,"
                      + "numCertif, fechaVencManufactura, fechaEmisionManufactura, etiquetadoPrimario, etiquetadoSecundario,"
                      + "etiquetadoTerciario, obsOfertasProv, noFoliosOferta, muestraPresentada, solicitudesAclaracion,"                      
                      + "respuestaSolicitudesAclaracion, consultasArsa, consultasBenef, estado, noOferta, fechaOferta, moneda, obsOfertaCEO from dbo.ofertaALP where codPadre = " + codPadre; 
                      rs = state.executeQuery(QueryString);
                    %>
                    <% while(rs.next()){
                      String noOfertaIngresada = rs.getString(1);if(noOfertaIngresada == null || noOfertaIngresada.isEmpty()){ noOfertaIngresada = "-"; }
                      String distribuidor = rs.getString(2);if(distribuidor == null || distribuidor.isEmpty()){ distribuidor = "-"; }
                      String idItem = rs.getString(3);if(idItem == null || idItem.isEmpty()){ idItem = "-"; }
                      String codATC = rs.getString(4);if(codATC == null || codATC.isEmpty()){ codATC = "-"; }
                      String codSesal = rs.getString(5);if(codSesal == null || codSesal.isEmpty()){ codSesal = "-"; }
                      String medicamentoEstimado = rs.getString(6);if(medicamentoEstimado == null || medicamentoEstimado.isEmpty()){ medicamentoEstimado = "-"; }
                      String medicamentoOfertado = rs.getString(7);if(medicamentoOfertado == null || medicamentoOfertado.isEmpty()){ medicamentoOfertado = "-"; }
                      String descripcionTecnicaRequerida = rs.getString(8);if(descripcionTecnicaRequerida == null || descripcionTecnicaRequerida.isEmpty()){ descripcionTecnicaRequerida = "-"; }
                      String descripcionTecnica = rs.getString(9);if(descripcionTecnica == null || descripcionTecnica.isEmpty()){ descripcionTecnica = "-"; }
                      String unidadPresentacionRequerida = rs.getString(10);if(unidadPresentacionRequerida == null || unidadPresentacionRequerida.isEmpty()){ unidadPresentacionRequerida = "-"; }
                      
                      String canEstimadaOfertaMiles = String.format("%,d", rs.getInt(11));if(canEstimadaOfertaMiles == null || canEstimadaOfertaMiles.isEmpty()){ canEstimadaOfertaMiles = "0"; }
                      String canEstimadaOferta = rs.getString(11);if(canEstimadaOferta == null || canEstimadaOferta.isEmpty()){ canEstimadaOferta = "0"; }
                      String precio = rs.getString(12);if(precio == null || precio.isEmpty()){ precio = "0"; }
                      String nombreFabricante = rs.getString(13);if(nombreFabricante == null || nombreFabricante.isEmpty()){ nombreFabricante = "-"; }
                      String paisOrigen = rs.getString(14);if(paisOrigen == null || paisOrigen.isEmpty()){ paisOrigen = "-"; }
                      String registroSanitario = rs.getString(15);if(registroSanitario == null || registroSanitario.isEmpty()){ registroSanitario = "-"; }
                      String numSanitario = rs.getString(16);if(numSanitario == null || numSanitario.isEmpty()){ numSanitario = "-"; }
                      String fechaVencSan = rs.getString(17);if(fechaVencSan == null || fechaVencSan.isEmpty()){ fechaVencSan = "-"; }
                      String fechaEmisionSan = rs.getString(18);if(fechaEmisionSan == null || fechaEmisionSan.isEmpty()){ fechaEmisionSan = "-"; }
                      String certificadoManufactura = rs.getString(19);if(certificadoManufactura == null || certificadoManufactura.isEmpty()){ certificadoManufactura = "-"; }
                           
                      String numCertif = rs.getString(20);if(numCertif == null || numCertif.isEmpty()){ numCertif = "-"; }
                      String fechaVencManufactura = rs.getString(21);if(fechaVencManufactura == null || fechaVencManufactura.isEmpty()){ fechaVencManufactura = "-"; }
                      String fechaEmisionManufactura = rs.getString(22);if(fechaEmisionManufactura == null || fechaEmisionManufactura.isEmpty()){ fechaEmisionManufactura = "-"; }
 					  
                      if(certificadoManufactura.contentEquals("CONSTANCIA") || certificadoManufactura.contentEquals("SOLICITUD")){
                    	  fechaEmisionManufactura = "N/A";
                      }
                      
                      String etiquetadoPrimario = rs.getString(23);if(etiquetadoPrimario == null || etiquetadoPrimario.isEmpty()){ etiquetadoPrimario = "-"; }
                      String etiquetadoSecundario = rs.getString(24);if(etiquetadoSecundario == null || etiquetadoSecundario.isEmpty()){ etiquetadoSecundario = "-"; }
                      String etiquetadoTerciario = rs.getString(25);if(etiquetadoTerciario == null || etiquetadoTerciario.isEmpty()){ etiquetadoTerciario = "-"; }
                      String obsOfertasProv = rs.getString(26);if(obsOfertasProv == null || obsOfertasProv.isEmpty()){ obsOfertasProv = "-"; }
                     
                      String noFoliosOferta = String.format("%,d", rs.getInt(27));if(noFoliosOferta == null || noFoliosOferta.isEmpty()){ noFoliosOferta = "0"; }
                     
                      String muestraPresentada = rs.getString(28);if(muestraPresentada == null || muestraPresentada.isEmpty()){ muestraPresentada = "-"; }
                      String solicitudesAclaracion = rs.getString(29);if(solicitudesAclaracion == null || solicitudesAclaracion.isEmpty()){ solicitudesAclaracion = "-"; }
                      String respuestaSolicitudesAclaracion = rs.getString(30);if(respuestaSolicitudesAclaracion == null || respuestaSolicitudesAclaracion.isEmpty()){ respuestaSolicitudesAclaracion = "-"; }
                      String consultasArsa = rs.getString(31);if(consultasArsa == null || consultasArsa.isEmpty()){ consultasArsa = "-"; }
                      String consultasBenef = rs.getString(32);if(consultasBenef == null || consultasBenef.isEmpty()){ consultasBenef = "-"; }
                      String estado = rs.getString(33);if(estado == null || estado.isEmpty()){ estado = "-"; }
                      
                      String fechaOferta = rs.getString(35);if(fechaOferta == null || estado.isEmpty()){ fechaOferta = "-"; }
                      String moneda = rs.getString(36);if(moneda == null || moneda.isEmpty()){ moneda = "-"; }
                      String obsOfertaCEO = rs.getString(37);if(obsOfertaCEO == null || obsOfertaCEO.isEmpty()){ obsOfertaCEO = "-"; }
                      
                    %>
                      <tr>
                        <td><%=count ++%></td>
                        <td><%=rs.getString(34)%></td>   
                        <td><%=noOfertaIngresada%></td>
                        <td><%=distribuidor%></td>
                        <td><%=idItem%></td>
                        <td><%=codATC%></td>
                        <td><%=codSesal%></td>
                        <td><%=medicamentoEstimado%></td>
                        <td><%=medicamentoOfertado%></td>
                        <td><%=descripcionTecnicaRequerida%></td>
                        <td><%=descripcionTecnica%></td>
                        <td><%=unidadPresentacionRequerida%></td>
                        <td><%=canEstimadaOfertaMiles%></td>
                        <td><%=precio%></td>
                        <td><%=(Double.parseDouble(precio)*Integer.parseInt(canEstimadaOferta))%></td>
                        <td><%=nombreFabricante%></td>
                        <td><%=paisOrigen%></td>                        
                        <td><%=registroSanitario%></td>
                        <td><%=numSanitario%></td>                                              
                        <td><%=fechaVencSan%></td>
                        <td><%=fechaEmisionSan%></td>
                        <td><%=certificadoManufactura%></td>
                        <td><%=numCertif%></td>
                        <td><%=fechaVencManufactura%></td>
                        <td><%=fechaEmisionManufactura%></td>
                        <td><%=etiquetadoPrimario%></td>
                        <td><%=etiquetadoSecundario%></td>
                        <td><%=etiquetadoTerciario%></td>
                        <td><%=obsOfertasProv%></td>                        
                        <td><%=noFoliosOferta%></td>
                        <td><%=muestraPresentada%></td>
                        <td><%=solicitudesAclaracion%></td>
                        <td><%=respuestaSolicitudesAclaracion%></td>
                        <td><%=consultasArsa%></td>
                        <td><%=consultasBenef%></td> 
                        <td><%=obsOfertaCEO %></td>
                        <td>VER REPORTE</td> 
                        <td>VER REPORTE</td>      
                        <td><%=estado%></td>
                         <td><%=rs.getString(35)%></td>
                        <td><%=rs.getString(36)%></td>                  
                        <%
                        try{
                        	
                            Connection conS = null;
                            Statement stateS = null;
                            ResultSet rsS = null;
                            String urlS = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            conS = DriverManager.getConnection(url,"admin","system123");
                            stateS = con.createStatement(); 
                            String QueryStringS = "select ce.NombreCriterio, ced.NombreCriterioDetalle  from [dbo].[CriterioEvaluacionDetalleALP] as cedalp inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK inner join [dbo].[CriterioEvaluacionALP] as cealp on cedalp.idCriterio = cealp.idC where cedalp.noOferta = "+rs.getInt(34) +" and cealp.Estado = 'true'"
                            + "group by ce.NombreCriterio, ced.NombreCriterioDetalle"; 
                            rsS = stateS.executeQuery(QueryStringS);
                            while(rsS.next()){                                 	
                            	%>
  									<li> <b> CITERIO: </b> <%=rsS.getString(1).toUpperCase()%> <strong> &nbsp;&nbsp;OPCION: </strong> <%=rsS.getString(2).toUpperCase()%></li>
  									 <td><%=rsS.getString(2).toUpperCase()%></td>  														
                            	<%                            		                            	
                            }
                            rsS.close(); 
                            stateS.close(); 
                            conS.close();
                            }catch(Exception e){ System.out.println(e); }
                        %>
                         <td><%=estado%></td>
                         <td><%=rs.getString(35)%></td>
                         
                                              
                        
                      </tr>
                    <%} 
                      rs.close(); 
                      state.close(); 
                      con.close();
                      }catch(Exception e){ System.out.println(e); }
                    %> --%>
                  </tbody> 
                </table>
              </div> 
              <!--Table Section ends-->
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              
               <!-- <div class="card-body main-font" style="overflow-x:auto">
              
           <table  class="table table-bordered w-100 mb-0 table-aditional-styles" id="reqTable">
            <thead>
                <tr>
                    <th>
                        c11
                    </th>

                </tr>
            </thead>
            <tbody>
                
                    <tr>       
                  <td>ghjhfj</td>               
                    </tr>
             
            </tbody>

        </table>
      </div> -->
              
              
              <!-- <div class="row">
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
              </div> -->
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

    <form class="main-font" action="ofertaALPServlet" method="post">

      <!--*****Total Form Info Here*****-->

      <!-- Cancel Float Button -->
      <!-- <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div> -->

      <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
      <!-- Submit Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
        <button
          id="submitButton"
          name="submit"
          type="submit"
          value="finalizar"
          class="btn btn-primary btn-rounded shadow"
        >
          <span>SALIR </span>
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
                          <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <!--Med Insumos Table Section starts-->
                              <table
                                id="medInsumosTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de productos Estimados"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">NO. ITEM</th>
                                    <th class="min-tablet">CODIGO ATC</th>
                                    <th class="min-tablet">CODIGO SESAL</th>
                                    <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                                    <th class="min-tablet">DESCRIPCION TECNICA</th>
                                    <th class="min-tablet">CANTIDAD REQUERIDA</th>
                                    <th class="min-tablet">CANTIDAD DE OFERTAS</th>
                                    <th class="min-tablet">ESTADO OFERTAS</th>
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
    
    <!--Dist/Fab Modal-->
    <div
      class="modal fade main-font"
      id="DistFabModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Dist/Fab starts-->
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
                  LISTADO DE DISTRIBUIDORES/FABRICANTES
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  SELECCIONE UN DISTRIBUIDOR/FABRICANTE
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
                              <!--Dist/Fab Table Section starts-->
                              <table
                                id="DistFabTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de productos Estimados"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">DENOMINACION</th>
                                    <th class="min-tablet"> DISTRIBUIDOR/FABRICANTE</th>
                                    <th class="min-tablet"> NO OFERTADOR</th>
                                  </tr>
                                </thead>
                                </tbody></tbody>
                              </table>
                              <!--Dist/Fab Table Section ends-->
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
        <!--Dist/Fab ends-->
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

    <!-- DELETE REG Modal -->
    <div class="modal fade " id="deleteModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
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
              <div class="modal-body main-font" id="deleteConfirMessage">
                &#191;ESTA SEGURO QUE DESEA ELIMINAR EL REGISTRO? ESTA ACCION ES IRREVERSIBLE
              </div>
              <div>
                <div class="row">
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="confirmDelModalButton"
                       data-dismiss="modal"
                    >
                      SI <i class="material-icons md-18">done</i>
                    </button>
                  </div>
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="exitModalButton"
                      data-dismiss="modal"
                    >
                      NO <i class="material-icons md-18">highlight_off</i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- NEW REG MODE STATE Modal -->
    <div class="modal fade " id="newRegStateModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
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
              <div class="modal-body main-font" id="newRegConfirMessage">
                &#191;BAJO QUE ESTADO DESEA GUARDAR ESTA OFERTA?
              </div>
              <div>
                <div class="row">
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="saveStateNewModalButton"
                    >
                      GUARDAR <i class="material-icons md-18">cached</i>
                    </button>
                  </div>
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="endingStateNewModalButton"
                    >
                      FINALIZAR <i class="material-icons md-18">done</i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- EDIT REG MODE STATE Modal -->
    <div class="modal fade " id="editRegStateModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
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
              <div class="modal-body main-font" id="editRegConfirMessage">
                &#191;BAJO QUE ESTADO DESEA GUARDAR ESTA OFERTA?
              </div>
              <div>
                <div class="row">
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="saveStateEditModalButton"
                    >
                      GUARDAR <i class="material-icons md-18">cached</i>
                    </button>
                  </div>
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="endingStateEditModalButton"
                    >
                      FINALIZAR <i class="material-icons md-18">done</i>
                    </button>
                  </div>
                </div>
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
    
   
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
    

    <!-- Customized page level js -->
    <% if (openMode.equalsIgnoreCase("nuevaOferta")) { %>
    <script>
    
    onload = function () {
        var ele = document.querySelectorAll('.validanumericos')[0];
        ele.onkeypress = function (e) {
            if (isNaN(this.value + String.fromCharCode(e.charCode)))
                return false;
        }
        ele.onpaste = function (e) {
            e.preventDefault();
        }
    }
    
    
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
        $("#itemID").prop("value", "");
        $("#reqID").prop("value", "");
        $("#productName").prop("value", "");
        $("#presentationUnit").prop("value", "");
        $("#price").prop("value", "");
        $("#currency").prop("value", "");
        $("#medInsumoCod").prop("value", "");
        $("#offeredMed").prop("value", "");
        $("#technicDescriptionOffered").prop("value", "");
        $("#nombreFabricante").prop("value", "");
        $("#paisOrigen").prop("value", "");
        $("#dateVencimiento1").prop("value", "");
        $("#dateEmision1").prop("value", "");
        $("#dateVencimiento2").prop("value", "");
        $("#dateEmision2").prop("value", "");
        $("#razonPrimario").prop("value", "");
        $("#razonSecundario").prop("value", "");
        $("#razonTerciario").prop("value", "");
        $("#numSanitario").prop("value", "");
        $("#numCertif").prop("value", "");
        $("#muestraPresentada").prop("value", "");
        $("#noFolios").prop("value", "");
        $("#obsOferProv").prop("value", "");
        $("#consultaArsa").prop("value", "");
        $("#consultaBenef").prop("value", "");
        $("#solicitudAclaracion").prop("checked", false);
        $("#resSolicitudAclaracion").prop("checked", false);
        $("#primario").val("CUMPLE").change();
        $("#secundario").val("CUMPLE").change();
        $("#terciario").val("CUMPLE").change();
        $("#regProveedor").val("NO CUMPLE").change();
        $("#descTecnicaCumple").val("NO CUMPLE").change();
        $("#historialContratos").val("NO CUMPLE").change();
        $("#cantidadCumple").val("NO CUMPLE").change();
        $("#icoterm").val("NO CUMPLE").change();
        $("#regSanitarioCumple").val("NO CUMPLE").change();
        $("#garantOfertaCumple").val("NO CUMPLE").change();
        $("#tiemposEntrega").val("NO CUMPLE").change();
        $("#vidaUtil").val("NO CUMPLE").change();
        $("#garantFabr").val("NO CUMPLE").change();
        $("#cartaRespuestos").val("NO CUMPLE").change();
        $("#aseguramientoCalidad").val("NO CUMPLE").change();
        $("#razonPrec").val("NO CUMPLE").change();
        $("#cppIso").val("NO CUMPLE").change();
        $("#manCap").val("NO CUMPLE").change();
        $("#numSanitario").prop("value", "");
        $("#numCertif").prop("value", "");
        $("#price").prop("value", "");
        $("#cantestimadaofer").prop("value", "");        
        $("#distributor").prop("value", ""); 
        $("#obsOfertaCEO").prop("value", ""); 
        $("#noOfertaIngresada").prop("value", ""); 
        $("#tipo1").prop("value", "");
        $("#tipo2").prop("value", "");
      }

      $(document).ready(function () {  
    	  var cC = <%=totalColumnas%>;
    	  
    	  
    	  /* data Table */
         var reqTable = $("#reqTable").DataTable({
            responsive: true,
            searching: true,
            bLengthChange: true,
            columnDefs: [
              {
                targets: cC,
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
                 'excel'
            ],
          });
      	
    	  
         reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
         
    	  
    	  
    	  
    	  
        /* data Table */
        /* var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 33,
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
         */
        
        /*TABLA DE CRITERIOS*/
        var reqTableCriterios = $("#criteriosEvalaucionTableParam").DataTable({
            responsive: true,
            searching: false,
            bLengthChange: false,
            //pageLength: 3,
            columnDefs: [
              {
   			  targets: 1,
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
              //search: "",
              //searchPlaceholder: "Buscar registro...",
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
        
        
        
		//JS para campos en opciones
        $("#btnPaso1").on("click", function(event){
        	this.style.backgroundColor = "#008a40";
        	document.getElementById("btnPaso2").style.backgroundColor = "#9cce9e";
        	document.getElementById("btnPaso3").style.backgroundColor = "#9cce9e";
        	
        	document.getElementById("paso1").style.display = "block";
        	document.getElementById("paso2").style.display = "none";
        	document.getElementById("paso3").style.display = "none";
        });
		
        $("#btnPaso2").on("click", function(event){
        	this.style.backgroundColor = "#008a40";
        	document.getElementById("btnPaso1").style.backgroundColor = "#9cce9e";
        	document.getElementById("btnPaso3").style.backgroundColor = "#9cce9e";
        	
        	document.getElementById("paso2").style.display = "block";
        	document.getElementById("paso1").style.display = "none";
        	document.getElementById("paso3").style.display = "none";
        });
        
        $("#btnPaso3").on("click", function(event){
        	this.style.backgroundColor = "#008a40";
        	document.getElementById("btnPaso2").style.backgroundColor = "#9cce9e";
        	document.getElementById("btnPaso1").style.backgroundColor = "#9cce9e";
        	
        	document.getElementById("paso3").style.display = "block";
        	document.getElementById("paso2").style.display = "none";
        	document.getElementById("paso1").style.display = "none";
        });
		
		
        $("#primario").on("change", function(event){
        	if(this.value === "NO CUMPLE"){
        		document.getElementById("razonPrimarioRow").style.display = "block";
        	}
        	else{
        		document.getElementById("razonPrimarioRow").style.display = "none";
        	}
        });
		
        $("#secundario").on("change", function(event){
        	if(this.value === "NO CUMPLE"){
        		document.getElementById("razonSecundarioRow").style.display = "block";
        	}
        	else{
        		document.getElementById("razonSecundarioRow").style.display = "none";
        	}
        });
        
        $("#terciario").on("change", function(event){
        	if(this.value === "NO CUMPLE"){
        		document.getElementById("razonTerciarioRow").style.display = "block";
        	}
        	else{
        		document.getElementById("razonTerciarioRow").style.display = "none";
        	}
        });
        
        $("#tipo1").on("change", function(event){
        	 $("#dateVencimiento1").prop("value", "");          
             $("#dateEmision1").prop("value", "");   
        	if(this.value === "REGISTRO SANITARIO"){
        		document.getElementById("dateVencimiento1").readOnly= false;
        		document.getElementById("dateEmision1").readOnly= true;
        		document.getElementById("numSanitario").readOnly= false;
        	}else if(this.value === "OTROS" || this.value === "RECONOCIMIENTO MUTUO"){
        		document.getElementById("dateVencimiento1").readOnly= false;
        		document.getElementById("dateEmision1").readOnly= false;
        		document.getElementById("numSanitario").readOnly= false;
        	}
        	else if(this.value === "CONSTANCIA" || this.value === "SOLICITUD"){        	
        		document.getElementById("dateEmision1").readOnly= false;
        		document.getElementById("dateVencimiento1").readOnly= true;
        		document.getElementById("numSanitario").readOnly= false;
        	}
        	else{
        		document.getElementById("dateVencimiento1").readOnly= true;
        		document.getElementById("dateEmision1").readOnly= true;
        		document.getElementById("numSanitario").readOnly= true;
        	}
        });
        
        $("#tipo2").on("change", function(event){
        	 $("#dateVencimiento2").prop("value", "");          
             $("#dateEmision2").prop("value", "");   
        	if(this.value === "CONSTANCIA" || this.value === "SOLICITUD" ){
        		document.getElementById("dateEmision2").readOnly= false; 
        		document.getElementById("dateVencimiento2").readOnly= true;
        		document.getElementById("numCertif").readOnly= false;
        	}
        	else if(this.value === "NO PRESENTO" ){
        		document.getElementById("dateEmision2").readOnly= true; 
        		document.getElementById("dateVencimiento2").readOnly= true; 
        		document.getElementById("numCertif").readOnly= true; 
        	}
        	else if(this.value === "OTROS" ){
        		document.getElementById("dateVencimiento2").readOnly= false;
        		document.getElementById("dateEmision2").readOnly= false;
        		document.getElementById("numCertif").readOnly= false;
        	}
        	else{
        		document.getElementById("dateEmision2").readOnly= true;
        		document.getElementById("numCertif").readOnly= false;
        		document.getElementById("dateVencimiento2").readOnly= false;
        	}
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
  	        inputDIST.setAttribute("name", "distributor");
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

      
      
        var itemID = "";
        var distributor = "";
        var medInsumoCod = "";
        var productName = "";
        var offeredMed = "";
        var technicDescriptionOffered = "";
        var presentationUnit = "";
        var price = "";
        var currency = "";
        var date = "";

        var nombrefabricante = "";
        var paisOrigen = "";
        var regSanitarioSelect = "";
        var regSanNumber = "";
        var regSanFechaVencimiento = "";
        var regSanFechaEmision = "";
        var certificadoBPManufactura = "";
        var certificadoBPMNumber = "";
        var certificadoBPFechaVencimiento = "";
        var certificadoBPFechaEmision = "";

        var etiquetadoPrimario = "";
        var etiquetadoSecundario = "";
        var etiquetadoTerciario = "";

        var muestraPresentada = "";
        var noFoliosOferta = "";
        var obsOferProv = "";
        var consultaArsa = "";
        var consultaBenef = "";
        var historialCal = "";
        var historialCont = "";

        var solicitudAclaracion = "";
        var respuestaSolicitudesAclaracion = "";

        var registroProveedorCriterio = "";
        var descripcionTecnicaCriterio = "";
        var historialCumplimientoCriterio = "";
        var cantidadCriterio = "";
        var icoTermCriterio = "";
        var regSanCriterio ="";
        var garantMantenimientoOfertaCriterio = "";
        var tiemposEntregaCriterio = "";
        var vidaUtilCriterio = "";
        var garantiaFabricaCriterio = "";
        var cartaCompromisoRepuestosCriterio = "";
        var aseguramientoCalidadCriterio = "";
        var razonabilidadPreciosCriterio = "";
        var certificadoBPMCriterio = "";
        var mantenimientoCapacitacionCriterio = "";
        var reqID = "";
        var estado = "";
        var noOferta = "";
        
        
        // contador
        var noOfertaIngresadaP = "";
        var distribuidorP = "";
        var idItemP = "";
        var codATCP = "";
        var codSesalP = "";
        var medicamentoEstimadoP = "";
        var medicamentoOfertadoP = "";
        var descripcionTecnicaRequeridaP = "";
        var descripcionTecnicaP = "";
        var unidadPresentacionRequeridaP = "";
        var canEstimadaOfertaP = "";
        var precioP = "";
        var totalPrecioP = "";
        var nombreFabricanteP = "";
        var paisOrigenP = "";
        var registroSanitarioP = "";
        var numSanitarioP = "";
        var fechaVencSanP = "";
        var fechaEmisionSanP = "";
        var certificadoManufacturaP = "";
        var numCertifP = "";
        var fechaVencManufacturaP = "";
        var fechaEmisionManufacturaP = "";
        var etiquetadoPrimarioP = "";
        var etiquetadoSecundarioP = "";
        var etiquetadoTerciarioP = "";
        var obsOfertasProvP = "";
        var noFoliosOfertaP = "";
        var muestraPresentadaP = "";
        var solicitudesAclaracionP = "";
        var respuestaSolicitudesAclaracionP = "";
        var consultasArsaP = "";
        var consultasBenefP = "";
        var obsOfertaCEOP ="";   
        //ver reporte
        //ver reporte
        //var ctriterio-opcion[] = "";
        var estadoP = "";
        var fechaOfertaP = "";
        var monedaP = "";
        var noOferta ="";
             
        
      
         /*Req List Select Function*/
        $("#reqTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");

          //contador
          noOfertaIngresadaP = $(this).find("td:eq(2)").text();          
          distribuidorP = $(this).find("td:eq(3)").text();
          idItemP = $(this).find("td:eq(4)").text();
          codATCP = $(this).find("td:eq(5)").text();
          codSesalP = $(this).find("td:eq(6)").text();
          medicamentoEstimadoP = $(this).find("td:eq(7)").text();
          medicamentoOfertadoP = $(this).find("td:eq(8)").text();
          descripcionTecnicaRequeridaP = $(this).find("td:eq(9)").text();
          descripcionTecnicaP = $(this).find("td:eq(10)").text();
          unidadPresentacionRequeridaP = $(this).find("td:eq(11)").text();
          canEstimadaOfertaP = $(this).find("td:eq(12)").text();
          
          var precioPro = $(this).find("td:eq(13)").text().split(" ");
          precioP = precioPro[1];
          totalPrecioP = $(this).find("td:eq(14)").text();
          nombreFabricanteP = $(this).find("td:eq(15)").text();
          paisOrigenP = $(this).find("td:eq(16)").text();
          registroSanitarioP = $(this).find("td:eq(17)").text();
          numSanitarioP = $(this).find("td:eq(18)").text();
          
          
          fechaVencSanP = $(this).find("td:eq(19)").text().split("-");       
          fechaVencSanP = fechaVencSanP[2] +"-"+  fechaVencSanP[1] +"-"+ fechaVencSanP[0];
          fechaEmisionSanP = $(this).find("td:eq(20)").text().split("-");
          fechaEmisionSanP = fechaEmisionSanP[2] +"-"+  fechaEmisionSanP[1] +"-"+ fechaEmisionSanP[0];
          
          certificadoManufacturaP = $(this).find("td:eq(21)").text();
          numCertifP = $(this).find("td:eq(22)").text();
          
          fechaVencManufacturaP = $(this).find("td:eq(23)").text().split("-");
          fechaVencManufacturaP = fechaVencManufacturaP[2] +"-"+  fechaVencManufacturaP[1] +"-"+ fechaVencManufacturaP[0];
          fechaEmisionManufacturaP = $(this).find("td:eq(24)").text().split("-");
          fechaEmisionManufacturaP = fechaEmisionManufacturaP[2] +"-"+  fechaEmisionManufacturaP[1] +"-"+ fechaEmisionManufacturaP[0];
          
          etiquetadoPrimarioP = $(this).find("td:eq(25)").text();
          etiquetadoSecundarioP = $(this).find("td:eq(26)").text();
          etiquetadoTerciarioP = $(this).find("td:eq(27)").text();
          obsOfertasProvP = $(this).find("td:eq(28)").text();
          noFoliosOfertaP = $(this).find("td:eq(29)").text();
          muestraPresentadaP = $(this).find("td:eq(30)").text();
          solicitudesAclaracionP = $(this).find("td:eq(31)").text();
          respuestaSolicitudesAclaracionP = $(this).find("td:eq(32)").text();
          consultasArsaP = $(this).find("td:eq(33)").text();
          consultasBenefP = $(this).find("td:eq(34)").text();
          obsOfertaCEOP = $(this).find("td:eq(35)").text();
          //ver reporteP
          //ver reporteP
          //ctriterio-opcion[]
          estadoP = $(this).find("td:eq(38)").text();
          fechaOfertaP = $(this).find("td:eq(39)").text();
          monedaP = $(this).find("td:eq(40)").text();
          noOferta = $(this).find("td:eq(1)").text();        
         
          
          $("#offerState").prop("value", estadoP);

          $("#editRegButton").on("click", function (event) {
            event.preventDefault();
                  
            $("#reqID").prop("value", idItemP);

            if (estadoP === "EN PROCESO")
            {
            	//Cargar Criterios por item a editar
                $('#criteriosEvalaucionTableParam tbody').empty();
                
                reqTableCriterios.ajax.url(getAbsolutePath() + "ObtenerCriteriosEvaluacionOpcionesVaciadoAPI" + "?noOferta=" +noOferta).load();
                
                
                //-------------------------------------------------------      
              $("#noOfertaIngresada").prop("value", noOfertaIngresadaP);	
              $("#distributor").prop("value", distribuidorP);
              $("#itemID").prop("value", idItemP);
              $("#medInsumoCod").prop("value", codATCP);              
              $("#offeredMed").prop("value", medicamentoOfertadoP);              
              $("#technicDescriptionOffered").prop("value", descripcionTecnicaP);
              
              var options = document.getElementById("presentationUnit").options;
        	  for (var i = 0; i < options.length; i++) {
        	    if (options[i].text == unidadPresentacionRequeridaP) {
        	      options[i].selected = true;
        	      break;
        	    }
        	  }
              
			  $("#cantestimadaofer").prop("value", canEstimadaOfertaP);
			  $("#price").prop("value", precioP);
			  $("#nombreFabricante").prop("value", nombreFabricanteP);
			  
			  var options = document.getElementById("paisOrigen").options;
        	  for (var i = 0; i < options.length; i++) {
        	    if (options[i].text == paisOrigenP) {
        	      options[i].selected = true;
        	      break;
        	    }
        	  }
        	  
        	  $("#tipo1").prop("value", registroSanitarioP);
        	  $("#numSanitario").prop("value", numSanitarioP);
        	  $("#dateVencimiento1").prop("value", fechaVencSanP);
              $("#dateEmision1").prop("value", fechaEmisionSanP);
              $("#tipo2").prop("value", certificadoManufacturaP);
              $("#numCertif").prop("value", numCertifP);
              $("#dateVencimiento2").prop("value", fechaVencManufacturaP);
              $("#dateEmision2").prop("value",fechaEmisionManufacturaP);
              
              $("#productName").prop("value", medicamentoEstimadoP);
             
               
             
             
              
              if (etiquetadoPrimarioP === "CUMPLE")
              {
                $("#primario").prop("value", "CUMPLE");
                $("#razonPrimario").prop("value", "");
                document.getElementById("razonPrimarioRow").style.display = "none";
              }
              else
              {
                $("#primario").prop("value", "NO CUMPLE");
                $("#razonPrimario").prop("value", etiquetadoPrimarioP);
                document.getElementById("razonPrimarioRow").style.display = "block";
              }

              if (etiquetadoSecundarioP === "CUMPLE")
              {
                $("#secundario").prop("value", "CUMPLE");
                $("#razonSecundario").prop("value", "");
                document.getElementById("razonSecundarioRow").style.display = "none";
              }
              else
              {
                $("#secundario").prop("value", "NO CUMPLE");
                $("#razonSecundario").prop("value", etiquetadoSecundarioP);
                document.getElementById("razonSecundarioRow").style.display = "block";
              }

              if (etiquetadoTerciarioP === "CUMPLE")
              {
                $("#terciario").prop("value", "CUMPLE");
                $("#razonTerciario").prop("value", "");
                document.getElementById("razonTerciarioRow").style.display = "none";
              }
              else
              {
                $("#terciario").prop("value", "NO CUMPLE");
                $("#razonTerciario").prop("value", etiquetadoTerciarioP);
                document.getElementById("razonTerciarioRow").style.display = "block";
              }

              $("#obsOferProv").prop("value", obsOfertasProvP);
              $("#noFolios").prop("value", noFoliosOfertaP);
              $("#muestraPresentada").prop("value", muestraPresentadaP);
             
              
             

              if (solicitudesAclaracionP === "NO HAY SOLICITUD")
              {
                $("#solicitudAclaracion").prop("checked", false);
              }
              else
              {
                $("#solicitudAclaracion").prop("checked", true);
              }
            
              if (respuestaSolicitudesAclaracionP === "NO HAY RESPUESTA A LA SOLICITUD DE ACLARACION / SUBSANACION")
              {
                $("#resSolicitudAclaracion").prop("checked", false);
              }
              else
              {
                $("#resSolicitudAclaracion").prop("checked", true);
              }
            
              $("#consultaArsa").prop("value", consultasArsaP);
              $("#consultaBenef").prop("value", consultasBenefP);              
              $("#date").prop("value", fechaOfertaP);               
              $("#currency").prop("value", monedaP);              
              $("#noOferta").prop("value", noOferta);
              $("#obsOfertaCEO").prop("value", obsOfertaCEOP);
              
              $("#confirmEditRegButton").removeClass("hide");
              $("#addRegButton").addClass("hide");
             
              
            }
            else
            {
              $("#confirMessage").text("ERROR, NO SE PUEDE EDITAR UNA OFERTA CON ESTADO FINALIZADO");
              $("#confirmationModalCenter").modal('show');
            }
          });
        });

        /*Delete Reg Function*/

        $("#confirmDelModalButton").on("click", function (event) {
          event.preventDefault();
          
          if (estadoP == "FINALIZADO"){
        	  $("#confirMessage").text(
                      "ERROR ITEM FINALIZADO  NO SE PUEDE ELIMINAR"
                    );
                    $("#confirmationModalCenter").modal('show');
          }else{
        	  var url = getAbsolutePath() + "ALPManageOffersAPI" + "?mode=delete&noOferta="+noOferta;
              console.log("Enviando...")
              $("#confirMessage").text("BORRAR REGISTRO: EN PROCESO, POR FAVOR ESPERE...");
              $("#deleteModalCenter").modal('hide');
              $("#confirmationModalCenter").modal('show');
              $.ajax({
                type: "POST",
                url: url,
                data: {},
                success: function(data)          
                {
                  console.log(data);
                  if (data === "successful"){
                    reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                     
                    $("#confirMessage").text(
                      "EXITOSO! REGISTRO ELIMINADO CORRECTAMENTE"
                    );
                    $("#confirmationModalCenter").modal('show');
                    cleanFields();
                  }
                  else if (data === "inputError"){
                    $("#confirMessage").text(
                      "ERROR DE DATOS REQUERIDOS! SELECCIONE EL REGISTRO O RECARGUE LA PAGINA E INTENTE DE NUEVO"
                    );
                    $("#confirmationModalCenter").modal('show');
                  }
                  else{
                    $("#confirMessage").text(
                      "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
                    );
                    $("#confirmationModalCenter").modal('show');
                  }           
                },
                error : function() {
                  $("#confirMessage").text(
                    "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
                  );
                  $("#confirmationModalCenter").modal('show');
                }
              });
          }
          
          
        });

        /*Edit Reg State Confirm Function*/

        $("#saveStateEditModalButton").on("click", function (event) {
          event.preventDefault();
          $("#editRegStateModalCenter").modal('hide');
          $("#offerState").prop("value", "EN PROCESO");

          $("#confirmationModalCenter").modal('show');
          
          if (
          $("#purchaseProc").prop("value") === "" ||
          $("#date").prop("value") === "" ||
          $("#distributor").prop("value") === "" ||
          $("#productName").prop("value") === "" ||
          $("#presentationUnit").prop("value") === "" ||
          $("#price").prop("value") === "" ||
          $("#currency").prop("value") === "" ||
          $("#medInsumoCod").prop("value") === "" ||
          $("#offeredMed").prop("value") === "" ||
          $("#technicDescriptionOffered").prop("value") === ""		
        ) {
              $("#confirMessage").text(
                "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN LA EDICION DEL MEDICAMENTO..."
              );
            } else {
            	
            	var url = getAbsolutePath() + "ValidarDuplicadosAPI";
        		var purchaseProc = document.getElementById("purchaseProc").value;//procesoCompra
        		var noOferta = document.getElementById("noOferta").value;
        		
        		var noOfertaIngresada = document.getElementById("noOfertaIngresada").value;
        		var distributor = document.getElementById("distributor").value;
        		var validar = "ValidarNoOfertaIngByProveedor";		
        		$.ajax({
        					url : url,
        					type : "POST",
        					dataType : 'json',
        					data : {
        						purchaseProc : purchaseProc,
        						noOferta : noOferta,
        						validar : validar,
        						noOfertaIngresada : noOfertaIngresada,
        						distributor : distributor
        					},
        					success : function(data) {
        					
        						if (data == "0") {									
        							var url = getAbsolutePath() + "ALPManageOffersAPI" + "?mode=edit";
        			                console.log("Enviando...")
        			                $("#confirMessage").text("EDITAR REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
        			                $.ajax({
        			                  type: "POST",
        			                  url: url,
        			                  data: $("#newEditRegForm").serialize(),
        			                  success: function(data)          
        			                  {
        			                    console.log(data);
        			                    if (data === "successful"){
        			                      reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
        			                      
        			                      $("#confirMessage").text(
        			                        "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
        			                      );
        			                      $("#confirmationModalCenter").modal('show');
        			                      cleanFields();
        			                      document.getElementById('opcion').selectedIndex = 0;	        			                      
        			                      
        			                    }
        			                    else{
        			                      $("#confirMessage").text(
        			                        "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
        			                      );
        			                      $("#confirmationModalCenter").modal('show');
        			                    }           
        			                  },
        			                  error : function() {
        			                    $("#confirMessage").text(
        			                      "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
        			                    );
        			                    $("#confirmationModalCenter").modal('show');
        			                  }
        			                });
        			            	
        			                $("#confirmEditRegButton").addClass("hide");
        			                $("#addRegButton").removeClass("hide");
        						} else {
        							$("#confirMessage")
        									.text(
        											"ALERTA! ESTE PROVEEDOR YA POSEE UNA OFERTA CON ESTE NUM. DE OFERTA");
        							$("#confirmationModalCenter")
        									.modal('show');
        							return false;
        						}

        					},
        				});
            	
              }
        });

        /*Edit End Reg State Confirm Function*/

        $("#endingStateEditModalButton").on("click", function (event) {
          event.preventDefault();
          $("#editRegStateModalCenter").modal('hide');
          $("#offerState").prop("value", "FINALIZADO");

          $("#confirmationModalCenter").modal('show');
          
          if (
          $("#purchaseProc").prop("value") === "" ||
          $("#date").prop("value") === "" ||
          $("#distributor").prop("value") === "" ||
          $("#productName").prop("value") === "" ||
          $("#presentationUnit").prop("value") === "" ||
          $("#price").prop("value") === "" ||
          $("#currency").prop("value") === "" ||
          $("#medInsumoCod").prop("value") === "" ||
          $("#offeredMed").prop("value") === "" ||
          $("#technicDescriptionOffered").prop("value") === ""		
        ) {
              $("#confirMessage").text(
                "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN LA EDICION DEL MEDICAMENTO..."
              );
            } else {
            	
            	var url = getAbsolutePath() + "ValidarDuplicadosAPI";
        		var purchaseProc = document.getElementById("purchaseProc").value;//procesoCompra
        		var noOferta = document.getElementById("noOferta").value;
        		var noOfertaIngresada = document.getElementById("noOfertaIngresada").value;
        		var distributor = document.getElementById("distributor").value;
        		var validar = "ValidarNoOfertaIngByProveedor";		
        		$.ajax({
        					url : url,
        					type : "POST",
        					dataType : 'json',
        					data : {
        						purchaseProc : purchaseProc,
        						noOferta : noOferta,
        						validar : validar,
        						noOfertaIngresada : noOfertaIngresada,
        						distributor : distributor
        					},
        					success : function(data) {

        						if (data == "0") {									
        							var url = getAbsolutePath() + "ALPManageOffersAPI" + "?mode=edit";
        			                console.log("Enviando...")
        			                $("#confirMessage").text("EDITAR REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
        			                $.ajax({
        			                  type: "POST",
        			                  url: url,
        			                  data: $("#newEditRegForm").serialize(),
        			                  success: function(data)          
        			                  {
        			                    console.log(data);
        			                    if (data === "successful"){
        			                      reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
        			                    
        			                      $("#confirMessage").text(
        			                        "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
        			                      );
        			                      $("#confirmationModalCenter").modal('show');
        			                      cleanFields();
        			                      document.getElementById('opcion').selectedIndex = 0;        			                      
        			                    }
        			                    else{
        			                      $("#confirMessage").text(
        			                        "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
        			                      );
        			                      $("#confirmationModalCenter").modal('show');
        			                    }           
        			                  },
        			                  error : function() {
        			                    $("#confirMessage").text(
        			                      "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
        			                    );
        			                    $("#confirmationModalCenter").modal('show');
        			                  }
        			                });
        			            	
        			                $("#confirmEditRegButton").addClass("hide");
        			                $("#addRegButton").removeClass("hide");
        							
        						} else {
        							$("#confirMessage")
        									.text(
        											"ALERTA! ESTE PROVEEDOR YA POSEE UNA OFERTA CON ESTE NUM. DE OFERTA");
        							$("#confirmationModalCenter")
        									.modal('show');
        							return false;
        						}

        					},
        				});            	
              }
        });

        
        /*New Reg State Button function*/

        $("#saveStateNewModalButton").on("click", function (event) {
          event.preventDefault();
          $("#newRegStateModalCenter").modal('hide');
          $("#offerState").prop("value", "EN PROCESO");

          $("#confirmationModalCenter").modal('show');

          if (
        		  $("#purchaseProc").prop("value") === "" ||
                  $("#date").prop("value") === "" ||
                  $("#distributor").prop("value") === "" ||
                  $("#productName").prop("value") === "" ||
                  $("#presentationUnit").prop("value") === "" ||
                  $("#price").prop("value") === "" ||
                  $("#currency").prop("value") === "" ||
                  $("#medInsumoCod").prop("value") === "" ||
                  $("#offeredMed").prop("value") === "" ||
                  $("#technicDescriptionOffered").prop("value") === ""		
        ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL NUEVO MEDICAMENTO..."
            );
          } else {
        	  
        	
        var url = getAbsolutePath() + "ValidarDuplicadosAPI";
		var purchaseProc = document.getElementById("purchaseProc").value;//procesoCompra
		var noOferta = document.getElementById("noOferta").value;
		var noOfertaIngresada = document.getElementById("noOfertaIngresada").value;
		var distributor = document.getElementById("distributor").value;
		var validar = "ValidarNoOfertaIngByProveedor";	
		var reqID = $("#reqID").val();
		$.ajax({
					url : url,
					type : "POST",
					dataType : 'json',
					data : {
						purchaseProc : purchaseProc,
						noOferta : noOferta,
						validar : validar,
						noOfertaIngresada : noOfertaIngresada,
						distributor : distributor,
						reqID : reqID
					},
					success : function(data) {
					
						if (data == "0") {									
							var url = getAbsolutePath() + "ALPManageOffersAPI" + "?mode=new";
				              console.log("Enviando...")
				              $("#confirMessage").text("NUEVO REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
				              $.ajax({
				                type: "POST",
				                url: url,
				                data: $("#newEditRegForm").serialize(),
				                success: function(data)          
				                {
				                  console.log(data);
				                  if (data === "successful"){
				                    reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
				                  
				                    $("#confirMessage").text(
				                      "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
				                    );
				                    $("#confirmationModalCenter").modal('show');
				                    cleanFields();
				                    document.getElementById('opcion').selectedIndex = 0;
				                   
				                  }
				                  else if (data === "maxRequiredError"){
				                    $("#confirMessage").text(
				                      "ERROR EN GUARDADO! EL REGISTRO SUPERA LA CANTIDAD MAXIMA PERMITIDA EN EL ACTA DE VACIADO"
				                    );
				                    $("#confirmationModalCenter").modal('show');
				                  }
				                  else{
				                    $("#confirMessage").text(
				                      "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
				                    );
				                    $("#confirmationModalCenter").modal('show');
				                  }        
				                },
				                error : function() {
				                  $("#confirMessage").text(
				                    "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
				                  );
				                  $("#confirmationModalCenter").modal('show');
				                }
				              });							
							
						} else {
							$("#confirMessage")
									.text("ALERTA! ESTE PROVEEDOR COMPLETO LAS OFERTAS PARA ESTE MEDICAMENTO, YA NO SE PUEDE VACIAR");
							$("#confirmationModalCenter")
									.modal('show');
							return false;
						}
					},
				});        	  
            }
        });

         /*New End Reg State Button function*/

        $("#endingStateNewModalButton").on("click", function (event) {
          event.preventDefault();
          $("#newRegStateModalCenter").modal('hide');
          $("#offerState").prop("value", "FINALIZADO");

          $("#confirmationModalCenter").modal('show');
          
          if (
          $("#purchaseProc").prop("value") === "" ||
          $("#date").prop("value") === "" ||
          $("#distributor").prop("value") === "" ||
          $("#productName").prop("value") === "" ||
          $("#presentationUnit").prop("value") === "" ||
          $("#price").prop("value") === "" ||
          $("#currency").prop("value") === "" ||
          $("#medInsumoCod").prop("value") === "" ||
          $("#offeredMed").prop("value") === "" ||
          $("#technicDescriptionOffered").prop("value") === ""		
        ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL NUEVO MEDICAMENTO..."
            );
          } else {
        	  
        	  var url = getAbsolutePath() + "ValidarDuplicadosAPI";
      		var purchaseProc = document.getElementById("purchaseProc").value;//procesoCompra
      		var noOferta = document.getElementById("noOferta").value;
      		var noOfertaIngresada = document.getElementById("noOfertaIngresada").value;
      		var distributor = document.getElementById("distributor").value;
      		var validar = "ValidarNoOfertaIngByProveedor";	
      		var reqID = $("#reqID").val();
      		$.ajax({
      					url : url,
      					type : "POST",
      					dataType : 'json',
      					data : {
      						purchaseProc : purchaseProc,
      						noOferta : noOferta,
      						validar : validar,
      						noOfertaIngresada : noOfertaIngresada,
      						distributor : distributor,
      						reqID : reqID
      					},
      					success : function(data) {

      						if (data == "0") {									
      							 var url = getAbsolutePath() + "ALPManageOffersAPI" + "?mode=new";
      				              console.log("Enviando...")
      				              $("#confirMessage").text("NUEVO REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
      				              $.ajax({
      				                type: "POST",
      				                url: url,
      				                data: $("#newEditRegForm").serialize(),
      				                success: function(data)          
      				                {
      				                  console.log(data);
      				                  if (data === "successful"){
      				                    reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
      				             
      				                    $("#confirMessage").text(
      				                      "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
      				                    );
      				                    $("#confirmationModalCenter").modal('show');
      				                    cleanFields();
      				                  document.getElementById('opcion').selectedIndex = 0;
      				                  }
      				                  else if (data === "maxRequiredError"){
      				                    $("#confirMessage").text(
      				                      "ERROR EN GUARDADO! EL REGISTRO SUPERA LA CANTIDAD MAXIMA PERMITIDA EN EL ACTA DE VACIADO"
      				                    );
      				                    $("#confirmationModalCenter").modal('show');
      				                  }
      				                  else{
      				                    $("#confirMessage").text(
      				                      "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
      				                    );
      				                    $("#confirmationModalCenter").modal('show');
      				                  }        
      				                },
      				                error : function() {
      				                  $("#confirMessage").text(
      				                    "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
      				                  );
      				                  $("#confirmationModalCenter").modal('show');
      				                }
      				              });
      						} else {
      							$("#confirMessage")
      									.text("ALERTA! ESTE PROVEEDOR COMPLETO LAS OFERTAS PARA ESTE MEDICAMENTO, YA NO SE PUEDE VACIAR");
      							$("#confirmationModalCenter")
      									.modal('show');
      							return false;
      						}

      					},
      				});        	  
            }
        });   
      });

      var medInsumosTable = $("#medInsumosTableParam").DataTable({
        responsive: true,
        searching: true,
        bLengthChange: false,        
        pageLength: 5,
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
      });
      
      var DistFabTable = $("#DistFabTableParam").DataTable({
          responsive: true,
          searching: true,
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

      /*Modal Select add info in Main Form*/
      $("#DistFabTableParam tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(0)").text();
        $("#distributor").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#noOfertaIngresada").prop("value", value);
      });
      
      $("#DistFabModalButton").on("click", function (event) {
          event.preventDefault();
         // DistFabTable.ajax.url(getAbsolutePath() + "ALPmedEstForOffersAPI?searchByBuyProcess=DIST").load();
          var noProceso = document.getElementById("purchaseProc").value;
          DistFabTable.ajax.url(getAbsolutePath() + "ALPmedEstForOffersAPI?searchByBuyProcess=DIST&noProceso="+noProceso).load();
        });
      
      /*Modal Select add info in Main Form*/
      $("#medInsumosTableParam tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        const estado = $(this).find("td:eq(5)").text();
        if (estado === "COMPLETADO")
        {
          $("#confirMessage").text(
            "ERROR! ESTE REQUERIMIENTO HA SIDO COMPLETADO Y YA NO ACEPTARA MAS OFERTAS"
          );
          $("#medInsumosModal").modal('hide');
          $("#confirmationModalCenter").modal('show');
        }
        else
        {
          var value;
          value = $(this).find("td:eq(0)").text();
          $("#reqID").prop("value", value);
          value = $(this).find("td:eq(3)").text();
          $("#productName").prop("value", value);
          $("#offeredMed").prop("value", value);
          value = $(this).find("td:eq(4)").text();
          $("#technicDescriptionOffered").prop("value", value);
          value = $(this).find("td:eq(1)").text();
          $("#medInsumoCod").prop("value", value);
        }
      });

      $("#medInsumosEstModalButton").on("click", function (event) {
        event.preventDefault();
        var searchValue = $("#purchaseProc").val();    
        var distributor = $("#distributor").val();    
        medInsumosTable.ajax.url(getAbsolutePath() + "ALPmedEstForOffersAPI?searchByBuyProcess=" + searchValue + "&distribuitor="+distributor).load();
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
          dom: 'Bfrtip',
          buttons: [
               'excel'
          ],
        });
        
        reqTable.ajax.url(getAbsolutePath() + "ALPManageOffersAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
        
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
  	          inputDIST.setAttribute("name", "distributor");
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
    <script>
    function format(input)
    {
    var num = input.value.replace(/\,/g,"");
    if(!isNaN(num)){
    num = num.toString().split("").reverse().join("").replace(/(?=\d*\,?)(\d{3})/g,'$1,');
    num = num.split("").reverse().join("").replace(/^[\,]/, "");
    input.value = num;
    }

    else{ alert("Solo se permiten numeros");
    input.value = input.value.replace(/[^\d\.]*/g,"");
    }
    }
    
    $('input[name=cantestimadaofer]').bind('keypress', function(event) {
  	  var regex = new RegExp("^[0-9]+$");
  	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
  	  if (!regex.test(key)) {
  	    event.preventDefault();
  	    return false;
  	 }
  	});
    
    
    $('input[name=noFolios]').bind('keypress', function(event) {
    	  var regex = new RegExp("^[0-9]+$");
    	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    	  if (!regex.test(key)) {
    	    event.preventDefault();
    	    return false;
    	 }
    	});
    
   
    function filterFloat(evt, input) {
        // Backspace = 8, Enter = 13, â0â² = 48, â9â² = 57, â.â = 46, â-â = 43
        var key = window.Event ? evt.which : evt.keyCode;
        var chark = String.fromCharCode(key);
        var tempValue = input.value + chark;
        if (key >= 48 && key <= 57) {
            if (filter(tempValue) === false) {
                return false;
            } else {
                return true;
            }
        } else {
            if (key == 8 || key == 13 || key == 0) {
                return true;
            } else if (key == 46) {
                if (filter(tempValue) === false) {
                    return false;
                } else {
                    return true;
                }
            } else {
                return false;
            }
        }
    }
    
   
  
    /*  $("#price").change(function() {
        var $this = $(this);
        $this.val($this.replace('.', ','));        
    });  */
    
    $(".decimales").on("keypress keyup blur", function (event) {
        var patt = new RegExp(/[0-9]*[.]{1}[0-9]{4}/i);
        var matchedString = $(this).val().match(patt);
        if (matchedString) {
            $(this).val(matchedString);
        }
        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
            event.preventDefault();
        }
    });
    
    
    //Tabla dinamica con criterios 
    
    function tablaConOfertas() {
    	
    	var url = getAbsolutePath() + "ALPManageOffersAPI";	
    	
    	$.ajax({
            type: 'GET',
            url: url,
            datatype: 'json',
            data: {purchaseProc:$("#purchaseProc").val()},
            success: function (data) {
                $('#reqTable tbody').empty();
                $('#reqTable thead').empty();
                
                console.log(data)
                
                $.each(data, function (i, item) {   
           
                for (var i = 0; i < item.length; i++) {                	
                var datos = item[i]                
      			var tblhead = "";
                var tblBody = "";
                 for (var j = 0; j < datos.length; j++) {
                	
                	
                	
                	 if (j%2 == 0){
                		 if(i === 0){
                			 tblhead +=	datos[j] + '+';
                    	 }
                		 
                	 }   
                      else{
                    	  tblBody +=	datos[j] + '+';
                      }
                    	  
                    } 
                 
                 
                 var theadTabla = "<tr>" +                 
                 tblhead
                 "</tr>";
         		$('#reqTable thead').append(theadTabla);
                
         
                      var rows = "<tr data-id=" + datos[1] + ">" +	
                  		tblBody
                    "</tr>";
        			 $('#reqTable tbody').append(rows);  
                    
                    
                } 
                	
                    
                });
            },
            error: function (data) { alert(data.responseText); }
        });
	
	
	
	}
    
    
    </script>
    
    <!-- Java Script section ends -->
  </body>
</html>
