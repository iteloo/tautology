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
			['Word', 'Percent']
			["#{@word1} that are  #{@word2}", 100],
			["#{@word1} that are not #{@word2}", 0]
		])

		options = {title: "Percentage of #{@word1} that are #{@word2}"}


		chart = new google.visualization.PieChart @element.get(0)
		chart.draw data,options

class window.BarChart extends Graph
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

