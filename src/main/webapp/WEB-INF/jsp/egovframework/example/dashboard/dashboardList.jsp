<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests">

<!-- amChart5 -->
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<script src="https://cdn.amcharts.com/lib/5/locales/de_DE.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/usaLow.js"></script>
<!-- <script src="https://cdn.amcharts.com/lib/5/geodata/southKoreaLow.js"></script> -->
<!-- <script src="https://cdn.amcharts.com/lib/5/geodata/germanyLow.js"></script> -->
<script src="https://cdn.amcharts.com/lib/5/fonts/notosans-sc.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/data/countries.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/data/countries2.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>



<!-- header -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/header.jsp"></jsp:include>

<style type="text/css">

.contain{ 
  	display: flex;
	margin: 3rem 12% 3rem 12%;
	font-family: 'Orbit', sans-serif;
 	flex-direction: row;
    align-items: center;
    height: auto;
  	min-height: 100%;
 	padding-bottom: 10rem;
 	justify-content: center;
 	height: min-vh-100;
}

.contain > div {
	width: 50%;

}



.box2{
	display: flex;
	flex-direction: column;
	align-items: center;
	width : 100%;
}

.box2-1, .box2-2{
	display: flex;
	flex-direction: column;
	width: 100%;	

}



<!-- 암차트 예시 -->
#chartdiv {
  display : flex;
  width: 100%; 
/*   height: 80rem; */
  
  
}
</style>





<title>대시보드1</title>
</head>
<body>
<div class="contain">
	<div class="box1 left" style="border: 1px solid black">
		<h3>한반도 차트</h3>
			<div>
			<div id="chartdiv" style="width: 100%; height: 500px;"></div>
			<p> 
				<span>test</span>
			</p>
			</div>
	</div><!-- box1 -->
	<div class="box2 right" style="border: 1px solid red;">
		<div class="box2-1" style="border: 1px solid black">
			<p>병원종류 차트</p>
			<div id="chartHospital" style="width: 100%; height: 500px;"></div>
		</div> <!-- box2-1 -->	
		<div class="box2-2" style="border: 1px solid black">
			<p>의사종류 차트</p>
			<div id="chartDoctor" style="width: 100%; height: 500px;"></div>
		</div> <!-- box2-2 -->	
	</div><!-- box2 -->
	
</div><!-- contain  -->

<!-- 	<div class="box3"> -->
<!-- 	</div> -->
</body>

<script type="text/javascript">

// var user = new User("보라");









//전국 지도 차트
//https://www.amcharts.com/demos/location-sensitive-map/
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartdiv");

// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);

// Create the map chart
// https://www.amcharts.com/docs/v5/charts/map-chart/
var chart = root.container.children.push(am5map.MapChart.new(root, {
  panX: "rotateX",
  projection: am5map.geoMercator(),
  layout: root.horizontalLayout
}));

am5.net.load("https://www.amcharts.com/tools/country/?v=xz6Z", chart).then(function (result) {
   var geo = am5.JSONParser.parse(result.response);
   loadGeodata(geo.country_code);
});

// Create polygon series for continents
// https://www.amcharts.com/docs/v5/charts/map-chart/map-polygon-series/
var polygonSeries = chart.series.push(am5map.MapPolygonSeries.new(root, {
  calculateAggregates: true,
  valueField: "value"
}));

polygonSeries.mapPolygons.template.setAll({
  tooltipText: "{name}",
  interactive: true
});

polygonSeries.mapPolygons.template.states.create("hover", {
  fill: am5.color(0x677935)
});

polygonSeries.set("heatRules", [{
  target: polygonSeries.mapPolygons.template,
  dataField: "value",
  min: am5.color(0x8ab7ff),
  max: am5.color(0x25529a),
  key: "fill"
}]);

polygonSeries.mapPolygons.template.events.on("pointerover", function(ev) {
  heatLegend.showValue(ev.target.dataItem.get("value"));
});

