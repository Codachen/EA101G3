<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.adopter.model.*"%>
<%@ page import="com.mem.model.*"%>



<!DOCTYPE html>
<html>

<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>萌寵家族</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front-end/frontEndIndex/style.css">

<script src="https://kit.fontawesome.com/a559a578e4.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<%
	AdopterVO adoptetVO = (AdopterVO) request.getAttribute("adopterVO");
%>
<!-- bootstrap、FontAwesome、googleFont -->

<style>
a.nav-link-sub {
	color: #8a8a90 !important;
	font-size: 20px;
	padding: 12.5px 50px !important;
	margin: 0%;
	font-family: 'Noto Sans TC';
	white-space: nowrap;
}

.fas, .far {
	font-size: 30px;
	margin: 0px 5px;
}

.nav-link-sub:hover {
	color: white !important;
}

.navbar-sub-main {
	padding: 0px 16px;
}

.subnavli {
	/* 	border-left: 1px solid #8a8a90; */
	/* 	border-right: 1px solid #8a8a90; */
	
}

#subnavli-last {
	/* 	border-right: 1px solid #8a8a90; */
	
}

.pet-card-img-top {
	position: relative;
	width: 100%;
	height: 225px;
}

.pet-img {
	width: auto;
	height: 100%;
	max-width: 100%;
}

.pet-card {
	height: auto;
}

ul.info-list {
	list-style-type: circle;
	list-style-position: inside;
}

.list-group-item {
	display: list-item;
}

.col-sm-2gender {
	padding: 0px;
}

#addAdopter-form {
	margin-top: 15px;
}

.form-signin {
	font-family: 'Noto Sans TC';
}

hr {
	margin-top: 0px;
}

body{
	font-family: 'Noto Sans TC';
	height: 100%;
	background-image: url("images/loginbackground.jpg");
	/* The image used */
	background-color: #cccccc; /* Used if the image is unavailable */
	background-position: center top; /* Center the image */
	background-repeat: no-repeat; /* Do not repeat the image */
	background-size: cover;
	/* Resize the background image to cover the entire container */
}

.btn-primary {
	background-color: #ffffff66;
	border-color: #ffffff00;
	color: #212529;
}

.btn-primary:hover, .btn-primary:active, .btn-primary:visited,
	.btn-primary:focus {
	background-color: #ffffff99;
	border-color: #ffffff00;
	color: #212529;
}

p.text-right {
	color: white;
}

header{
	background-color: white;
}
</style>

<body>
	<main role="main">
		<nav class="navbar navbar-expand-lg navbar-light navbar-sub-main"
			style="background-color: #f1f3f3">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="justify-content-center collapse navbar-collapse"
				id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item subnavli"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp"><i
							class="fas fa-house-damage"></i>尋找浪浪</a></li>
					<li class="nav-item subnavli"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/interaction/listInteractionByAdopter.jsp"><i
							class="fas fa-search-plus"></i>領養互動查詢</a></li>
					<li class="nav-item subnavli" id="subnavli-last"><a
						class="d-flex nav-link nav-link-sub align-items-center"
						href="<%=request.getContextPath()%>/front-end/adopt/adopter/addAdopter.jsp"><i
							class="fas fa-user-edit"></i>領養人登記</a></li>
				</ul>
			</div>
		</nav>
		<div class="container">
			<div class="row justify-content-around">
				<div class="col-lg-3 mt-5">
					<form method="post" class="form-signin"
						action="<%=request.getContextPath()%>/adopter/adopter.do">
						<h1 class="h3 mt-3 mb-3 font-weight-normal text-center text-nowarp">領養人登入</h1>
						<label for="adopterName" class="sr-only adopterName"><b>姓名</b></label>
						<input type="text" id="adopterName" name="adopterName"
							class="form-control" placeholder="領養人姓名" required autofocus>
						<label for="adopterMail" class="sr-only"><b>電子郵件</b></label> <input
							type="email" id="adopterMail" name="adopterMail"
							class="form-control" placeholder="電子郵件" required>
						<button class="btn btn-lg btn-primary btn-block mt-5 text-nowarp"
							type="submit">登入</button>
						<input type="hidden" class="form-control" name="action"
							value="login">
						<p class="mt-3 mb-3 text-right">© 2020-2021</p>
					</form>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
	</main>
	<footer class="bg-white footer fixed-bottom">
		<div class="text-center">
			<hr>
			<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
		</div>
	</footer>

	<script>
		$(document).ready(function() {
			$('li.subnavli').mouseenter(function() {

				if ($(this).index() !== 2) {
					$(this).css({
						"background-color" : "#fd9742c9",
						"border-left" : "1px solid white"
					});
					$(this).next().css({
						"border-left" : "1px solid white",
					});
					$(this).find("a").attr("style", "color: white !important");
				} else {
					$(this).css({
						"background-color" : "#fd9742c9",
						"border-left" : "1px solid white",
						"border-right" : "1px solid white"
					});
					$(this).find("a").attr("style", "color: white !important");

				}

			}).mouseleave(function() {

				if ($(this).index() !== 2) {
					$(this).css({
						"background-color" : "#f1f3f3",
						"border-left" : ""
					});
					$(this).next().css({
						"border-left" : "",
					});
					$(this).find("a").attr("style", "color: #8a8a90 !important");
				} else {
					$(this).css({
						"background-color" : "#f1f3f3",
						"border-left" : "",
						"border-right" : ""
					});
					$(this).find("a").attr("style", "color: #8a8a90 !important");
				}

			});
			var gender = '${adopterVO.adopterGender}';
			if (gender === "男") {
				$('#adopterGender1').attr("checked", "checked");
			} else {
				$('#adopterGender2').attr("checked", "checked");
			}
		});
	</script>
</body>
</html>