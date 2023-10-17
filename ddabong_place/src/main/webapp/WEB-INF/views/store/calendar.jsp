<!DOCTYPE html>
<%@page import="com.ezen.dda.calendar.CalendarDTO"%>
<%@page import="java.util.List"%>
<html>
<head>
<meta charset="utf-8">
<title>Full Calendar Example</title>

<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css" rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.css" rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"  integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="  crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/moment/main.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>

<script>
$(document).ready(function() {
	setCalendar();
});

function setCalendar(){

	var calendarEl = document.getElementById('calendar');

	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
		},
		dayGridMonth: 'timeGridWeek',
		locale: 'ko',
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		allDaySlot: false,
		eventLimit: true, // allow "more" link when too many events
		minTime: '07:00:00',
		maxTime: '25:00:00',
		contentHeight: 'auto',
		eventSources: [{
			events : [ 
	    	    <%List<CalendarDTO> calendarList = (List<CalendarDTO>) request.getAttribute("calendarList");%>
	            <%if (calendarList != null) {%>
	            <%for (CalendarDTO dto : calendarList) {%>
	            {
	            	title : '<%=dto.getCustomer_id()%>',
	                start : '<%=dto.getReservation_start_date()%>',
	                end : '<%=dto.getReservation_end_date()%>',
	                color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
	             },
		<%}
	}%>
					]
		}]
	});		
	calendar.render();
}
</script>
</head>

<body>
	<br>
	<br>
	<br>
	<div id="calendar"></div>
</body>
</html>
