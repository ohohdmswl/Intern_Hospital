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

    /** OnLoad event */
    $(function() {
    	//처음 페이지 로드할 때 전국 데이터 활용한 차트 보여주기
    	fn_chartClick();
    });
    
//한반도 차트에서 지역 선택시 반응하는 Ajax
//지역 선택시 해당지역에 맞는 병원종류(막대), 의사종류(파이) 차트 만들어짐
function fn_chartClick(geoClick) {
	
	$.ajax({
	    url: '/dash/dashGeoClick.do',
	    type: 'post',
	    data: { "geoClick": geoClick},
	    dataType: 'json',
	    success: function(data){ 
	        
	    	//지역별 병원 종류 차트 루트 초기화
	    	fn_chartRootReset('chartHospital');
	    	
	    	//지역별 병원 종류 개수
// 	    	var data = fn_numHospitalJson(data.numHospitalList);
	    	fn_createHpChart(fn_numHospitalJson(data.numHospitalList));
	    	
	    	
	    },
	    error: function(){
	        alert("실패실패22");
	    }
	});
}

//지역별 병원 종류 개수 JSON 객체화 (var data 선언위해)
function fn_numHospitalJson(redata) {
	
	//JS 배열 셍성
	var numHospitalList = new Array();
	
	//for문 활용해서 Ajax 응딥데이터를 이용한 객체 만들기
	for(var i=0; i<redata.length; i++){
		
		var data = {};
		data.kind_tot = redata[i].kind_tot;
		data.kind_nm = redata[i].kind_nm;

		//for문으로 만든 객체를 배열에 담기
		numHospitalList.push(data);
	}
	return numHospitalList;
};


//차트 리셋
//-> 여러지역 선택시 이미 루트가 있다는 JS오류 해결하기 위해 차트 루트 리셋하는 함수 사용
function fn_chartRootReset(divId) {
	  am5.array.each(am5.registry.rootElements, function(root) {
	    if (root.dom.id === divId) {
	      root.dispose();
	    }
	  });
	}




//전국 지도 차트 
//->한반도 차트는 병원, 의사종류 차트의 지역조건이 되기 때문에 페이지 로드하자마자 실행
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
//   alert("클릭한 지역 이름: " + geoValNm);
//   alert("클릭한 지역 코드: " + geoValCd);
  
  //input hidden 값으로 설정(ajax_controller로 지역 값 넘기기 위해)
  $("#geoClick").val(geoValNm);
  alert("클릭한 지역 input hidden: " + $("#geoClick").val());
  
  //한반도 차트 클릭시 Ajax 함수 사용할 수 있게 작성
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
//페이지 로드되자마자 진행되지 않고 전국 or 지역 선택시 작동할 수 있도록 함수로 감싸기
/*https://www.amcharts.com/demos/column-with-rotated-series*/
function fn_createHpChart(redata) {
	
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
	  categoryField: "kind_nm",
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
	  valueYField: "kind_tot",
	  sequencedInterpolation: true,
	  categoryXField: "kind_nm",
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
	
	//JSON이 아닌 JS객체로 보여야 차트 동작
	var data = redata;
	
	xAxis.data.setAll(data);
	series.data.setAll(data);
	
	// Make stuff animate on load
	// https://www.amcharts.com/docs/v5/concepts/animations/
	series.appear(1000);
	chart.appear(1000, 100);
	
	}) // end am5.ready()
}


//right div's height 맞게  left div's height 동일하게 설정  
$(document).ready(function(){
    
    $('.contain').each(function(){  //컨테인
        
        var highestBox = 0;
        $('.right', this).each(function(){ //양쪽에 있는 디브 안에 있는 디브(내용물)
        
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