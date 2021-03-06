// Generated by CoffeeScript 1.6.2
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.Graph = (function() {
  function Graph(element) {
    var me;

    this.element = element;
    google.load('visualization', '1', {
      packages: ['corechart'],
      callback: function() {
        return me.drawChart.call(me, me.element);
      }
    });
    me = this;
    google.setOnLoadCallback;
  }

  Graph.prototype.drawChart = function(element) {
    return true;
  };

  return Graph;

})();

window.PieChart = (function(_super) {
  __extends(PieChart, _super);

  function PieChart(element, word1, word2) {
    this.element = element;
    this.word1 = word1;
    this.word2 = word2;
    PieChart.__super__.constructor.call(this, this.element);
  }

  PieChart.prototype.drawChart = function() {
    var chart, data, options;

    data = google.visualization.arrayToDataTable([['Word', 'Percent'], ["" + this.word1 + " that are  " + this.word2, 100], ["" + this.word1 + " that are not " + this.word2, 0]]);
    options = {
      title: "Percentage of " + this.word1 + " that are " + this.word2
    };
    chart = new google.visualization.PieChart(this.element.get(0));
    return chart.draw(data, options);
  };

  return PieChart;

})(Graph);

window.BarChart = (function(_super) {
  __extends(BarChart, _super);

  function BarChart(element, word1, word2) {
    this.element = element;
    this.word1 = word1;
    this.word2 = word2;
    BarChart.__super__.constructor.call(this, this.element);
  }

  BarChart.prototype.drawChart = function() {
    var chart, data, options;

    data = google.visualization.arrayToDataTable([['Thing', 'Number of Letters'], [this.word1, this.word1.length], [this.word2, this.word2.length]]);
    options = {
      title: 'Number of Letters Comparison'
    };
    chart = new google.visualization.ColumnChart(this.element.get(0));
    return chart.draw(data, options);
  };

  return BarChart;

})(Graph);
