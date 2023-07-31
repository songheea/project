<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	function checkJoin(){
		if(document.join.id.value == ""){
			alert("아이디를 입력하십시오!");
		}else if(document.join.password.value == ""){
			alert("비밀번호를 입력하십시오!");
		}else if(document.join.repw.value == ""){
			alert("비밀번호확인을 입력하십시오!");
		}else if(document.join.name.value == ""){
			alert("이름을 입력하십시오!");
		}else if(document.join.email.value == ""){
			alert("이메일을 입력하십시오!");
		}else if(document.join.tel1.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel2.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.tel3.value == ""){
			alert("전화번호를 입력하십시오!");
		}else if(document.join.password.value != document.join.repw.value){
			alert("비밀번호가 일치하지 않습니다.");
		}else{
			document.join.submit();
		}
	}
	
	function checkId(f) {
		if(f.id2.value == ""){
			alert("아이디를 입력하십시오!");
			return;
		}
		
		var url = "${pageContext.request.contextPath}/member/checkId";
		var param = "id2=" + encodeURIComponent(f.id2.value);
		console.log(url);
		console.log(param);
		
		sendRequest(url,param,resultFn,"POST");
	}
	
	function resultFn(){
		if(xhr.readyState==4 && xhr.status==200) {
			//도착된 데이터를 읽어오기
			var data = xhr.responseText;
			const join = document.getElementById("join");
			const check = document.getElementById('check');
			const id2 = document.getElementById('id2');
			
			check.innerText = '';
			console.log(data);
			if(data === '사용 가능한 ID입니다'){
				check.style.cssText="color: blue; font-size: 10px;";
				join.disabled=false;
				id2.readOnly = true;
			}else{
				check.style.cssText="color: red; font-size: 10px;";	
				join.disabled=true;
			}
			
			check.innerText = data;
		}
	}
</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<form action="${ pageContext.request.contextPath }/member/join" method="post" name = "join">
	<table>
		<tr>
			<td>ID</td>
			<td>
				<input type="text" id="id2" name = "id2" autocomplete="off">
				<input type="button"  value="중복체크" onclick="checkId(this.form)"><br>
				<span id="check"></span>
			</td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" name = "password"></td>
		</tr>
		<tr>
			<td>rePW</td>
			<td><input type="password" name = "repw"></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" name = "name"  autocomplete="off"></td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td><input type="text" name = "email"></td>
		</tr>
		<tr>
			<td>TEL</td>
			<td>
				<select name = "tel1">
					<option value="010">010</option>
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
				<input type="button" id ="join" disabled="disabled" value="Join" onclick="javascript:checkJoin()">
				<input type="button" value="Reset" onclick="document.join.reset()">
			</td>
		</tr>
	</table>
</form>
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>


















