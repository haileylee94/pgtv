<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<script src="/resources/js/jquery.js"></script>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
#SerId_in {
	background-color: white;
	width: 650px;
	height: 700px;
	position: relative;
	left: 430px;
	display: flex;
	flex-direction: column;
}

#SerId_in_title {
	color: black;
	font-size: 28px;
	margin: auto;
	position: relative;
	top: -20px;
}

#SerId_in_desc {
	color: black;
	margin: auto;
	position: relative;
	top: 0px;
}

#user_name {
	color: black;
	position: relative;
	left: 175px;
	top: -150px;
	border-width: 2px;
	width: 300px;
	height: 40px;
	font-size: 18px;
}

#user_birth1 {
	color: black;
	position: relative;
	left: -131px;
	top: -90px;
	border-width: 2px;
	width: 96px;
	height: 40px;
	font-size: 18px;
}

#user_birth2 {
	color: black;
	position: relative;
	left: -131px;
	top: -90px;
	border-width: 2px;
	width: 96px;
	height: 40px;
	font-size: 18px;
}

#user_birth3 {
	color: black;
	position: relative;
	left: -131px;
	top: -90px;
	border-width: 2px;
	width: 96px;
	height: 40px;
	font-size: 18px;
}

#SerId_button {
	color: black;
	background-color: white;
	border-width: 2px;
	border-color: black;
	width: 150px;
	height: 37px;
	position: relative;
	left: 249px;
	top: -65px;
}

#SerId_button {
	cursor: pointer;
}

#birth_form{
 position:relative;
 left:305px;
 top:-47px;
}
#SerId_reslt{
 position:relative;
 top:215px;
 width:700px;
 height:500px;
}

#SerId_show b{
    color:black;
    font-size:32px;
}

#SerId_show{
  position:relative;
  left:150px;
  top:-163px;
  color:black;
  font-size:32px;
  
}

#login_page{
 color:black;
 width:175px;
 height:45px;
 background-color:white;
 border-width:2px;
 border-color:black;
 position:relative;
 left:236px;
 top:215px;
 visibility:hidden;
}



</style>
<script>

$(function(){
	$('#SerId_button').click(function(){
		
		var user_name = $("#user_name").val();
		var user_birth1 = $("#user_birth1").val();
		var user_birth2 = $("#user_birth2").val();
		var user_birth3 = $("#user_birth3").val();
	
		
		var param = {"user_name":user_name, "user_birth1":user_birth1, "user_birth2": user_birth2, "user_birth3":user_birth3}
		
		$.ajax({
			anyne: true,
			method:"POST",
			url:"/SerId_in_ok",
			dataType:"html",
			contentType:"application/json",
			data:JSON.stringify(param),
			success: function(data){
				var id = data;
				var result = "<div id = 'SerId_show'>고객님의 id는 <b>"+id+"</b>입니다.</div>";
				$('#SerId_reslt').html(result);
				var button = document.getElementById('login_page');
				button.style.visibility = "visible";   
			},
		    error: function(data) {
		    	alert("해당 이름과 생년월일에 맞는 아이디가 존재하지 않습니다.");
		    	$('#user_name').val('');
		    	$('#user_birth1').val('');
		    	$('#user_birth2').val('');
		    	$('#user_birth3').val('');
		    }
			
		});
	});
});
</script>
<body>
	<div id="SerId_in">
		<b id="SerId_in_title">아이디 찾기</b> 
		<button type = 'button' id = 'login_page' onclick = "location.href = 'login'" style='cursor:pointer'>로그인</button>
		<div id = "SerId_reslt">
		<input type="text" id="user_name" 
			placeholder="이름">
		<div id = "birth_form">
			<input type="text" id="user_birth1" placeholder="년"> <input
				type="text" id="user_birth2" placeholder="월"> <input
				type="text" id="user_birth3" placeholder="일"></div>
			<button type="button" id="SerId_button">찾아보기</button>
			<b id="SerId_in_desc">찾고자 하는 아이디의 이름과 생년월일을 적어주세요</b>
			

               </div>
		</div>
</body>
</html>
<%@ include file="../include/footer.jsp"%>