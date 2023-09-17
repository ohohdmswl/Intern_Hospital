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
    
	border: 0.35rem solid #e2e2e2; 
	border-radius: 1.4rem;
	
	padding: 1rem;
	
}

.contTitle1 {
	display:flex;
	
}

.contTitle2 {
	
}

.contCont {


	height: auto; 
	min-height: 27rem; 
	width: 800px;
	padding: 1rem 1rem;
	


}

.contD{
	background: #e2e2e2;
	border-radius: 1.8rem;
	padding: 0.3rem 0.7rem; 
	font-weight: bold;
	margin-right: 0.2rem;
	display: inline-block;
	width: 6rem;
	height: 2.5rem;
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

table {
	border-collapse: collapse;
	margin-left: 0;
	margin-right: 0;
	width: auto;

}

.InText{
	width: 600px;
	border-radius: 0.3rem;
	border: 1;
}

tr {
	height: 3rem;

}

.contTh {
	width: 10rem;
	text-align: center;
}


.board1, .board2 {
	margin-top: 1rem;
	margin-bottom: 1rem;

}


</style>

<script type="text/javascript">

	/** OnLoad event */
	$(function() {

		fn_writeUpdateBtn();
		//수정시 이전 게시글 내용 조회되도록 게시글 번호 받아오는 함수
		fn_writeOrUp();
	});
	
	//새 글 작성, 수정시 보이는 버튼 다르게 작성
	function fn_writeUpdateBtn() {
		
		//input hidden에 있는 board_no 확인해 insert or update 구분
		var boardNO = ${board_no};
		
		if(boardNO == 0){ //새 글 작성
			//수정용 저장 버튼 숨김
			$('.contUpB').hide();
			$('.contUpCancel').hide();
		
		} else{ //글 수정
			//새글 작성 버튼 숨김
			$('.contInsertB').hide();	
			$('.contList').hide();	
		}
	};
	
	
	//게시글 수정시 새 게시글 작성인지 수정인지 구분함수
	//보드번호가 0이면 새 글, 0이 아니면 수정 -> 한 글 조회 해서 값 표출
	function fn_writeOrUp() {
		
		var boardNO = ${board_no};
		
		fn_boardSelectOne(boardNO)
	}
	
	
	
	//게시글 한 글 조회
	function fn_boardSelectOne() {
		
		var boardNO = ${board_no};
		
		var param = {
				board_no : boardNO
		}
		
		var selectoncallback = function(data) {			
			console.log( JSON.stringify(data) );
			
			$("#conTitle").val(data.boardSelectOne.board_title);
			$("#conWriter").val(data.boardSelectOne.board_writer);
			$("#conCont").val(data.boardSelectOne.board_cont);
			$("#board_no").val(data.boardSelectOne.board_no);
		}
		
		callAjax("/board/boardSelectOne.do", "post", "json", false, param, selectoncallback) ;
		
	}
	

	//게시글 입력 값 유효성 검사(공백 검사 및 비밀번호 숫자 4자리 검사)
	function fn_validation() {
		
		var board_title = $("#conTitle").val()
		var board_writer = $("#conWriter").val()
		var board_pw = $("#conPw").val()
		var board_cont = $("#conCont").val()

		if ( $("#conTitle").val().trim() == "" ){
			alert("제목을 입력해주세요(공백불가).");
			$("#conTitle").focus();
			return false;
		}
		
		
		if ($("#conWriter").val().trim() == ""){
			alert("작성자를 입력해주세요(공백불가).");
			$("#board_writer").focus();
			return false;
		}
		
		if ($("#conCont").val().trim() == ""){
			alert("내용을 입력해주세요(공백불가).");
			$("#board_cont").focus();
			return false;
		}
		
		var LcdChk = /^[0-9]{4}$/;
		if(!LcdChk.test(board_pw)){
			alert("비밀번호는 4자리 숫자만 가능합니다.");
			$("#conPw").focus();
			return false;
		} 
		
	}
	
	
	
	
	
	
	//게시글 작성
	function fn_boardInsert() {
		
		if(fn_validation()==false){ //유효성 검사 실패
			return;
		}// 유효성 검사 성공 
		
		var pdata = { "board_title": $("#conTitle").val()
				     ,"board_writer":  $("#conWriter").val()
				     ,"board_pw":  $("#conPw").val()
				     ,"board_cont":  $("#conCont").val()
				     };
		
		$.ajax({
		    url: '/board/boardInsert.do',
		    type: 'post',
		    data: pdata,
		    dataType: 'json',
		    success: function(data){ 
		        
				if(data.returnInsert > 0){
					alert("정상적으로 등록되었습니다.");
					//게시판 첫 화면으로 이동
					location.href = "/board/boardView.do";
				} else {
					alert ("정상적으로 등록되지 않았습니다.");
				};
				
		    },
		    error: function(){
		        alert("실패실패22");
		    }
		});
	}
	
	
	function fn_boardUpdate() {
		
		if(fn_validation()==false){ //유효성 검사 실패
			return;
		}// 유효성 검사 성공 
		
		var pdata = {
					   "board_no" : $("#board_no").val()
					  ,"board_title": $("#conTitle").val()
			     	  ,"board_writer":  $("#conWriter").val()
			     	  ,"board_pw":  $("#conPw").val()
			     	  ,"board_cont":  $("#conCont").val()
		     		};
		
		$.ajax({
		    url: '/board/boardUpdate.do',
		    type: 'post',
		    data: pdata,
		    dataType: 'json',
		    success: function(data){ 
		        
		        
				if(data.returnUpdate > 0){
					alert("정상적으로 수정되었습니다.");
				} else {
					alert ("정상적으로 수정되지 않았습니다.");
				};
					//게시글 한 글 조회 페이지 이동
					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
		    },
		    error: function(){
		        alert("실패실패");
		    }
		});
	}
	

</script>


<!-- <body> -->

<form action="" id="boardWU">
	<input type="hidden" id="board_no" value=""/>
	


	<h1 class="boardTitle">자유게시판</h1>
	<div class="contain d-flex flex-column min-vh-100"><!-- container -->
			<div class="selectCont" style=" height: auto; width: 800px; ">
				<div class="contTitle1" style="height: auto; width: 800px;">
					<table class="board1">
						<tr>
							<td class="contTh"><span class="contD">제 목</span></td>
							<td><input class="InText" id="conTitle" type="text" value="" placeholder="제목을 입력해주세요."/></td>
						</tr>
						<tr>
							<td class="contTh"><span class="contD">작성자</span></td>
							<td><input class="InText" id="conWriter" type="text" value="" placeholder="작성자 이름을 입력해주세요."/></td>
						</tr>
						<tr>
							<td class="contTh" ><span class="contD">비밀번호</span></td>
							<td><input class="InText" id="conPw" type="password" value="" placeholder="4자리 숫자를 입력해주세요."/></td>
						</tr>
					</table>
				</div><!-- contTitle -->
				<div class="contTitle2" style="height: auto; width: 800px; ">
					<table class="board2">
						<tr>
							<td class="contTh"><span class="contD">내용</span></td>
							<td><textarea class="InText" id="conCont" rows="15" cols="" placeholder="내용을 입력해주세요."></textarea></td>
						</tr>
					
					</table>
				</div>
				</div><!-- selectCont -->
		<!-- 		<div class="contCont" >
					<table>
						<tr>
							<td><span class="contD">내 용</span></td>
							<td><input class="InText" type="text" value=""/></td>
						</tr>
					</table>
				</div>
		 -->	
				<div class="contB">
					<a href="/board/boardView.do" class="contList"><div class="contBTN contList" id="contList">취소</div></a>
					<a href="javascript:history.back(-1)" class="contUpCancel"><div class="contBTN  contUpCancel" >취소</div></a>
					<a href="javascript:fn_boardInsert()" class="contInsertB"><div class="contBTN contInsertB">저장</div></a>
					<a href="javascript:fn_boardUpdate()" class="contUpB"><div class="contBTN contUpB">저장</div></a>
				</div>
	</div><!-- container -->
</form>
<!-- </body>			 -->
					
<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>
	
