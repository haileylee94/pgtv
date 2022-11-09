<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인화면</title>
<style>
#admin_body{
	width:1300px; height:1000px; border:1px solid black;
	margin: 40px auto;
}
#admin_header{
	width:1278px; height:160px; border:1px solid black;
	margin:10px;
}
#admin_menu{
	width:900px; height:140px; border:1px solid black;
	margin:10px 0px 0px 10px; float:left;
}
#admin_menu ul li{
    float:left;
    list-style:none;
    margin:15px 0px 0px 0px;
    padding:0px 65px;
}
#main_title{
	width:878px; height:50px;
	margin: 10px 10px 0px;
	
	text-align: center;
}
#admin_logout1{
	width:340px; height:140px; border:1px solid black;
	margin:10px 0px 0px 10px; float:left;
}
#admin_logout2{
    margin: 50px 0px 0px 130px;	
}
#admin_cont{
    width:1278px; height:800px;
    border:1px solid black;
    margin:10px 0px 0px 10px;
}
#adm_mem_table{
	width: 100%;
	
}

#adm_poster{
	width: 138px; height: 200px;
}
a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{text-decoration:underline;}
a:active{text-decoration:none;}
</style>
<script src="/resources/js/jquery.js"></script>
<script>
function del_check() {
	if(confirm("정말로 삭제하시겠습니까?")){
		return true;
	}else{
		return false;
	}
}
</script>
</head>
<body>
	 <div id="admin_body">	  
			<div id="admin_header">			   
				   <div id="admin_menu">
				   		<div id="main_title">
				   			<h2>관리자 영화관리</h2>
				   		</div>
					    <ul>
						     <li><a href="/">메인페이지</a></li>
						     <li><a href="./main">관리자메인</a></li>
						     <li><a href="./member">회원관리</a></li>
						     <li><a href="./movie">영화관리</a></li>
					    </ul>
				   </div>
			   
				   <div id="admin_logout1">
				   		<div id="admin_logout2">
				   			<sec:authentication property="name" />님 환영합니다.<br>
				   			<a href="#" onclick="document.getElementById('logout').submit();">LogOut</a>
				   			<form id="logout" method="post" action="/logout">
				   			 <input type="hidden" name="${_csrf.parameterName}" class="logout" value="${_csrf.token}" />
					    	</form>
				   		</div>
				   </div>
		  	</div>
		  
			<div id="admin_cont">
			
				<table border="1" id="adm_mem_table">
					<tr>
						<td align="center"><strong>총 영화 : ${totalCount }</strong>편</td>
					</tr>
					
					<tr>
						<th>포스터</th> <th>.NO</th> <th>영화명</th> <th>지점</th> <th>좌석</th> <th>상영날짜</th> <th></th>
					</tr>
					
					<c:if test="${!empty list }">
						<c:forEach var="mov" items="${list }">
								<tr>
									<th><img src="${mov.poster }" id="adm_poster" alt="포스터"></th>
									<th>${mov.movietotalnum }</th>
									<th>${mov.moviename }</th>
									<th>${mov.branchname }</th>
									<th>${mov.totalseat }</th>
									<th>${mov.strdate }</th>
									<th>
									<form action="/admin/mov_delete_ok?movietotalnum=${mov.movietotalnum }" onsubmit="return del_check();" method="post">
										<input type="hidden" name="${_csrf.parameterName}" class="logout" value="${_csrf.token}" />
										<input type="submit" value="영화 삭제" />
									</form>
									</th>
								</tr>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }">	
						<tr>
						 <th colspan="6">게시된 영화가 없습니다.</th>
						</tr>
					</c:if>
					
					<%-- 페이징 쪽나누기 부분 --%>
					<tr>
						<th colspan="7">
							<c:if test="${page <= 1}">
								[이전]&nbsp;
							</c:if>
							
							<c:if test="${page > 1 }">
								<a href="/admin/movie?page=${page -1}">[이전]</a>&nbsp;
							</c:if>
							
							<%-- 헌재 쪽번호 출력 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage }" step="1">
								<c:if test="${a == page }"> <%-- 현재 쪽번호가 선택된 경우 --%>
									<${a }>
								</c:if>
								
								<c:if test="${a != page }"> <%-- 현재 쪽번호가 선택되지 않은경우 --%>
									<a href="/admin/movie?page=${a }">[${a }]</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:if test="${page >= maxpage }">
							다음
							</c:if>
							
							<c:if test="${page < maxpage }">
								<a href="/admin/movie?page=${page+1 }">[다음]</a>
							</c:if>
						</th>
					</tr>
					
					<tr>
						<td colspan="7" align="right" style="padding-right: 14px;">
							<form action="/admin/movie_add" method="post">
								<input type="hidden" name="${_csrf.parameterName}" class="logout" value="${_csrf.token}" />
								<input type="submit" value="영화 추가" />
							</form>
						</td>
					</tr>
				</table>
			
			</div>
	 </div>
</body>
</html>