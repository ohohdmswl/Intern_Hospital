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
					<a href=""javascript:fn_boardSelectOne()"><div class="contBTN contList">목록</div></a>
					<div class="contBTN contDel">삭제</div>
					<div class="contBTN contup">수정</div>
				</div>
			
					
	
