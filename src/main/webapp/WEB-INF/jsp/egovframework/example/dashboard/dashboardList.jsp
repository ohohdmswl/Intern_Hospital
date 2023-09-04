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
  height: 80rem;
  
  
}


.box1{
	display: flex;
	flex-direction: column;
	justify-content: center;
	
}
</style>





<title>대시보드1</title>
</head>
<body>
<div class="contain">

	<input type="hidden" id="geoClick" value=""/>
	<div class="box1 left" style="border: 1px solid black">
		<h3>한반도 차트</h3>
			<div>
			<div id="chartdiv" style="width: 100%; height: 800px;"></div>
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

    /** OnLoad event */
    $(function() {
//     	fn_chartClick(geoClick);
    
    
    });
	
 var eClick = document.getElementById("chartdiv");

 // 버튼에 클릭 이벤트 리스너를 추가
 eClick.addEventListener("click", showAlert);

 // 클릭 이벤트를 처리할 함수를 정의
 function showAlert() {
   alert("클릭되었습니다!");
   

   
 }    
    
    
function fn_chartClick(geoClick) {
	
	$.ajax({
	    url: '/dash/dashGeoClick.do',
	    type: 'post',
	    data: { "geoClick": geoClick},
	    dataType: 'json',
	    success: function(data){ 
	        
	    	console.log("data 응답 데이터 확인" +  JSON.stringify(data));
	        console.log("data.returnDel 확인" +  JSON.stringify(data.returnInsert));
	        
	        
// 			if(data.returnInsert > 0){
// 				alert("정상적으로 등록되었습니다.");
// 				location.href = "/board/boardView.do";
// 			} else {
// 				alert ("정상적으로 등록되지 않았습니다.");
// //					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
// 			};
			
	    },
	    error: function(){
	        alert("실패실패22");
	    }
	});
	
	
}









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

//{"country_code":"KR","country_name":"Korea, Republic of"}
am5.net.load("https://www.amcharts.com/tools/country/?v=xz6Z", chart).then(function (result) {
   var geo = am5.JSONParser.parse(result.response);
   loadGeodata(geo.country_code);
});

// Create polygon series for continents
// https://www.amcharts.com/docs/v5/charts/map-chart/map-polygon-series/
var polygonSeries = chart.series.push(am5map.MapPolygonSeries.new(root, {
  calculateAggregates: true, //계산집계
  valueField: "value"
}));




polygonSeries.mapPolygons.template.setAll({
  tooltipText: "{name}", //정보팝업창
  interactive: true		//상호작용
 
});	



//지역 클릭시 해당 지역 이름값을 가져옴 - 클릭 이벤트 핸들러를 추가
polygonSeries.mapPolygons.template.events.on("click", function(ev) {
  // 클릭한 지역의 값을 가져옴
  var geoValNm = ev.target.dataItem.dataContext.name;
  var geoValCd = ev.target.dataItem.dataContext.id;
  
  // 클릭한 지역의 값을 alert 확인
  alert("클릭한 지역 이름: " + geoValNm);
  alert("클릭한 지역 코드: " + geoValCd);
  
  
  //input hidden 값으로 설정(ajax_controller로 지역 값 넘기기 위해)
  $("#geoClick").val(geoValNm);
  alert("클릭한 지역 input hidden: " + $("#geoClick").val());
  
  fn_chartClick($("#geoClick").val());
  
  
});


polygonSeries.mapPolygons.template.states.create

	 ("hover", {fill: am5.color(0x677935)})
	
	;
 
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
  country: "상급종합",
  value: 2025
}, {
  country: "종합병원",
  value: 1882
}, {
  country: "병원",
  value: 1809
}, {
  country: "요양병원",
  value: 1322
}, {
  country: "정신병원",
  value: 1122
}, {
  country: "의원",
  value: 1114
}, {
  country: "치과병원",
  value: 984
}, {
  country: "치과의원",
  value: 711
}, {
  country: "조산원",
  value: 665
}, {
  country: "보건소",
  value: 443
}, {
  country: "보건지소",
  value: 441
}, {
  country: "보건진료소",
  value: 441
}, {
  country: "보건의료원",
  value: 441
}, {
  country: "한방병원",
  value: 441
}, {
  country: "한의원",
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