package com.ezen.dda.personal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PersonalController {
	@Autowired
	SqlSession sqlSession;

	// 로그인 선택 화면
	@RequestMapping(value = "/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	// 회원가입 선택 화면
	@RequestMapping(value = "/selectJoin")
	public String selectJoin() {
		return "selectJoin";
	}

	// 회원용 로그인 화면
	@RequestMapping(value = "/personalLogin")
	public String personalLogin() {
		return "personalLogin";
	}

//  회원용 로그인 확인
	@RequestMapping(value = "/personallogincheck", method = RequestMethod.POST)
	public String personallogincheck(HttpServletRequest request) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");
		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		PersonalDTO dto = ss.personallogincheck(id, pw);
		if (dto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("personal", dto);
			hs.setAttribute("personalloginstate", true);
			hs.setMaxInactiveInterval(3600);

			return "redirect:/";
		} else {

			return "personalloginerr";
		}
	}

//  로그아웃
	@RequestMapping(value = "/personallogout")
	public String personallogout(HttpServletRequest request) {
		HttpSession hs = request.getSession();

		hs.removeAttribute("personal");
		hs.setAttribute("personalloginstate", false);

		return "redirect:/";
	}

	// 회원용 회원가입 화면
	@RequestMapping(value = "/personalJoin")
	public String personalJoin() {
		return "personalJoin";
	}

//  회원 회원가입 전송
	@RequestMapping(value = "/personalsave", method = RequestMethod.POST)
	public String in2(HttpServletRequest request) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");
		String name = request.getParameter("personalname");
		String nickname = request.getParameter("personalnickname");
		String phone = request.getParameter("personalphone");
		String address = request.getParameter("personaladdress");
		String email = request.getParameter("personalemail");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		ss.personaljoin(id, pw, name, nickname, phone, address, email);

		return "main";
	}

//  아이디 중복확인 체크
	@ResponseBody
	@RequestMapping(value = "/idcheck")
	public String out4(String id) {
		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		int cnt = ss.idcheck(id);
		String bb = null;
		if (cnt == 0) {
			bb = "ok";
		} else {
			bb = "";
		}
		return bb;
	}

}
