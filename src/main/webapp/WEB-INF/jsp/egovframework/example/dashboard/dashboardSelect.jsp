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
<script src="https://cdn.amcharts.com/lib/5/fonts/notosans-sc.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/data/countries.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/data/countries2.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>

<!-- 카카오맵 API -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76a089e067cc1b79272edcd263efb64f&libraries=services,clusterer,drawing"></script>


<!-- header -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/header.jsp"></jsp:include>

<style type="text/css">

.contain{ 
  	display: flex;
	margin: 1rem 7% 3rem 7%;
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
/*   height: 10rem; */
	justify-content: center;
  
  
}


.box1{
	display: flex;
	flex-direction: column;
/* 	justify-content: center; */
	
	
}

#geoTitle1 {
	text-align: center;
	margin-left:auto;
	margin-right:auto;
	margin-bottom: 1rem;
	margin-top:1rem;
	background: #e4eaf1;
	font-size: 1.4rem;
	font-weight: bold;
 	width: 8rem;
	border-radius: 0.5rem;
	
}

.searchT{
 	text-align: center;
  	margin: 0 1rem 0.5rem 0;
/*  	margin-bottom: 1rem;  */
	background: #e4eaf1;
	font-size: 1rem;
	font-weight: bold;
	width: 5.5rem;
	border-radius: 0.5rem;
/* 	padding: 10 10 10 10; */
}

#docTitle {
	margin-bottom: 0.1rem;

}

#docTitle2{
	margin-top: 0.1rem; 
	margin-bottom: 0.3rem; 
	font-size: 1rem;
}

.search{
 	display : flex; 
 	justify-content : center; 
 	align-items : center; 
	flex-direction: column; 
}

.searchSelect{
	display : flex; 
	border-radius: 0.5rem;
}

select, input {
	height: 1.7rem;
	border-radius: 0.5rem;
}


.Sclick{
	width: 8rem;
	height: 2rem;
	text-align: center;
	background: #e4eaf1;
	border-radius: 3rem;
	font-size: 1rem;
	font-weight: bolder;
}

.searchHnm{
	display: flex;
	 justify-content: space-between;
}

.table tr {
	text-align: center;
}


.paging_area {
	text-align: center;
	margin-bottom: 2rem;
}

#map {
	width:400px; 
	height:400px;
	border: 3px solid orange;
}

    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}


</style>





<title>대시보드2</title>
</head>
<body>
<div class="contain">

	<input type="hidden" id="geoClick" value=""/>
	<input type="hidden" id="sigungu_cd" value=""/>
	<input type="hidden" id="kind_cd" value=""/>
	<input type="hidden" id="hos_nm" value=""/>
	<div class="box1 left" style="border: 1px solid black">
<!-- 	<div class="box1 left"> -->
		<div id="geoTitle1" class="geoTitle"></div>
		<div>
			<a href="/dash/dashboardSelect.do">
				<img src="${pageContext.request.contextPath}/images/egovframework/dashboard/all.png" style="width: 3rem; height: 3rem;">
			</a>
		</div>
			<div>
			<div id="chartdiv" style="width: 100%; height: 500px;"></div>
			</div>
	</div><!-- box1 -->
	<div class="box2 right" style="border: 1px solid red;">
<!-- 	<div class="box2 right"> -->
		<div class="box2-1" style="border: 1px solid black">
<!-- 		<div class="box2-1" > -->
				<div class="search" id="search" style="border: 1px solid gray;">
					<div class="searchSelect" style="margin-bottom: 0.5rem;">
						<div class="searchT" style="margin-right: 0.5rem; margin-left: 0">시/군/구</div>
						<select id="selectsigungu" style="margin-right: 1rem;">
							<option value="" >시/군/구</option>
						</select>
						<div class="searchT"style="margin-right: 0.5rem;">병원종류</div>
						<select id="selectHkind">
							<option value="" >병원종류</option>
						</select>
					</div>
					<div class="searchSelect searchHnm" style="margin-bottom: 0.5rem;">
					
						<div class="searchT">병원이름</div>
						<input type="text" id="searchText" placeholder="병원이름을 입력해주세요." style="width: 19rem;"/>
					</div>
					<div class="searchSelect">
						<a href="javascript:fn_HospitalSearch()" id="btnSearch" name="btn"><div class="Sclick" >검 색</div></a>
					</div>
				</div><!-- search -->
			
			<div class="clickedGeo"></div>
		</div> <!-- box2-1 -->	
		<div class="box2-2" style="border: 1px solid black; height: 500px;">
