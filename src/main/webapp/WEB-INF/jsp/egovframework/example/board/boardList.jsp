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

.paging_area {

	text-align: center;
	margin-bottom: 2rem;
}

.contWrite{
	display:flex;
	background: #e2e2e2;
	border-radius: 0.3rem;
	padding: 0.3rem 0.7rem; 
	font-weight: bold;
	text-align: center;
	height: 2.5rem; 
	width: 6.5rem;
	margin-right: 1rem;
	margin-bottom: 2rem;
	align-items: center;
    justify-content: center;
    margin-left:auto;
}

</style>


<script type="text/javascript">

	//페이지네이션 설정
	var pageSize = 10;     
	var pageBlockSize = 5;    
	
    /** OnLoad event */
    $(function() {
    	fn_btn()
    	fn_boardlist();
    	fn_searchText();
    });
	
    //버튼 기능 부여
    function fn_btn(){
		$('a[name=btn]').click(function(e) {
			e.preventDefault();
			
			var btnId = $(this).attr('id');

			switch (btnId) {
				case 'btnSearch' :
					fn_boardlist();
				break;
    	
			}
		})
	};
/*	
	function fn_paginationBTN(){
	    	
			$('.Pnum').click(function(e) {
		        $(this).css({
		            "border": "0.3rem solid rgb(163, 151, 198)",
		            "border-radius": "50%",
		            "background" : "black"
		            
		        });
		    });
		}*/
	
	//검색어 입력 후 엔터 사용시 검색 가능하게 하는 함수	
	function fn_searchText(){
		$('#searchText').keypress(function(event){
		     if ( event.which == 13 ) {//엔터쳤을 때 검색되게하는 코드
		         $('#btnSearch').click();
		         return false;
		     }
		})
	};
    
	//게시판 게시글 목록 및 검색 결과 목록 가져오는 함수
	function fn_boardlist(pagenum) {
		
		pagenum = pagenum || 1;
		
		var param = {
			selectSearch : $("#selectSearch").val()
		  , searchText : $("#searchText").val()
		  , pageSize : pageSize				//한 페이지에 보일 게시글 개수
		  , pageBlockSize : pageBlockSize	//페이지네이션 개수
		  , pagenum : pagenum				//현재 페이지네이션 번호
		}
		 
		var listcollabck = function(returnvalue) {
			
			//게시판 목록 테이블 tbody에 응답데이터 추가
			$("#boardListTbody").empty().append(returnvalue);
			//게시글 총 개수
			var  totalcnt = $("#totalcnt").val();
			//페이지네이션 함수
			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize, pageBlockSize, 'fn_boardlist');
			console.log("paginationHtml : " + paginationHtml);
			//페이지네이션 추가
			$("#boardPagination").empty().append( paginationHtml );
// 			$("#pageno").val(pagenum);
		}
		callAjax("/board/boardList.do", "post", "text", false, param, listcollabck) ;
	};
	
	//게시글 한 글 조회(Ajax버전)
	function fn_boardSelectOne(no) {
		
		var param = {
				board_no : no
		}
		
		var selectoncallback = function(returndata) {			
			console.log( JSON.stringify(returndata) );
			
			var cont = returndata
			
			$("#boardSelectOne").empty().append( cont );
			$("#table").hide();
			$("#search").hide();
			$("#search").hide();
			
		}
		
		callAjax("/board/boardSelectOne.do", "get", "text", false, param, selectoncallback) ;
		
	}
	
	
	
	
</script>



</head>
<body>
	<div class="contain d-flex flex-column min-vh-100"><!-- container -->
	<h1 class="boardTitle">자유게시판</h1>
	<div id="boardSelectOne"></div>
		<div class="search" id="search">
			<select id="selectSearch">
				<option value="" >전체</option>
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="writer">작성자</option>
			</select>
			<input type="text" id="searchText"/>
			<a href="" id="btnSearch" name="btn">
			<div class="Sclick" >검 색</div>
			</a>
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
				<tbody id="boardListTbody"></tbody>
			</table>
			<div class="paging_area"  id="boardPagination"> </div>
			<a href="/board/boardWrite.do"><div class="contWrite">작 성</div></a>
		</div>
	</div><!-- container -->
	
	
</body>

<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>


</html>