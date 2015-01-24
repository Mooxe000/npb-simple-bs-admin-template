$(document).ready ->
  $(".alert").addClass("in").fadeOut 4500

  # swap open/close side menu icons 
  $("[data-toggle=collapse]").click ->

    # toggle icon
    $(this).find("i").toggleClass "glyphicon-chevron-right glyphicon-chevron-down"
    return

  return
