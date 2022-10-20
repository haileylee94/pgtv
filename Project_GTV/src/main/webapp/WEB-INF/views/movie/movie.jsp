<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../include/header.jsp" %> <%--상단 공통 페이지 외부 포함 파일 불러오기 --%>
<body>

	<!-- Slider main container -->
	<div class="swiper">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- Slides -->
			<div class="swiper-slide" 
				style="background-image: url(../image/honest.jpeg);"><a href="#"><img src="../image/pbt.png" alt="제작자: Uniconlabs"></a></div>
			<div class="swiper-slide"
				style="background-image: url(../image/gong.jpg);"><a href="#"><img src="../image/pbt.png" alt="제작자: Uniconlabs"></a></div>
			<div class="swiper-slide"
				style="background-image: url(../image/avatar.jpeg);"><a href="#"><img src="../image/pbt.png" alt="제작자: Uniconlabs"></a></div>
			
		</div>
		<!-- If we need pagination -->
		<div class="swiper-pagination"></div>

		<!-- If we need navigation buttons -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>

		<!-- If we need scrollbar -->
		<div class="swiper-scrollbar"></div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
		<script>
		var swiper = new Swiper('.swiper', {
			  // Optional parameters
			  effect: 'cube',
			  		grabCursor: true,
			  		cubeEffect: {
			  			shadow: true,
			  			slideShadows: true,
			  			shadowOffset: 30,
			  			shadowScale: 0.94,
			  		},
			  		loop: true,
			  		speed: 2000,


			  // If we need pagination
			  pagination: {
			    el: '.swiper-pagination',
			  },

			  // Navigation arrows
			  navigation: {
			    nextEl: '.swiper-button-next',
			    prevEl: '.swiper-button-prev',
			  },

			  // And if we need scrollbar
			  scrollbar: {
			    el: '.swiper-scrollbar',
			  },
			});
		</script>
<!-- swiper -->
	
	<div class="now-top5">
		<div class="top5_title">
			<div class="title_area">현재 상영작
			<strong style="color: red;"> TOP 5</strong></div>
			<div class="moredetails">더 살펴보기<img alt="화살표" src="../image/right-arrow.png"></div>
		</div>
		<!-- top5_title -->
		<div class="top5_programes">
			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/hansan.jpg" alt="한산">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="movie_sub.jsp">상세정보</a></div>
				</div>
			</div>
			<!-- 한산 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/money.jpeg" alt="money_heist">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- moneyheist -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/woyoungwo.jpeg" alt="우영우">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- 우영우 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/hansan.jpg" alt="한산">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- 한산 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/money.jpeg" alt="money_heist">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- moneyheist -->

		</div>
		<!-- top5_programes -->
	</div>
	<!--now-top5 -->
	
		<div class="upcoming-top5">
		<div class="top5_title">
			<div class="title_area">상영 예정작
			<strong style="color: red;"> TOP 5</strong></div> 
			<div class="moredetails">더 살펴보기<img alt="화살표" src="../image/right-arrow.png"></div>
		</div>
		<!-- top5_title -->
		<div class="top5_programes">
			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/hansan.jpg" alt="한산">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- 한산 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/money.jpeg" alt="money_heist">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- moneyheist -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/woyoungwo.jpeg" alt="우영우">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- 우영우 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/hansan.jpg" alt="한산">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- 한산 -->

			<div class="card-box">
				<div class="img-gradient"></div>
				<img src="../image/money.jpeg" alt="money_heist">
				<div class="text-wrap">
					<div id="booking"><a href="#">예매하기</a></div>
					<div class="btm-info"><a href="#">상세정보</a></div>
				</div>
			</div>
			<!-- moneyheist -->

		</div>
		<!-- top5_programes -->
	</div>
	<!--upcoming-top5 -->
	
	<div class="banner_01">
		<a href="#">
			<img src="../image/suri.jpeg" alt="수리남">
		</a>
	</div>
	<!-- banner_01 -->
	<hr>
	<div id="ad-beer">
		<a href="#">
			<img src="../image/beer.jpeg" alt="맥주광고">
		</a>
	</div>
	<!-- ad-beer -->
	
	<jsp:include page="../include/footer.jsp" />