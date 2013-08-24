class window.Graph
	constructor: (@element) ->
		google.load 'visualization', '1', {
			packages: ['corechart'],
			callback: ->
				me.drawChart.call me, me.element
		}
		me = @
		google.setOnLoadCallback 

	drawChart: (element) ->
		yes

class window.PieChart extends Graph
	constructor: (@element, @word1, @word2) ->
		super(@element)

	drawChart: ->
		data = google.visualization.arrayToDataTable([
			['Thing', 'Number of Letters'],
			[@word1, @word1.length],
			[@word2, @word2.length]
		])

		options = {title: 'Number of Letters Comparison'}


		chart = new google.visualization.ColumnChart @element.get(0)
		chart.draw data,options
