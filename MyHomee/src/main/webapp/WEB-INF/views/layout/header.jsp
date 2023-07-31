<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
  margin: 0;
  padding: 0;
}

a {
  text-decoration: none;
}

li {
  list-style-type: none;
}

.hbody {
  background-color: black;
  width: 100%;
  height: 100px;
}

.nav {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 20px 50px;
  color: white;
}

.title {
  font-size: 2em;
}

.title > a {
  color: white;
}

@media screen and (min-width: 625px) {

  #menu {
    display: flex;
  }

  #menu > li {
    padding: 20px 30px;
    font-size: 20px;
  }

  li > a {
    color: white;
  }

  .fab {
    font-size: 35px;
    color: #1DA1F2;
  }

  .fas {
    display: none;
  }
}

@media screen and (max-width: 625px) {

  .nav {
    padding: 30px 40px;
  }

  #menu {
    display: none;
  }

  .fab {
    display : none;
  }

  .fas {
    font-size: 2em;
  }
}
	
</style>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/summernote/js/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/css/summernote-lite.css">

</head>
<body>
  <section class="hbody">
    <article class="nav">
     <div class="title"><a href="${pageContext.request.contextPath }">MyHome</a></div>
     <ul id="menu">
 			<c:choose>
				<c:when test="${!empty login }">
					<li><a href="${pageContext.request.contextPath }/member/mypage">MyPage</a></li>
					<li><a href="${pageContext.request.contextPath }/login/logout">Logout</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="${pageContext.request.contextPath }/login/loginform" >Login</a></li>
					<li><a href="${pageContext.request.contextPath }/member/joinform">Join</a></li>
				</c:otherwise>
			</c:choose>
			<li><a href="${pageContext.request.contextPath }/board/list">Board</a><li>
			</ul>
			<i class="fab fa-twitter-square"></i>
    		<i class="fas fa-bars"></i>
	</article>
  </section>