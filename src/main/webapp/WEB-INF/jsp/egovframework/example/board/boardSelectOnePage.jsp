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
	
	//목록 버튼 클릭 시 게시판 목록으로 이동
	function fn_contList() {
		$("#contList").click(function (e) {
			 $("#contList").attr("href", "/board/boardList.do");

		})
	};
	
	//게시글 삭제시 비밀번호 확인
	function fn_boardDelPw(no) {
		
		var boardPW = prompt('삭제를 위한 게시글 비밀번호 숫자 4자리를 입력해주세요', '4자리 숫자 비밀번호를 입력해주세요');
		var pw = Number(boardPW);
		var dataPw = { "board_no": no, "board_pw": pw };
		
		$.ajax({
		    url: '/board/boardPwChk.do',
		    type: 'post',
		    data: dataPw,
		    dataType: 'json',
		    success: function(data){ 
		        console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        
				if(data.returnPw > 0){
					//비밀번호가 맞을 경우 삭제 함수 진행
					fn_boardDel(data.board_no);
				} else {
					alert("게시글 비밀번호가 틀렸습니다");
					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
				};
		    },
		    error: function(){
		        alert("실패실패");
		    }
		});
	}
	
	
	
	//게시글 삭제
	function fn_boardDel(no) {
		
		$.ajax({
		    url: '/board/boardDel.do',
		    type: 'get',
		    data: 'board_no=' + no,
		    dataType: 'json',
		    success: function(data){ 
		        console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        
				if(data.returnDel > 0){
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
	
		
		

	//수정시 비밀번호 체크
	function fn_boardUpdatePwChk(no) {
		
		var boardPW = prompt('수정을 위한 게시글 비밀번호 숫자 4자리를 입력해주세요', '4자리 숫자 비밀번호를 입력해주세요');
		var pw = Number(boardPW);
		var dataPw = { "board_no": no, "board_pw": pw };
		
		
		$.ajax({
		    url: '/board/boardPwChk.do',
		    type: 'post',
		    data:  dataPw,
		    dataType: 'json',
		    success: function(data){ 
		    	console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        
				if(data.returnPw > 0){
// 					alert("비밀번호 확인 완료.");

					//에이젝스로 셀렉트원 다시 해서 - 값 채우기
					//작성페이지넘겨서 값 el로 받고 글 작성 페이지로 이동
					location.href = "/board/boardWrite.do?board_no=" + JSON.stringify(data.board_no);

				} else {
					alert ("게시글 비밀번호가 틀렸습니다.");
					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
				};
		    },
		    error: function(){
		        alert("실패실패22");
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
					<a href="javascript:fn_boardDelPw('${boardSelectOne.board_no}')"><div class="contBTN contDel">삭제</div></a>
					<a href="javascript:fn_boardUpdatePwChk('${boardSelectOne.board_no}')"><div class="contBTN contup">수정</div></a>
				</div>
	</div><!-- container -->
</body>			
					
<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>
	
