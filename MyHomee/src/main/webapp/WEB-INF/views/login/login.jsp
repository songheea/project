<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<script type="text/javascript">
	function check(f) {
		if(f.id.value == ""){
			alert("ID를 입력하십시오!");
			f.id.focus();
			return false;
		}else if(f.password.value == ""){
			alert("PW를 입력하십시오!");
			f.password.focus();
			return false;
		}
		
		return true;
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

#login-error-msg-holder {
  width: 50%;
  height: 50%;
  display: grid;
  height : 20%;
  justify-items: center;
  align-items: center;
}

#login-error-msg {
  width: 30%;
  text-align: center;
  margin: 30px auto; /* 상하 여백을 10px로 설정하고 가로 중앙 정렬합니다. */
  padding: 5px;
  font-size: 12px;
  font-weight: bold;
  color: #8a0000;
  border: 1px solid #8a0000;
  background-color: #e58f8f;
  opacity: 0;
}


#error-msg-second-line {
  display: block;
}

#login-form {
  align-self: flex-start;
  display: grid;
  justify-items: center;
  align-items: center;
 
}

.login-form-field::placeholder {
  color: #3a3a3a;
}

.ckid {
  position: relative; /* 상대적인 위치 지정 */
  top: 50px; /* 위쪽으로 50px 이동 */
}

.findjoin {
  position: relative; /* 상대적인 위치 지정 */
  top: 15px; /* 위쪽으로 50px 이동 */
}

.login-form-field {
  border: none;
  border-bottom: 1px solid #3a3a3a;
  margin-bottom: 10px;
  border-radius: 3px;
  outline: none;
  padding: 0px 0px 5px 5px;
  
}

#login-form-submit {
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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script defer src="login-page.js"></script>
</head>
<body>
<form id="login-form" action="${ pageContext.request.contextPath }/login/check" method="post" onsubmit="return check(this)">
  <main id="main-holder">
    <h1 id="login-header">Login</h1>
    
	<span class="ckid">
	<c:choose>
		<c:when test="${check }">
			<input type="checkbox" name="ckid" value="true" checked="checked">
		</c:when>
		<c:otherwise>
   			
      <input type="text" name="id" id="id-field" class="login-form-field" placeholder="ID">
      <input type="password" name="password" id="password-field" class="login-form-field" placeholder="Password">
    <div id="login-error-msg-holder">
      <p id="login-error-msg">Invalid ID <span id="error-msg-second-line">and/or password</span></p>
    </div>
      
     </c:otherwise>
	</c:choose>
	</span>
      <input type="submit" value="Login" id="login-form-submit">
     <div class = "findjoin">
	<a href="${ pageContext.request.contextPath }/login/findform?mode=id">ID찾기</a>
	<a href="${ pageContext.request.contextPath }/login/findform?mode=pw">PW찾기</a> 
	</div>
  </main>
</form>

</body>

</html>