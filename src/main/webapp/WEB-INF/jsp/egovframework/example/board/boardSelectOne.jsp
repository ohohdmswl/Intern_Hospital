<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>

.selectCont {
	display: flex;
	flex-direction: column;
    align-items: center;
    margin-top: 2rem;
    margin-bottom: 5rem;
}


.contD{
	background: gray;
	border-radius: 0.3rem;
	padding: 0.3rem 0.7rem; 
	font-weight: bold;
	
}


.contBTN{
	background: gray;
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
	

}
</style>

			<div class="selectCont" style="border: 1px solid black; height: auto; width: auto; ">
				<div class="contTitle" style="border: 1px solid black; height: 130px; width: 800px;">
					<P style="font-size: 2rem; font-weight: bold;">${boardSelectOne.board_title}</P>
					<div style="text-align: right; margin-right: 2rem;">
						<span class="contD"">작성자</span>
						<span>${boardSelectOne.board_writer}</span>
						<span class="contD">작성일</span>
						<span>${boardSelectOne.board_date}</span>
						<span class="contD">조회수</span>
						<span>${boardSelectOne.board_hit}</span>
					</div>
				</div>
				<div class="contCont" style="border: 1px solid black; height: auto; min-height: 27rem; width: 800px;">
					${boardSelectOne.board_cont}
				</div>
				<div class="contB">
					<a href=""javascript:fn_boardSelectOne()"><div class="contBTN contList">목록</div></a>
					<div class="contBTN contDel">삭제</div>
					<div class="contBTN contup">수정</div>
				</div>
			
			</div>
			
					
	
