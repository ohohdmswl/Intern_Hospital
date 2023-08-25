<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- font -->
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Orbit&display=swap" rel="stylesheet">

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>

<!--common.js  -->
<script type="text/javascript" charset="utf-8" src="../js/common.js"></script>
<!-- commonAjax.js -->
<script type="text/javascript" charset="utf-8" src="../js/commonAjax.js"></script>


<style>
body, ui, li {
    margin: 0;
    padding: 0;
}

.contain{
	 
	
}
.nav{
	display: flex;
	flex-direction: column;
}

.title, .menu {
	width: 100vw;
/* 	font-family: 'IBM Plex Sans KR', sans-serif; */
	font-family: 'Orbit', sans-serif;
}

.title{
	background: #fefefe;
	height: 4rem;
	display: flex;
	justify-content: center;
	font-weight: bolder;
	margin-top: 0.5rem;
	align-items: center;

}


.title > div > p {
	font-size: 2rem;
	margin: 0 0 0.5rem 0.5rem;
	letter-spacing:0.1rem;
	
}

.hospitalImg {
	margin: 0 0.5rem 0 0;
}

.menu{
  	background: #becef1; 
	height: 3.5rem;
	display: flex;
	justify-content: center;
	align-item: center;
	margin: 0;
}

ul, li {
	list-style:none;
	font-weight: bolder;
	font-size: 1.5rem;
	padding: 0;
	margin: 0;
	

  
}
.menuA {
	margin-top : 0px;
	text-decoration: none;
	color: black;
	
}

.menuA:hover {
	color: white;


}
.menuList {
	display: flex;
	padding-left: 0px;
	margin: 0;
	align-content: center;
    align-items: center;
	

}

.menuItem {
	
	margin-right: 7rem;
	color: black

}

.menuItem:last-child {
  	margin-right: 0;
}



</style>


</head>


<body>

	<div class="nav"><!-- nav -->
		<div class="title"><!-- title -->
			<div class="hospitalImg">
				<img src="${pageContext.request.contextPath}/images/egovframework/layout/hospitalIcon.png" style="width: 3rem; height: 3rem;">
			</div>
			<div><p>병원찾GO</p></div>
		</div >
		<div class="menu"><!-- menu -->
			<ul class="menuList">
				<li class="menuItem">
					<a class="menuA" href="../dashboardList.do">대시보드1</a>
				</li>
				<li class="menuItem">
					<a class="menuA">대시보드2</a>	
				</li>
				<li class="menuItem">
					<a class="menuA" href="/board/boardView.do">자유게시판</a>
				</li>
			</ul>
		
		</div>
	</div><!-- nav -->

</body>
</html>