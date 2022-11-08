<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>
<script src="/resources/js/jquery.js"></script>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<style>
 #SerPwd_in{
  background-color:white;
  width:650px;
  height:700px;
  position:relative;
  left:430px;
  display:flex;
  flex-direction:column;
 }
 
 #SerPwd_in_title{
  color:black;
  font-size:28px;
  margin:auto;
  position:relative;
  top:-125px;
 }
 
 #SerPwd_in_desc{
  color:black;
  margin:auto;
  position:relative;
  top:-200px;
 }
 
 #find_pwd_id{
  color:black;
  position:relative;
  left:175px;
  top:-150px;
  border-width:2px;
  width:300px;
  height:40px;
  margin-bottom:6px;
  font-size:20px;
 }
 #find_pwd_name{
  color:black;
  position:relative;
  left:175px;
  top:-150px;
  border-width:2px;
  width:300px;
  height:40px;
  font-size:20px;
 }
 #SerPwd_button{
  color: black;
	background-color: white;
	border-width: 2px;
	border-color: black;
	width: 150px;
	height: 37px;
	position:relative;
	left:244px;
	top:-89px;
 }
 #SerPwd_button:hover{
  cursor:pointer;
 }
</style>
<script>
$(function(){
	$('#SerPwd_button').click(function(){
		
		var user_id = $("#find_pwd_id").val();
		var user_name = $("#find_pwd_name").val();
		
	
		
		var param = {"user_id":user_id, "user_name":user_name}
		
		$.ajax({
			anyne: true,
			method:"POST",
			url:"/SerPwd_in_ok",
			contentType:"application/json",
			data:JSON.stringify(param),
			success: function(){
				
			},
			error: function(){
				$('#find_pwd_id').val('');
				$('#find_pwd_name').val('');
			}
			
		});
		
	});
	
});
</script>
<body>
<div id = "SerPwd_in">
<b id = "SerPwd_in_title">비밀번호 찾기</b>

 <input type = "text" id = "find_pwd_id" placeholder = "아이디">
 <input type = "text" id = "find_pwd_name" placeholder = "이름">
 <button type = "button" id = "SerPwd_button">찾아보기</button>
<b id = "SerPwd_in_desc">찾고자 하는 비밀번호의 아이디와 이름을 입력해주세요.</b>

 
</div>

</body>
</html>
<%@ include file="../include/footer.jsp"%>