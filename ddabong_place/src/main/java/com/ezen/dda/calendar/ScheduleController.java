//package com.ezen.dda.calendar;
//
//import java.util.HashMap;
//import java.util.Map;
//
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestBody;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.ResponseBody;
//
//@Controller
//public class ScheduleController {
//	
//	@ResponseBody
//	@RequestMapping(value = "/addSchedule", method = RequestMethod.POST)
//	public Map<Object,Object> addSchedule(@RequestBody ScheduleDTO dto) throws Exception{
//		Map<Object,Object>map = new HashMap<Object,Object>();
//		
//		//ScheduleService service = ;
//		//service.addSchedule(dto);
//
//		return map;
//	}
//
//	@RequestMapping(value = "/schedule")
//	public String schedule(Model model)throws Exception {
//
//		//model.addAttribute("showSchedule" , service.showSchedule());
//	    
//		return "/schedule";
//	}
//}