function loadGeodata(country) {

  // Default map
  var defaultMap = "usaLow";
  
  if (country == "US") {
    chart.set("projection", am5map.geoAlbersUsa());
  }
  else {
    chart.set("projection", am5map.geoMercator());
  }

  // calculate which map to be used
  var currentMap = defaultMap;
  var title = "";
  if (am5geodata_data_countries2[country] !== undefined) {
    currentMap = am5geodata_data_countries2[country]["maps"][0];

    // add country title
    if (am5geodata_data_countries2[country]["country"]) {
      title = am5geodata_data_countries2[country]["country"];
    }
  }
  
  am5.net.load("https://cdn.amcharts.com/lib/5/geodata/json/" + currentMap + ".json", chart).then(function (result) {
    var geodata = am5.JSONParser.parse(result.response);
    var data = [];
    for(var i = 0; i < geodata.features.length; i++) {
      data.push({
        id: geodata.features[i].id,
        value: Math.round( Math.random() * 10000 )
      });
    }

    polygonSeries.set("geoJSON", geodata);
    polygonSeries.data.setAll(data)
  });
  
  chart.seriesContainer.children.push(am5.Label.new(root, {
    x: 5,
    y: 5,
    text: title,
    background: am5.RoundedRectangle.new(root, {
      fill: am5.color(0xffffff),
      fillOpacity: 0.2
    })
  }))

}

var heatLegend = chart.children.push(
  am5.HeatLegend.new(root, {
    orientation: "vertical",
    startColor: am5.color(0x8ab7ff),
    endColor: am5.color(0x25529a),
    startText: "Lowest",
    endText: "Highest",
    stepCount: 5
  })
);

heatLegend.startLabel.setAll({
  fontSize: 12,
  fill: heatLegend.get("startColor")
});

heatLegend.endLabel.setAll({
  fontSize: 12,
  fill: heatLegend.get("endColor")
});

// change this to template when possible
polygonSeries.events.on("datavalidated", function () {
  heatLegend.set("startValue", polygonSeries.getPrivate("valueLow"));
  heatLegend.set("endValue", polygonSeries.getPrivate("valueHigh"));
});

}); // end am5.ready()


////////////////////////////////////////////////////////////////////////////////////////////////////


//도넛차트(의사차트)
//https://www.amcharts.com/demos/donut-chart/
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartDoctor");


// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);


// Create chart
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
var chart = root.container.children.push(am5percent.PieChart.new(root, {
  layout: root.verticalLayout,
  innerRadius: am5.percent(50)
}));


// Create series
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
var series = chart.series.push(am5percent.PieSeries.new(root, {
  valueField: "value",
  categoryField: "category",
  alignLabels: false
}));

series.labels.template.setAll({
  textType: "circular",
  centerX: 0,
  centerY: 0
});


// Set data
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
series.data.setAll([
  { value: 10, category: "One" },
  { value: 9, category: "Two" },
  { value: 6, category: "Three" },
  { value: 5, category: "Four" },
  { value: 4, category: "Five" },
  { value: 3, category: "Six" },
  { value: 1, category: "Seven" },
]);


// Create legend
// https://www.amcharts.com/docs/v5/charts/percent-charts/legend-percent-series/
var legend = chart.children.push(am5.Legend.new(root, {
  centerX: am5.percent(50),
  x: am5.percent(50),
  marginTop: 15,
  marginBottom: 15,
}));

legend.data.setAll(series.dataItems);

////////////////////////////////////////////////////////////////////////////////////////////////
// Play initial series animation
// https://www.amcharts.com/docs/v5/concepts/animations/#Animation_of_series
series.appear(1000, 100);

}); // end am5.ready()

