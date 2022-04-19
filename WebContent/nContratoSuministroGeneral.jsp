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
            System.out.println(cod + " cod");
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTRATOS Y ÓRDENES DE COMPRA
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                PROCESO DE COMPRAS GENERALES
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
          <form id="formContratoSuministro" action="contratoSuministroGeneralServlet" method="post" enctype="multipart/form-data">
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
                                  <div class="float-left"></div>
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
                                        String QueryString = "SELECT * FROM procesoCompraGeneral where estado1='APROBADO'"; 
                                        if(func != null && !func.contentEquals("nuevo")){
                                          QueryString = "SELECT * from dbo.procesoCompraGeneral where idProcesoCompraGeneral = " + cod; 
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
                                          <%=disable%>
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

							<div class="form-group" style="text-align: left">
									<label>BENEFICIARIO</label> <input type="hidden"
										id="nombrebeneficiario" name="nombrebeneficiario"
										value="${nombrebeneficiario}" /> 
										<select
											autocomplete="off" class="form-control" id="beneficiario"
											name="beneficiario" 
											onchange="ShowSelectedc('beneficiario');" <%=disable%>>
										<option selected disabled value="">SELECCIONA UNA OPCION...</option>
										</select>
							</div>
							
							<div class="row">
                                <div class="col-lg-12 col-md-12">
                                
                                <div class="form-group" style="text-align: left">
                          <label>PROVEEDOR</label>
                          <input type="hidden" id="nombreproveedor" name="nombreproveedor" value="${nombreproveedor}"/>                   		  
                              <select
                                autocomplete="off"
                                class="form-control"
                                id="proveedor"
                                name="proveedor"
                                onchange="ShowSelected('proveedor');"
                                required
                                <%=disable%>
                              >
                              <option selected disabled value="">
                              SELECCIONA UNA OPCION...
                            	</option>                              
                              </select>                           
                        </div>
                                  <%-- <div class="form-group"> 
                                    <label>PROVEEDOR</label>
                                    <input type="text" id="proveedor" required value="${proveedor}" name="proveedor" class="form-control" <%=read%>>
                                  </div> --%>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                
                                <div class="form-group" style="text-align: left">
                          <label>TIPO DE DOCUMENTO</label>
                          <input type="hidden" id="tipoDocumento" name="tipoDocumento" value="${tipoDocumento}"/>                   		  
                              <select
                                autocomplete="off"
                                class="form-control"
                                id="tipoDocumentoNombre"
                                name="tipoDocumentoNombre"
                                onchange="ShowSelected('tipoDocumentoNombre');"
                                required
                                <%=disable%>
                              >
                              <option selected disabled value="">
                              SELECCIONA UNA OPCION...
                            	</option>                              
                              </select>                           
                        </div>
                                  <%-- <div class="form-group"> 
                                    <label>PROVEEDOR</label>
                                    <input type="text" id="proveedor" required value="${proveedor}" name="proveedor" class="form-control" <%=read%>>
                                  </div> --%>
                                </div>
                              </div>
								<div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>NO. DE DOCUMENTO</label>
                                    <select
                                      autocomplete="off"
                                      class="form-control"
                                      id="ordencompra"
                                      name="ordencompra"
                                      required
                                      <%=disable%>
                                    >
                                      <option selected disabled value="">
                                        SELECCIONA UNA OPCION...
                                      </option>
                                    </select>
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
                            <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
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
                            </label>
                          </div>
                        </div>
                      </div>
                  </div>
                </div>
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
    <form id="back" method="post" action="contratoSuministroALP.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="backwardApertura"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

    <% if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
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
    </div>
    <% } %>

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
      $(document).ready(function () {
        <% if (!func.toUpperCase().contentEquals("NUEVO") && func != null) {%>
	        var nombreDocumento = "${myfile}";
	        if (nombreDocumento === "")
	        {
	          $("#previewDocumentInput").addClass("hide");
	          $("#previewDocumentInput").prop("src", "");
	          $("#documentFile").prop("required", true);
	        }
	        else{
	          var ruta = getAbsolutePath() + "assets/files/contractSupplyFiles/" + nombreDocumento;
	          $("#previewDocumentInput").prop("src", ruta);
	          $("#previewDocumentInput").removeClass("hide");
	          $("#documentFile").prop("required", false);
	        }
	        
	        var ordencomprainput = $("#ordencompra");
	        var ordencompravariable="${ordencompra}";
	        ordencomprainput.append('<option selected value="' + ordencompravariable + '">' + ordencompravariable + '</option>');
	        
	        $("#myfile").prop('required',false);
        <%}%>
        
      });
      
      
      $("#procesocompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var ordencomprainput = $("#ordencompra");
	        var combo = document.getElementById("procesocompra");
		    var selected = combo.options[combo.selectedIndex].text;
	
	        // Guardamos el select de procesocomprainput
	        var procesocomprainput = $(this);
	
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "contratoSuministrosGeneral" + "?submit=Consultar&noProcesoCompra="+selected;
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
	                	var m=r.split(",");
	                    procesocomprainput.prop('disabled', false);
	                    ordencomprainput.prop('disabled', false);
	                    // Limpiamos el select
	                    ordencomprainput.find('option').remove();
	                    ordencomprainput.append('<option>SELECCIONE UNA OPCION...</option>');

	                    $(m).each(function(i, v){ // indice, valor
		                	console.log(m[i])
		                	if(m[i]!=''){
	                        ordencomprainput.append('<option value="' + m[i] + '">' + m[i] + '</option>');
		                	}
	                    })
	
	                    ordencomprainput.prop('disabled', false);
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
	
      function ShowSelectedc(campo){
	      /* Para obtener el valor */
	      console.log(campo)
	      var cod = document.getElementById(campo).value;
	      /* Para obtener el texto */
	      var combo = document.getElementById(campo);
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#nombre"+campo).val(selected);
	  }
      
      function ShowSelected(){
	      /* Para obtener el valor */
	      var cod = document.getElementById("procesocompra").value;
	      /* Para obtener el texto */
	      var combo = document.getElementById("procesocompra");
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#procesocompracod").val(selected);
	    }
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
