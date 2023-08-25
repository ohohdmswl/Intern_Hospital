<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">

.footer {
	display: flex;
	flex-direction: row;
	background: #becef1;
	height: 10rem;
	position : relative;
	transform : translateY(-100%);
	font-family: 'Orbit', sans-serif;
	justify-content: center;
	align-items: center;
}

.footer > .hospitalImg {
	margin-right: 3rem;

}

#titleNM {
	font-size: 1.8rem;
	font-weight: bold;
	
}


.footerContain {

}

.introduce {
	font-size: 1rem;
	font-weight: 500;
	margin : 0rem;
}




</style>

</head>
<body>
	<footer class="footer mt-auto">
		<div class="hospitalImg">
			<img src="${pageContext.request.contextPath}/images/egovframework/layout/hospitalIcon.png" style="width: 7.5rem; height: 7.5rem;">
		</div>
		<div class="footerContain">
			<p id="titleNM">병원찾GO</p>
			<P class="introduce">여러분이 찾는 국내의 병원은 모두 다 병원찾GO!</P>
			<P class="introduce">병원찾GO에서 여러분에게 필요한 병원정보를 찾GO, 후기를 확인할 수 있습니다.</P>
			<P class="introduce">주소 : (08389) 서울특별시 구로구 디지털로 272, 704호 (구로동, 한신IT타워)</P>
			<P class="introduce">TEL : 02-2108-7211</P>
		</div>
	</footer>



</body>
</html>