/*
//도넛차트X(의사종류X)
//https://www.amcharts.com/demos/animated-time-line-pie-chart/
am5.ready(function() {

// Define data for each year
var chartData = {
  "1995": [
    { sector: "Agriculture", size: 6.6 },
    { sector: "Mining and Quarrying", size: 0.6 },
    { sector: "Manufacturing", size: 23.2 },
    { sector: "Electricity and Water", size: 2.2 },
    { sector: "Construction", size: 4.5 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 14.6 },
    { sector: "Transport and Communication", size: 9.3 },
    { sector: "Finance, real estate and business services", size: 22.5 } ],
  "1996": [
    { sector: "Agriculture", size: 6.4 },
    { sector: "Mining and Quarrying", size: 0.5 },
    { sector: "Manufacturing", size: 22.4 },
    { sector: "Electricity and Water", size: 2 },
    { sector: "Construction", size: 4.2 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 14.8 },
    { sector: "Transport and Communication", size: 9.7 },
    { sector: "Finance, real estate and business services", size: 22 } ],
  "1997": [
    { sector: "Agriculture", size: 6.1 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 20.9 },
    { sector: "Electricity and Water", size: 1.8 },
    { sector: "Construction", size: 4.2 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 13.7 },
    { sector: "Transport and Communication", size: 9.4 },
    { sector: "Finance, real estate and business services", size: 22.1 } ],
  "1998": [
    { sector: "Agriculture", size: 6.2 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 21.4 },
    { sector: "Electricity and Water", size: 1.9 },
    { sector: "Construction", size: 4.2 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 14.5 },
    { sector: "Transport and Communication", size: 10.6 },
    { sector: "Finance, real estate and business services", size: 23 } ],
  "1999": [
    { sector: "Agriculture", size: 5.7 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 20 },
    { sector: "Electricity and Water", size: 1.8 },
    { sector: "Construction", size: 4.4 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.2 },
    { sector: "Transport and Communication", size: 10.5 },
    { sector: "Finance, real estate and business services", size: 24.7 } ],
  "2000": [
    { sector: "Agriculture", size: 5.1 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 20.4 },
    { sector: "Electricity and Water", size: 1.7 },
    { sector: "Construction", size: 4 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.3 },
    { sector: "Transport and Communication", size: 10.7 },
    { sector: "Finance, real estate and business services", size: 24.6 } ],
  "2001": [
    { sector: "Agriculture", size: 5.5 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 20.3 },
    { sector: "Electricity and Water", size: 1.6 },
    { sector: "Construction", size: 3.1 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.3 },
    { sector: "Transport and Communication", size: 10.7 },
    { sector: "Finance, real estate and business services", size: 25.8 } ],
  "2002": [
    { sector: "Agriculture", size: 5.7 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 20.5 },
    { sector: "Electricity and Water", size: 1.6 },
    { sector: "Construction", size: 3.6 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.1 },
    { sector: "Transport and Communication", size: 10.7 },
    { sector: "Finance, real estate and business services", size: 26 } ],
  "2003": [
    { sector: "Agriculture", size: 4.9 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 19.4 },
    { sector: "Electricity and Water", size: 1.5 },
    { sector: "Construction", size: 3.3 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.2 },
    { sector: "Transport and Communication", size: 11 },
    { sector: "Finance, real estate and business services", size: 27.5 } ],
  "2004": [
    { sector: "Agriculture", size: 4.7 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 18.4 },
    { sector: "Electricity and Water", size: 1.4 },
    { sector: "Construction", size: 3.3 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.9 },
    { sector: "Transport and Communication", size: 10.6 },
    { sector: "Finance, real estate and business services", size: 28.1 } ],
  "2005": [
    { sector: "Agriculture", size: 4.3 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 18.1 },
    { sector: "Electricity and Water", size: 1.4 },
    { sector: "Construction", size: 3.9 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.7 },
    { sector: "Transport and Communication", size: 10.6 },
    { sector: "Finance, real estate and business services", size: 29.1 } ],
  "2006": [
    { sector: "Agriculture", size: 4 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 16.5 },
    { sector: "Electricity and Water", size: 1.3 },
    { sector: "Construction", size: 3.7 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 14.2 },
    { sector: "Transport and Communication", size: 12.1 },
    { sector: "Finance, real estate and business services", size: 29.1 } ],
  "2007": [
    { sector: "Agriculture", size: 4.7 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 16.2 },
    { sector: "Electricity and Water", size: 1.2 },
    { sector: "Construction", size: 4.1 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.6 },
    { sector: "Transport and Communication", size: 11.2 },
    { sector: "Finance, real estate and business services", size: 30.4 } ],
  "2008": [
    { sector: "Agriculture", size: 4.9 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 17.2 },
    { sector: "Electricity and Water", size: 1.4 },
    { sector: "Construction", size: 5.1 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.4 },
    { sector: "Transport and Communication", size: 11.1 },
    { sector: "Finance, real estate and business services", size: 28.4 } ],
  "2009": [
    { sector: "Agriculture", size: 4.7 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 16.4 },
    { sector: "Electricity and Water", size: 1.9 },
    { sector: "Construction", size: 4.9 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.5 },
    { sector: "Transport and Communication", size: 10.9 },
    { sector: "Finance, real estate and business services", size: 27.9 } ],
  "2010": [
    { sector: "Agriculture", size: 4.2 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 16.2 },
    { sector: "Electricity and Water", size: 2.2 },
    { sector: "Construction", size: 4.3 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.7 },
    { sector: "Transport and Communication", size: 10.2 },
    { sector: "Finance, real estate and business services", size: 28.8 } ],
  "2011": [
    { sector: "Agriculture", size: 4.1 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 14.9 },
    { sector: "Electricity and Water", size: 2.3 },
    { sector: "Construction", size: 5 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 17.3 },
    { sector: "Transport and Communication", size: 10.2 },
    { sector: "Finance, real estate and business services", size: 27.2 } ],
  "2012": [
    { sector: "Agriculture", size: 3.8 },
    { sector: "Mining and Quarrying", size: 0.3 },
    { sector: "Manufacturing", size: 14.9 },
    { sector: "Electricity and Water", size: 2.6 },
    { sector: "Construction", size: 5.1 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 15.8 },
    { sector: "Transport and Communication", size: 10.7 },
    { sector: "Finance, real estate and business services", size: 28 } ],
  "2013": [
    { sector: "Agriculture", size: 3.7 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 14.9 },
    { sector: "Electricity and Water", size: 2.7 },
    { sector: "Construction", size: 5.7 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.5 },
    { sector: "Transport and Communication", size: 10.5 },
    { sector: "Finance, real estate and business services", size: 26.6 } ],
  "2014": [
    { sector: "Agriculture", size: 3.9 },
    { sector: "Mining and Quarrying", size: 0.2 },
    { sector: "Manufacturing", size: 14.5 },
    { sector: "Electricity and Water", size: 2.7 },
    { sector: "Construction", size: 5.6 },
    { sector: "Trade (Wholesale, Retail, Motor)", size: 16.6 },
    { sector: "Transport and Communication", size: 10.5 },
    { sector: "Finance, real estate and business services", size: 26.5 } ]
};

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartDoctor");


// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);


// Create chart
//https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/
var chart = root.container.children.push(am5percent.PieChart.new(root, {
  innerRadius: 100,
  layout: root.verticalLayout
}));


// Create series
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Series
var series = chart.series.push(am5percent.PieSeries.new(root, {
  valueField: "size",
  categoryField: "sector"
}));


// Set data
// https://www.amcharts.com/docs/v5/charts/percent-charts/pie-chart/#Setting_data
series.data.setAll([
  { sector: "Agriculture", size: 6.6 },
  { sector: "Mining and Quarrying", size: 0.6 },
  { sector: "Manufacturing", size: 23.2 },
  { sector: "Electricity and Water", size: 2.2 },
  { sector: "Construction", size: 4.5 },
  { sector: "Trade (Wholesale, Retail, Motor)", size: 14.6 },
  { sector: "Transport and Communication", size: 9.3 },
  { sector: "Finance, real estate and business services", size: 22.5 }
]);


// Play initial series animation
// https://www.amcharts.com/docs/v5/concepts/animations/#Animation_of_series
series.appear(1000, 100);


// Add label
var label = root.tooltipContainer.children.push(am5.Label.new(root, {
  x: am5.p50,
  y: am5.p50,
  centerX: am5.p50,
  centerY: am5.p50,
  fill: am5.color(0x000000),
  fontSize: 50
}));


// Animate chart data
var currentYear = 1995;
function getCurrentData() {
  var data = chartData[currentYear];
  currentYear++;
  if (currentYear > 2014)
    currentYear = 1995;
  return data;
}

//년대별 변화 애니메이션(실사용X -> 추후 삭제 고려)
function loop() {
  label.set("text", currentYear);
  var data = getCurrentData();
  for(var i = 0; i < data.length; i++) {
    series.data.setIndex(i, data[i]);
  }
  chart.setTimeout( loop, 4000 );
}

loop();

}); // end am5.ready()
*/



