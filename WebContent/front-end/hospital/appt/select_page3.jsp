<!DOCTYPE html>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

<%
	String memNO = (String) session.getAttribute("memNO");
	String memName = (String) session.getAttribute("memName");
%>

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
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
   
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
 
     <!-- Site Metas -->
 
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="style2.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
	<script src="js/modernizr.js"></script> <!-- Modernizr -->

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<body id="page-top" class="politics_version">

<!-- HEADER -->
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
				<div style="<%=(memNO == null) ? "visibility:hidden" : "visibility:"%>">
					<img alt="" src="<%=request.getContextPath()%>/Puppy/pic.do?memNo=${memNO}" style="height: 50px" id="mempic">
					<%=memName%>您好~
				</div>
				<a href="#">
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
<!-- HEADER -->

    <!-- LOADER -->
    <div id="preloader">
        <div id="main-ld">
			<div id="loader"></div>  
		</div>
    </div><!-- end loader -->
    <!-- END LOADER -->
	
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
  
            </li>
          </ul>
        </div>
      </div>
    </nav>
	
	<section id="home" class="main-banner parallaxie" style="background: url('uploads/banner-01.jpg')">
		<div class="heading">
		
			<h1>Cute Family </h1>			
			<h3 class="cd-headline clip is-full-width">
				<span>We care for your </span>
				<span class="cd-words-wrapper">
					<b class="is-visible">Lovely Pets</b>
					
					<b>Cats</b>
					<b>Dogs</b>
					<b>other pets</b>
				</span>
				<div class="btn-ber">
				
					<a class="get_btn hvr-bounce-to-top" href="<%=request.getContextPath()%>/front-end/hospital/appt/select_page.jsp">預約門診</a>
					<table>
					<FORM id="form1" METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/appt/appt.do" name="form1">
					<input type="hidden" name="memno" value="${memNO}">
					<input type="hidden" name="optstate" value="0">
					
					<a class="learn_btn hvr-bounce-to-top" href="javascript:;" onclick="document.getElementById('form1').submit();">預約查詢</a>
        	<input type="hidden" name="action" value="listAppt_ByCompositeQuery2">
				</FORM>
				 </table>
				</div>
			</h3>
			
		</div>
		
	</section>
	
    <div id="services" class="section lb">
        <div class="container">
            <div class="section-title text-center">
               <h3>看診進度</h3>
                <p>為您即時顯示目前看診進度</p>
            </div><!-- end title -->

            <div class="row">
				<div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
							
							 <!-- icon -->
						</div>DR01
						<h2>張國彬醫師</h2>
						<iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queue1.jsp" frameborder="0" width="100%" height="100%"></iframe>
					</div>
                </div><!-- end col -->
                
                <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
						</div>DR02
						<h2>李美玲醫師</h2>
						<iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queueB.jsp" frameborder="0" width="100%" height="100%"></iframe>
					</div>
                </div><!-- end col -->
				<div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
						</div>DR03
						<h2>黃昭文醫師</h2>
						<iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queueC.jsp" frameborder="0" width="100%" height="100%"></iframe>
					</div>
                </div><!-- end col -->
                <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
						</div>DR04
						<h2>蔡旻烜醫師</h2>
						<iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queueD.jsp" frameborder="0" width="100%" height="100%"></iframe>
					</div>
                </div><!-- end col -->
                <div class="col-md-4">
                    <div class="services-inner-box">
						<div class="ser-icon">
							<i class="flaticon-discuss-issue"></i>
						</div>DR05
						<h2>鄭柏昕醫師</h2>
						<iframe src="<%=request.getContextPath()%>/front-end/hospital/appt/queueE.jsp" frameborder="0" width="100%" height="100%"></iframe>
					</div>
                </div><!-- end col -->
				
            </div><!-- end row -->
        </div><!-- end container -->
    </div><!-- end section -->
	
	
	
	
	<div id="blog" class="section lb">
		<div class="container">
			<div class="section-title text-center">
                <h3>Team</h3>
                <p>優質醫師團隊給您的寵物安心照護</p>
            </div><!-- end title -->
			
			<div class="row">
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-01.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>門診值班表</h4>
							<ul>
                                <li>檢索醫生看診值班時段</li>
  
                               
                            </ul>
							
<p><a href='<%=request.getContextPath()%>/front-end/hospital/appt/dispOpt.jsp' style="text-decoration:none;"><b>點此瀏覽門診班表</b></a></p>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
  <jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
  
<%--       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/doc/doc.do" > --%>
<!--        <b></b> -->
<!--        <select size="1" name="docno" style="width:130px"> -->
<%--          <c:forEach var="docVO" items="${docSvc.all}" >  --%>
<%--           <option value="${docVO.docno}">${docVO.docno}-${docVO.docname} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--     </FORM> -->
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-02.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>科別查詢</h4>
							<ul>
                               <li>選擇科別以查詢醫師資訊</li>
                            </ul>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/div/div.do" >
       <b><font></font></b>
       <select size="1" name="divno">
         <c:forEach var="divVO" items="${divSvc.all}" > 
          <option value="${divVO.divno}">${divVO.divname}
         </c:forEach>   
       </select>
       <input type="submit" value="送出">
       <input type="hidden" name="action" value="listDocs_ByDivno_C">
     </FORM>
						</div>
					</div>
				</div>
				<div class="col-md-4 col-sm-6 col-lg-4">
					<div class="post-box">
						<div class="post-thumb">
							<img src="uploads/blog-03.jpg" class="img-fluid" alt="post-img" />
							
						</div>
						<div class="post-info">
							<h4>全部醫師一覽</h4>
							<ul>
                                <li>查詢全部醫師</li>
                               
                            </ul>
							<p><a href='<%=request.getContextPath()%>/front-end/hospital/doc/listAllDoc.jsp' style="text-decoration:none;"><b>點此瀏覽全部醫師資訊</b></a></p>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	
	

    

    <a href="#" id="scroll-to-top" class="dmtop global-radius"><i class="fa fa-angle-up"></i></a>

    <!-- ALL JS FILES -->
    <script src="js/all.js"></script>
	<!-- Camera Slider -->
	<script src="js/jquery.mobile.customized.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script> 
	<script src="js/parallaxie.js"></script>
	<script src="js/headline.js"></script>
	<!-- Contact form JavaScript -->
    <script src="js/jqBootstrapValidation.js"></script>
    <script src="js/contact_me.js"></script>
    <!-- ALL PLUGINS -->
    <script src="js/custom.js"></script>
    <script src="js/jquery.vide.js"></script>

</body>
<footer>
		<div class="section-5 text-center">
			<h4 style="margin-top: 5%;">最完善的寵物平台</h4>
			<h4 class="my-4">如果您有需要 請聯絡我們</h4>

			<div class="form-inline justify-content-center ">
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
	
	<script
		src="<%=request.getContextPath()%>/base64-js-master/base64js.min.js"></script>
	<%-- 	<script src="<%=request.getContextPath()%>/base64-js-master/index.js"></script> --%>
	
	
	</body>
	</html>
