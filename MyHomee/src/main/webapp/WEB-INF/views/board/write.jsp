<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function checkWrite() {
		if(document.write.title.value == ""){
			alert("제목을 입력하십시오!");
		}else if(document.write.content.value == ""){
			alert("내용을 입력하십시오!")
		}else{
			document.write.submit();
		}
	}
</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<div align="center">
	<form action="${pageContext.request.contextPath }/board/write" method="post" name = "write">
		<c:if test="${seq != null }">
			<input type="hidden" name="seq" value="${seq }">
		</c:if>
		<table class = "boardTable">
			<tr>
				<th width="60">제목</th>
				<td><input type="text" name = "title" size = "53"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="summernote" rows="15" cols="65" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="file" name = "filename" size = "400">
				</td>
			</tr>
		</table>
		<div class = "btnBox">
			<input type="button" value="쓰기" onclick="javascript:checkWrite()">
		</div>
	</form>
</div>
<script type="text/javascript">
	$(document).ready(function() {
 	 	$('#summernote').summernote();
	});
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>















