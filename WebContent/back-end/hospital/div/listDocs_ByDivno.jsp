<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.div.model.*"%>

<jsp:useBean id="listDocs_ByDivno" scope="request" type="java.util.Set<DocVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />

<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>
<style>
/* table { */
/* 	width: 100%; */
/* 	background-color: white; */
/* 	margin-top: 5px; */
/* 	margin-bottom: 5px; */
/* 	border: 1px solid #CCCCFF; */
/* } */

table {
	text-align: center;
	background-color: white;
	
}

 th { 
/* 	padding: 5px; */
 	background-color: lightcoral;
} 

/* th, td { */
/* 	padding: 5px; */
/* 	border-bottom: dotted; */
/* 	border-width: 1px; */
/* 	border-color: rgba(0, 0, 0, 0.5); */
/* } */

td{
line-height:60px;
height:60px;
}

.seqno{
font-size:28px; 
color:red; 
font-weight:bold; 
}

#img {
	max-width: 1800px;
}

/* .modal-body img{ */
/* width:800px; */
/* } */
</style>
</head>

<body>
		<%@ include file="/back-end/backEndInclude/header.jsp" %>

	<!-- ****************************以下為實際功能頁變更區域**************************** -->
<span class="mainTitle">科別醫師檢索</span>

	<hr class="mainTitlehr">
		 
	<a href="<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp">返回</a></h6>

	</td></tr>
</table>
<table>
		
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
		
	<tr>
		<th>科別</th>
		<th>醫生編號 </th>
		<th>醫生姓名</th>
		<th>診間號碼</th>
		<th>年資</th>
		<th>介紹</th>
		<th>醫生照片</th>
		<th>醫生在職狀態</th>
		<th>修改</th>
	</tr>
	
	<c:forEach var="docVO" items="${listDocs_ByDivno}" >
		<tr>
			<td><c:forEach var="divVO" items="${divSvc.all}">
                    <c:if test="${docVO.divno==divVO.divno}">
	                    ${divVO.divno}${divVO.divname}</font>
                    </c:if>
                </c:forEach>
			</td>
			<td>${docVO.docno}</td>
			<td>${docVO.docname}</td>
			<td>${docVO.roomno}</td>
			<td>${docVO.seniority}</td>
			<td  width="40%"  align="left">${docVO.intro}</td> 
			<td>
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
			</td>
			<td width="5%">${docVO.docstatus}</td>	
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="docno"  value="${docVO.docno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>		
		
		</tr>
	</c:forEach>
</table>



</body>
</html>