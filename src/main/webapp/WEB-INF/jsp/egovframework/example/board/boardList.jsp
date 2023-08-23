<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- header -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/header.jsp"></jsp:include>
  
<title>자유게시판</title>

<style>

.contain{ 
  	display: flex;
	margin-left: 12%;
	margin-right: 12%;
	font-family: 'Orbit', sans-serif;z;
 	flex-direction: column;
    align-items: center;
    height: auto;
  	min-height: 100%;
 	padding-bottom: 10rem;
}

.boardTitle {
	display: flex;
	text-align: center;
	margin-top: 2rem;
 	margin-bottom: 2rem;
 	font-weight: bolder;
}

.search{
	display: flex;
	background-color: #e4eaf1;
	border-radius: 0.3rem;
	width: 42rem;
	height: 4rem;
	margin-bottom: 2rem;
	align-items: center;
	justify-content: center;
	
}

#selectSearch {
	width: 7rem;
	height: 1.8rem;
	border-radius: 0.3rem;
 	font-size: 1rem; 
	text-align: center;
	margin-right: 1rem;
}

#searchText{
	width: 25rem;
	height: 1.8rem;
	border-radius: 0.3rem;
 	font-size: 1rem; 	
	text-align: center;
	margin-right: 1rem;
}

.Sclick {
	width: 4rem;
	height: 1.8rem;
	border-radius: 0.3rem;
 	font-size: 1rem;
	text-align: center; 
	border: 0;
	background-color: #becef1;
	font-weight: bold;

}

.table {
	width: 63rem;
	

}

.table tr {
	text-align: center;
}

</style>

</head>
<body>
	<div class="contain d-flex flex-column min-vh-100"><!-- container -->
	<h1 class="boardTitle">자유게시판</h1>
		<div class="search">
			<select id="selectSearch">
				<option value="" >전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" id="searchText"/>
			<div class="Sclick">검 색</div>
		</div>
		<div id="table">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="col-1">번호</th>
						<th class="col-6">제목</th>
						<th class="col-2">작성자</th>
						<th class="col-2">작성일</th>
						<th class="col-1">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.board_no}" /></td>
							<td><c:out value="${list.board_title }" /></td>
							<td><c:out value="${list.board_writer }" /></td>
							<td><c:out value="${list.board_date }" /></td>
							<td><c:out value="${list.board_hit }" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div><!-- container -->
	
	
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>


</html>