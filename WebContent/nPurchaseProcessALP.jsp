
<%@ page language="java" contentType="text/html"%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="main.model.*"%>
<%@ page import="java.util.*"%>

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
   		#benFinalTable th:nth-child(1){
			   display: none;
			}
		#benFinalTable td:nth-child(1){
			   display: none;
			}
		 #benFinalTable th:nth-child(2){
		   display: none;
		}
		#benFinalTable td:nth-child(2){
			   display: none;
			}
		#benFinalTable th:nth-child(6){
			   display: none;
			}
		#benFinalTable td:nth-child(6){
			   display: none;
			}  
		
		#benFinalTableParam th:nth-child(1){
			   display: none;
			}
		#benFinalTableParam td:nth-child(1){
			   display: none;
			}	
		#benFinalTableParam th:nth-child(3){
			   display: none;
			}
		#benFinalTableParam td:nth-child(3){
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
                <form method="post" action="pcALPRouting">
                <nav class="navbar col-12 main-font">
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <input type="hidden" name="prevJsp" value="apertura" />
                    <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
                    <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                    <input class="hide" type="submit" name="nextJsp" value ="requerimientos" id="req" />
                    <input class="hide" type="submit" name="nextJsp" value ="digitalizacion" id="dig" />
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
                        >DATOS DE APERTURA</a
                      >
                      <label class="dropdown-item" for="criteria"
                        >CRITERIOS DE EVALUACION</label
                      >
                      <label class="dropdown-item" for="req"
                        >VACIADO DE REQUERIMIENTO SEGUN OFICIO</label
                      >
                      <label class="dropdown-item" for="listaest"
                        >LISTA DE ESTIMACIONES DE COMPRA</label
                      >
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">DATOS DE APERTURA</a>
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
              System.out.println("Test" + func);
              
              String type = (String)session.getAttribute("type");
              int cod = (Integer)session.getAttribute("noCompra");
              ArrayList<CriterioEvaluacionDTO> Criterios = (ArrayList<CriterioEvaluacionDTO>) request.getAttribute("criterios");
              System.out.println(Criterios + " array");
              String numeroproceso="";
              try{
              Connection con = null;
              Statement state = null; 
              int i = 1;
              ResultSet rs = null; 
              String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
              con = DriverManager.getConnection(url,"admin","system123");
              state = con.createStatement(); 
              String QueryString = "select cod from numeroProcesoCompra where idProc="+cod; 
              rs = state.executeQuery(QueryString); 
              while(rs.next()){
                numeroproceso=rs.getString(1);
              }
              System.out.println(numeroproceso);
              rs.close();
              state.close();
              con.close();
              }catch(Exception e){
                System.out.println(e);
              }

              String tipoC = (String)request.getAttribute("tipoCompra");
              String tipoCompra = "";
              if(tipoC != null && !tipoC.isEmpty()){
                tipoCompra = tipoC;
              }
            %>
            <form id="newEditRegForm" method="post" action="procesoCompraALPServlet" enctype="multipart/form-data">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-5">
                  <h1 class="mb-0 text-white">
                    PROCESO DE COMPRA A LARGO PLAZO
                  </h1>
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
                          >format_shapes</i
                        >
                        <h5
                          id="instructionSubtitle"
                          class="mb-3 text-center"
                          style="font-weight: bold;"
                        >
                          DATOS DE APERTURA DEL PROCESO:
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
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <h6 style="font-weight: bold;">
                                          1.DATOS GENERALES
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
                                    <div class="col-lg-4 col-md-4">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >1.1 NO. DE PROCESO DE COMPRA</label
                                        >
                                      </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">    
                                      <input type="hidden" id="nupro" value="<%=numeroproceso%>"/>
                                        <input type="hidden" id="archivos" />
                                        
                                      
                                        
                                      
                                      <%  if(!funcion.contentEquals("nuevo")){
                                    	  String noProcesoCompra = (String)request.getAttribute("noProcesoCompra");
                                    	 %>
                                    	  <input readonly  id="purchaseType" class="form-control"   name="purchaseNum" value="<%=noProcesoCompra%>"/>
                                    	  
                                    	  
                                    	  
                                    	 <% 
                                    	 } else {
                                    		 try{ 
                                                 Connection con1 = null;
                                                 Statement state1 = null;
                                                 int is = 1;
                                                 ResultSet rs1 = null;
                                                 String url1 = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                                 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                 con1 = DriverManager.getConnection(url1,"admin","system123");
                                                 state1 = con1.createStatement();
                                                 String QueryString1 = "select cod from dbo.numeroProcesoCompra where cod like 'ALP%' and estado = 'DISPONIBLE'"; 
                                                 if(func != null && !func.contentEquals("nuevo")){
                                                 	QueryString1 = "SELECT noProcesoCompra from dbo.procesoCompraALP where cod = " + cod; 
                                                 }
                                                 rs1 = state1.executeQuery(QueryString1);
                                               %>
                                               
                                              <input list="browsers" id="purchaseType" autocomplete="off"  class="form-control"  name="purchaseNum">
     										  <datalist id="browsers">
     										  
     										  <%
     										  while(rs1.next()){ 
     											  %>											  
     											    <option  class="form-control" value="<%=rs1.getString(1)%>">
     											  <%   
     										   }										  
     										  %>
     										  </datalist>                                           
                                               <%
                                                 rs1.close(); 
                                                 state1.close();
                                                 con1.close(); 
                                                 }catch(Exception e){System.out.println(e); }
                                    		 
                                    	 }
                                    	 %>
                                    	  
                                          
                                      </div>
                                    </div>
                                  </div>
                                  
                                  <div class="row">
                                    <div class="col-lg-4 col-md-4">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >1.1.2 TIPO DE COMPRA</label
                                        >
                                      </div>
                                    </div>
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="purchaseDescription"
                                          name="purchaseDescription"
                                          required
                                       	  <%=disable%>
                                        >
                                        <option value="NINGUNO" disabled selected>
                                          SELECCIONA UNA OPCION...
                                        </option>
                                        <%
                                        String d = (String)request.getAttribute("descripcioncompra");
                                        String descripcion= "";
                                        if(d != null && !d.isEmpty()){
                                        	descripcion = d;
                                        }
                                        if(funcion != null){
                                          try{ Connection con = null;
                                          Statement state = null; 
                                          int i = 1;
                                          ResultSet rs = null; 
                                          String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          con = DriverManager.getConnection(url,"admin","system123");
                                          state = con.createStatement();
                                          int co = -1;
                                          if(cod > 0 ){
                                            co = cod;
                                          }
                                          String QueryString = "select nombrecompra from descripcioncompra where estado = 'ACTIVO'";
                                          rs = state.executeQuery(QueryString);
                                      %>
                                      <%
                                          while(rs.next()){
                                       		  if(!funcion.contentEquals("nuevo")){
                                       			  if(rs.getString(1).contentEquals(d)){
                                      %>
                                           			<option selected value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                              <%
                                       			  }
                                       			  else{
                                              %>
                                           			<option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                           		<%
                                       			  }
                                       		  }
                                       		  else{
                                       			%>
                                       			  <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                       	<%}i = i + 1;} 
                                            rs.close(); 
                                            state.close();
                                            con.close(); 
                                          }catch(Exception e){ System.out.println(e); }
                   					            }
                                        %>
                                        </select>
                                      </div>
                                      
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-9 col-md-19">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >1.2 LIMITE DE PRESENTACION:
                                          ESTA OFERTA PUEDE SER 
                                          PRESENTADA HASTA LAS
                                        </label>
                                      </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3">
                                      <div class="form-group">
                                        <input
                                          autocomplete="off"
                                          type="time"
                                          class="form-control"
                                          id="purchaseHourLimit"
                                          name="purchaseHourLimit"
                                          placeholder=""
                                          value="${horaLimite}"
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div
                                      class="col-lg-1 col-md-1"
                                      style="
                                        padding: 0px 0px 0px 15px !important;
                                      "
                                    >
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>DEL DIA</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                        <input
                                          autocomplete="off"
                                          type="date"
                                          class="form-control"
                                          id="purchaseDateLimit"
                                          name="purchaseDateLimit"
                                          placeholder=""
                                          value="${fechaLimite}"
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >TODA OFERTA, FUERA DE ESTE PLAZO NO
                                          SERA ACEPTADA.</label
                                        >
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
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >1.3 LA FECHA DE APERTURA DE ESTA
                                          OFERTA ES:
                                        </label>
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                        <input
                                          autocomplete="off"
                                          type="date"
                                          class="form-control"
                                          id="purchaseDateOpen"
                                          name="purchaseDateOpen"
                                          placeholder=""
                                          value="${fechaApertura}"
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                    </div>
                                    <div
                                      class="col-lg-2 col-md-2"
                                      style="
                                        padding: 0px 15px 0px 0px !important;
                                      "
                                    >
                                      <div class="form-group">
                                        <label>A LAS </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-3 col-md-3">
                                      <div class="form-group">
                                        <input
                                          autocomplete="off"
                                          type="time"
                                          class="form-control"
                                          id="purchaseHourOpen"
                                          name="purchaseHourOpen"
                                          placeholder=""
                                          value="${horaApertura}"
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                    </div>
                                    <div class="col-lg-2 col-md-2">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>EN EL LUGAR</label>
                                      </div>
                                    </div>
                                    <div class="col-lg-7 col-md-7">
                                      <div class="form-group">
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="purchasePlace"
                                          name="purchasePlace"
                                          required
                                       	  <%=disable%>
                                        >
                                        <option disabled value = "NINGUNO">
                                          			SELECCIONA UN LUGAR...
                                          		</option>
                                        <%
                                        String l = (String)request.getAttribute("lugar");
                                        String lugar = "";
                                        if(l != null && !l.isEmpty()){
                                        	lugar = l;
                                        }
                                        if(funcion != null){
                                          try{ Connection con = null;
                                          Statement state = null; 
                                          int i = 1;
                                          ResultSet rs = null; 
                                          String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          con = DriverManager.getConnection(url,"admin","system123");
                                          state = con.createStatement(); 
                                          String QueryString = "select lugarApertura from lugarApertura where estado = 'ACTIVO'"; 
                                          rs = state.executeQuery(QueryString); 
                                      %>
                                      <%
                                          while(rs.next()){ 
                                       		  if(!funcion.contentEquals("nuevo")){
                                       			  if(rs.getString(1).contentEquals(l)){
                                      %>
                                           			<option selected value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                              <%
                                       			  }
                                       			  else{
                                              %>
                                           			<option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                           		<%
                                       			  }
                                       		  }
                                       		  else{
                                       			%>
                                       			  <option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
                                       	<%}i = i + 1;} 
                                            rs.close(); 
                                            state.close();
                                            con.close(); 
                                          }catch(Exception e){ System.out.println(e); }
                   					            }
                                        %>
                                        </select>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >1.4 EL PERIODO DE VALIDEZ DE LA
                                          OFERTA PARA SU ACEPTACION POR BANCOCCI
                                          (EL FIDUCIARIO) SERA DE
                                        </label>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-2 col-md-2">
                                      <div class="form-group">
                                        <input
                                          autocomplete="off"
                                          type="number"
                                          min="1"
                                          max="120"
                                          class="form-control"
                                          id="purchaseDaysPeriod"
                                          name="purchaseDaysPeriod"
                                          placeholder=""
                                          value="${periodoValidez}"
                                          required
                                          <%=read%>
                                        />
                                      </div>
                                    </div>
                                    <div class="col-lg-10 col-md-10">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label
                                          >DIAS CALENDARIOS A PARTIR DE LA FECHA
                                          DE APERTURA DE LA OFERTA.</label
                                        >
                                      </div>
                                    </div>
                                  </div>
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group"></div>
                                    </div>
                                  </div>
                                                                    
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <button class="btn btn-sm btn-success ml-3" data-target="#CriteriosEvalaucionModal" data-toggle="modal"
                                          type = "button" id="CriteriosEvaluacionParamModalButton"><i class="material-icons md-18">list</i>
                                           CRITERIOS DE EVALUACION PARA <br/> VACIADO DE OFERTAS
                                  </button>
                                      </div>
                                    </div>
                                  </div>
                                                                 
                                  <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-left">
                                        <h6 style="font-weight: bold;">
                                          2.DOCUMENTACION DEL REQUERIMIENTO DE COMPRA
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
                                    <div class="col-lg-3 col-md-3">
                                      <div
                                        class="form-group"
                                        style="text-align: left;"
                                      >
                                        <label>2.1 BENEFICIARIOS</label>
                                        <button
                                          class="btn btn-sm btn-success ml-3"
                                          data-target="#benFinalModal"
                                          data-toggle="modal"
                                          type = "button"
                                          id="benFinalParamModalButton"
                                          <%=disable%>
                                        >
                                          <i class="material-icons md-18"
                                            >list</i
                                          >
                                           VINCULAR <br/> OFICIO-BENEFICIARIO
                                        </button>
                                        <button
                                        type = "button"
                                          class="btn btn-sm btn-success ml-3"
                                          id="deletRegButton"
                                       	  <%=disable%>
                                        >
                                          <i class="material-icons md-18"
                                            >delete</i
                                          > ELIMINAR OFICIO
                                        </button>
                                      </div>
                                    </div>
                                    <div class="col-lg-9 col-md-9">
                                      <div class="form-group">
                                        <!--Ben Final Table Section starts-->
                                        <table
                                          id="benFinalTable"
                                          class="table table-bordered w-100 mb-0 table-aditional-styles"
                                          aria-describedby="Tabla de Beneficiarios y Oficios"
                                        >
                                          <thead>
                                            <tr>
                                              <th class="all">ID</th>
                                              <th class="all">NO BENEFICIARIO</th>
                                              <th class="min-tablet">NO. OFICIO</th>
                                              <th class="min-tablet">BENEFICIARIOS</th>
                                              <th class="min-tablet">OFICIO CARGADO</th>
                                              <th class="min-tablet">ID DB</th>
                                          </thead>
                                          <tbody>
                       					            <%
                       					              if(funcion != null && !funcion.contentEquals("nuevo")){
                       						              try{ 
                                                  Connection con = null;
                                                  Statement state = null;
                                                  ResultSet rs = null;
                                                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                  con = DriverManager.getConnection(url,"admin","system123");
                                                  state = con.createStatement();
                                                  int co = -1;
                                                  if(cod > 0 ){
                                                	  co = cod;
                                                  }
                                                  //String QueryString = "SELECT bf.no,opca.oficio,bf.beneficiarioFinal,bfoca.nombreArchivo,bf.direccion FROM beneFinalOficioCompraALP bfoca INNER JOIN  oficioProcesoCompraALP opca ON opca.oficio = bfoca.oficio INNER JOIN beneficiarioFinal bf ON bfoca.beneF = bf.no WHERE opca.procesoCompra = "+ co+" GROUP BY bf.no,opca.oficio,bf.beneficiarioFinal,bfoca.nombreArchivo,bf.direccion ORDER BY opca.oficio";
                                                  String QueryString = "select benfOficio.beneF, benfOficio.oficio, benfFinal.beneficiarioFinal, benfOficio.nombreArchivo, benfOficio.idOficio  from beneFinalOficioCompraALP as benfOficio inner join beneficiarioFinal as  benfFinal on benfOficio.beneF = benfFinal.no where benfOficio.idProcesoCompALP = '"+co+"'"; 
                                                 rs = state.executeQuery(QueryString); %> 
                                                  <% while(rs.next()){ %>
                                                	<tr>
                                                    <td>-1</td>
                                                    <td><%=rs.getInt(1)%></td>
                                                    <td><%=rs.getString(2).toUpperCase()%></td>
                                                    <td><%=rs.getString(3).toUpperCase()%></td>
                                                    <td><a href="assets/files/buyProcessALPFiles/legalDocumentForBeneficiary/<%=rs.getString(4)%>" target="_blank"><%=rs.getString(4)%></td>
                                                   <td><%=rs.getString(5)%></td>
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
                  <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
                  
                  <%
                  
                  if(func.contentEquals("nuevo")|| func.contentEquals("modificar")| func.contentEquals("revisar")){%>
                	<button
                    id="submitExternalButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="button"
                    value="guardar"
                  >
                    <span>GUARDAR Y CONTINUAR</span
                   	><i class="material-icons vm">arrow_forward</i>
                  </button>
                	<%}
                  else {%>
                  <button
                    id="submitExternalButton"
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="button"
                    value="guardar"
                  >
                    <span>CONTINUAR</span
                   	><i class="material-icons vm">arrow_forward</i>
                  </button>
                  <% 
                	  
                	  
                  }%>
                  
                  
                  
                  
                  
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
    <form method="post" action="procesoCompraALPServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">close</i>CANCELAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--Ben Final Modal-->
    <div
      class="modal fade main-font"
      id="benFinalModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
      data-backdrop="static" 
      data-keyboard="false"
    >
      <div class="modal-dialog modal-xl modal-dialog-centered" style="max-width: 100%;padding-left: 15%;padding-right: 15%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
              onclick="limpiariframe();"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">
                  BENEFICIARIOS PARAMETRIZADOS DISPONIBLES
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  AGREGAR A LOS DATOS DE APERTURA
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
                      <i
                        id="infoIcon"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >check</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        SELECCIONE LOS BENEFICIARIOS A AGREGAR:
                      </h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-4 col-md-4">
                                <div
                                  class="form-group"
                                  style="text-align: right;"
                                >
                                  <label>OFICIO DE SOLICITUD</label>
                                </div>
                              </div>
                              <div class="col-lg-6 col-md-6">
                                <div class="form-group">
                                  <input
                                    autocomplete="off"
                                    type="text"
                                    class="form-control"
                                    id="legalRequestCod"
                                    name="legalRequestCod"
                                    placeholder=""
                                    value=""
                                    required
                                  />
                                </div>
                              </div>
                              <div class="col-lg-2 col-md-2">
                                <div
                                  class="form-group"
                                  style="text-align: right;"
                                >
                                <button
                                      id="botonsubir"
                                      class="btn btn-sm btn-success ml-2"
                                    >
                                      SUBIR ARCHIVO
                                    </button>
                                </div>
                              </div> 
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-8">
                              <!--Ben Final Table Section starts-->
                              <table
                                id="benFinalTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de Beneficiarios Finales"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">NO.</th>
                                    <th class="min-tablet">
                                      BENEFICIARIOS FINALES
                                    </th>
                                    <th class="min-tablet">
                                      DIRECCION
                                    </th>
                                    <th class="min-tablet">
                                      SELECCION
                                    </th>
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
									                  String QueryString = "SELECT * from dbo.beneficiarioFinal where estado = 'ACTIVO'";
									                  rs = state.executeQuery(QueryString);
								                %>
								                  <% 	
								                    while(rs.next()){
									                    String direccion = rs.getString(3);
									                    if(rs.wasNull()){
										                    direccion = " ";
									                    }
							              	    %>
								                      <tr>
									                      <td><%=rs.getInt(1)%></td>
									                      <td><%=rs.getString(2).toUpperCase()%></td>
									                      <td><%=direccion.toUpperCase()%></td>
									                      <td><input type="checkbox" class="tableid" name="tableid" id="chk_1" class="click"/></td>
								                      </tr>
								                  <%i = i + 1;}
								                      rs.close();
								                      state.close();
								                      con.close();
								                  }catch(Exception e){System.out.println(e);}
                                  %>
                                </tbody>
                              </table>
                              <!--Ben Final Table Section ends-->
                            </div>
                            <div class="col-md-4">
                                <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                      <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                      <p>
                                        SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                      </p>
                                    </div>
                                    <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                                      height="520" class="container-fluid hide">
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
                      onclick="limpiariframe();"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button
                      id="submitParamBens"
                      value=""
                      data-dismiss="modal"
                      aria-label="Close"
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
        </div>
        <!--Ben Final Param ends-->
      </div>
    </div>
    
    <!--Custom New Modal-->

    <!-- Modal Section ends-->
    <!--Criterios evaluacion -->
    <div
      class="modal fade main-font"
      id="CriteriosEvalaucionModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
      data-backdrop="static" 
      data-keyboard="false"
    >
      <div class="modal-dialog modal-dialog-scrollable" style="max-width: 100%;padding-left: 15%;padding-right: 15%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
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
                  CRITERIOS DE EVALUACION
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  SELECCIONE SU CRITERIO
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
                      <i
                        id="infoIcon"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >check</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        SELECCIONE LOS CRITERIOS DE EVALUACION PARA VACIADOS DE OFERTAS:
                      </h5>
                      <div class="row">
                        <div class="card-body">                          
                          <div class="row">
                            <div class="col-md-12">
                              <!--Table Section starts-->
                              <table
                        id="criteriosEvalaucionTableParam"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de Oficios"
                      >
                        <thead>
                          <tr>
                            <th class="all">NO.</th>
                            <th class="min-tablet">CRITERIOS EVALUACION</th>
                            <th class="min-tablet">SELECCIONE</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          if (Criterios != null)
                          {
                            for(CriterioEvaluacionDTO criterio : Criterios){
                            	
                        %>
                            <tr>
                            
                            <td><%=criterio.getIdCE()%></td>
                            <td><%=criterio.getNombreCriterio().toUpperCase()%></td>
							    <td>
							    <% if(criterio.getEstado() == true){
							    	System.out.println("True");
							    	%>
							    	<input <%=disable%> type="checkbox" checked/>
							    	
							    	<%
							    }else{
							    	System.out.println("False");
							    	%>
							    	<input <%=disable%> type="checkbox" />
							    	 
							    	<%
							    	
							    } %>
							    
							    </td>
							    </tr>
                        <%
                            }
                          }
                        %>
                        </tbody>
                      </table>
                              <!--Ben Final Table Section ends-->
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
                      id="submitParamCriterios"
                      value=""
                      data-dismiss="modal"
                      aria-label="Close"
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
        </div>
        <!--Ben Final Param ends-->
      </div>
    </div>


	  <div
      class="modal fade"
      id="confirmationModalCenter"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
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
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
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
      
      $(document).ready(function () {
    	  
    	  <%
    	  String error = (String)request.getAttribute("mostrarmensaje");
    	  if(error != null && !error.isEmpty()){   	
    		 
    		  if(error.contentEquals("PROCESOFALSE") ){
    			  %>
        		  $("#confirMessage").text("ALERT! EL NUMERO DE PROCESO DE COMPRA SELECCIONADO ENTRO EN USO HACE UNOS MOMENTOS, POR FAVOR SELECCIONE OTRO");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }else if(error.contentEquals("RTNExiste") )
    		  {
    			  
    			  %>
        		  $("#confirMessage").text("ERROR! AL REGISTRAR POR FAVOR INTENTE DE NUEVO O CONTACTE AL ADMINISTRADOR");
        	        $("#confirmationModalCenter").modal('show');
        		  <%
    		  }
    	  }
    	  %>
    	  

        /* Preparativos iniciales*/
       
    	  var container = document.getElementById("newEditRegForm")
			  
		    var inputPT = document.createElement("input");
	      inputPT.setAttribute("type", "hidden");
	      inputPT.setAttribute("name", "projectPath");
	      inputPT.setAttribute("value", getAbsolutePath());
	      container.appendChild(inputPT);

        /*Tabla de Beneficiarios Finales del Documento*/
        var reqTable = $("#benFinalTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: false,
          pageLength: 3,
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
      	  
            
            console.log("contador "+ contador);
            var container = document.getElementById("newEditRegForm")
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
      		  }
      		  else{
      			  $("#archivos").val("NOHAYARCHIVO");
      		  }
      		   
      	  });
        });
        
        var reqTableCriterio = $("#criteriosEvalaucionTableParam").DataTable({
            responsive: true,
            searching: true,
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
              [-1],
              ["Todos"],
            ],
            order: [[0, "asc"]],
          });  

        $("#submitParamBens").click(function(){       	
          var val = document.getElementById("legalRequestCod").value;
          var val1 = document.getElementById("nupro").value;
          var arch = document.getElementById("archivos").value;
          
          
          if(val!="" && val!=null ){
        	  if(arch=="HAYARCHIVO"){
        		  var checkedRows = $("#benFinalTableParam input[type=checkbox]:checked").parents("tr").clone();
                  checkedRows.find('td:last').remove();
                  console.log(checkedRows.length)
                  
                  var url = getAbsolutePath() + "ValidateOficioALP";	                    	
                        var Oficio = document.getElementById("legalRequestCod").value;
                        
                        $.ajax({
                    	    url:url,
                    	    type:"POST",
                    	    dataType:'json',
                    	    data: {Oficio:Oficio, Beneficiario:$(this).find( "td:eq(1)" ).html()},
                    	    success:function(data){
                    	    console.log(data)
                    	       if(data == 0){
                    	    
                    	    	    $("#confirmationModalCenter").modal('show');				 				 
                    				 $("#confirMessage").text(" ESTE OFICIO YA ESTA REGISTRADO POR FAVOR INGRESE UNO NUEVO...");
                    				 
                    	       }
                    	       
                    	    },
                    	});
                  
                  if(checkedRows.length > 0){
                    /* reqTable.rows().data().each(function () {
                      $(this).each(function () {
                        console.log($(this));
                      });
                    }); */
                    checkedRows.each(function () {
                   
                      //var numReg = reqTable.rows().count();
                      var x = document.createElement('td');
                      var y = document.createElement('td');
                      var z = document.createElement('td');
                   	  //var val = document.getElementById("legalRequestCod").value;
                      x.innerHTML =val.toUpperCase();
                      y.innerHTML = val.toUpperCase()+".pdf"; 
                      z.innerHTML =contador;
                      //y.innerHTML =  "<input type='file' name='oficioFile_" + numReg + "'>";
                      this.insertBefore(z, this.childNodes[1]);
                      this.insertBefore(x, this.childNodes[3]);
                      this.insertBefore(y, this.childNodes[6]);
                    
                      reqTable.row.add(this).draw();
                    });
                  }
                  var iframe = document.getElementById("previewDocumentInput");
                  var html = "";

                  iframe.contentWindow.document.open();
                  iframe.contentWindow.document.write(html);
                  iframe.contentWindow.document.close();
            	    $("#archivos").val("");
        	  }
        	  else{        		  
        		  $("#confirmationModalCenter").modal('show');				 				 
     			 $("#confirMessage").text(" INGRESE EL ARCHIVO...");
        	  }
  		   
        	}
          else{
            $("#confirmationModalCenter").modal('show');				 				 
			 $("#confirMessage").text(" INGRESE EL OFICIO...");
			 
          }
  	    }); 
        
        
        $("#submitParamCriterios").click(function(){      
        	 var checkedRows = $("#criteriosEvalaucionTableParam input[type=checkbox]:checked").parents("tr").clone();
             checkedRows.find('td:last').remove();
            
            
  	    }); 
        
        $('#submitExternalButton').click(function (){
  		  var container = document.getElementById("newEditRegForm");
  		  var table = document.getElementById('benFinalTable');
  		  //console.log(table.rows[2].cells[1].innerHTML);
  		    if(reqTable.data().any()){
  		    	for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
                var cell = reqTable.row(r).data();

  		          var inputPT = document.createElement("input");
  			        inputPT.setAttribute("type", "hidden");
  			        inputPT.setAttribute("name", "oficiosTabla");
  			        inputPT.setAttribute("value", cell[2]);
  			        container.appendChild(inputPT);
  			        
  			        var inputBF = document.createElement("input");
  			        inputBF.setAttribute("type", "hidden");
  			        inputBF.setAttribute("name","beneficiariosFinales");
  			      	inputBF.setAttribute("value",cell[1]);
  			      	container.appendChild(inputBF);

                var inputBC = document.createElement("input");
  			        inputBC.setAttribute("type", "hidden");
  			        inputBC.setAttribute("name","iddoficios");
  			      	inputBC.setAttribute("value",cell[0]);
  			      	container.appendChild(inputBC);
  		    	}
  		    }
  		    
  		    
  		    
  		  var checkedRows = $("#criteriosEvalaucionTableParam input[type=checkbox]:checked").parents("tr").clone();
  		  	
  		  if(checkedRows.length == 0){
  			$("#confirmationModalCenter").modal('show');				 				 
			 $("#confirMessage").text(" POR FAVOR SELECCIONE UN CRITERIO DE EVALUCION COMO MINIMO...");
  			  return false;
  		  }
  		  
          checkedRows.find('td:last').remove();
          checkedRows.each(function () {
              
        	  var inputBC = document.createElement("input");
		        inputBC.setAttribute("type", "hidden");
		        inputBC.setAttribute("name","idCriterio");
		      	inputBC.setAttribute("value", $(this).find( "td:eq(0)" ).html());
		      	container.appendChild(inputBC);
		      	
		      	console.log($(this).find( "td:eq(0)" ).html())   
		      	
		    	var inputBF = document.createElement("input");
		        inputBF.setAttribute("type", "hidden");
		        inputBF.setAttribute("name","NombreCriterio");
		      	inputBF.setAttribute("value", $(this).find( "td:last" ).html());
		      	container.appendChild(inputBF);
        	  
		      	console.log($(this).find( "td:last" ).html())   
  			  
            });
          
         
          console.log(reqTable.data().length);
          
          if(reqTable.data().length == 0){
        	  $("#confirmationModalCenter").modal('show');				 				 
 			 $("#confirMessage").text(" POR FAVOR INGRESE UN OFICIO COMO MINIMO...");
   			  return false;
          }
            		   
  		  document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
      	  document.getElementById("submit").click();
        });
        
        $("#benFinalTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          const rowSelected = $(this);
          $("#deletRegButton").on("click", function (event) {
            event.preventDefault();
            reqTable.row(rowSelected).remove().draw();
            contador = reqTable.data().length -1;
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
        
        /*Tabla de Beneficiarios Finales Parametrizados*/
        $("#benFinalTableParam").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: false,
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
        
        
        //asignar valor al contador
        var x = reqTable.data().length; 
        contador = x-1;
        
      });
     
      
      $("#oficio").on("change", function (e){
    	  var ofi = $("#oficio").val();
          if(ofi){
          	document.getElementById("hayOfi").style.display = "inline";
          	document.getElementById("noHayOfi").style.display = "none";
          }
          else{
          	document.getElementById("hayOfi").style.display = "none";
          	document.getElementById("noHayOfi").style.display = "inline";
          }
      });
      
      $("#uploadFileButton").on("click", function (e) {
        $("#oficio").trigger("click");
        var ofi = $("#oficio").val();
        if(ofi){
        	document.getElementById("hayOfi").style.display = "inline";
        	document.getElementById("noHayOfi").style.display = "none";
        }
        else{
        	document.getElementById("hayOfi").style.display = "none";
        	document.getElementById("noHayOfi").style.display = "inline";
        }
      });
      
      $('#upload').click(function (){
      	var url = getAbsolutePath() + "fileLoader" + "?noProcesoCompra=" +$('#purchaseNum').val()+"&oficioCOD="+$('#legalRequestCod').val()+"&submit=insert";
      	
      	var sampleFile = document.getElementById("oficio").files[0];

        var formdata = new FormData();


        formdata.append("oficio", sampleFile);

        var xhr = new XMLHttpRequest();       

        xhr.open("POST",url, true);

        xhr.send(formdata);

        xhr.onload = function(e) {

            if (this.status == 200) {
               alert("Oficio subido exitosamente!");
            }
            else{
            	alest("ERROR: No se pudo subir el oficio");
            }

        }; 
      
      <%
	  if(funcion != null && !funcion.contentEquals("nuevo")){
	  %>
      /*Load File*/
     $('#verOficio').click(function (){
    	var url = getAbsolutePath() + "fileLoader" + "?noProcesoCompra=" +$('#purchaseNum').val()+"&oficio="+$('#legalRequestCod').val();
    	 var xhr = new XMLHttpRequest();
    	 xhr.open('POST', url, true);
    	 xhr.responseType = 'arraybuffer';
    	 xhr.onload = function () {
    	     if (this.status === 200) {
    	         var filename = "";
    	         var disposition = xhr.getResponseHeader('Content-Disposition');
    	         if (disposition && disposition.indexOf('attachment') !== -1) {
    	             var filenameRegex = /filename[^;=\n]*=((['"]).*?\2|[^;\n]*)/;
    	             var matches = filenameRegex.exec(disposition);
    	             if (matches != null && matches[1]) filename = matches[1].replace(/['"]/g, '');
    	         }
    	         var type = xhr.getResponseHeader('Content-Type');

    	         var blob;
    	         if (typeof File === 'function') {
    	             try {
    	                 blob = new File([this.response], filename, { type: type });
    	             } catch (e) { /* Edge */ }
    	         }
    	         if (typeof blob === 'undefined') {
    	             blob = new Blob([this.response], { type: type });
    	         }

    	         if (typeof window.navigator.msSaveBlob !== 'undefined') {
    	             // IE workaround for "HTML7007: One or more blob URLs were revoked by closing the blob for which they were created. These URLs will no longer resolve as the data backing the URL has been freed."
    	             window.navigator.msSaveBlob(blob, filename);
    	         } else {
    	             var URL = window.URL || window.webkitURL;
    	             var downloadUrl = URL.createObjectURL(blob);

    	             if (filename) {
    	                 // use HTML5 a[download] attribute to specify filename
    	                 var a = document.createElement("iframe");
    	                 // safari doesn't support this yet
    	                 if (typeof a.download === 'undefined') {
    	                	 a.src = downloadUrl;
    	                     a.title = filename;
							
    	                	 window.open(downloadUrl);
    	                 } else {
    	                     a.src = downloadUrl;
    	                     a.title = filename;
    	                     var win = window.open();
    	                     win.document.write(a);
    	                     //a.download = filename;
    	                     //document.body.appendChild(a);
    	                     //a.click();
    	                 }
    	             } else {
    	                 window.location.href = downloadUrl;
    	             }

    	             setTimeout(function () { URL.revokeObjectURL(downloadUrl); }, 100); // cleanup
    	         }
    	     }
    	 };
    	 xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
    	 xhr.send();
      });
      <%
	  }
      %>
      });
      
      $(function(){
    	  $("input[id^='chk_']").on("click",function(){
		  $("input[id^='chk_']").not(this).prop('checked', false);
			});
		});

      
      // Obtener datos de la fila
      // y enviar datos a input del modal
      
      /* var table = document.getElementById("benFinalTable"),rIndex;
      
      for(var i = 1; i < table.rows.length; i++)
      {
          table.rows[i].onclick = function()
          {
              rIndex = this.rowIndex;
              console.log(rIndex);
              
              document.getElementById("legalRequestCod").value = this.cells[2].innerHTML;
             
          };
      }
      
    //editar fila
      function editRow()
      {
           table.rows[rIndex].cells[0].innerHTML = document.getElementById("idImput").value;
       
      } */
    	
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