<!-- 		<div class="box2-2"> -->
			<div id="table">
				<table class="table table-hover">
					<thead>
						<tr>
							<th class="col-12" >병원이름</th>
						</tr>
					</thead>
					<tbody id="hpListTbody"></tbody>
				</table>
				<div class="paging_area"  id="hpPagination"> </div>
			</div>

		</div> <!-- box2-2 -->	
		
	</div><!-- box2 -->
	<div class="box3 last" style="border: 1px solid blue; height: 100%;">
		<div>
			
		</div>
		
		<div id="map"></div>
	
	</div><!-- box3 -->
</div><!-- contain  -->

<!-- 	<div class="box3"> -->
<!-- 	</div> -->

</body>




<script type="text/javascript">




	//페이지네이션 설정
	var pageSize = 10;     
	var pageBlockSize = 5;  

    /** OnLoad event */
    $(function() {
    	//처음 페이지 로드할 때 전국 데이터 활용한 차트 보여주기
    	fn_chartClick();
    	fn_searchText();
    });

//선택한 지역 sido_nm 표기
function fn_clickChk(redata) {
	var clickData = redata.sido_nm;
	document.getElementById('geoTitle1').innerHTML =  clickData;
}    
    
    
//한반도 차트에서 지역 선택시 반응하는 Ajax
//-> 선택한 지역에 맞는  select (시/군/구 , 병원종류) 옵션 보이게 설정
function fn_chartClick(geoClick) {
	
	$.ajax({
	    url: '/dash/dashGeoClickSelect.do',
	    type: 'post',
	    data: { "geoClick": geoClick},
	    dataType: 'json',
	    success: function(data){ 
	        
	    	console.log( "에이젝스 리턴 데이터 확인 : " + JSON.stringify(data) );
	    	
	    	var sidoCd = data.clickGeoNm.sido_cd;

	    	//선택한 지역 표기(전국 or 지역)
	    	fn_clickChk(data.clickGeoNm);
	    	
	    	
	    	$("#geoClick").val(sidoCd);
	    	
	    	//선택한 지역의 시군구 리스트 전달
	    	fn_hopitalSelectList(data);
	    },
	    error: function(){
	        alert("실패실패22");
	    }
	})
};

//검색눌렀을 때 선택 조건에 맞는 병원 검색
function fn_HospitalSearch(pagenum) {
	
	pagenum = pagenum || 1;
	
	var pdata = {
					sigungu_cd : $("#selectsigungu").val()
				   ,kind_cd : $("#selectHkind").val()
				   ,hos_nm : $("#searchText").val()
				   ,pageSize : pageSize
				   ,pageBlockSize : pageBlockSize
				   ,pagenum : pagenum
				}
	
	$.ajax({
	    url: '/dash/HospitalSearchList.do',
	    type: 'post',
	    data: pdata,
	    dataType: 'text',
	    success: function(data){ 
	    	console.log( "에이젝스 리턴 데이터 확인 : " + data );
			
			$("#hpListTbody").empty().append(data);
			
			var  totalcnt = $("#totalcnt").val();
			
			console.log("totalcnt : " + totalcnt);
			
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_HospitalSearch');
			console.log("paginationHtml : " + paginationHtml);
			 
			$("#hpPagination").empty().append( paginationHtml );
			
			$("#pageno").val(pagenum);

	    },
	    error: function(){
	        alert("실패실패22");
	    }
	})
};

//아직 안됨 추후 수정필요
function fn_searchText(){
	$('#searchText').keypress(function(event){
	     if ( event.which == 13 ) {//엔터쳤을 때 검색되게하는 코드
	         $('#btnSearch').click();
	         return false;
	     }
	})
};


