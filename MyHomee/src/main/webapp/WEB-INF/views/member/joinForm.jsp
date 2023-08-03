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
	
	function sendRequest(url, param, callback, method, asyncBool) //내가 함
	{
		if(window.ActiveXObject)
			xhr = new ActiveXObject("Microsoft.XMLHTTP");
		else
			xhr = new XMLHttpRequest();

		method = (method.toLowerCase() == "get") ? "GET" : "POST";
		
		param = ( param == null || param == '' ) ? null : param;

		if(method == "GET" && param != null) url = url + "?" + param;
		
		xhr.open(method, url, asyncBool);

		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		
		xhr.onreadystatechange = callback;

		xhr.send(  (method == "POST")? param : null   );
	}
	
	function checkId(f) {
		if(f.id.value == ""){
			alert("아이디를 입력하십시오!");
			return;
		}
		
		var url = "${pageContext.request.contextPath}/member/checkId";
		var param = "id=" + encodeURIComponent(f.id.value);
		console.log(url);
		console.log(param);
		console.log(f.id.value);
		
		sendRequest(url,param,resultFn,"POST");
	}
	
	
	
	function resultFn(){
		if(xhr.readyState==4 && xhr.status==200) {
			//도착된 데이터를 읽어오기
			var data = xhr.responseText;
			const join = document.getElementById("join");
			const check = document.getElementById('check');
			const id = document.getElementById('id');
			
			check.innerText = '';
			console.log(data);
			if(data === '사용 가능한 ID입니다'){
				check.style.cssText="color: blue; font-size: 10px;";
				join.disabled=false;
				id.readOnly = true;
			}else{
				check.style.cssText="color: red; font-size: 10px;";	
				join.disabled=true;
			}
			
			check.innerText = data;
		}
	}
</script>

<html>
<head>

<style>
html {
  height: 100%;
}

body {
  height: 100%;
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
  display: grid;
  justify-items: center;
  align-items: center;
  background-color: #3a3a3a;
}

#main-holder {
  width: 35%;
  height: 55%;
  position: fixed;
  top: 50%; 
  left: 50%;
  transform: translate(-50%, -50%); 
  display: grid;
  justify-items: center;
  align-items: center;
  background-color: white;
  border-radius: 7px;
  box-shadow: 0px 0px 5px 2px black;
}



#join-form {
  align-self: flex-start;
  display: grid;
  justify-items: center;
  align-items: center;
 
}

.join-form-field::placeholder {
  color: #3a3a3a;
}

.ckid {
  position: relative; /* 상대적인 위치 지정 */
  top: 50px; /* 위쪽으로 50px 이동 */
}


.join-form-field {
  border: none;
  border-bottom: 1px solid #3a3a3a;
  margin-bottom: 10px;
  border-radius: 3px;
  outline: none;
  padding: 0px 0px 5px 5px;
  
}

#join-form-submit {
  width: 50%;
  position: fixed;
    bottom: 90px; /* 하단 여백을 20px로 설정합니다. */
  left: 25%; /* 가로 위치를 화면 중앙에 맞춥니다. */
  padding: 7px;
  border: none;
  border-radius: 15px;
  color: white;
  font-weight: bold;
  background-color: #3a3a3a;
  cursor: pointer;
  outline: none;
  
}


</style>





<body>
<form id="join-form" action="${ pageContext.request.contextPath }/member/join" method="post" name = "join">
	<main id="main-holder">
	<h1 id="join-header">Join</h1>
	<table>
		<tr>
			<td>ID</td>
			<td>
				<input type="text" id="id-field" class="join-form-field" name = "id" autocomplete="off">
				<input type="button"  value="중복체크" onclick="javascript:checkId(this.form)"><br>
				<span id="check"></span>
			</td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type="password" id="password-field" class="join-form-field" name = "password"></td>
		</tr>
		<tr>
			<td>rePW</td>
			<td><input type="password" id="password-field" class="join-form-field" name = "repw"></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" id="name-field" class="join-form-field"name = "name"  autocomplete="off"></td>
		</tr>
		<tr>
			<td>E-Mail</td>
			<td><input type="text" id="email-field" class="join-form-field"name = "email"></td>
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
				-<input type="text" size = "5" maxlength="4" name = "tel2" class="join-form-field">
				-<input type="text" size = "5" maxlength="4" name = "tel3" class="join-form-field">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" id ="join" disabled="disabled" value="Join" onclick="javascript:checkJoin()">
				<input type="button" value="Reset" onclick="document.join.reset()">
			</td>
		</tr>
	</table>
	</main>
</form>
</body>
</head>




















