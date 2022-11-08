<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/resources/js/jquery.js"></script>
<script>
	function join_check() {
		if ($.trim($("#sign_id_input").val()) == "") {
			alert("회원아이디를 입력하세요!");
			$("#sign_id_input").val("").focus();
			return false;
		}
		$sign_pwd_input = $.trim($("#sign_pwd_input").val());
		$sign_pwd_input2 = $.trim($("#sign_pwd_input2").val());
		if ($sign_pwd_input == "") {
			alert("비번을 입력하세요!");
			$("#sign_pwd_input").val("").focus();
			return false;
		}
		if ($sign_pwd_input2 == "") {
			alert("비번확인을 입력하세요!");
			$("sign_pwd_input2").val("").focus();
			return false;
		}
		if ($sign_pwd_input != $sign_pwd_input2) {
			alert("비번이 다릅니다!");
			$("#sign_pwd_input").val("");//비번 입력박스를 초기화
			$("#sign_pwd_input2").val("");
			$("#sign_pwd_input").focus();
			return false;
		}
		if ($.trim($("#sign_name_input").val()) == "") {
			alert("회원이름을 입력하세요!");
			$("#sign_name_input").val("").focus();
			return false;
		}
		if ($.trim($("#sign_email_input").val()) == "") {
			alert("이메일을 입력하세요!");
			return false;
		}
		if ($.trim($("#sign_email_input2").val()) == "") {
			alert("이메일을 입력하세요!");
			return false;
		}
		if ($.trim($("#sign_phone_input01").val()) == "") {
			alert("폰번호를 입력하세요!");
			$("#sign_phone_input01").val("").focus();
			return false;
		}
		if ($.trim($("#sign_phone_input02").val()) == "") {
			alert("폰번호를 입력하세요!");
			$("#sign_phone_input02").val("").focus();
			return false;
		}
		if ($.trim($("#sign_phone_input03").val()) == "") {
			alert("폰번호를 입력하세요!");
			$("#sign_phone_input03").val("").focus();
			return false;
		}
		if ($.trim($("#sign_year_input").val()) == "") {
			alert("생년월일을 입력하세요!");
			$("#sign_year_input").val("").focus();
			return false;
		}
		if ($.trim($("#sign_month_input").val()) == "월") {
			alert("생년월일을 입력하세요!");
			$("#sign_month_input").val("").focus();
			return false;
		}
		if ($.trim($("#sign_day_input").val()) == "") {
			alert("생년월일을 입력하세요!");
			$("#sign_day_input").val("").focus();
			return false;
		}
		if ($.trim($("#sign_gender_input").val()) == "성별") {
			alert("성별을 입력하세요!");
			$("#sign_gender_input").val("").focus();
			return false;
		}
	}
</script>
<link rel="stylesheet" type="text/css" 
href="/resources/css/sign_up.css" />

</head>
<body style="background-color: #1b1b1b">

	<div id="sign_up">
		<form name = "m" onsubmit="return join_check();" method = "post" action = "sign_up_ok">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
			<a href="pj_main.html" id="main_title">G.TV</a> 
			<b id="id_title">아이디</b>
			<div id="id_box">
				<input type="text" id="sign_id_input" name = "user_id">
			</div>
			<b id="pwd_title">비밀번호</b>
			<div id="pwd_box">
				<input type="password" id="sign_pwd_input" name = "user_pw">
			</div>
			<b id="pwd_check_title">비밀번호 재확인</b>
			<div id="pwd_box_check">
				<input type="password" id="sign_pwd_input2">
			</div>
			<b id="name_title">이름</b>
			<div id="name_box">
				<input type="text" id="sign_name_input" name = "user_name">
			</div>
			<b id="birth_title">생년월일</b>
			<div id="birth_box">
				<div id="year_box">
					<input type="text" placeholder="년(4자)" id="sign_year_input" name = "user_birth1">
				</div>
				<div id="month_box">
					<select id="sign_month_input" name = "user_birth2"><option>월</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option></select>
				</div>
				<div id="day_box">
					<input type="text" placeholder="일" id="sign_day_input" name = "user_birth3">
				</div>
			</div>
			<b id="gender_title">성별</b>
			<div id="gender_box">
				<select id="sign_gender_input" name = "user_gender"><option>성별</option>
					<option value="1">남자</option>
					<option value="2">여자</option></select>
			</div>
			<b id="email_title">이메일</b>
			<div id="email_box">
				<div id="email_text">
					<input type="text" id="sign_email_input" name = "email">
				</div>
				<div id="email_domain">
					<input type="text" id="sign_email_input2" name = "email_domain">
				</div>
			</div>
			<b id="phone_title">휴대전화</b>
			<div id="phone_number">
				<div id="phone01">
					<input type="text" id="sign_phone_input01" name = "user_phone1">
				</div>
				_
				<div id="phone02">
					<input type="text" id="sign_phone_input02" name = "user_phone2">
				</div>
				_
				<div id="phone03">
					<input type="text" id="sign_phone_input03" name = "user_phone3">
				</div>
			</div>
			<button type="submit" id="sign_button">가입하기</button>
		</form>





	</div>

</body>
</html>