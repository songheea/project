<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	<c:choose>
		<c:when test="${!check}">
			<h3>아이디 혹은 비밀번호를 찾지 못하였습니다.</h3>
			<a href="${ pageContext.request.contextPath }/login/findform?mode=id">ID찾기</a> | 
			<a href="${ pageContext.request.contextPath }/login/findform?mode=pw">PW찾기</a> |
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${param.mode == 'id' }">
						<h3>ID : ${id }</h3>
						<a href="${ pageContext.request.contextPath }/login/findform?mode=pw">PW찾기</a> | 
				</c:when>
				<c:otherwise>
						<h3>PW : ${password }</h3>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<a href="${ pageContext.request.contextPath }/login/loginform">Login</a>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>

