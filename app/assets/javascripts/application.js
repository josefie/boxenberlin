// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require_tree .

  
  function myFunction() {
    alert("Hi");
  }

  function remove_element(link) {
    event.preventDefault();
    $(link).prev("input[type=hidden]").val("1");
    $(link).closest(".fields").hide();
  }
    
  function add_elements(link, association, content) {
    event.preventDefault();
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")
    $(link).parent().append(content.replace(regexp, new_id));
  }
  
  function approve_event() {
    event.preventDefault();
    $("approve_form").submit();
    $('.approve-buttons').hide();
    //$('#flash.notice').append("Approved!");
    alert("Veranstaltung genehmigt!");
  }
  
  function decline_event() {
    event.preventDefault();
    $("approve_form").submit();
    $('.approve-buttons').hide();
    alert("Veranstaltung abgelehnt!");
  }
  
  