////////////////////////////////////////////////////////////////////////////////////////////////

//막대그래프(병원종류)
/*https://www.amcharts.com/demos/column-with-rotated-series*/
am5.ready(function() {

// Create root element
// https://www.amcharts.com/docs/v5/getting-started/#Root_element
var root = am5.Root.new("chartHospital");


// Set themes
// https://www.amcharts.com/docs/v5/concepts/themes/
root.setThemes([
  am5themes_Animated.new(root)
]);


// Create chart
// https://www.amcharts.com/docs/v5/charts/xy-chart/
var chart = root.container.children.push(am5xy.XYChart.new(root, {
  panX: true,
  panY: true,
  wheelX: "panX",
  wheelY: "zoomX",
  pinchZoomX: true
}));

// Add cursor
// https://www.amcharts.com/docs/v5/charts/xy-chart/cursor/
var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
cursor.lineY.set("visible", false);


// Create axes
// https://www.amcharts.com/docs/v5/charts/xy-chart/axes/
var xRenderer = am5xy.AxisRendererX.new(root, { minGridDistance: 30 });
xRenderer.labels.template.setAll({
  rotation: -90,
  centerY: am5.p50,
  centerX: am5.p100,
  paddingRight: 15
});

xRenderer.grid.template.setAll({
  location: 1
})

var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
  maxDeviation: 0.3,
  categoryField: "country",
  renderer: xRenderer,
  tooltip: am5.Tooltip.new(root, {})
}));

