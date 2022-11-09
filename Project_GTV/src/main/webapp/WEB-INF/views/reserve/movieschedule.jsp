<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/reserve.js"></script>
	<c:forEach var="mt" items="${mtlist}">
		<li class="hour_color">
			<button type=button id="hour_btn_${mt.movietotalnum}"
				value="_${mt.movietotalnum}" class="hour_btn" onclick="hourClk(${mt.movietotalnum});">
				<span class="time"> <strong>
						${mt.strhour}:${mt.strmin} </strong>
				</span> <span class="title"> <strong> ${mt.moviename} </strong>
				</span>
				<div class="info">
					<span class="theater"> ${mt.branchname} <br>
						${mt.thname}
					</span> <span class="seat"> <strong class="now">${mt.remainseat}</strong>
						<span>/</span> <em class="all">${mt.totalseat}</em>
					</span>
				</div>
			</button>
		</li>
	</c:forEach>
