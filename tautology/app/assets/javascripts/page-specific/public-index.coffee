$ ->
	$('.search-button').click ->
		window.search()
	$('.search-box input').keypress (e) ->
		if e.which == 13
			window.search()

window.search = ->
	location.href = "/" + $('.search-box input').val().replace(' ','-')