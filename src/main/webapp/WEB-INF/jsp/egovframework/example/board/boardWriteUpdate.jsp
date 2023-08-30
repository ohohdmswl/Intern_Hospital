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
	border-radius: 0.8rem;
	
}

.contTitle1 {
	display:flex;
	
/* 	border: solid #becef1;  */
/* 	border-width: 0px 0px 0.3rem 0px ; */
}

.contTitle2 {
	
 	border: solid #e2e2e2;  
 	border-width: 0.35rem 0px 0px 0px ; 
}

.contCont {


	height: auto; 
	min-height: 27rem; 
	width: 800px;
	padding: 1rem 1rem;
	


}

.contD{
	
/* 	background: #becef1; */
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

	});
/*	
	function fn_contList() {
		$("#contList").click(function (e) {
			 $("#contList").attr("href", "/board/boardList.do");

		})
	};
	
	function fn_boardDelPw(no) {
		
		var boardPW = prompt('삭제를 위한 게시글 비밀번호 숫자 4자리를 입력해주세요', '4자리 숫자 비밀번호를 입력해주세요');
		var pw = Number(boardPW);
		
// 		alert("pw 확인" + pw);
		
		var dataPw = { "board_no": no, "board_pw": pw };
		
// 		alert("확인2" + dataPw);
		
		$.ajax({
		    url: '/board/boardDelPwChk.do',
		    type: 'post',
		    data: dataPw,
		    dataType: 'json',
		    success: function(data){ 
		        console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        console.log("data.returnPw 확인" +  JSON.stringify(data.returnPw));
		        console.log("data.board_no 확인" +  JSON.stringify(data.board_no));
		        
				if(data.returnPw > 0){
// 					alert("게시글 비밀번호가 맞았다!");
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
	
	*/
	
	
	
	function fn_boardInsert() {
		
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
		        
		    	console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        console.log("data.returnDel 확인" +  JSON.stringify(data.returnInsert));
		        
		        
				if(data.returnInsert > 0){
					alert("정상적으로 등록되었습니다.");
					location.href = "/board/boardView.do";
				} else {
					alert ("정상적으로 등록되지 않았습니다.");
// 					location.href = "/board/boardSelectOnePage.do?board_no=" + JSON.stringify(data.board_no);
				};
				
		    },
		    error: function(){
		        alert("실패실패22");
		    }
		});
	}
	
	/*
	function fn_boardInsert(no) {
		
		var no = no
		
		if(no == "" || no == null || no == undefined){
			board_no = 0;
		}
		
		var Pdata = { "board_no": no, "board_title": conTitle, "board_writer": conWriter, "board_pw": conPw, "board_cont": conCont };
		
		
		$.ajax({
		    url: '/board/boardWriteUpdate.do',
		    type: 'post',
		    data: Pdata,
		    dataType: 'json',
		    success: function(data){ 
		        
		    	console.log("data 응답 데이터 확인" +  JSON.stringify(data));
		        console.log("data.returnDel 확인" +  JSON.stringify(data.returnDel));
		        console.log("data.board_no 확인" +  JSON.stringify(data.board_no));
		        
		    },
		    error: function(){
		        alert("실패실패");
		    }
		});
	}
	*/

</script>


<!-- <body> -->

<form action="" id="boardWU">
	<input type="hidden" id="state" value=""/>
<%-- 	<input type="hidden" id="board_no" value="${board_no}"/> --%>
	


	<h1 class="boardTitle">자유게시판</h1>
	<div class="contain d-flex flex-column min-vh-100"><!-- container -->
			<div class="selectCont" style=" height: auto; width: 800px; ">
				<div class="contTitle1" style="height: auto; width: 800px;">
					<table class="board1">
						<tr>
							<td class="contTh"><span class="contD">제 목</span></td>
							<td><input class="InText" id="conTitle" type="text" value="${boardSelectOne.board_title}" placeholder="제목을 입력해주세요."/></td>
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
					<a href="/board/boardView.do"><div class="contBTN contList" id="contList">취소</div></a>
					<a href="javascript:fn_boardInsert('${boardSelectOne.board_no}')" class="contInsertB"><div class="contBTN contInsertB">저장</div></a>
<%-- 					<a href="javascript:fn_boardUpdate('${boardSelectOne.board_no}')" class="contUpB"><div class="contBTN contUpB">저장</div></a> --%>
				</div>
	</div><!-- container -->
</form>
<!-- </body>			 -->
					
<!-- footer -->
<jsp:include page="/WEB-INF/jsp/egovframework/example/layout/footer.jsp"></jsp:include>
	
