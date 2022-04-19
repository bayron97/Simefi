<%@ page language="java" contentType="text/html"%>

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

    <!-- Bootstrap4 Theme-->
    <link
      href="./bootstrap4-style-orange-light.css"
      rel="stylesheet"
      id="stylelink"
    />

    <!-- Customized template style mandatory starts-->
    <style>
      .logoLogin {
        width: 10%;
      }
      .logoCharge {
        width: 40%;
      }
      .main-font {
        font-family: "Quicksand", sans-serif;
      }
      .fullscreen-background {
        background: url(./BAC.png) center center;
        background-size: cover;
      }
      .login-container-styles {
        background: url(./BAC.png) center center !important;
        background-size: auto;
        border-radius: 2em 0em 2em 0em !important;
        border: 8px solid #ffa500 !important;
      }
      input:not([type="password"]) {
        text-transform: uppercase;
      }
      input:read-only {
        cursor: not-allowed;
      }
      input:-moz-read-only {
        cursor: not-allowed;
      }
    </style>
    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <!-- Head tag ends -->

  <!-- Body -->

  <body class="h-100 no-sidemenu fullscreen-background">
    <div class="loader container-fluid">
      <div class="row h-100">
        <div class="col-auto align-self-center mx-auto text-center">
          <p>
            <img src="./bancoccicon.png" alt="" class="logoCharge" />
          </p>
          <h4 class="text-white">BANCO DE OCCIDENTE</h4>
          <p class="badge badge-primary text-uppercase">
            PLATAFORMA DE FIDECOMISOS
          </p>
          <br />
          <div class="loader-ripple">
            <div></div>
            <div></div>
          </div>
        </div>
      </div>
    </div>

    <div class="wrapper">
      <div class="content shadow-sm position-relative">
        <div class="header main-font">
          <!-- Fixed navbar -->
          <nav class="container-fluid">
            <div class="row">
              <div class="col align-self-center">
                <a href="" class="logo text-white">
                  <img src="./bancoccicon.png" alt="" class="logoLogin" />
                  <div class="logo-text" style="padding-bottom: 15px;">
                    <h5 class="fs22 mb-0">BANCO DE OCCIDENTE</h5>
                    <p class="badge badge-primary text-uppercase fs11">
                      PLATAFORMA DE FIDECOMISOS
                    </p>
                  </div>
                </a>
              </div>
              <div class="col text-right align-self-center"></div>
            </div>
          </nav>
        </div>
        <div class="background">
          <img src="./BAC_LOGIN.png" alt="" />
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="row login-row-height">
            <div class="col-12 col-md-6 col-lg-7 d-none d-md-flex"></div>
            <!--Login Box Container-->
            <div class="col-12 col-md-6 col-lg-5 col-xl-4 align-self-center">
              <div class="card shadow-lg login-container-styles">
                <form action="newPassS" method="post">
                  <div class="card-body py-5">
                    <h5 class="font-weight-light mb-1 text-mute-high">
                      CAMBIO DE CONTRASE&#209;A
                    </h5>
                    <h3 class="font-weight-normal mb-4">
                      INGRESA TU NUEVA CONTRASE&#209;A:
                    </h3>
                    <div class="card mb-2 overflow-hidden">
                      <div class="card-body p-0">
                        <label for="inputUser" class="sr-only">USUARIO</label>
                        <input
                          autocomplete="off"
                          type="text"
                          id="inputUser"
                          name="un"
                          class="form-control rounded-0 border-0"
                          placeholder="USUARIO"
                          value="${rstUser}"
                          required
                          readonly
                        />
                        <hr class="my-0" />
                        <label for="inputPassword" class="sr-only"
                          >NUEVA CONTRASE&#209;A</label
                        >
                        <input
                          autocomplete="off"
                          type="password"
                          id="inputPassword"
                          name="pw"
                          class="form-control rounded-0 border-0"
                          placeholder="NUEVA CONTRASE&#209;A"
                          required
                        />
                        <hr class="my-0" />
                        <label for="inputPassConfirm" class="sr-only"
                          >CONFIRME NUEVA CONTRASE&#209;A</label
                        >
                        <input
                          autocomplete="off"
                          type="password"
                          id="inputPassConfirm"
                          name="pw1"
                          class="form-control rounded-0 border-0"
                          placeholder="CONFIRME NUEVA CONTRASE&#209;A"
                          required
                        />
                      </div>
                    </div>
                    <div class="text-left mb-3">
                      <button type="submit" class="btn btn-primary btn-block">
                        CAMBIAR CONTRASE&#209;A
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </div>
            <!--Login Box Container Ends-->
          </div>
        </div>
        <!-- Main container ends -->
      </div>
      <footer class="footer main-font text-white">
        <div class="container-fluid">
          <div class="row">
            <div
              class="col-12 col-md text-center text-md-left align-self-center"
            >
              <p>
                TODOS LOS DERECHOS RESERVADOS POR
                <a class="text-white" href="">BANCOCCI</a>
              </p>
            </div>
            <div class="col-12 col-md-auto text-center text-md-right">
              <ul class="nav justify-content-center justify-md-content-end">
                <li class="nav-item">
                  <a class="nav-link text-white" href="/term-use1"
                    >TERMINOS DE USO</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link text-white" href="/policy2"
                    >POLITICA DE PRIVACIDAD</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link text-white" href="/contactus3"
                    >CONTACTANOS</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- wrapper ends -->

    <!-- Java Script section starts -->

    <!-- JQuery -->
    <script src="./jquery-3.5.1.js"></script>

    <!-- Utils -->
    <script src="./utils.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      "use strict";


    </script>

    <!-- Java Script section ends -->
  </body>

  <!-- Body ends -->
</html>
