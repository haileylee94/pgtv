<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<div class="body_frame">
	<div class="inner_wrap">
			<div class="quick-reserve">
				<h2 class="reserve_title_1"
					style="font-size: 30px; color: #222; margin-left: 10px; margin-bottom: 10px; font-weight: bold;">빠른예매</h2>
			</div>
			<div class="quick-reserve-include">
				<div class="quick-reserve-area">
					
					<form action="reserve" method="post" name="myForm" id="movieform">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<input type="hidden" id="movieSel" name="movieSel" value="" />
					<input type="hidden" id="regionSel" name="regionSel" value="" />	
					<input type="hidden" id="dateSel" name="dateSel" value=""/>
					<input type="hidden" id="dateSel2" name="dateSel2" value=""/>
					<input type="hidden" id="movieTotalSel" name="movieTotalSel" value=""/>
					<input type="hidden" id="idSel" name="idSel" value="${id}"/>
					
					
					<div class="movie-choice">
						<p class="tit" style="color: white;">영화</p>
						<div class="list-area">
							<div class="all-list">
								<button type="button" onclick="" class="btn-tab on"
									id="movieAll">전체</button>
								<div class="list">
									<div class="scroll">
										<div class="mCustomScrollBox">
											<div class="mCSB_container_1">

												<ul>
													<c:if test="${!empty mlist}">
														<c:forEach var="m" items="${mlist}">
															<li>
																<button type="button" id="movie_btn_0${m.movienum}"
																	value="_0${m.movienum}" class="movie" onclick="mnClk(${m.movienum});">
																	<span>${m.moviename}</span>
																</button>
															</li>
														</c:forEach>
													</c:if>
												</ul>


											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
					<div class="theater-choice">
						<div class="tit-area">
							<p class="tit">극장</p>
						</div>
						<div class="list-area">
							<div class="all-list">
								<button type="button" class="btn-tab on">전체</button>
								<div class="theater_tab">
									<c:if test="${!empty region}">
										<c:forEach var="re" items="${region}">
											<input type="radio" name="tabmenu" id="tab0${re.regionnum}">
											<label for="tab0${re.regionnum}">${re.regionname}</label>
										</c:forEach>
									</c:if>
									<div class="theaterbox box1">
										<ul>
											<c:if test="${!empty rlist}">
												<c:forEach var="r" items="${rlist}">
													<c:if test="${r.regionnum == 1}">
														<li>
															<button type="button"
																id="theater_seo_btn_${r.theaternum}"
																value="_${r.theaternum}" class="theater_bt" onclick="regionClk(${r.theaternum});">
																<span>${r.branchname}</span>
															</button>
														</li>
													</c:if>
												</c:forEach>
											</c:if>
										</ul>
									</div>
									<div class="theaterbox box2">
										<ul>
											<c:if test="${!empty rlist}">
												<c:forEach var="r" items="${rlist}">
													<c:if test="${r.regionnum == 2}">
														<li>
															<button type="button"
																id="theater_seo_btn_${r.theaternum}"
																value="_${r.theaternum}" class="theater_bt">
																<span>${r.branchname}</span>
															</button>
														</li>
													</c:if>
												</c:forEach>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
							<div class="other-list">
								<button type="button" class="btn-tab">특별관</button>
							</div>
						</div>
					</div>
					<div class="date-choice" style="width: 112px;">
						<div class="tit-area">
							<p class="tit">날짜</p>
						</div>
						<div class="date-schedule">
							<div class="date-list">
								<div>
									<ul class="date-list-ul">
										<li class="li-month">
											<div>
												<span class="span-year">${dayWeekList[1].year}</span> <span
													class="span-month">${dayWeekList[1].month}</span>
												<div></div>
											</div>
										</li>
										<c:forEach var="dvo" items="${dayWeekList }">
											<c:if test="${! empty dayWeekList }">
												<li class="li-day">
													<button type="button" id="day-btn_${dvo.day}" class="li-day-btn"
														value="_${dvo.day}" onclick="dateClk(${dvo.year},${dvo.month},${dvo.day});">
														<span class="span-dayweek ${dvo.dayOfweek}">${dvo.dayOfweek}</span>
														<span class="span-day ${dvo.dayOfweek}">${dvo.day}</span>
													</button>
												</li>
											</c:if>
										</c:forEach>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="hour-choice">
						<div class="tit-area">
							<p class="tit">시간</p>
						</div>
						<div class="hour-schedule">
							<div class="movie-schedule-area">
								<div class="result">
									<ul id="movieschedule">
										
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div class="end">
						<div class="end_area" id="moviesele">
							
							
						</div>
					</div>
					
					</form>
				</div>
			</div>
	</div>
	
</div>

<%@ include file="../include/footer.jsp"%>