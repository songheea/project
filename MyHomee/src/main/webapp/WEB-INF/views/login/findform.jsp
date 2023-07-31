<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	function check(f){
		if(f.id.value == ''){
			alert("아이디를 입력 하십시오!");
			f.id.focus();
			return false;
		}
		if(f.name.value == ''){
			alert("이름를 입력 하십시오!");
			f.name.focus();
			return false;
		}
		
		if(f.tel3.value == '' || f.tel2.value == ''){
			alert("전화번호를 입력하십시오!");
			f.tel2.focus();
			return false;
		}
		
		
		return true;
	}

</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	<div align="center">
		<form action="${ pageContext.request.contextPath }/login/find" onsubmit="return check(this);" method="post" name="find">
			<c:choose>
				<c:when test="${param.mode == 'id' }">
					<input type="hidden" name="mode" value="id">
					<h3>아이디찾기</h3>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="mode" value="pw">					
					<h3>패스워드찾기</h3>
				</c:otherwise>
			</c:choose>
			<table>
				<c:if test="${param.mode == 'pw' }">
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
					</tr>
				</c:if>
				<tr>
					<th>NAME</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>TEL</th>
					<td>
						<select name = "tel1">
							<option value="010" selected="selected">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="019">019</option>
						</select>
						-<input type="text" size = "5" maxlength="4" name = "tel2">
						-<input type="text" size = "5" maxlength="4" name = "tel3">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="find">
						<input type="button" value="Reset" onclick="document.find.reset()">
					</td>
				</tr>
			</table>
		</form>
	</div>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>