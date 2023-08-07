<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">

	function check(f) {
		alert("실행");
		if(f.type.value == "seq"){
			var num_pattern = /^[0-9]{1,20}$/;
			
			if(f.word.value == "" || !num_pattern.test(f.word.value)){
				alert("글번호를 입력하십시오!");
				return false;
			}
		}else if(f.word.value == ""){
			alert("검색어를 입력하십시오!");
			return false;
		}
		
		return true;
	}
</script>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<style>
  /* 기존 CSS 스타일 */
  /* ... */

  /* 추가한 CSS 스타일 */
  .board_list_wrap {
    margin-top: 20px;
    margin-bottom: 20px;
  }

  .boardTable {
    width: 100%;
    border-collapse: collapse;
    background-color: #1c1c1c;
  }

  .boardTable th,
  .boardTable td {
    padding: 10px;
    text-align: center;
    color: #fff;
    border-bottom: 1px solid #333;
  }

  .boardTable th {
    background-color: #333;
  }

  .boardTable tr:nth-child(odd) {
    background-color: #1a1a1a;
  }

  .boardTable a {
    text-decoration: none;
    color: #fff;
  }

  .boardTable a:hover {
    text-decoration: underline;
  }

  .boardTable .num,
  .boardTable .count {
    width: 8%;
  }

  .boardTable .title {
    width: 45%;
    text-align: left;
  }

  .boardTable .writer,
  .boardTable .date {
    width: 12%;
  }

  .board_page {
    margin-top: 30px;
    text-align: center;
    font-size: 1.4rem;
  }

  .board_page a {
    display: inline-block;
    width: 32px;
    height: 32px;
    box-sizing: border-box;
    vertical-align: middle;
    border: 1px solid #ddd;
    border-left: 0;
    line-height: 100%;
    text-align: center;
    font-size: 1.2rem;
    padding-top: 8px;
    color: #333;
  }

  .board_page a.on {
    border-color: #000;
    background: #000;
    color: #fff;
  }

  .board_page a:first-child {
    border-left: 1px solid #ddd;
  }

  .btnBox {
    margin-top: 20px;
    text-align: right;
  }

  .btnBox button {
    padding: 10px 15px;
    border: 1px solid #fff;
    border-radius: 3px;
    background-color: #333;
    color: #fff;
    font-size: 1.2rem;
    cursor: pointer;
  }

  .btnBox button:hover {
    background-color: #000;
  }

  /* 검색 폼 스타일 */
  .board_list_wrap form {
    margin-top: 10px;
    margin-bottom: 10px;
  }

  .board_list_wrap select,
  .board_list_wrap input[type="text"],
  .board_list_wrap .btn {
    display: inline-block;
    padding: 10px;
    border: 1px solid #bbb;
    border-radius: 8px;
    font-size: 14px;
  }

  .board_list_wrap select {
    width: 20%;
  }

  .board_list_wrap input[type="text"] {
    width: 60%;
  }

  .board_list_wrap .btn {
    width: 15%;
    background-color: #3a3a3a;
    color: #fff;
    cursor: pointer;
    outline: none;
  }

  .board_list_wrap .btn:hover {
    background-color: #000;
    
  }
  
    /* 버튼 스타일 */
  .btnBox {
    margin-top: 10px;
    text-align: right;
  }
  
  
    form {
    display: flex;
    align-items: center;
    margin-top: 10px;
    margin-bottom: 10px;
  }

  select[name="type"] {
    width: 120px;
    height: 40px;
    margin-right: 10px;
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 5px 12px;
    font-size: 14px;
  }

  input[type="text"] {
    flex: 1;
    height: 40px;
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 5px 12px;
    font-size: 14px;
  }

  input.btn {
    width: 80px;
    height: 40px;
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 5px 12px;
    font-size: 14px;
    background-color: #3a3a3a;
    color: #fff;
    cursor: pointer;
  }

  /* 추가한 CSS 스타일 */
  .search-form-label {
    font-size: 14px;
    color: #3a3a3a;
    margin-right: 5px;
  }
  
  
  
</style>
	<c:set var="cpath" value="${pageContext.request.contextPath }"/>		
	<div align="center">
		<table class="boardTable">
			<tr>
				<th>번호</th>
				<th>글제목</th>
				<th>아이디</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:choose>
				<c:when test="${list == null }">
					<tr>
						<td colspan="5" align="center">
							<span style="font-weight: bold;">작성한 글이 없습니다.</span>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.seq }</td>
							<td>
								<c:forEach var="i" begin="1" end="${dto.depth}" step="1">
									[댓글]
								</c:forEach>
								<a href="${pageContext.request.contextPath }/board/content?seq=${dto.seq }">${dto.title }</a>
							</td>
							<td>${dto.id }</td>
							<td>${dto.logtime }</td>
							<td>${dto.hit }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		<form action="${cpath }/board/list" method="get" onsubmit="return check(this)" >
			<span style="float: left;">
				<select name="type">
					<option value="seq" ${param.type == 'seq' ? 'selected' : '' }>글번호로 검색</option>
					<option value="title" ${param.type == 'title' or empty param.type ? 'selected' : '' }>제목으로 검색</option>
					<option value="id" ${param.type == 'id' ? 'selected' : '' }>아이디로 검색</option>
					<option value="content" ${param.type == 'content' ? 'selected' : '' }>내용으로 검색</option>
				</select>
				<input type="text" name="word" placeholder="검색어를 입력하세요" value="${param.word }" autocomplete="off">
				<input class="btn" type="submit"  value="검색">
			</span>
		</form>		
		<c:if test="${login != null }">
			<div class="btnBox">
				<button onclick="document.location.href='${pageContext.request.contextPath }/board/writeform'">글쓰기</button>
			</div>
		</c:if>
		<div align="center">
			<c:if test="${paging.prev }">
				<a href="${cpath }/board/list?page=${paging.begin - 1}&type=${param.type}&word=${param.word}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${paging.begin }" end="${paging.end }" step="1">
				<c:choose>
					<c:when test="${i == paging.page }">
						<strong>[${i}]</strong>
					</c:when>
					<c:otherwise>
						<a href="${cpath }/board/list?page=${i}&type=${param.type}&word=${param.word}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.next }">
				<a href="${cpath }/board/list?page=${paging.end + 1}&type=${param.type}&word=${param.word}">[다음]</a>
			</c:if>
		</div>
	</div>	
<%@ include file="/WEB-INF/views/layout/footer.jsp" %>		



