<%@ page contentType="text/html; charset=UTF-8"%>
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/reserve.js"></script>
<div class="tit_area">
	<p class="titl">${movieselect.moviename}</p>
	<p class="cate">2D</p>
</div>
<div class="info-area">
	<p class="theater">${movieselect.branchname}</p>
	<p class="special">${movieselect.thname}</p>
	<p class="date">
		<span>${movieselect.strdate}</span>
	</p>
	<div class="time">${movieselect.strhour}:${movieselect.strmin}~${movieselect.endhour}:${movieselect.endmin}</div>
	<p class="poster">
		<img src="${movieselect.poster}" style="width:72px;">
	</p>
</div>
<div class="result-area">
	<input type="submit" class="result-btn" value="좌석선택" />
</div>