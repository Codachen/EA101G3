<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>會員中心</title>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/member/member/membercentercss.css">
  <link rel="stylesheet" href="<%=request.getContextPath()%>/front-end/frontEndIndex/style.css">
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>
<%@ include file="/front-end/frontEndInclude/header.jsp"%>
</head>
<body>
<!-- partial:index.partial.html -->
<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,700" rel="stylesheet">
<div class="container">
  <h1>會員中心</h1>
  <div class="members">
    <div class="member">
    	<a href="<%=request.getContextPath()%>/Puppy/mem.do?action=getOne_For_Update&memNO=${memNO}">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/mempic.png">
      <h2 class="member-name">編輯會員資料</h2>
      <span class="member-role">Founder & CEO</span>
   		</a>
    </div>
    <div class="member">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/dog.jpg">
      <h2 class="member-name">寵物專區</h2>
      <span class="member-role">Senior Programmer</span>
    </div>
    <div class="member">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/hosiptal.jpg">
      <h2 class="member-name">診所預約</h2>
      <span class="member-role">Chief Systems Architect</span>
    </div>
    <div class="member">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/mall.png">
      <h2 class="member-name">商城明細</h2>
      <span class="member-role">Chief Operating Officer</span>
    </div>
    <div class="member">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/hotel.jpg">
      <h2 class="member-name">旅館預約</h2>
      <span class="member-role">Chief Financial Officer</span>
    </div>
    
     <div class="member">
     <a href="<%=request.getContextPath()%>/Puppy/mli.do?action=getAll_For_Display&mli=${memNO}">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/new.png">
      <h2 class="member-name">最新消息</h2>
      <span class="member-role">Majority Investor</span>
   	 </a>
    </div>
    
    
    <div class="member">
     <a href="<%=request.getContextPath()%>/front-end/member/accusation/add_acc.jsp">
      <img class="centerpic" src="<%=request.getContextPath()%>/front-end/member/member/images/accpic.png">
      <h2 class="member-name">客訴中心</h2>
      <span class="member-role">Majority Investor</span>
   	 </a>
    </div>
  </div>
</div>
<!-- partial -->
  	<c:if test="${not empty update}">
		<script>
			swal("修改成功", "", "success");
		</script>
	</c:if>
	<c:if test="${not empty insertacc}">
		<script>
			swal("新增成功", "", "success");
		</script>
	</c:if>
</body>
</html>
