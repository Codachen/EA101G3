<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.mem.model.*"%>
<%	
	MemberVO member = (MemberVO)session.getAttribute("member");
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");
%>


<%
	AdoptedPetsVO adoptedpetsVO = (AdoptedPetsVO) request.getAttribute("adoptedpetsVO");
%>

<!DOCTYPE html>
<html>

<head>
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
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
	integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
	crossorigin="anonymous"></script>


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

.pet-figure {
	height: 400px;
	weight: auto;
}

ul {
	list-style-type: circle;
	list-style-position: inside;
}

.list-group-item {
	display: list-item;
}

main {
	font-family: 'Noto Sans TC';
}
</style>

</head>

<body>
<header>
	<nav class="navbar navbar-expand-lg navbar-light ">
		<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="navbar-brand ml-3">
			Cute:)
			<span style="color: #00E8E8;">Family</span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarMenu" aria-controls="navbarMenu" aria-expanded="false" aria-label="Toggle Navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse"></div>
		<div class="collapse navbar-collapse" id="navbarMenu">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a href="index.html" class="nav-link">首頁</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link " href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 會員專區 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="#">會員登入</a>
						<form action="<%=request.getContextPath()%>/Puppy/mem.do" METHOD="post" style="margin-bottom: 0px;">
							<input type="submit" value="編輯會員資料" class="dropdown-item">
							<input type="hidden" name="memNO" value="${memNO}">
							<input type="hidden" name="action" value="getOne_For_Update">
						</form>
						<a class="dropdown-item" href="#">管理您的寵物</a>
						<form METHOD="post" ACTION="<%=request.getContextPath()%>/Puppy/mli.do" style="margin-bottom: 0px;">
							<input type="submit" value="瀏覽最新通知" class="dropdown-item">
							<input type="hidden" name="mli" value="${memNO}">
							<input type="hidden" name="action" value="getAll_For_Display">
						</form>
					</div>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" class="nav-link">門診專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/Hotel/myIndex.jsp" class="nav-link">寵物旅館</a>
				</li>
				<li class="nav-item dropdown">
					<a href="#" class="nav-link">寵物商城</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp" class="nav-link">領養專區</a>
				</li>
			</ul>
			<div style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>" id="loginFonts">
				<img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}" style="height: 50px" id="mempic">
				<%=memName%>您好~
			</div>
			<a href="#">
				<button class="btn menu-right-btn border" type="button" style="<%=(memNO == null) ? "display:" : "display:none"%>">註冊</button>
			</a>
			<a href="#">
				<button class="btn menu-right-btn border" type="submit" id="login" style="<%=(memNO == null) ? "display:" : "display:none"%>">登入</button>
			</a>
			<form class="form-inline my-2 my-lg-0" action="<%=request.getContextPath()%>/Puppy/logout.do">
				<button class="btn menu-right-btn border" type="submit" id="logout" style="<%=(memNO != null) ? "display:" : "display:none"%>">登出</button>
			</form>
		</div>
	</nav>
</header>
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
		<section class="pet-search"></section>
		<div class="container-fluid">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-3 text-right mt-3">
					<figure class="figure pet-figure">
						<img
							src="<%=request.getContextPath()%>/adoptedpetspic.do?petNo=${adoptedpetsVO.petNo}"
							class="figure-img img-fluid rounded pet-img" alt="...">
						<figcaption class="figure-caption text-right">
							${adoptedpetsVO.petNo}</figcaption>
					</figure>
				</div>
				<div class="col-lg-3">
					<ul class="list-group list-group-flush text-left">
						<li class="list-group-item">編號：${adoptedpetsVO.petNo}</li>
						<li class="list-group-item">類型：${adoptedpetsVO.petSpecies}</li>
						<li class="list-group-item">品種：${adoptedpetsVO.petBreed}</li>
						<li class="list-group-item">性別：${adoptedpetsVO.petGender}</li>
						<li class="list-group-item">收容日期：${adoptedpetsVO.adoptedDate}</li>

					</ul>
				</div>
			</div>
		</div>
		</div>

	</main>
	<footer>
		<div class="section-5 text-center">
			<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
			<h4 class="my-4">如果您有需要 請聯絡我們</h4>

			<div class="form-inline justify-content-center">
				<input type="text" name="Email" id="email" placeholder="Email"
					size="40" class="form-control px-4 py-2"> <input
					type="button" value="Contact US"
					class="btn btn-danger px-4 py-2 ml-1">
			</div>
			<div class="social" style="margin: 5%;">
				<div class="d-flex flex-row justify-content-center">
					<i class="fab fa-facebook-f m-2"></i> <i class="fab fa-twitter m-2"></i>
					<i class="fab fa-instagram m-2"></i> <i class="fab fa-youtube m-2"></i>
				</div>
			</div>
			<hr>
			<h5 style="color: lightseagreen;">Cute Family &copy;</h5>
		</div>
	</footer>
	<script>
		$(document).ready(
				function() {
					$("li.subnavli").mouseenter(
							function() {

								if ($(this).index() !== 2) {
									$(this).css({
										"background-color" : "#fd9742c9",
										"border-left" : "1px solid white"
									});
									$(this).next().css({
										"border-left" : "1px solid white",
									});
									$(this).find("a").attr("style",
											"color: white !important");
								} else {
									$(this).css({
										"background-color" : "#fd9742c9",
										"border-left" : "1px solid white",
										"border-right" : "1px solid white"
									});
									$(this).find("a").attr("style",
											"color: white !important");

								}
								

							}).mouseleave(
							function() {

								if ($(this).index() !== 2) {
									$(this).css({
										"background-color" : "#f1f3f3",
										"border-left" : ""
									});
									$(this).next().css({
										"border-left" : "",
									});
									$(this).find("a").attr("style",
											"color: #8a8a90 !important");
								} else {
									$(this).css({
										"background-color" : "#f1f3f3",
										"border-left" : "",
										"border-right" : ""
									});
									$(this).find("a").attr("style",
											"color: #8a8a90 !important");
								}
							});

				});
	</script>


</body>
</html>