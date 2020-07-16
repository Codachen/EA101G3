<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.doc.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  DocVO docVO = (DocVO) request.getAttribute("docVO"); //DocServlet.java(Concroller), 存入req的docVO物件
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
<span class="mainTitle">醫師查詢</span>

	<hr class="mainTitlehr">
		 
	<a href="<%=request.getContextPath()%>/back-end/hospital/doc/select_page.jsp">返回</a></h6>



		

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
	</tr>
	<tr>
		<td><%=docVO.getDocno()%></td>
		<td><%=docVO.getDivno()%></td>
		<td><%=docVO.getDocname()%></td>
		<td><%=docVO.getRoomno()%></td>
		<td><%=docVO.getSeniority()%></td>
		<td width="40%"  align="left"><%=docVO.getIntro()%></td>
		<td>
			<img alt="" src="<%=request.getContextPath()%>/back-end/doc/ShowDocPic.do?docno=${docVO.docno}" id="display">
		</td>
		<td width="5%"><%=docVO.getDocstatus()%></td>
		<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/doc/doc.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="docno"  value="${docVO.docno}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
		</td>
	</tr>
</table>

	<!-- ****************************以上為實際功能頁變更區域*************************** -->

</div>




<%@ include file="/back-end/backEndInclude/footer.jsp"%>


</div>

</div>


</body>
</html>