<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="inner-wrap">
	<div class="quick_reserve">
		<h2 class="tit">빠른예매</h2>
		<div class="seat-select-section">
			<form action="result" method="post" name="reserveForm"
				id="reserveForm">
				<input type="hidden" id="movieTotalSel" name="movieTotalSel"
					value="${movietotal.movietotalnum }" /> <input type="hidden"
					id="adultCount" name="adultCount"> <input type="hidden"
					id="kidCount" name="kidCount"> <input type="hidden"
					id="seat_name" name="seat_name">
					<input type="hidden" id="count" name="count">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<input type="hidden" id="idSel" name="idSel" value="${id}">
				<div class="seat-section">
					<div class="tit-util">
						<h3 class="tit small">관람인원선택</h3>
					</div>
					<div class="seat-area">
						<div class="seat-count" style="min-height: 52px;">
							<div id="Select">
								<div class="selectInnerWrap">
									<div class="selecter1">
										<h3>성인</h3>
										<div class="radio-group">
											<c:forEach begin="0" end="5" var="i">
												<input type="radio" name="adult" id="adult${i}"
													onchange="setDisplay()" value="${i}">
												<label for="adult${i}">${i}</label>
											</c:forEach>
										</div>
									</div>
									<div class="selecter2">
										<h3>청소년</h3>
										<div class="radio-group">
											<c:forEach begin="0" end="5" var="i">

												<input type="radio" name="teen" id="teen${i}"
													onchange="setDisplay()" value="${i}">
												<label for="teen${i}">${i}</label>
											</c:forEach>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="seat-layout">
							<div class="scroll">
								<div class="mCustomScrollBox">
									<div class="mSCB_container">
										<div id="seatLayout">

											<div>
												<div class="screen"
													style="position: absolute; left: 281px; top: 10px;">screen</div>
												<table>
													<c:forEach begin="1" end="13" var="i">
														<tr>
															<td><c:if test="${i eq 1}">
																	<c:set value="A" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 2}">
																	<c:set value="B" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 3}">
																	<c:set value="C" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 4}">
																	<c:set value="D" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 5}">
																	<c:set value="E" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 6}">
																	<c:set value="F" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 7}">
																	<c:set value="G" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 8}">
																	<c:set value="H" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 9}">
																	<c:set value="I" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 10}">
																	<c:set value="J" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 11}">
																	<c:set value="K" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 12}">
																	<c:set value="L" var="seatInit"></c:set>
																</c:if> <c:if test="${i eq 13}">
																	<c:set value="M" var="seatInit"></c:set>
																</c:if>${seatInit}</td>
															<c:forEach begin="1" end="15" var="j">
																<td class="bookable"><label
																	for="seat${(i-1)*15 + j}"> <input
																		type="checkBox" class="seat" name="${seatInit}${j}"
																		id="seat${(i-1)*15 + j}" value="${seatInit}${j}">&nbsp${j}&nbsp
																</label></td>
																<c:if test="${j eq 4}">
																	<td></td>
																</c:if>
																<c:if test="${j eq 11}">
																	<td></td>
																</c:if>
															</c:forEach>
														</tr>
													</c:forEach>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

				</div>
				<div class="seat-result">
					<div class="seat_wrap">
						<div class="tit_area">
							<p class="titl">${movietotal.moviename }</p>
							<p class="cate">2D</p>
						</div>
						<div class="info-area">
							<p class="theater">${movietotal.branchname }</p>
							<p class="special">${movietotal.thname }</p>
							<p class="date">
								<span>${movietotal.strdate }</span>
							</p>
							<div class="time">
								${movietotal.strhour}:${movietotal.strmin}~${movietotal.endhour}:${movietotal.endmin}
							</div>
							<p class="poster">
								<img src="${movietotal.poster}" style="width: 72px;">
							</p>
						</div>
						<div class="choice-seat-area">
							<div class="my_seatnum">
								<img src="./resources/images/reserve/seat.png">
							</div>
							<div class="seat_condition">
								<ul class="cond_list">
									<li>
										<div id="checked-seat"></div> <em>선택</em>
									</li>
									<li>
										<div id="reserved_seat"></div> <em>예매완료</em>
									</li>
									<li>
										<div id="no_choice"></div> <em>선택불가</em>
									</li>
								</ul>
							</div>
						</div>
						<div class="pay-area">
							<div class="pay">
								<p class="pay-tit">최종결제금액</p>
								<!--  
								<div class="money">
									<input type="text" id="price" name="price" readonly="readonly"> <span
										style="display: block; float: left; padding: 0 0 0 5px; line-height: 35px;">원</span>
								</div>
								-->
								<div class="price_wrap">
									<input type="text" id="price" name="price" readonly="readonly">원
								</div>
							</div>
						</div>
						<div class="finish-area">
							<a class="finish-area-btn" href="/screening">이전</a> <a
								class="finish-area-btn active" href="#" id="btn_reserve">결제</a>

						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var list = [];
	<c:forEach items="${seat}" var="seat">
	list.push("${seat.seat_name}");
	</c:forEach>

	for (var i = 0; i < list.length; i++) { 
		for (var j = 1; j < $("input:checkbox[class='seat']").length + 1; j++) {
			if (list[i] == $("input:checkbox[id='seat" + j + "']").val()) {
				$("input:checkbox[id='seat" + j + "']").parents("td").attr(
						"class", "booked");
				$("input:checkbox[id='seat" + j + "']").attr('disabled', true);
			}
		}
	}

	$(function() {
		$('td').mouseover(function() {
			if (this.className == 'bookable')
				$(this).addClass('over');
		});
		$('.bookable').mouseout(function() {
			$(this).removeClass('over');
		});
	});

	$("input:checkbox[class='seat']")
			.change(
					function() { 
						var seat_name = "";
						for (var i = 0; i < $("input:checkbox[class='seat']").length + 1; i++) {
							if ($("input:checkbox[id=seat" + i + "]").is(
									":checked") == true) {
								seat_name = seat_name
										+ $("input:checkbox[id=seat" + i + "]")
												.val();
								$("#seat_name").val(seat_name);
								if ($("input:checkbox[class='seat']:checked").length > 1) { 
									seat_name = seat_name + ",";
								}
								if ($("input:checkbox[class='seat']:checked").length > 0) {
									var adultCount = 0; 
									var teenCount = 0; 
									for (var j = 0; j < 6; j++) {
										if ($("input:radio[id=adult" + j + "]")
												.is(":checked") == true) {
											adultCount = j; 
										}
										if ($("input:radio[id=teen" + j + "]")
												.is(":checked") == true) {
											teenCount = j; 
										}
									}
									var pay = teenCount * 12000 + adultCount
											* 14000;
									$("#price").val(pay);
								}
							}
						}
						if ($("input:checkbox[class='seat']:checked").length == 0)
							$("#seat_name").val('');
						var countAdult = $('input[name="adult"]:checked').val();
						if (countAdult == null)
							countAdult = 0;
						countAdult = Number(countAdult);
						var countteen = $('input[name="teen"]:checked').val();
						if (countteen == null)
							countteen = 0;
						countteen = Number(countteen);
						if (this.checked == false) { 
							var cancel = confirm(this.value + "좌석 취소하시겠습니까?");
							if (cancel == true) {
								$(this).parents("td").attr('class', 'bookable');
							} else { 
								this.checked = true;
								$(this).parents("td").attr('class', 'booking');
							}
						} else {
							$(this).parents("td").attr('class', 'booking');
						}
						if ($("input:checkbox[class='seat']:checked").length == countAdult
								+ countteen) {
							$("input:checkbox[class='seat']").not(":checked")
									.parents("td").attr('class', 'bookend');
							$("input:checkbox[class='seat']").not(":enabled")
									.parents("td").attr('class', 'booked');
						} else if ($("input:checkbox[class='seat']:checked").length < countAdult
								+ countteen) {
							$("input:checkbox[class='seat']").not(":checked")
									.parents("td").attr('class', 'bookable');
							$("input:checkbox[class='seat']").not(":enabled")
									.parents("td").attr('class', 'booked');
						} else if (countAdult + countteen != 0
								&& $("input:checkbox[class='seat']:checked").length > countAdult
										+ countteen) {
							
							alert('이미 선택하신 좌석을 취소하고 선택해주십시오.');
							$(this).parents("td").attr('class', 'bookend');
							this.checked = false;
						} else if (countAdult + countteen == 0) {
							alert('관객 수를 선택 하세요.');
							$(this).parents("td").attr('class', 'bookable');
							this.checked = false;
						}
						$("#seatCount")
								.val(
										$("input:checkbox[class='seat']:checked").length);
					});
	function setDisplay() { // 인원 수 변경시
		if ($('input:radio[name=adult]').is(':checked')
				|| $('input:radio[name=teen]').is(':checked')) {
			$("#seatSelect").show();
		}
		var countAdult = $('input[name="adult"]:checked').val();
		if (countAdult == null)
			countAdult = 0;
		countAdult = Number(countAdult);
		var countteen = $('input[name="teen"]:checked').val();
		if (countteen == null)
			countteen = 0;
		countteen = Number(countteen);
		$("#count").val(countAdult + countteen);
		if ($("input:checkbox[class='seat']:checked").is(":checked") == true) { 
			$("input:checkbox[class='seat']:checked").parents("td").attr(
					'class', 'bookable');
			$(".bookend").attr('class', 'bookable');
			$("input:checkbox[class='seat']:checked").prop("checked", false);
		}
	}
	
	$("#btn_reserve").click(function() {
		var adultCount = 0; 
		var teenCount = 0; 
		var peopleCount = 0 
		var seatCount = 0 
		var seatNum = new Array(); 
		var seatLength = $("input:checkbox[class='seat']:checked").length 
		$("#seatCount").val(seatLength);
		for (var i = 1; i < 6; i++) {
			if ($("input:radio[id=adult" + i + "]").is(
					":checked") == true) {
				adultCount = i; 
				
			}
			if ($("input:radio[id=teen" + i + "]").is(
					":checked") == true) {
				teenCount = i; 
				
			}
		}
		peopleCount = adultCount + teenCount; 
		for (var i = 1; i < $("input:checkbox[class='seat']").length + 1; i++) {
			if ($("input:checkbox[id=seat" + i + "]").is(
					":checked") == true) {
				seatNum[seatCount] = i; 
				seatCount++;
			}
		}
		if (seatLength == peopleCount && peopleCount != 0) { // 관객 수와 선택 좌석 수가 같을 경우 
			for (var i = 0; i < seatCount; i++) {
				$("input:checkbox[id=seat"
								+ seatNum[i] + "]").attr(
						'disabled', true);
			}
			var pay = teenCount * 12000 + adultCount * 14000;
			$("#adultCount").val(adultCount);
			$("#kidCount").val(teenCount);
			$("#price").val(pay);
			alert("금액 : " + pay + "원, 예매");
			$("#reserveForm").submit();
		} else if (seatLength > peopleCount) { 
			alert("인원 수 보다 좌석 수가 더 많습니다.");
		} else if (seatLength < peopleCount) { 
			alert("좌석 수 보다 인원 수가 더 많습니다.");
		} else if (seatLength == 0 && peopleCount != 0) { 
			alert("좌석을 선택 하세요.")
		} else if (peopleCount == 0) {
			alert("관객 수를 선택 하세요.")
		}
	});
	
	
</script>




<%@ include file="../include/footer.jsp"%>