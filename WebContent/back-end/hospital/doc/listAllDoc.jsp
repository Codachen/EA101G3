<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.doc.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    DocService docSvc = new DocService();
    List<DocVO> list = docSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<!DOCTYPE html>
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
<span class="mainTitle">所有醫師資料</span>

	<hr class="mainTitlehr">
		 
	<a href="<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp">返回</a></h6>


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
		<th>醫生編號</th>
		<th>科別編號</th>
		<th>醫生姓名</th>
		<th>診間號碼</th>
		<th>年資</th>
		<th>介紹</th>
		<th>醫生照片</th>
		<th>醫生在職狀態</th>
		<th>修改</th>
<!-- 		<th>刪除</th> -->
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="docVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${docVO.docno}</td>
			<td>${docVO.divno}</td>
			<td>${docVO.docname}</td>
			<td>${docVO.roomno}</td>
			<td>${docVO.seniority}</td>
			<td width="40%"  align="left">${docVO.intro}</td> 
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
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="刪除"> -->
<%-- 			     <input type="hidden" name="docno"  value="${docVO.docno}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

	<!-- ****************************以上為實際功能頁變更區域*************************** -->
</div>




<%@ include file="/back-end/backEndInclude/footer.jsp"%>


</div>

</div>


</body>
</html>