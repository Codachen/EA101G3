<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%@ page import="java.util.*"%>
<%@ page import="com.appt.model.*"%>

<%-- �U�νƦX�d��-�i�ѫȤ��select_page.jsp�H�N�W�����Q�d�ߪ���� --%>
<%-- �����u�@���ƦX�d�߮ɤ����G�m�ߡA�i���ݭn�A�W�[�����B�e�X�ק�B�R�����\��--%>

<jsp:useBean id="listAppt_ByCompositeQueryC" scope="request" type="java.util.List<ApptVO>" />

 <% 
 ApptService apptSvc = new ApptService();
 List<ApptVO> list  = listAppt_ByCompositeQueryC;
 pageContext.setAttribute("list",list);
 
 %>

<html>
<head><title>�ݶE�i�� </title>
<meta http-equiv="refresh" content="10;URL=<%=request.getContextPath()%>/front-end/hospital/appt/queueC.jsp">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.13.0/css/all.css"
	integrity="sha384-Bfad6CLCknfcloXFOyFnlgtENryhrpZCe29RTifKEixXQZ38WheV+i/6YWSzkz3V"
	crossorigin="anonymous"></head>
<body bgcolor='white'>

<h1>

<c:choose>
    <c:when test="${fn:length(listAppt_ByCompositeQueryC)==0}">
       <i class="fas fa-exclamation-circle"></i> ����S���ݶE
    </c:when>
    <c:otherwise>
        <i class="fas fa-user-md"></i>�ثe�ݶE��${fn:length(listAppt_ByCompositeQueryC)+1}
    </c:otherwise>
</c:choose>


<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<th>���u�s��</th> -->
<!-- 		<th>���u�m�W</th> -->
<!-- 		<th>¾��</th> -->
<!-- 		<th>���Τ��</th> -->
<!-- 		<th>�~��</th> -->
<!-- 		<th>����</th> -->
<!-- 		<th>����</th> -->
<!-- 	</tr> -->
	
<%-- 	<c:forEach var="apptVO" items="${listAppt_ByCompositeQuery}"> --%>
		
<!-- 		<tr> -->
<%-- 			<td>${apptVO.apptno}</td> --%>
<%-- 			<td>${apptVO.memno}</td> --%>
<%-- 			<td>${apptVO.sessionno}</td> --%>
<%-- 			<td>${apptVO.seqno}</td> --%>
<%-- 			<td>${apptVO.symdesc}</td> --%>
<!-- 			<td> -->
<%-- 			<img alt="" src="<%=request.getContextPath()%>/front-end/appt/ShowSymPhoto.do?apptno=${apptVO.apptno}" id="display"> --%>
<!-- 			</td> -->
<%-- 			<td>${apptVO.optstate}</td> --%>
			
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->

</body>
</html>