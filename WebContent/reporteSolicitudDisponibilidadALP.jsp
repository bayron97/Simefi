<%@ page language="java" contentType="text/html"%>
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	//Retrieve your list from the request, with casting
  ArrayList<listaRequerimientoSolicitudDisponibilidadALP> listaRequerimientosSDList = (ArrayList<listaRequerimientoSolicitudDisponibilidadALP>) request.getAttribute("listaRequerimientosSDList");
  ArrayList<Long> itemsBPM = (ArrayList<Long>) request.getAttribute("itemsBPM");
	ArrayList<Long> itemsRegSan = (ArrayList<Long>) request.getAttribute("itemsRegSan");
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

    <!-- General styles -->
    <link href="./assets/css/general.css" rel="stylesheet" />

    <!-- Bootstrap4 Theme-->
    <link
      href="./assets/css/bootstrap4-style-orange-light.css"
      rel="stylesheet"
      id="stylelink"
    />

    <!-- Customized template style mandatory starts-->
    <style>
      .custom-logo {
        height: 80px;
        width: auto;
      }
      .font-custom {
        font-family: Arial, Helvetica, sans-serif;
      }
    </style>
    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <body>
    <!-- wrapper starts -->
    <div class="wrapper">
      <!-- Main container starts -->
      <div class="container-fluid mt-3 mb-3 font-custom">
        <div class="row mb-4">
          <div class="col-12">
            <table class="w-100 mb-0">
              <thead>
                <tr>
                  <th
                    class="float-left"
                    style="background-color: #fff !important"
                  >
                    <img
                      class="custom-logo"
                      src="reportLogo.png"
                      alt="Logo Reporte"
                    />
                  </th>
                  <th
                    class="text-right"
                    style="
                      background-color: #fff !important;
                      color: #000 !important;
                    "
                  >
                    <h4
                      class="font-weight-bold"
                      style="text-decoration: underline black"
                    >
                      Departamento de Fideicomisos
                    </h4>
                    <h6>
                      Compra Mediante Acuerdo a Largo Plazo No. ${codPC}
                    </h6>
                  </th>
                </tr>
              </thead>
            </table>
          </div>
        </div>
        <div class="row">
          <table class="table table-bordered w-100 mb-0">
            <thead>
              <tr>
                <th class="font-weight-bold text-left">
                  ${fechaEmision}, Tegucigalpa, M.D.C.
                </th>
                <th class="font-weight-bold text-right">
                  <p>SOLICITUD DE DISPONIBILIDAD DE PRODUCTOS No. ${codSD}</p>
                  <p>REF.: SOLICITUD DE COMPRA ${codSC}-SESAL</p>
                </th>
              </tr>
            </thead>
          </table>
        </div>
        <div class="row border mt-4">
          <div class="col-12">
            <h6 class="font-weight-bold">Para: ${proveedor}</h6>
          </div>
        </div>
        <div class="row border">
          <div class="col-12">
            <h6 class="font-weight-bold">Atenci�n a: {Representante Legal de Proveedor}</h6>
          </div>
        </div>
        <div class="row mt-3">
          <p>
            Por medio de la presente le informamos que de conformidad con el
            <strong class="font-weight-bold"
              >ACUERDO A LARGO PLAZO No. ${codPC}</strong
            >
            de fecha XXXXXX, sus Enmiendas y/o Ampliaci�n,
            <strong class="font-weight-bold">EL FIDUCIARIO</strong> emite la
            siguiente
            <strong
              class="font-weight-bold"
              style="text-decoration: underline black"
              >Solicitud de Disponibilidad de Productos</strong
            >
            para una Nueva Compra a realizar a trav�s de dicho Acuerdo y bajo
            las condiciones detalladas a continuaci�n:
          </p>
        </div>
        <div class="row mt-4">
          <!--Legal Table Section starts-->
          <table
            id="reqTable"
            class="table table-bordered w-100 mb-0 table-aditional-styles"
            aria-describedby="Tabla de Productos Requeridos"
          >
            <thead>
              <tr style="font-weight: bold;">
                <th class="all">NO. ITEM</th>
                <th class="min-tablet">CODIGO SESAL</th>
                <th class="all">NOMBRE DEL PRODUCTO ACORDADO</th>
                <th class="min-desktop">DESCRIPCION TECNICA ACORDADA</th>
                <th class="min-tablet">UNIDAD DE PRESENTACION ACORDADA</th>
                <th class="min-tablet">FABRICANTE / PAIS DE ORIGEN</th>
                <th class="min-tablet">PRECIO UNITARIO ACORDADO</th>               
                <th class="min-tablet">CANTIDAD REQUERIDA</th>
                <th class="min-tablet">
                  TIEMPO DE ENTREGA (DIAS CALENDARIO REQUERIDOS)
                </th>
                <th class="min-tablet">VIDA UTIL REQUERIDA</th>
              </tr>
            </thead>
            <tbody>
              <%
                if (listaRequerimientosSDList != null)
                {
                  for(listaRequerimientoSolicitudDisponibilidadALP requerimiento : listaRequerimientosSDList){
              %>
                <tr>
                  <td><%=requerimiento.getNoItem()%></td>
                  <td><%=requerimiento.getcodigoSesal()%></td>
                  <td><%=requerimiento.getNombreProductoOfertado()%></td>
                  <td><%=requerimiento.getDescripcionTecnicaOfertada()%></td>
                  <td><%=requerimiento.getUnidadPresentacionOfertada()%></td>
                  <td><%=requerimiento.getOrigenFP()%></td>
                  <td><%= requerimiento.getMoneda() + " "+ requerimiento.getPrecioUnitarioAcordado()%></td>
                 
                  <td><%=requerimiento.getCantidadRequerida()%></td>
                  <td><%=requerimiento.getTiempoEntregaOfertado()%></td>
                  <td><%=requerimiento.getVidaUtilOfertada()%></td>
                </tr>
              <%
                  }
                }
              %>
            </tbody>
          </table>
          <!--Legal Table Section ends-->
        </div>
        <div class="row mt-4">
          <p>
          <strong
              class="font-weight-bold"
              style="text-decoration: underline black"
              >NOTA:</strong
            > ${nota}
            </p>
        </div>
        <br /><br /><br />
        <div class="row border mt-4">
          <div class="col-12 mt-2 mb-2">
            <h6 class="font-weight-bold">Condiciones Generales:</h6>
          </div>
        </div>
        <div class="row border">
          <div class="col-12">
            <p class="mt-3">
              a) <strong class="font-weight-bold">EL PROVEEDOR</strong> deber�
              confirmar si cuenta con la Disponibilidad de los Productos
              solicitados en el tiempo solicitado en este documento. As� 
              tambi�n,
              <strong class="font-weight-bold">EL PROVEEDOR</strong> podr� 
              presentar una propuesta alterna para la Disponibilidad de los
              mismos, la cual, estar� sujeta en todo momento a la aprobaci�n de
              <strong class="font-weight-bold">EL FIDUCIARIO</strong>.
            </p>
            <p>
              b) <strong class="font-weight-bold">EL PROVEEDOR</strong> deber�
              detallar la Fecha de Vencimiento (Vida ��til) de los productos
              disponibles. Es indispensable contar con una Fecha de Vencimiento
              puntual a cada producto que se ofrece como disponible.
            </p>
            <p>
              c) Esta Notificaci�n no constituye, ni representa, un compromiso
              de parte de
              <strong class="font-weight-bold">EL FIDUCIARIO</strong> en
              realizar una Compra, sin embargo,
              <strong class="font-weight-bold">EL PROVEEDOR</strong> deber�
              presentar la informaci�n solicitada de forma detallada y clara,
              para que,
              <strong class="font-weight-bold">EL FIDUCIARIO</strong> pueda
              realizar su respectiva Evaluaci�n.
            </p>
            <p>
              d) El lugar de entrega de los productos es el siguiente:
              <strong class="font-weight-bold">{Direccion Beneficiario parametrizado}</strong>.
            </p>
            <p>
              e) Se solicita a
              <strong class="font-weight-bold">EL PROVEEDOR</strong> confirmar
              Aceptaci�n de Entrega Directa en el
              <strong class="font-weight-bold"
                >Almac�n de medicamentos complejo COALSA</strong
              >, Tegucigalpa. As� tambi�n, se solicita confirmar si el
              Suministro de los Medicamentos que se requieran tendr� Costos
              Log�sticos adicionales.
              <strong class="font-weight-bold">EL PROVEEDOR</strong> present� su
              Oferta en base a realizar entregas en el Municipio del Distrito
              Central (M.D.C.) en Francisco Moraz�n, sin embargo, como lo
              establecido en los T�rminos de Referencia (TDR’s) y el Acuerdo a
              Largo Plazo (ALP) suscrito,
              <strong class="font-weight-bold">EL FIDUCIARIO</strong> podr�
              solicitar un lugar diferente de Entrega;
              <strong class="font-weight-bold">EL FIDEICOMISO</strong> se
              reservar� el derecho de aceptar o no el Costo Log�stico adicional.
            </p>
            <p>
              Por tanto, se solicita que la respuesta a la
              <strong
                class="font-weight-bold"
                style="text-decoration: underline black"
                >Solicitud de Disponibilidad de Productos</strong
              >, sea enviada a m�s tardar el ${fechaMaxima}.
            </p>
            <h6 class="font-weight-bold text-center" style="margin-top: 180px">
              FIRMA AUTORIZADA
            </h6>
            <h6 class="font-weight-bold text-center mb-3">
              DEPARTAMENTO DE FIDEICOMISOS
            </h6>
          </div>
        </div>
        <!-- Main container ends -->
      </div>
    </div>

    <!-- Navigation Float Buttons section starts -->

    <!--**********No Buttons in this page**********-->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--**********No MODALS in this page**********-->

    <!-- Modal Section ends-->

    <!-- Java Script section starts -->

    <!-- JQuery -->
    <script src="./assets/js/jquery-3.5.1.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      "use strict";

    </script>

    <!-- Java Script section ends -->
  </body>
</html>
