package com.ezen.dda.store;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	@Autowired
	SqlSession sqlSession;

	//회원용 로그인 화면
	@RequestMapping(value = "/storeLogin")
	public String storeLogin() {
		return "storeLogin";
	}
	//회원용 회원가입 화면
	@RequestMapping(value = "/storeJoin")
	public String storeJoin() {
		return "storeJoin";
	}

}
