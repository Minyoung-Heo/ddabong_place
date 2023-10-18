package com.ezen.dda.calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CalendarController{
	
	@RequestMapping(value = "/calendar")
	public String cal1(){
		return "storestatus";
	}
}
//import java.util.HashMap;
//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.ibatis.session.SqlSession;
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//@RequiredArgsConstructor
//@RequestMapping("/calendar")
//public class CalendarController {
// 
//    private static final Logger log = LoggerFactory.getLogger(CalendarController.class);
// 
//    private final ScheduleService scheduleService;
// 
//    @GetMapping("/calendar-admin")
//    @ResponseBody
//    public List<Map<String, Object>> monthPlan() {
//        List<CalendarDTO> listAll = scheduleService.findAll();
// 
//        JSONObject jsonObj = new JSONObject();
//        JSONArray jsonArr = new JSONArray();
// 
//        HashMap<String, Object> hash = new HashMap<>();
// 
//        for (int i = 0; i < listAll.size(); i++) {
//            hash.put("title", listAll.get(i).getCustomer_id());
//            hash.put("start", listAll.get(i).getReservation_start_date());
//            hash.put("end", listAll.get(i).getReservation_end_date());
////          hash.put("time", listAll.get(i).getScheduleTime());
// 
//            jsonObj = new JSONObject(hash);
//            jsonArr.add(jsonObj);
//        }
//        log.info("jsonArrCheck: {}", jsonArr);
//        return jsonArr;
//    }
//}