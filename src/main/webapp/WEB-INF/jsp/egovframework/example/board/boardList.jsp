<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
    margin: 0;
    padding: 0;
}
.nav{
	display: flex;
	flex-direction: column;
}

.title, .menu {
	height: 10rem;
	width: 100vw;
}

.title{
	background: gray;
}

.menu{
	background: blue;
}


.container{
	display: grid;
}
</style>



</head>
<body>
	<div class="nav"><!-- nav -->
		<div class="title"><!-- title -->
		
		</div >
		<div class="menu"><!-- menu -->
		
		</div>
	</div><!-- nav -->
	
	<div class="container"><!-- container -->
	<h3>test_board Page</h3>
		<div id="table">
			<table class="custom-table">
				<thead>
					<tr>
						<th>순번</th>
						<th>이름</th>
						<th>나이</th>
						<th>내용</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.bno }" /></td>
							<td><c:out value="${list.name }" /></td>
							<td><c:out value="${list.age }" /></td>
							<td><c:out value="${list.content }" /></td>
							<td><c:out value="${list.regdate }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><!-- container -->
</body>
</html>