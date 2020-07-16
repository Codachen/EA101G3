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

// 	MemberPetService adoptedPetsSvc = new AdoptedPetsService();
// 	List<AdoptedPetsVO> list = adoptedPetsSvc.getAll();
// 	pageContext.setAttribute("list", list);
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

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

main {
	font-family: 'Noto Sans TC';
}

#pet-search-title, form.pet-search-form, div.pet-sort-row {
	padding-left: 15px;
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
					<a href="<%=request.getContextPath()%>/front-end/frontEndIndex/index.jsp" class="nav-link">首頁</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/member/member/membercenter.jsp" class="nav-link">會員專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page3.jsp" class="nav-link">門診專區</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/Hotel/hotelIndex.jsp" class="nav-link">寵物旅館</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/product/shopindex.jsp" class="nav-link">寵物商城</a>
				</li>
				<li class="nav-item dropdown">
					<a href="<%=request.getContextPath()%>/front-end/adopt/adoptedpets/listAllPets.jsp" class="nav-link">領養專區</a>
				</li>
			</ul>
			<div style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>" id="loginFonts">
				<span class="nav-link">
				<img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}" style="height: 50px" id="mempic">
				 <%=memName%>您好~
				  </span>
			</div>
			<a href="<%=request.getContextPath()%>/front-end/member/member/addMem.jsp">
				<button class="btn menu-right-btn border" type="button" style="<%=(memNO == null) ? "display:" : "display:none"%>">註冊</button>
			</a>
			<a href="<%=request.getContextPath()%>/front-end/member/member/login.jsp">
				<button class="btn menu-right-btn border" type="submit" id="login" style="<%=(memNO == null) ? "display:" : "display:none"%>">登入</button>
			</a>
			<form class="form-inline my-2 my-lg-0" action="<%=request.getContextPath()%>/Puppy/logout.do">
				<button class="btn menu-right-btn border" type="submit" id="logout" style="<%=(memNO != null) ? "display:" : "display:none"%>">登出</button>
			</form>
		</div>
	</nav>
	</header>