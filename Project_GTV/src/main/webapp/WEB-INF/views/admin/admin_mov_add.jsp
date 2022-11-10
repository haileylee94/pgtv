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
    display : flex;
  	justify-content: center;
  	align-items : center;
}
#adm_mov_table{
	width: 600px;
	height: 700px;
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
			
			<form action="./adm_movie_add_ok">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<table border="1" id="adm_mov_table">
					<tr>
						<th>영화 제목</th> 
						<th>
							<select name = "moviename">
								<option value="공조2">공조2</option>
								<option value="동감">동감</option>
								<option value="데시벨">데시벨</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>영화 제목 확인</th>
						<th>
							<select name = "movienum">
								<option value="1">공조2</option>
								<option value="2">동감</option>
								<option value="3">데시벨</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>지점 번호</th>
						<th>
							<select name = "theaternum">
									<option value="1">강남</option>
									<option value="2">잠실</option>
									<option value="11">판교</option>
									<option value="12">구리</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>지점 번호 확인</th>
						<th>
							<select name = "branchname">
								<option value="강남">강남</option>
								<option value="잠실">잠실</option>
								<option value="판교">판교</option>
								<option value="구리">구리</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>지역번호</th>
						<th>
							<select name = "regionnum">
									<option value="1">서울</option>
									<option value="2">경기</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>좌석</th>
						<th>좌석은 108석으로 고정됩니다.</th>
					</tr>
					<tr>
						<th>상영일</th>
						<th>
							<input type="date" name="strdate"/>
						</th>
					</tr>
					<tr>
						<th>시작시간</th>
						<th>
							<select name = "strhour">
								<c:forEach begin="0" end="24" var="i">
									<option value="${i }">${i }</option>
								</c:forEach>						
							</select>시 
							<select name = "strmin">
								<c:forEach begin="0" end="59" var="j">
									<option value="${j }">${j }</option>
								</c:forEach>						
							</select>분
						</th>
					</tr>
					<tr>
						<th>종료시간</th>
						<th>
							<select name = "endhour">
								<c:forEach begin="0" end="24" var="i">
									<option value="${i }">${i }</option>
								</c:forEach>						
							</select>시 
							<select name = "endmin">
								<c:forEach begin="0" end="59" var="j">
									<option value="${j }">${j }</option>
								</c:forEach>
							</select>분
						</th>
					</tr>
					
					<tr>
						<th>상영관</th>
						<th>
							<select name = "thname">
								<option value="1관">1관</option>
								<option value="2관">2관</option>
							</select>
						</th>
					</tr>
					<tr>
						<th>포스터 url</th>
						<th><input type="text" name="poster"/></th>
					</tr>
					<tr>
						<th></th><th><input type="submit" value="영화 등록"/></th>
					</tr>
				</table>
				<input type="hidden" name="totalseat" value="108"/>
				<input type="hidden" name="remainseat" value="108"/>
			</form>
			
			</div>
	 </div>
</body>
</html>