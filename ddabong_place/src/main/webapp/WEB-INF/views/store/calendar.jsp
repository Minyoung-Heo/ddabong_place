<!DOCTYPE html>
<html>
<meta charset='UTF-8'>
<head>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>calendar</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- bootstrap 4 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <!-- fullcalendar -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.css">
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@5.7.0/main.min.js"></script>

    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            timeZone: 'Asia/Seoul',
            locale: 'ko',
            initialView: 'dayGridMonth',
            events: [
                {
                    title: 'hello',
                    start: '2023-10-18 10:30:00',
                    end: '2023-10-18 12:30:00'
                },
                {
                    title: '반가와요',
                    start: '2023-10-23 17:30:00',
                    end: '2023-10-23 19:30:00'
                }
            ],
            headerToolbar: {
                left: 'prev,next today addEventButton',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
            }
        });

        // "ADD" 버튼 클릭 이벤트 핸들러 추가
        $(document).on("click", "#add", function () {
            $("#calendarModal").modal("show");
        });

        // Modal 내에서 추가 버튼 클릭 이벤트 핸들러
        $("#btn.btn-primary").on("click", function () {
            var content = $("#calendar_content").val();
            var start_date = $("#reservation_start_date").val();
            var end_date = $("#reservation_end_date").val();

            //내용 입력 여부 확인
            if (content == null || content == "") {
                alert("내용을 입력하세요.");
            } else if (start_date == "" || end_date == "") {
                alert("날짜를 입력하세요.");
            } else if (new Date(end_date) - new Date(start_date) < 0) {
                alert("종료일이 시작일보다 먼저입니다.");
            } else { // 정상적인 입력 시
                var obj = {
                    "title": content,
                    "start": start_date,
                    "end": end_date
                }; // 전송할 객체 생성

                console.log(obj); // 서버로 해당 객체를 전달해서 DB 연동 가능
            }
        });
        calendar.render();
    });

    </script>

<style>
#calendar{
	width: 100%;
	font-size: 15px;
}
.fc-day-sat {
    color: blue; /* 토요일과 일요일 텍스트 색상을 빨간색으로 설정 */
  }
  
.fc-day-sun {
    color: red; /* 토요일과 일요일 텍스트 색상을 빨간색으로 설정 */
  }
</style>
</head>

<body>
<!-- <button type="button" id="add">ADD</button> -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" id="add">ADD</button>
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>
<!-- <!-- Cloudflare Pages Analytics --><script defer src='https://static.cloudflareinsights.com/beacon.min.js' data-cf-beacon='{"token": "dc4641f860664c6e824b093274f50291"}'></script>
    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 입력하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">content</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">start date</label>
                        <input type="date" class="form-control" id="reservation_start_date" name="reservation_start_date">
                        <label for="taskId" class="col-form-label">end date</label>
                        <input type="date" class="form-control" id="reservation_end_date" name="reservation_end_date">                    
                 	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="btn btn-secondary" data-dismiss="modal">닫기</button>
        			<button type="button" id="btn btn-primary">저장</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>