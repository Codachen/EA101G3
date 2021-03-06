<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.adoptedpets.model.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="com.MemberPet.model.*"%>


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
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>
<%
	MemberPetService memberPetSvc = new MemberPetService();
List<MemberPetVO> list = memberPetSvc.getPetsFromThisMember(memNO);
pageContext.setAttribute("list", list);
%>


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
	height: 300px;
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
	<main role="main">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-4">
					<a class="btn btn-outline-success ml-5"
						href="<%=request.getContextPath()%>/front-end/member/memberpet/AddMemberPets.jsp"
						role="button">新增</a>
				</div>
				<div class="col-4 bg-light text-center">
					<h3>寵物資訊</h3>
				</div>
				<div class="col-4"></div>
			</div>
			<div class="row pet-list mt-5">
				<c:forEach var="memberPetVO" items="${list}" varStatus="loop">
					<c:if test="${memberPetVO.petStatus == '0'}">
						<div class="col-md-6">
							<div class="card mb-4 shadow-sm pet-card  border-white">
								<div
									class="card-img-top pet-card-img-top d-flex justify-content-center">
									<img
										src="<%=request.getContextPath()%>/memberpet/memberpetpic.do?petNo=${memberPetVO.petNo}"
										class="pet-img rounded">
								</div>
								<div class="container">
									<ul class="list-group list-group-flush info-list">
										<li class="list-group-item text-center">姓名：${memberPetVO.petName}</li>
										<li class="list-group-item text-center">品種：${memberPetVO.petVariety}</li>
										<li class="list-group-item text-center">性別：${memberPetVO.petGender}</li>
										<li class="list-group-item text-center">年齡：${memberPetVO.petAge}</li>
									</ul>
								</div>
								<div
									class="card-body pet-card-body d-flex justify-content-center">
									<div class="btn-group ">
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/memberpet/memberpet.do">
											<button type="submit" class="btn btn-lg btn-outline-warning">修改</button>
											<input type="hidden" class="form-control" name="petNo"
												value="${memberPetVO.petNo}"><input type="hidden"
												class="form-control" name="action" value="getOne_For_Update">
										</FORM>
										<FORM METHOD="post"
											ACTION="<%=request.getContextPath()%>/memberpet/memberpet.do">
											<button type="submit" class="btn btn-lg btn-outline-danger">移除</button>
											<input type="hidden" class="form-control" name="petNo"
												value="${memberPetVO.petNo}"> <input type="hidden"
												class="form-control" name="memNo" value="${memNO}">
											<input type="hidden" class="form-control" name="petName"
												value="${memberPetVO.petName}"> <input type="hidden"
												class="form-control" name="petVariety"
												value="${memberPetVO.petVariety}"> <input
												type="hidden" class="form-control" name="petAge"
												value="${memberPetVO.petAge}"> <input type="hidden"
												class="form-control" name="petGender"
												value="${memberPetVO.petGender}"> <input
												type="hidden" class="form-control" name="petStatus"
												value="${memberPetVO.petStatus}"> <input
												type="hidden" class="form-control" name="action"
												value="delete">

										</FORM>
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</main>
	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>
</body>
</html>