<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.mem.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	OptVO optVO = (OptVO) session.getAttribute("optVO"); //存入session的optVO物件
	// 	String memNO = (String)session.getAttribute("memNO");
	MemberVO memberVO = (MemberVO) session.getAttribute("member");
	System.out.println(memberVO.getMemName());
	System.out.println(memberVO.getMemNo());
%>
<jsp:useBean id="docSvc" scope="page" class="com.doc.model.DocService" />
<jsp:useBean id="petSvc" scope="page"
	class="com.MemberPet.model.MemberPetService" />
<html>
<head>
<%@ include file="/front-end/frontEndInclude/head.jsp"%>

<style>
table {
	width: 100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 2px solid grey;
	font-size: 22px;
	
}

table, th, td {
	text-align: center;
	
}

th {
	padding: 5px;
	background-color: #E1F5FF;
	
}

th, td {
	
	padding: 5px;
}


img {
	max-width: 100px;
}

.mainTitle {
	font-size: 32px;
	font-weight:bold;
}

.mainTitlehr{
	background-color:#E1F5FF;
	color:#E1F5FF;
	
	height:2px;
	
}
.memTable{
	width: 100%;
	margin-top: 5px;
	margin-bottom: 5px;
	border: 2px solid grey;
	font-size: 22px;

}
.memTable th {
	width: 300px;
	border-top: 1px solid #D5D5D5;
}

.memTable td  {
	float: left;
	font-size: 24px;
	text-align:left;
}


.main {
font-family: 'Noto Sans TC';
	width: 90%;
	margin: 0 auto;
}

.star{
color:red;
}
</style>


</head>
<body>

	<%@ include file="/front-end/frontEndInclude/header.jsp"%>

	<div class="main">
		<span class="mainTitle">掛號預約內容</span>

		<!-- 	<a href="dispOpt.jsp">重新選擇</a> -->


		<hr class="mainTitlehr">

		<!-- 	<div>時段編號</div> -->
		<!-- 	<div>醫生編號</div> -->
		<!-- 	<div>門診日期</div> -->
		<!-- 	<div>門診時段</div> -->
		<!-- 	<div>預約</div> -->
		<!-- 	<div></div> -->


		<table>
			<tr>

				<!-- <th>時段編號</th> -->
				<th>門診日期</th>
				<th>門診時段</th>
				<th>科別</th>
				<th>獸醫師</th>
				<th>診間</th>
				<th>預約順位</th>
				<!-- 			<th>最大預約數</th> -->
			</tr>
			<tr>

				<%-- 			<td>${optVO.sessionNo}</td> --%>
				<td><fmt:formatDate value="${optVO.optDate}"
						pattern="yyyy/MM/dd (E)" /></td>
				<td>${optVO.optSession}</td>
				<td>
					<!-- 			暫時寫死3個科別(整合後修改) --> <c:forEach var="docVO"
						items="${docSvc.all}">
						<c:if test="${optVO.docNo==docVO.docno}">
	                    ${(docVO.divno == 'D01')?'貓科':(docVO.divno == 'D02')?'犬科':'其他科'}
                    </c:if>
					</c:forEach>

				</td>
				<td><c:forEach var="docVO" items="${docSvc.all}">
						<c:if test="${optVO.docNo==docVO.docno}">
	                    ${docVO.docname}
                    </c:if>
					</c:forEach></td>
				<td><c:forEach var="docVO" items="${docSvc.all}">
						<c:if test="${optVO.docNo==docVO.docno}">
	                    ${docVO.roomno}診
                    </c:if>
					</c:forEach></td>
				<td>${optVO.currentCount+1}</td>
				<%-- 			<td>${optVO.maximum}</td> --%>


			</tr>
		</table>



		<br> <span class="mainTitle">確認會員資料</span>
		<hr class="mainTitlehr">
		<FORM METHOD="post" ACTION="apptStart.do" name="form1" id="form1"
			enctype="multipart/form-data">

			<table class="memTable table-striped">



				<tr>
					<th>姓名</th>
					<td><span><%=(memberVO == null) ? "" : memberVO.getMemName()%></span></td>
				</tr>


				<tr>
					<th>Email</th>
					<td><span><%=(memberVO == null) ? "" : memberVO.getMemEmail()%></span></td>
				</tr>




				<tr>
					<th>電話</th>
					<td><span><%=(memberVO == null) ? "" : memberVO.getMemPhone()%></span></td>
				</tr>




				<tr>
					<th>選擇寵物<span class="star">*</span></th>
					<td><select size="1" name="petNo" style="width: 247px;">
							<%-- 					下方member.memNo的member是一個MemberVO，在原本session裡面--%>
							<option value="nodata">未選擇
								<c:forEach var="petVO"
									items="${petSvc.getPetsFromThisMember(member.memNo)}">
									<%-- 						<c:forEach var="petVO" items="${petSvc.getPetsFromThisMember('M0005')}"> --%>

									<option value="${petVO.petNo}">${petVO.petName}
								</c:forEach>
								
					</select>
					<c:if test="${not empty errorMsgs}">

		<c:forEach var="message" items="${errorMsgs}">
			<span style="color:red">${message}</span>
		</c:forEach>

</c:if></td>
				</tr>


				<tr>
					<th>症狀描述</th>
					<td><textarea id="symdesc" name="symdesc" rows="4" cols="50"
							maxlength="33"></textarea></td>
				</tr>

				<tr>
					<th>上傳寵物症狀圖片</th>
					<td><input type="file" name="symphoto" class="upl">
						<div style="width: 100%;">
							<img class="preview" style="max-width: 300px;border-radius:10px;">
							<div class="size"></div>
						</div>
					</td>
				</tr>




			</table>
			<br> <input type="hidden" name="action" value="insert">
			<input type="hidden" name="memNo" value="${member.memNo}"> <input
				type="hidden" name="sessionNo" value="${optVO.sessionNo}"> <input
				type="hidden" name="seqNo" value="${optVO.currentCount+1}">
			<input type="hidden" name="requestPara"
				value="<%=request.getQueryString()%>">
			<!--送出本網頁的路徑參數給Controller-->

			<div style="width: 100%" align="center">
				<button type="submit" class="btn btn-primary">確定預約</button>
			</div>



		</form>


	</div>



	<%@ include file="/front-end/frontEndInclude/footer.jsp"%>


</body>


<script>
	$(function() {

		function format_float(num, pos) {
			var size = Math.pow(10, pos);
			return Math.round(num * size) / size;
		}

		function preview(input) {

			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.preview').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}

		$("body").on("change", ".upl", function() {
			console.log("123");
			preview(this);
		})

	})
</script>
</html>

