$(document).ready(function() {
  $(".nav-register").on("click", function(e){
    e.preventDefault();
    $("#registrations").slideToggle();
  });

  $(".registrations-signin-link").on("click", function(e){
    e.preventDefault();
    e.stopPropagation();
    $('.dropdown-toggle').dropdown("toggle");
    $("#registrations").slideToggle();
  });
})
