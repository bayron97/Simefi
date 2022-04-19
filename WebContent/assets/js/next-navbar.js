/*!
 * Authcode script v1.0.0 (https://www.deviohn.com/)
 */

(function ($) {
  $(document).ready(function () {
    $(".next-navbar > ul > li > a").click(function () {
      $(".next-navbar li").removeClass("active");
      $(this).closest("li").addClass("active");
      var checkElement = $(this).next();
      if (checkElement.is("ul") && checkElement.is(":visible")) {
        $(this).closest("li").removeClass("active");
        checkElement.slideUp("normal");
      }
      if (checkElement.is("ul") && !checkElement.is(":visible")) {
        $(".next-navbar ul ul:visible").slideUp("normal");
        checkElement.slideDown("normal");
      }
      if ($(this).closest("li").find("ul").children().length == 0) {
        return true;
      } else {
        return false;
      }
    });
    $(".next-navbar > ul > li > ul > li > button").click(function (e) {
      var value = $(this).prop("value");
      $("#submitNavBarValue").prop("value", value);
      $("#navform").submit();
    });
  });
})(jQuery);
