<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.board_no}" /></td>
							<td><c:out value="${list.board_title }" /></td>
							<td><c:out value="${list.board_writer }" /></td>
							<td><c:out value="${list.board_date }" /></td>
							<td><c:out value="${list.board_hit }" /></td>
						</tr>
					</c:forEach>
