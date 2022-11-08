<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<link rel="stylesheet" type="text/css" 
href="/resources/css/login.css" />
<script src="/resources/js/jquery.js"></script>
<script>
function login_check(){
    if($.trim($("#user_id").val())==""){
       alert("로그인 아이디를 입력하세요!");
       $("#user_id").val("").focus();
       return false;
    }
    if($.trim($("#user_pw").val())==""){
       alert("로그인 비번을 입력하세요!");
       $("#user_pw").val("").focus();
       return false;
    }
 }//로그인 인증 유효성 검증
 
 
</script>

   <div id="Login">
      <div style = "text-align:center; font-size:27px; color:black; position:relative; top:40px">로그인</div>
      <form onsubmit = "return login_check();" action = "/login" method="post">
      <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
      <div id = "Login_type">
         <input name = "user_id" id = "user_id" type="text" placeholder = "아이디">
         <input name = "user_pw" id = "user_pw" type="password" placeholder = "비밀번호">
      </div>
      <div id = "login_btn"><button type = "submit">로그인</button></div>
      </form>
      <div id = "id_ch eck"><input type = "checkbox" name = "remember-me" id = "remember-me"><label for = "remember-me" id = "remem_label">자동로그인</label></div>
      <div id = "SerN_in"><a href = "SerId_in">아이디 찾기</a> | <a href = "SerPwd_in">비밀번호 찾기</a> | <a href = "sign_up">회원가입</a></div>
      
    </div>
    
  <div style="clear: both;"></div>
  
<%@ include file="../include/footer.jsp"%>