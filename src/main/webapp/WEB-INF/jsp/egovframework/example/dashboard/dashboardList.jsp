<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- header -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/header.jsp"></jsp:include>

<style type="text/css">

.contain{ 
  	display: flex;
	margin: 3rem 12% 3rem 12%;
	font-family: 'Orbit', sans-serif;z;
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
}

</style>



<title>대시보드1</title>
</head>
<body>
<div class="contain">
	<div class="box1">
		<h3>이곳엔 한반도 차트를 넣을거야</h3>
			<div>
			<p> 
				<span>하하하하하핳하</span>
			hello world</p>
			</div>
	</div><!-- box1 -->
	<div class="box2">
		<div class="box2-1">
			<p>여기엔 병원종류 차트를 넣을거야</p>
		</div> <!-- box2-1 -->	
		<div class="box2-2">
			<p>여기엔 의사종류 차트를 넣을거야</p>
		</div> <!-- box2-2 -->	
	</div><!-- box2 -->
	
</div><!-- contain  -->

<!-- 	<div class="box3"> -->
<!-- 	</div> -->
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>

</html>