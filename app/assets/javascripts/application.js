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
    $("approve_form").submit();
    $('.approved.info-section').hide();
    $('#flash').html("<div class='notice'>Veranstaltung genehmigt.</div>")
  }
  
  function decline_event() {
    $("approve_form").submit();
    $('.approved.info-section').hide();
    $('#flash').html("<div class='notice'>Veranstaltung abgelehnt.</div>")
  }
  
  $("tr[data-link]").click(function() {
    window.location = this.dataset.link;
  })
  
  $(document).ready(function() {
    toggle_info('#boxer_active', '#boxer-info-section');
    toggle_info('#boxer_active', '#boxer-info-title');
    $('#participants-list').hide();
  });

  function toggle_info(check, element) {
    if ($(check).prop("checked")) {
      $(element).css("display", "block");
    } else {
      $(element).css("display", "none");
    }
  }
  
  $(function () {
    $('.checkall').on('click', function () {
        $(this).closest('tbody').find(':checkbox').prop('checked', this.checked);
    });
  });
  
  $(function() {
    $( "#tabs" ).tabs({ active: $("#tabs").data("tab") });
  });
  
  $(function() {
  $(".form-controls").tooltip();
  $(".btn").tooltip();
  $(".bar-chart").tooltip();
  $(".icon").tooltip();
  });
  
  function add_fight(id) {
    $("approve_fight_form").submit();
    $("#edit_fight_"+id+" .decline-fight.btn").css("display", "inline");
    $("#edit_fight_"+id+" .approve-fight.btn").css("display", "none");
  }
  
  function remove_fight(id) {
    $("decline_fight_form").submit();
    $("#edit_fight_"+id+" .approve-fight.btn").css("display", "inline");
    $("#edit_fight_"+id+" .decline-fight.btn").css("display", "none");
  }
  
