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
                initialView: 'dayGridMonth', // 홈페이지에서 다른 형태의 view를 확인할  수 있다.
                events:[ // 일정 데이터 추가 , DB의 event를 가져오려면 JSON 형식으로 변환해 events에 넣어주면된다.
                    {
                        title:'hello',
                        start:'2023-10-18 10:30:00',
                        end:'2023-10-18 11:30:00'
                    },
                    {
                        title:'반가와요',
                        start:'2023-10-23 17:30:00',
                        end:'2023-10-23 19:30:00'
                    }
                ],
                eventClick:function(events) {
                    if(event.url) {
                        alert(events.title + "\n" + events.start + " - " + events.end );
                        window.open(event.url);
                        return false;
                    }
                }
                headerToolbar: {
                    center: 'addEventButton' // headerToolbar에 버튼을 추가
                }, customButtons: {
                    addEventButton: { // 추가한 버튼 설정
                        text : "ADD",  // 버튼 내용
                        click : function(){ // 버튼 클릭 시 이벤트 추가
                            $("#calendarModal").modal("show"); // modal 나타내기
                            
                            $("#addCalendar").on("click", function () {
                                var content = $("#calendar_content").val();
                                var start_date = $("#reservation_start_date").val();
                                var end_date = $("#reservation_end_date").val();

                                if (!content) {
                                    alert("내용을 입력하세요.");
                                } else if (!start_date || !end_date) {
                                    alert("날짜를 입력하세요.");
                                } else {
                                    var startDate = new Date(start_date).getTime();
                                    var endDate = new Date(end_date).getTime();

                                    if (endDate < startDate) {
                                        alert("종료일이 시작일보다 먼저입니다.");
                                    } else {
                                        var obj = {
                                            title: content,
                                            start: start_date,
                                            end: end_date
                                        };
                                        console.log(obj);

                                        // 여기에 FullCalendar에 이벤트를 추가하는 코드를 작성하세요
                                        // calendar.addEvent({...});
                                        
                                        $('#calendarModal').modal('hide'); // 모달을 닫습니다.
                                    }
                                }
                            });

                        }
                    }
                },
                editable: true, // false로 변경 시 draggable 작동 x 
                displayEventTime: true, // 시간 표시 x
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
    <div id="calendarBox">
        <div id="calendar"></div>
    </div>

    <!-- modal 추가 -->
    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
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
                        <label for="taskId" class="col-form-label">일정 내용</label>
                        <input type="text" class="form-control" id="calendar_content" name="calendar_content">
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="date" class="form-control" id="reservation_start_date" name="reservation_start_date">
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="date" class="form-control" id="reservation_end_date" name="reservation_end_date">                    
                 	</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addCalendar">추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
            </div>
        </div>
    </div>
</body>

</html>