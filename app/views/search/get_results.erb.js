$('#tag_search_results').css("display", "block");
$('#mini_header').css("display", "none");
$('#tag_search_results').html("<h6> Search: <%= @tag.capitalize %> </h6>").css("text-decoration", "underline");
$("#tag_search_results").append("<%= escape_javascript(render 'looping_through_results') %>");
$('#tag_search_results .listing').css("background-color", "#F5EFE6").css("border", "1px solid grey");
