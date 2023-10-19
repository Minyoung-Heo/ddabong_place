package com.ezen.dda.calendar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CalendarDAO")
public class CalendarDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public List<CalendarDTO> getCalendar() throws Exception {
		List<CalendarDTO> calendar = null;
		calendar = sqlSession.selectList("Calendar.calendarList");
		return calendar;
	}
}
