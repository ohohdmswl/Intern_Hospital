<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/header.jsp"></jsp:include>

<title>자유게시판</title>

<style>

.boardTitle {
	display: flex;
	text-align: center;
	margin-top: 2rem;
 	margin-bottom: 2rem;
 	font-weight: bolder;
	font-family: 'Orbit', sans-serif;z;
	justify-content: center
	}

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

.selectCont {
	display: flex;
	flex-direction: column;
    align-items: center;
    margin-top: 2rem;
    margin-bottom: 2rem;
    
	border: 0.3rem solid #becef1; 
	border-radius: 0.8rem;
	
}

.contTitle {
	border: solid #becef1; 
	border-width: 0px 0px 0.3rem 0px ;
}

.contCont {


	height: auto; 
	min-height: 27rem; 
	width: 800px;
	padding: 1rem 1rem;
	


}

.contD{
	background: #becef1;
	border-radius: 0.3rem;
	padding: 0.3rem 0.7rem; 
	font-weight: bold;
	margin-right: 0.2rem;
	
}


.contBTN{
	background: #e2e2e2;
	border-radius: 0.3rem;
	padding: 0.3rem 0.7rem; 
	font-weight: bold;
	text-align: center;
	height: 2.5rem; 
	width: 6.5rem;
	margin-right: 1rem;
	
	
}

.contB{
	display: flex;
	flex-direction: row;
	justify-content: center;
	margin-bottom: 2rem;

}
</style>

<script type="text/javascript">

	/** OnLoad event */
	$(function() {
		//fn_contList();

		
		
		
	});
	
	function fn_contList() {
		$("#contList").click(function (e) {
			 $("#contList").attr("href", "/board/boardList.do");

		})
	};
	
	
	function fn_boardDel(no) {
		
		$.ajax({
		    url: '/board/boardDel.do',
		    type: 'get',
		    data: 'board_no=' + no,
		    dataType: 'json',
		    success: function(data){ 
		        console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        console.log("data.returnDel 확인" +  JSON.stringify(data.returnDel));
		        console.log("data.board_no 확인" +  JSON.stringify(data.board_no));
		        
				if(returnDel > 0){
					alert("정상적으로 삭제되었습니다.");
					location.href = "/board/boardView.do";
				} else {
					alert ("삭제되지 않았습니다.");
					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
				};
		    },
		    error: function(){
		        alert("실패실패");
		    }
		});
	}
	
	


</script>


<body>
	<input type="hidden" id="board_no" value="${boardSelectOne.board_no}"/>
	


	<h1 class="boardTitle">자유게시판</h1>
	<div class="contain d-flex flex-column min-vh-100"><!-- container -->
			<div class="selectCont" style=" height: auto; width: auto; ">
				<div class="contTitle" style="height: 9rem; width: 800px;">
					<P style="font-size: 2rem; font-weight: bold; padding:1rem 1rem; ">${boardSelectOne.board_title}</P>
					<div style="text-align: right; margin-right: 2rem; margin: 0.5rem 1rem;">
						<span class="contD"">작성자</span>
						<span>${boardSelectOne.board_writer}</span>
						<span class="contD">작성일</span>
						<span>${boardSelectOne.board_date}</span>
						<span class="contD">조회수</span>
						<span>${boardSelectOne.board_hit}</span>
					</div>
				</div>
				<div class="contCont" >
					${boardSelectOne.board_cont}
				</div>
			
			</div>
				<div class="contB">
					<a href="/board/boardView.do"><div class="contBTN contList" id="contList">목록</div></a>
					<a href="javascript:fn_boardDel('${boardSelectOne.board_no}')"><div class="contBTN contDel">삭제</div></a>
					<div class="contBTN contup">수정</div>
				</div>
	</div><!-- container -->
</body>			
					
<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>
	
