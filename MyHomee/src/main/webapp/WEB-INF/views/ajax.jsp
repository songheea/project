<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function check(f){
		//var param = "id=" + encodeURIComponent(f.id.value) + "&password" + encodeURIComponent(f.password.value);
		
		let data = new FormData(f);
		
		console.log(data);
		
		let d = serialize(data);
		
		console.log(d);
		
		makeRequest(d);
		
	}
	
	function serialize(rawData){
		let rtnData = {};
		
		for(let [key,value] of rawData){
			//console.log(key + "   " +  value);
			let sel = document.querySelectorAll("[name=" + key + "]");
			
			if(sel.length > 1){
				if(rtnData[key] === undefined){
					rtnData[key] = [];
				}
				rtnData[key].push(value);
			}else{
				rtnData[key] = value;
			}
		}
		
		return rtnData;
	}
</script>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<button id="btn">AJAX</button><br>
		<form method="post" onsubmit="return check(this)" enctype="application/x-www-form-urlencoded">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" value="${id }"></td>
				</tr>
				<tr>
					<th>PW</th>
					<td><input type="password" name="password"></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="Login" onclick="check(this.form)">
					</th>
				</tr>
			</table>
		</form>
	</div>
	<script type="text/javascript">
		const btn = document.getElementById("btn").addEventListener("click",makeRequest);
	
		var httpRequest = null; 
		
		function makeRequest(data){
			// HttpRequest라는 객체가 필요하다...

				//이런 클래스는 InternetExplorer에서는 XMLHTTP라고 불리는 ActivX object를 말한다. 

				//그러면 Mozzlia, Safari나 다른 브라우저에서도 Microsoft의 ActiveX 객체의 
				//method와 property를 지원하기 위해 XMLHttpRequest클래스를 구현 하고 있다.
				
			if(httpRequest == null){
				if(window.ActiveXObject){
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				}else{
					httpRequest = new XMLHttpRequest();
				}
			}
			
			if(!httpRequest) {
				alert('XMLHttp 인스턴스를 만들수가 없다!');
			}
			
			let name = "name";
			
			//httpRequest.open(메소드방식,url,동기화방식(비동기면 true,동기 false)); // 서버에 연결 준비
//			httpRequest.open("GET","/myhome/ajax?name=" + name);
			httpRequest.open("POST","/myhome/ajax");
			//httpRequest.setRequestHeader("Content-Type",enctype)			
//			httpRequest.setRequestHeader("Content-Type","application/x-www-form-urlencoded");	
			httpRequest.setRequestHeader("Content-Type","application/json");	
			
			//httpRequest.onreadystatechange = 콜백메소드;
			httpRequest.onreadystatechange = alertContents;
			
			//데이터 전송
			//httpRequest.send();
			httpRequest.send(JSON.stringify(data));
		}
		
		function alertContents(){
			
			if(httpRequest.readyState == 4 && httpRequest.status == 200){
				data = JSON.parse(httpRequest.responseText); // ajax를 통해 받은 데이터
				
				alert(data.id);
			}
			
			
		}
		
	</script>
</body>
</html>



























