
$('#tag_search_results').css("display", "block");
$('#tag_search_results').html("<h6> Search results </h6>").css("text-decoration", "underline");
$("#tag_search_results").append("<%= escape_javascript(render 'looping_through_results') %>");

