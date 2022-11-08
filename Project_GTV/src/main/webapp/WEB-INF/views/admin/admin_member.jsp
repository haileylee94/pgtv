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
a:link{text-decoration:none;}
a:visited{text-decoration:none;}
a:hover{text-decoration:underline;}
a:active{text-decoration:none;}
</style>
</head>
<body>
	 <div id="admin_body">	  
			<div id="admin_header">			   
				   <div id="admin_menu">
				   		<div id="main_title">
				   			<h2>관리자 회원관리</h2>
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
				<table border="1">					
					<tr>
						<td align="right"><strong>총 사용자 : ${totalCount }</strong>명</td>
					</tr>
					
					<tr>
						<th>.NO</th> <th>ID</th> <th>유저명</th> <th>성별</th> <th>연락처</th> <th>이메일</th> <th>가입일</th>
					</tr>
					
					<c:if test="${!empty list }">
						<c:forEach var="mem" items="${list }">
							<c:if test="${mem.user_state == 1 }">
								<tr>
									<th>${mem.user_no }</th>
									<td style="padding-left: 14px; font-weight: bolder;">
									<a href="#?user_id=${mem.user_id }&page=${page }">${mem.user_id }</a></td>
									<th>${mem.user_name }</th>
									<th>${mem.user_gender }</th>
									<th>${mem.user_phone1 }-${mem.user_phone2 }-${mem.user_phone3 }</th>
									<th>${mem.email }@${mem.email_domain }</th>
									<th>${mem.user_date }</th>
									<th>
										<input type="button" value="유저 탈퇴" onclick="location='/admin/admin_delete_ok?';" />
									</th>
								</tr>
							</c:if>
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }">	
						<tr>
						 <th colspan="7">사용자가 없습니다.</th>
						</tr>
					</c:if>
					
					<%-- 페이징 쪽나누기 부분 --%>
					<tr>
						<th colspan="5">
							<c:if test="${page <= 1}">
								[이전]&nbsp;
							</c:if>
							
							<c:if test="${page > 1 }">
								<a href="/board/board_list?page=${page -1}">[이전]</a>&nbsp;
							</c:if>
							
							<%-- 헌재 쪽번호 출력 --%>
							<c:forEach var="a" begin="${startpage}" end="${endpage }" step="1">
								<c:if test="${a == page }"> <%-- 현재 쪽번호가 선택된 경우 --%>
									<${a }>
								</c:if>
								
								<c:if test="${a != page }"> <%-- 현재 쪽번호가 선택되지 않은경우 --%>
									<a href="/board/board_list?page=${a }">[${a }]</a>&nbsp;
								</c:if>
							</c:forEach>
							
							<c:if test="${page >= maxpage }">
							다음
							</c:if>
							
							<c:if test="${page < maxpage }">
								<a href="/board/board_list?page=${page+1 }">[다음]</a>
							</c:if>
						</th>
					</tr>
				</table>
			</div>
	 </div>
</body>
</html>