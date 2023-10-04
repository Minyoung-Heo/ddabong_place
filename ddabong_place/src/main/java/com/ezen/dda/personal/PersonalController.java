package com.ezen.dda.personal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalController {
	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/personalLogin")
	public String asd2a3() {
		return "personalLogin";
	}

}
