
package com.ezen.dda.calendar;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CalendarController {

	@RequestMapping(value = "/calendar")
	public String store1() {

		return "calendar";
	}

	// 일정보기

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView getCalendarList(ModelAndView mv, HttpServletRequest request) {
		String viewpage = "calendar";
		List<CalendarDTO> calendar = null;
		try {
			calendar = CalendarService.getCalendar();
			request.setAttribute("calendarList", calendar);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.setViewName(viewpage);
		return mv;
	}
	 
}
