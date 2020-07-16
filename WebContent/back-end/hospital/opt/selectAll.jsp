<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.opt.model.*"%>
<%@ page import="com.doc.model.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.GsonBuilder"%>
<%@ page import="com.google.gson.JsonArray"%>
<%@ page import="com.google.gson.JsonElement"%>
<%@ page import="com.google.gson.JsonObject"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>


<%
	OptService optSvc = new OptService();
	// List<OptVO> list = optSvc.getCalInfoByDoc(docno);
	List<OptVO> list = optSvc.getCalInfo();
	Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
	String jsonStr = gson.toJson(list);

	System.out.println("Object to JSON: " + jsonStr);

	pageContext.setAttribute("jsonStr", jsonStr);
%>



<html>
<head>
<%@ include file="/back-end/backEndInclude/head.jsp"%>

<link
	href='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.css'
	rel='stylesheet' />
<script
	src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/main.js'></script>
<script
	src='<%=request.getContextPath()%>/front-end/hospital/fullcalendar/locales-all.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script>
		
	var dateStr = '';

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
    	
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay'
      },
      hiddenDays: [0],
      slotMinTime: "09:00:00",
      slotMaxTime: "22:00:00",
      locale: 'zh-tw',
      initialDate: new Date(),
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      select: function(info) {
    	 
    	  dateStr = info.startStr;
    	  
    	  console.log(dateStr);
    	  $('#formDate').html('');
    	  $('#formDate').append(dateStr);
    	  
    	  $('#exampleModal').modal('show');
//           var title = prompt('Event Title:');
//           if (title) {
//             calendar.addEvent({
//               title: title,
//               start: arg.start,
//               allDay: arg.allDay
//             })
//           }
//           calendar.unselect()
        },
      selectMirror: true,
      editable: false,
      dayMaxEvents: true, // allow "more" link when too many events
      events: ${jsonStr}
//       events: [{'title':123,'start':'2020-07-02'}]

    });
    calendar.render();
  });
  


  </script>

<style>
#calendar {
	width: 100%;
	/* 	margin: 0 auto; */
}
.modal-header
{
}
</style>



</head>

<body>
	<%@ include file="/back-end/backEndInclude/header.jsp"%>

	<span class="mainTitle">班表管理-全院排班</span>
	<a href="select_page.jsp">返回班表管理首頁</a>

	<hr class="mainTitlehr">


	<div id='calendar'></div>

	<jsp:useBean id="divSvc" scope="page" class="com.div.model.DivService" />
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">新增班表</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							日期
							<p id="formDate"></p>
						</div>
						<div class="form-group">
							科別 <select class="form-control form-control-sm">
								<option value="">未選擇
									<c:forEach var="divVO" items="${divSvc.all}">
										<option value="${divVO.divno}">${divVO.divname}
									</c:forEach>
							</select>
						</div>
						<div class="form-group">
							時段<br>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="optSession" id="inlineRadio1" value="10:00-12:00">
								<label class="form-check-label" for="inlineRadio1">早上</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="optSession" id="inlineRadio2" value="14:00-17:00">
								<label class="form-check-label" for="inlineRadio2">下午</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="optSession" id="inlineRadio3" value="18:00-20:00"> 
									<label class="form-check-label"
									for="inlineRadio3">晚上</label>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary">新增</button>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="/back-end/backEndInclude/footer.jsp"%>
</body>


</html>