<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	${msg }<br>
	<c:choose>
		<c:when test="${check }">
			<a href="${pageContext.request.contextPath }/member/mypage">MyPage</a>
		</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath }/login/findform?mode=id">ID찾기</a> | 
			<a href="${pageContext.request.contextPath }/login/findform?mode=pw">PW찾기</a> | 
			<a href="${pageContext.request.contextPath }/login/loginform">Login</a>
		</c:otherwise>
	</c:choose>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>


		
		