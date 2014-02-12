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
//= require twitter/bootstrap
//= require jquery.ui.all

//= require_tree .
//= require underscore
//= require gmaps/google

//= require jquery.turbolinks
//= require turbolinks

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
/*    event.preventDefault();*/

    $("approve_form").submit();
    $('#approve-buttons').hide();
    //$('#flash.notice').append("Approved!");
    alert("Veranstaltung genehmigt!");
  }
  
  function decline_event() {
/*    event.preventDefault();*/

    $("approve_form").submit();
    $('#approve-buttons').hide();
    alert("Veranstaltung abgelehnt!");
  }
  
  $("tr[data-link]").click(function() {
    window.location = this.dataset.link;
  })
  
  $(document).ready(function() {
    toggle_info('#boxer_active', '#boxer-info-section');
    toggle_info('#boxer_active', '#boxer-info-title');
  });

  function toggle_info(check, element) {
    if ($(check).prop("checked")) {
      $(element).css("display", "block");
    } else {
      $(element).css("display", "none");
    }
  }
  
  function selectAll() {
    alert("test select all");
    $("#check-all").click(function() {
      $("#boxer_ids[]").each(function() {
        $(this).prop("checked");
      });
    });
  }
  
  $(function() {
    $( "#tabs" ).tabs({ selected: $("#tabs").data("selected") });
  });
  
  $(function() {
    $(".form-controls").tooltip().off("mouseover mouseout");
  });
  
