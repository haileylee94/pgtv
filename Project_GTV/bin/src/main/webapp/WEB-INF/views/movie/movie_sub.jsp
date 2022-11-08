<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%--상단 공통 페이지 외부 포함 파일 불러오기 --%>

<div class="video-wrap">
	<video src="../video/gonjo.mp4" controls></video>
</div>

<div class="detail-top-wrap">
	<div class="poster">
		<img src="../image/gongjo_sub.png" alt="공조포스터">
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
		<hr>
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
			<img id="click-like" src="../image/icon2.svg">
			<div id="booking-btm">
				<a href="#">예매하기</a>
			</div>
		</div>
		<!-- detail-botton -->
	</div>
	<!-- detail-gongjo -->
</div>
<!-- detail-top-wrap -->
<div class="detail-cont-wrap">
	<div class="movie-detail">
		<div class="movie-info">영화 정보</div>
		<hr>
		<ul class="gongjo-content">
			<li class="cont1">공조 이즈 백! 이번엔 삼각 공조다!</li>
			<li class="cont2">남한으로 숨어든 글로벌 범죄 조직을 잡기 위해 새로운 공조 수사에 투입된 북한 형사
				'림철령'(현빈).</li>
			<li class="cont3">수사 중의 실수로 사이버 수사대로 전출됐던 남한 형사 '강진태'(유해진)는 광수대
				복귀를 위해 모두가 기피하는 '철령'의 파트너를 자청한다.</li>
			<li class="cont3">이렇게 다시 공조하게 된 '철령'과 '진태!</li>
			<li class="cont3">'철령'과 재화한 '민영'(임윤아)의 마음도 불타오르는 가운데, '철령'과 '진태'는 여전히 서로의 속내를 의심하면서도
			 나름 그럴싸한 공조 수사를 펼친다.</li>
		</ul>
	</div>
	<!-- movie-detail -->

	<div class="reviews">
		<div class="review-tit">평점 및 관람평(4,032)</div>
		<hr>
		<div class="person">
			<div id="women">
				<img alt="사람 아이콘  제작자: Good Ware - Flaticon"
					src="../image/woman.png">
				<div class="percent">58.8%</div>
			</div>
			<div id="men">
				<img alt="사람 아이콘  제작자: Freepik" src="../image/man.png">
				<div class="percent">41.2%</div>
			</div>
		</div>
		<!-- person -->
		<div id="graph">
			<img alt="제작자: Pixel Perfect" src="../image/graph.png">
			<div class="age"><em>10대</em> <em>20대</em> <em>30대</em></div>
		</div>
	</div>
	<!-- reviews -->
</div>
<!-- detail-cont-wrap" -->
<jsp:include page="../include/footer.jsp" />

