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
							<!-- Ajax 사용 -->
<%-- 							<td style="font-weight: bold;"><a href="javascript:fn_boardSelectOne('${list.board_no}')">${list.board_title }</a></td> --%>
							<!-- 쿼리스트링 사용 -->
							<td style="font-weight: bold;"><a href="/board/boardSelectOnePage.do?board_no=${list.board_no }">${list.hos_nm }</a></td>
						</tr>
					</c:forEach>
				</c:if>
				
				<input type="hidden" id="totalcnt" name="totalcnt" value ="${totalcnt}"/>
