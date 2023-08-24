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
}

</style>



<title>대시보드1</title>
</head>
<body>
<div class="contain">
	<div class="box1" style="border: 1px solid black">
		<h3>한반도 차트</h3>
			<div>
			<p> 
				<span>test</span>
			</p>
			</div>
	</div><!-- box1 -->
	<div class="box2" style="border: 1px solid black">
		<div class="box2-1" style="border: 1px solid black">
			<p>병원종류 차트</p>
		</div> <!-- box2-1 -->	
		<div class="box2-2" style="border: 1px solid black">
			<p>의사종류 차트</p>
		</div> <!-- box2-2 -->	
	</div><!-- box2 -->
	
</div><!-- contain  -->

<!-- 	<div class="box3"> -->
<!-- 	</div> -->
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>

</html>