package com.ezen.dda.personal;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class PersonalController {
	@Autowired
	SqlSession sqlSession;
	ArrayList<PersonalDTO> list = new ArrayList<PersonalDTO>();

	// 로그인 선택 화면
	@RequestMapping(value = "/selectLogin")
	public String selectLogin() {
		return "selectLogin";
	}

	// 마이페이지
	@RequestMapping(value = "/myinfo")
	public String myinfo() {
		return "myinfo";
	}

	// 마이페이지 수정
	@RequestMapping(value = "/myinfoModify")
	public String myinfoModify() {
		return "myinfoModify";
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

	// 회원용 아이디 및 비번찾기 화면
	@RequestMapping(value = "/personalFind")
	public String personalFind() {
		return "personalFind";
	}

	// 회원용 아이디찾기 화면
	@RequestMapping(value = "/personalidFind")
	public String personalidFind() {
		return "personalidFind";
	}


	// 회원용 아이디찾기 검색결과
	@RequestMapping(value = "/personalidResult", method = RequestMethod.POST)
	public String peresonalidResult(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		list = ss.personalidResult(name, email);
		model.addAttribute("list", list);

		return "personalidResult";
	}

	// 회원용 비번찾기 화면
	@RequestMapping(value = "/personalpwFind")
	public String personalpwFind() {
		return "personalpwFind";
	}

	// 회원용 비번찾기 검색결과
	@RequestMapping(value = "/personalpwResult", method = RequestMethod.POST)
	public String personalpwResult(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String id = request.getParameter("id");
		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		list = ss.personalpwResult(name, id);
		model.addAttribute("list", list);

		return "personalpwResult";
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
			hs.setMaxInactiveInterval(1800);

			return "redirect:/main";
		} else {
			String alertMessage = "아이디 또는 비밀번호를 다시 확인해주세요";
			request.setAttribute("alertMessage", alertMessage);

			return "personalloginerr";
		}
	}

	// 개인정보 들어가기 전 비밀번호 확인
	@RequestMapping(value = "/personalpwcheck")
	public String personalpwcheck() {
		return "personalpwcheck";
	}

	// 회원 탈퇴 마지막 질문
	@RequestMapping(value = "/confirmLeave")
	public String confirmLeave() {
		return "confirmLeave";
	}

//  개인정보 들어가기 전 비밀번호 확인 체킹
	@RequestMapping(value = "/personalpwchecking", method = RequestMethod.POST)
	public String personalpwchecking(HttpServletRequest request) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);

		PersonalDTO dto = ss.personalpwchecking(id, pw);

		if (dto != null) {

			return "myinfo";
		} else {
			String alertMessage = "비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "personalloginerr";
		}
	}

	// 탈퇴하기 전 비밀번호 확인
	@RequestMapping(value = "/personalleave")
	public String personalleave() {
		return "personalleave";
	}

//  탈퇴하기 전 비밀번호 확인 체킹
	@RequestMapping(value = "/personalleavechecking", method = RequestMethod.POST)
	public String personalpwchecking2(HttpServletRequest request) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);

		PersonalDTO dto = ss.personalleavechecking(id, pw);

		if (dto != null) {
			return "redirect:/confirmLeave";

		} else {
			String alertMessage = "비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "personalloginerr";
		}
	}

	// 회원 탈퇴
	@RequestMapping(value = "/personaldelete")
	public String del(HttpServletRequest request) {
		String id = request.getParameter("id");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		ss.reservationdelete(id); // 예약 데이터 삭제
		// 여기 리뷰테이블도 연결돼있는데 일단 나중에 다시 수정 필요!!!!!
		ss.stardelete(id); // 즐겨찾기 데이터 삭제
		ss.waitingdelete(id); // 웨이팅 데이터 삭제
		ss.personaldelete(id); // 회원아이디 데이터 삭제

		HttpSession hs = request.getSession();
		hs.removeAttribute("personal");
		hs.setAttribute("personalloginstate", false);

		return "redirect:/main";
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
		String address = request.getParameter("addr2") + " " + request.getParameter("addr3");
		String email = request.getParameter("personalemail");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		ss.personaljoin(id, pw, name, nickname, phone, address, email);

		return "personalLogin";
	}

//  회원정보 수정
	@RequestMapping(value = "/personalModifysave", method = RequestMethod.POST)
	public String Modify(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");
		String name = request.getParameter("personalname");
		String nickname = request.getParameter("personalnickname");
		String phone = request.getParameter("personalphone");
		String address = request.getParameter("addr2") + " " + request.getParameter("addr3");
		String email = request.getParameter("personalemail");

		PersonalService ss = sqlSession.getMapper(PersonalService.class);
		ss.personalModifysave(id, pw, name, nickname, phone, address, email);

		HttpSession hs = request.getSession();
		hs.removeAttribute("personal");
		hs.setAttribute("personalloginstate", false);

		return "redirect:/main";
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
