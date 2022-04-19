/*!
 * Authcode script v1.0.0 (https://www.deviohn.com/)
 */

$(document).ready(function () {
  /* page navigation on load */

  var url = window.location.href.split("#")[0];
  if ($("body").hasClass("horizontal-menu") === true) {
    var element = $(".sidebar-left #side-menu li a")
      .filter(function () {
        return this.href == url;
      })
      .addClass("active")
      .parent("li")
      .addClass("active")
      .closest(".nav")
      .slideDown()
      .parent()
      .addClass("show")
      .closest(".nav")
      .slideDown()
      .addClass("in")
      .prev()
      .addClass("show");

    $(".sidebar-left .nav li a").on("click", function () {
      if ($(this).hasClass("menudropdown") === true) {
        $(this)
          .toggleClass("show")
          .next()
          .slideToggle()
          .parent()
          .addClass("in");
      }
    });
  } else {
    var element = $(".sidebar .nav .nav-link")
      .filter(function () {
        return this.href == url;
        alert(url);
      })
      .addClass("active")
      .parent(".nav-item")
      .addClass("active")
      .parents(".nav")
      .slideDown()
      .parents(".dropdown")
      .addClass("show");
  }

  /* menu open close wrapper screen click close menu */
  $(".menu-btn").on("click", function (e) {
    e.stopPropagation();
    if ($("body").hasClass("sidemenu-open") == true) {
      $("body").removeClass("sidemenu-open");
    } else {
      $("body").addClass("sidemenu-open");
    }
  });

  if ($(document).width() <= 992) {
    $("body").removeClass("sidemenu-open");
    $(".wrapper").on("click", function () {
      if ($("body").hasClass("sidemenu-open") == true) {
        $("body").removeClass("sidemenu-open");
      }
    });
  }

  /* stop defualt event in card dropdown */
  $(".no-defaults").on("click", function (e) {
    e.stopPropagation();
  });

  /* select flag */
  $(".select-flag .dropdown-item").on("click", function () {
    var flagname = $(this).find(".flag-icon").attr("class");
    $(this)
      .closest(".select-flag")
      .find(".dropdown-toggle span")
      .attr("class", flagname);
  });

  /* filter click open filter */
  if ($("body").hasClass("filtermenu-open") == true) {
    $(".filter-btn").find("i").html("close");
  }
  $(".filter-btn").on("click", function () {
    if ($("body").hasClass("filtermenu-open") == true) {
      $("body").removeClass("filtermenu-open");
      $(this).find("i").html("filter_list");
    } else {
      $("body").addClass("filtermenu-open");
      $(this).find("i").html("close");
    }
  });

  /* background image to cover */
  $(".background").each(function () {
    var imagewrap = $(this);
    var imagecurrent = $(this).find("img").attr("src");
    imagewrap.css("background-image", 'url("' + imagecurrent + '")');
    $(this).find("img").remove();
  });

  $(".dropdown-toggle").on("click", function () {
    var thisdd = $(this);
    thisdd.removeClass("active");
    setTimeout(function () {
      thisdd.addClass("active");
    }, 100);
    $(".dropdown").on("hidden.bs.dropdown", function () {
      var thisddopen = $(this).find(".dropdown-toggle");
      thisddopen.removeClass("active");
    });
  });

  /* footer and responive sizing */
  var footerheight = $(".footer").outerHeight();
  $(".footer")
    .css("margin-top", -footerheight)
    .prev(".content ")
    .css("padding-bottom", footerheight);

  if ($(window).height() > 767) {
    /* mail-row height */
    $(".login-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header").outerHeight() -
        $(".footer").outerHeight() -
        50
    );
    $(".compose-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".footer").outerHeight() -
        170
    );
    $(".mail-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".mail-header").outerHeight() -
        $(".footer").outerHeight() -
        30
    );
    $(".file-row").css(
      "min-height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".mail-header").outerHeight() -
        $(".footer").outerHeight() -
        30
    );
  }

  /* sidebar compact */
  if ($("body").hasClass("sidebar-compact") == true) {
    $(".sidebar")
      .find(".dropdown")
      .removeClass("show")
      .find(".dropdown-toggle")
      .next()
      .hide();
  }

  /* sidebar small */
  if ($("body").hasClass("sidebar-icon") == true) {
    $(".sidebar")
      .find(".dropdown")
      .removeClass("show")
      .find(".dropdown-toggle")
      .next()
      .hide();
  }
  $(".sidebar").on("mouseleave", function () {
    if (
      $("body").hasClass("sidebar-icon") ||
      $("body").hasClass("sidebar-compact")
    ) {
      $(".sidebar")
        .find(".dropdown")
        .removeClass("show")
        .find(".dropdown-toggle")
        .next()
        .hide();
    }
  });

  /*  fixed header */
  if ($("body").hasClass("header-fixed-top") == true) {
    var headerheight = $(".header-container").outerHeight() + 15;
    $(".wrapper").css("padding-top", headerheight);
  }

  /* task dropdown action */
  $("#tasks a").on("click", function (e) {
    e.preventDefault();
    $(this).tab("show");
  });
});

$(window).on("load", function () {
  $(".loader").fadeOut("slow");

  /* header active on scroll more than 50 px*/
  if ($(this).scrollTop() >= 30) {
    $(".header").addClass("active");
  } else {
    $(".header").removeClass("active");
  }

  $(window).on("scroll", function () {
    /* header active on scroll more than 50 px*/
    if ($(this).scrollTop() >= 30) {
      $(".header").addClass("active");
    } else {
      $(".header").removeClass("active");
    }
  });

  /* sidebar message close */
  $(".close-btn").on("click", function () {
    $(this).closest(".card").fadeOut();
  });
});

$(window).on("resize", function () {
  /* on resize close sidemenu */
  if ($("body").hasClass("no-sidemenu") != true) {
    if ($(document).width() <= 1265) {
      $("body").removeClass("sidemenu-open");
    } else {
      $("body").addClass("sidemenu-open");
    }
  }

  /* footer and responive sizing */
  var footerheight = $(".footer").outerHeight();
  $(".footer")
    .css("margin-top", -footerheight)
    .prev(".content ")
    .css("padding-bottom", footerheight);

  if ($(window).height() > 767) {
    /* mail-row height */
    $(".login-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header").outerHeight() -
        $(".footer").outerHeight() -
        50
    );
    $(".compose-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".footer").outerHeight() -
        170
    );
    $(".mail-row-height").css(
      "height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".mail-header").outerHeight() -
        $(".footer").outerHeight() -
        30
    );
    $(".file-row").css(
      "min-height",
      $(window).outerHeight() -
        $(".header-container").outerHeight() -
        $(".mail-header").outerHeight() -
        $(".footer").outerHeight() -
        30
    );
  }
});

$(".wrapper").on("scroll", function () {
  /*window scoll event on scroll fill header to avoid overlapping content visible */
  if ($(this).scrollTop() > 20) {
    $(".header-container").addClass("header-fill");
  } else {
    $(".header-container").removeClass("header-fill");
  }
});
