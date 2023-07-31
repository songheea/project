<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	
	function deleteAction() {
		var check = confirm("삭제 하시겠습니까?");
		
		if(!check){
			return;
		}
		
		location.href = '${pageContext.request.contextPath }/board/delete?seq=${vo.SEQ}';
	}
	
</script>
<%@include file="/WEB-INF/views/layout/header.jsp"%>
<div align="center">
	<table class="boardTable" style="table-layout: fixed;">
		<tr>
			<th>제목</th>
			<td>${vo.TITLE }</td>
			<th>조회수</th>
			<td>${vo.HIT }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.NAME }</td>
			<th>작성일</th>
			<td>${vo.LOGTIME }</td>
		</tr>
		<tr>
			<td colspan="4">
				${vo.CONTENT }
			</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
				<a href="${pageContext.request.contextPath }/storage/${vo.FILENAME }" download>${vo.FILENAME }</a> 
			</td>
		</tr>
	</table>
	<div class="btnBox">
		<c:if test="${login == vo.NO }">
			<input type="button" value="수정" onclick="location.href='${pageContext.request.contextPath }/board/updateform?seq=${vo.SEQ}'">
			<input type="button" value="삭제" onclick="deleteAction()">
		</c:if>
		<c:if test="${!empty login }">
			<input type="button" value="답글쓰기" onclick="location.href='${pageContext.request.contextPath}/board/reply/${vo.SEQ}'">
		</c:if>
		<input type="button" value="목록" onclick="location.href='${pageContext.request.contextPath }/board/list'">
	</div>
</div>
<%@include file="/WEB-INF/views/layout/footer.jsp"%>
















