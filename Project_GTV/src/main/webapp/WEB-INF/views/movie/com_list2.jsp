<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../include/header.jsp"%>
<%--상단 공통 페이지 외부 포함 파일 불러오기 --%>

<div class="video-wrap">
	<video src="./resources/video/gonjo.mp4" controls></video>
</div>

<div class="detail-top-wrap">
	<div class="poster">
		<img src="./resources/images/main_movie/gongjo_sub.png" alt="공조포스터">
	</div>
	<!-- poster -->
	<div class="detail-gongjo">
		<div class="tit-info">
			<div class="star-review"></div>
			<strong class="gongjo-tit">공조2: 인터내셔널</strong>
		</div>
		<!-- tit-info -->
		<ul class="detail-info1">
			<li class="sub-info1" style="cursor: pointer;"><em>관람객 평점</em> <strong>9.3</strong>
			</li>
			<li class="sub-info2"><em>예매율 1위</em> <strong>24.8%</strong></li>
			<li class="sub-info3"><em>누적관객수</em> <strong>5,838,905</strong>
				<em>명</em></li>
		</ul>
		<!-- detail-info1 -->
		<ul class="detail-info2">
			<li class="sub-info4"><em>장르</em> <strong><em>액션
						코미디</em> <em>2022.09.07 개봉</em> <em>129분</em></strong></li>
			<li class="sub-info5"><em>감독</em> <strong>이석훈</strong></li>
			<li class="sub-info6"><em>출현</em> <strong>현빈, 유해진, 임윤아,
					다니엘 헤니, 진선규</strong></li>
		</ul>
		<!-- detail-info2 -->
		<div class="detail-botton">
			<img id="click-like" src="./resources/images/main_movie/icon2.svg">
			<div id="booking-btm">
				<a href="screening">예매하기</a>
			</div>
		</div>
		<!-- detail-botton -->
	</div>
	<!-- detail-gongjo -->
</div>
<!-- detail-top-wrap -->
<div class="reviews">
	<div class="review-tit">평점 및 관람평(4,032)</div>
	<hr>
	<div class="com_write">
		<form method="post" action="com_edit_ok"
			onsubmit="return com_check();">
			<div class="input_request">
				<input type="hidden" name="movienum" value="1"> <input
					type="hidden" name="moviename" value="공조2">
					<input type="hidden" name="com_num" value="${com_num}">
							<input type="hidden" name="page" value="${page}">
				<textarea name="cont_com" id="cont_com" rows="5" cols="80"
					>${cont_com }</textarea>
			</div>
			 <!-- input_request -->

			<input type="submit" class="com_list_btn" value="확인"> <input
				type="reset" value="취소" class="btn_cancel"
				onclick="$('#cont_com').focus();">
		</form>
	</div>
	<!-- com_write -->
</div>
<!-- reviews -->

<div class="com_result">

	<ul>
		<li class="totalCont">코멘트 수: ${totalCount}개</li>
		<c:if test="${!empty clist }">
			<c:forEach var="c" items="${clist }">
			<ul class="com_det">
				<li class="com_num">${c.com_num }</li>
				<li class="cont">${c.cont_com }</li>
				</ul>
				<!--  <li>${c.cont_com }</li> 아이디 받아오기-->
				<li class="cont_detail">${c.upload_com }</li>
				<input type="submit" value="삭제" id="com-remove"
					onclick="if(confirm('정말 삭제하시겠습니까?') == true){
			location='com_del?com_num=${c.com_num}&page=${page }';
				}else{return ;}">
				<%-- <input type="button" value="수정" onclick="location='com_edit?com_num=${c.com_num}&page=${page }';">--%>
				<input type="button" class="com_open" value="수정"
					onclick="location='com_edit?com_num=${c.com_num}&page=${page}';">
					<hr class="dot">
				 	<%--<a href="com_edit?com_num=${c.com_num}&page=${page}&state=edit">수정</a>--%>



			</c:forEach>
		</c:if>
	</ul>


	<c:if test="${empty clist }">
		<ul>
			<li class="totalCont">코멘트 수: ${totalCount}개</li>
			<li class="empty_com">이 영화에 대한 코멘트가 없습니다!</li>
		</ul>
	</c:if>

	<%--페이징 --%>
	<ul class="paging">
		<c:if test="${page <=1 }">
		[이전]&nbsp;
	</c:if>
		<c:if test="${page > 1 }">
			<a href="com_list?page=${page-1}">[이전]</a>&nbsp;
	</c:if>

		<%--현재 쪽번호 출력 --%>
		<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
			<c:if test="${a == page }">
				<%--현재 쪽번호가 선택된 경우 --%>
			<${a }>
		</c:if>
			<c:if test="${a != page }">
				<%--현재 쪽번호가 선택 안된 경우 --%>
				<a href="com_list?page=${a }">[${a }]</a>&nbsp;
		</c:if>
		</c:forEach>

		<c:if test="${page >= maxpage }">
		다음
	</c:if>
		<c:if test="${page < maxpage }">
			<a href="com_list?page=${page+1 }">[다음]</a>
		</c:if>
	</ul>
</div>
<!--com_result-->





<%@ include file="../include/footer.jsp"%>