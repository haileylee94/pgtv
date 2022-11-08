<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<title>Movie Project</title>

<link rel="stylesheet" type="text/css" href="./resources/css/main.css">
<link rel="stylesheet" type="text/css" href="./resources/css/movie.css">
<link rel="stylesheet" type="text/css" href="./resources/css/movie_sub.css">


<link rel="stylesheet" type="text/css" href="./resources/css/com_write.css">
<link rel="stylesheet" type="text/css" href="./resources/css/com_list.css">
<link rel="stylesheet" type="text/css" href="./resources/css/reserve_style.css">
<link rel="stylesheet" type="text/css" href="./resources/css/screening_style.css">
<script src="./resources/js/jquery.js"></script>
<script src="./resources/js/movie/com_write.js"></script>
<script src="./resources/js/movie/reserve.js"></script>


<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
</head>
<body style="background-color: #1b1b1b;">

	<div class="wrap">
		<div class="header">
			<h1 class="logo">
				<a href="/">G.TV</a>
			</h1>

				
			<ul class="nav">
				<li><a href="/">HONE</a></li>
				<li><a href="/screening">RESERVE</a></li>
				<li><a href="./sub-main/view_movie.jsp">CATEGORY</a></li>
				<li><a href="movie">MOVIE</a></li>

				<li><a href="./html/login.jsp" id="sign_in">SIGN IN</a></li>
			</ul>
			<div class="search_area">
				<form>
					<input type="search" placeholder="Ready to watch?"> <span>검색</span>
				</form>
			</div>
			<!-- search_area -->
		</div>
		<!-- header -->

	</div>
	<!-- wrap -->
	<div style="clear: both;"></div>