function fn_dashSelectOne(data) {
	
	$.ajax({
	    url: '/dash/dashGeoClickSelectOne.do',
	    type: 'post',
	    data: {hos_cd : data},
	    dataType: 'json',
	    success: function(data){ 
	    	console.log( "에이젝스 대시 셀렉트원 리턴 데이터 확인 : " + data );
			
			/*
			//카카오맵 API
			const container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			let options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
				level: 3 //지도의 레벨(확대, 축소 정도)
			};
			let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			*/
			
			
			
			var mapContainer = document.getElementById('map'), // 지도의 중심좌표
		    mapOption = { 
		        center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    }; 
	
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			

			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {

			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        
						// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
						kakao.maps.event.addListener(marker, 'click', function() {
						    overlay.setMap(map);
						});
						
						
						  // 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
					      kakao.maps.event.addListener(map, "click", function () {
					          overlay.setMap(null)
					        })     
			
			
			     // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			
			/*
			// 지도에 마커를 표시합니다 
			var marker = new kakao.maps.Marker({
			    map: map, 
			    position: new kakao.maps.LatLng(33.450701, 126.570667)
			});
			*/

	
			// 커스텀 오버레이에 표시할 컨텐츠 입니다
			// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
			// 별도의 이벤트 메소드를 제공하지 않습니다 
			var content = '<div class="wrap">' + 
			            '    <div class="info">' + 
			            '        <div class="title" style="background : gray;">' + 
			            '            카카오 스페이스닷원' + 
			            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
			            '        </div>' + 
			            '        <div class="body">' + 
			            '            <div class="img">' +
			            '                <img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/thumnail.png" width="73" height="70">' +
			            '           </div>' + 
			            '            <div class="desc">' + 
			            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
			            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
			            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
			            '            </div>' + 
			            '        </div>' + 
			            '    </div>' +    
			            '</div>';
	
			// 마커 위에 커스텀오버레이를 표시합니다
			// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
			var overlay = new kakao.maps.CustomOverlay({
			    content: content,
			    map: map,
			    position: marker.getPosition()       
			});
	
	    }//if
     })//geocoder.addressSearch
			
			

			
	    },
	    error: function(){
	        alert("실패실패22");
	    }
	})
	
}
	





//Ajax 응답데이터로 받은 시군구 리스트를 select list option으로 보여주기
function fn_hopitalSelectList(redata) {
	
	var hopitalGeoList = redata.dashgeoSelectList;
	var hopitalKindList = redata.dashHpKindVO;
	
	 $('#selectsigungu option').remove();
	 $('#selectHkind option').remove();

	for(var i=0; i<hopitalGeoList.length; i++){
		var sggValue = hopitalGeoList[i].sigungu_cd;
		var sggKey = hopitalGeoList[i].sigungu_nm;
		$("#selectsigungu").append("<option value='" + sggValue + "'>"+ sggKey +"</option>");
	}
	
	for(var i=0; i<hopitalKindList.length; i++){
		var hpkValue = hopitalKindList[i].kind_cd;
		var hpkKey = hopitalKindList[i].kind_nm;
		$("#selectHkind").append("<option value='" + hpkValue + "'>"+ hpkKey +"</option>");
	}
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
  
  //input hidden 값으로 설정(ajax_controller로 지역 값 넘기기 위해)
  $("#geoClick").val(geoValNm);
//   alert("클릭한 지역 input hidden: " + $("#geoClick").val());
  
  //한반도 차트 클릭시 Ajax 함수 사용할 수 있게 작성
  fn_chartClick($("#geoClick").val());
  
});

polygonSeries.mapPolygons.template.states.create

	 ("hover", {fill: am5.color(0x677935)})
	;

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
 // var title = "";
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
//     text: title,
    background: am5.RoundedRectangle.new(root, {
      fill: am5.color(0xffffff),
      fillOpacity: 0.2
    })
  }))
}


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
        $('.last',this).height(highestBox);
        
	});    
});





</script>

<!-- 카카오 맵 api JS 앱키 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=76a089e067cc1b79272edcd263efb64f"></script>



<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>

</html>