var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
  maxDeviation: 0.3,
  renderer: am5xy.AxisRendererY.new(root, {
    strokeOpacity: 0.1
  })
}));


// Create series
// https://www.amcharts.com/docs/v5/charts/xy-chart/series/
var series = chart.series.push(am5xy.ColumnSeries.new(root, {
  name: "Series 1",
  xAxis: xAxis,
  yAxis: yAxis,
  valueYField: "value",
  sequencedInterpolation: true,
  categoryXField: "country",
  tooltip: am5.Tooltip.new(root, {
    labelText: "{valueY}"
  })
}));

series.columns.template.setAll({ cornerRadiusTL: 5, cornerRadiusTR: 5, strokeOpacity: 0 });
series.columns.template.adapters.add("fill", function(fill, target) {
  return chart.get("colors").getIndex(series.columns.indexOf(target));
});

series.columns.template.adapters.add("stroke", function(stroke, target) {
  return chart.get("colors").getIndex(series.columns.indexOf(target));
});


// Set data
var data = [{
  country: "USA",
  value: 2025
}, {
  country: "China",
  value: 1882
}, {
  country: "Japan",
  value: 1809
}, {
  country: "Germany",
  value: 1322
}, {
  country: "UK",
  value: 1122
}, {
  country: "France",
  value: 1114
}, {
  country: "India",
  value: 984
}, {
  country: "Spain",
  value: 711
}, {
  country: "Netherlands",
  value: 665
}, {
  country: "South Korea",
  value: 443
}, {
  country: "Canada",
  value: 441
}];

xAxis.data.setAll(data);
series.data.setAll(data);


// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
series.appear(1000);
chart.appear(1000, 100);

}); // end am5.ready()


///////////////////////////////////////////////////////////////////////////////////
 
/* https://www.amcharts.com/docs/v5/charts/xy-chart/#Complete_example
// Create root and chart
var root = am5.Root.new("chartdiv"); 
var chart = root.container.children.push( 
  am5xy.XYChart.new(root, {
    panY: false,
    layout: root.verticalLayout
  }) 
);

// Define data
var data = [{ 
  category: "Research", 
  value1: 1000, 
  value2: 588 
}, { 
  category: "Marketing", 
  value1: 1200, 
  value2: 1800 
}, {  
  category: "Sales", 
  value1: 850, 
  value2: 1230 
}];

// Craete Y-axis
var yAxis = chart.yAxes.push( 
  am5xy.ValueAxis.new(root, { 
    renderer: am5xy.AxisRendererY.new(root, {}) 
  }) 
);

// Create X-Axis
var xAxis = chart.xAxes.push(
  am5xy.CategoryAxis.new(root, {
    renderer: am5xy.AxisRendererX.new(root, {}),
    categoryField: "category"
  })
);
xAxis.data.setAll(data);

// Create series
var series1 = chart.series.push( 
  am5xy.ColumnSeries.new(root, { 
    name: "Series", 
    xAxis: xAxis, 
    yAxis: yAxis, 
    valueYField: "value1", 
    categoryXField: "category" 
  }) 
);
series1.data.setAll(data);

var series2 = chart.series.push( 
  am5xy.ColumnSeries.new(root, { 
    name: "Series", 
    xAxis: xAxis, 
    yAxis: yAxis, 
    valueYField: "value2", 
    categoryXField: "category" 
  }) 
);
series2.data.setAll(data);

// Add legend
var legend = chart.children.push(am5.Legend.new(root, {})); 
legend.data.setAll(chart.series.values);

// Add cursor
chart.set("cursor", am5xy.XYCursor.new(root, {}));
*/

//right div's height 맞게  left div's height 동일하게 설정  
$(document).ready(function(){
    
    $('.contain').each(function(){  //컨테인
        
        var highestBox = 0;
        $('.right', this).each(function(){ //양쪽에 있는 디브 안에 있는 디브(내용물)
        
        alert("높이 확인" + $(this).height());
        
            if($(this).height() > highestBox) 
               highestBox = $(this).height(); 
        });  
        
        $('.left',this).height(highestBox);
        $('.chartdiv',this).height(highestBox);
        
    
	});    
});

















</script>

<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>

</html>