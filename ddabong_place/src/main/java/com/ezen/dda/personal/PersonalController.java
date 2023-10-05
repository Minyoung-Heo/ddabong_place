package com.ezen.dda.personal;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalController {
	@Autowired
	SqlSession sqlSession;

	//로그인 선택 화면
	@RequestMapping(value = "/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}
	
	//회원가입 선택 화면
	@RequestMapping(value = "/selectJoin")
	public String selectJoin() {
		return "selectJoin";
	}
	
	//회원용 로그인 화면
	@RequestMapping(value = "/personalLogin")
	public String personalLogin() {
		return "personalLogin";
	}
	//회원용 회원가입 화면
	@RequestMapping(value = "/personalJoin")
	public String personalJoin() {
		return "personalJoin";
	}

}
