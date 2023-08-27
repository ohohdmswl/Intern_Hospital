<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


				<c:if test="${totalcnt eq 0 }">
				  <tr>
				    <td colspan="5">데이터가 존재하지 않습니다</td>
				  </tr>
				</c:if>
				
				<c:if test="${totalcnt > 0 }">
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.board_no}</td>
<%-- 							<td><a href="javascript:fn_selectone('${list.budget_no}')">${list.board_title }</a></td> --%>
							<td><a href="#">${list.board_title }</a></td>
							<td>${list.board_writer }</td>
							<td>${list.board_date }</td>
							<td>${list.board_hit }</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>