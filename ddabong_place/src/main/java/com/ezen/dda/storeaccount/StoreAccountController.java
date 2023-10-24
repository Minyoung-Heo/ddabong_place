package com.ezen.dda.storeaccount;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.dda.store.StoreService;


@Controller
public class StoreAccountController {
	@Autowired
	SqlSession sqlSession;
	
	// 업체용 나의 회원 정보
	@RequestMapping(value = "/storeaccountinfo", method = RequestMethod.GET)
	public String storeaccountinfo(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		StoreAccountService ss = sqlSession.getMapper(StoreAccountService.class);
		StoreAccountDTO dto = ss.storeAccountOut(id);
		model.addAttribute("dto", dto);
		return "storeAccountInfo";
	}

	// 업체용 회원 정보 수정
	@RequestMapping(value = "/storeaccountmodify", method = RequestMethod.GET)
	public String storeaccountmodify(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		StoreAccountService ss = sqlSession.getMapper(StoreAccountService.class);
		StoreAccountDTO dto = ss.storeAccountOut(id);
		model.addAttribute("dto", dto);
		return "storeAccountModify";
	}
	
	// 업체용 회원 정보 수정 저장
	@RequestMapping(value = "/storeAccountModifySave", method = RequestMethod.POST)
	public String storeaccountmodifysave(HttpServletRequest request, Model model) {
		String id = request.getParameter("storeAccountid");
		String pw = request.getParameter("storeAccountpw");
		String ceo = request.getParameter("storeAccountceo");
		String phone = request.getParameter("storeAccountphone");
		String email = request.getParameter("storeAccountemail");
		
		StoreAccountService ss = sqlSession.getMapper(StoreAccountService.class);
		ss.storeAccountModify(id, pw, ceo, phone, email);
		return "redirect:/";
	}
	
	// 업체용 회원 삭제 페이지로 이동
	@RequestMapping(value = "/storeaccountleave")
	public String storeaccountleave() {
		return "storeAccountLeave";
	}
	
//  탈퇴하기 전 비밀번호 확인 체킹
	@RequestMapping(value = "/storeaccountleavechecking", method = RequestMethod.POST)
	public String personalpwchecking2(HttpServletRequest request) {
		String id = request.getParameter("personalid");
		String pw = request.getParameter("personalpw");

		StoreAccountService ss = sqlSession.getMapper(StoreAccountService.class);
		StoreAccountDTO dto = ss.storeaccountleavechecking(id, pw);

		if (dto != null) {
			return "redirect:/confirmLeaveacc";

		} else {
			String alertMessage = "비밀번호를 다시 확인해주세요.";
			request.setAttribute("alertMessage", alertMessage);

			return "storeaccloginerr";
		}
	}
	// 회원 탈퇴 마지막 질문
	@RequestMapping(value = "/confirmLeaveacc")
	public String confirmLeaveacc() {
		return "confirmLeaveacc";
	}
		
	// 회원 탈퇴
	@RequestMapping(value = "/storeaccountdelete")
	public String del(HttpServletRequest request) {
		String id = request.getParameter("id");
		StoreService ss = sqlSession.getMapper(StoreService.class);
		ss.stardelete(id); // 즐겨찾기 삭제
		ss.waitingdelete(id); // 웨이팅 삭제
		ss.ddabongdelete(id); //따봉 삭제
		ss.reservationdelete(id); 
		// 예약 삭제 인데 이거 수정해야 됨 예약테이블에서 업체아이디 갖는 레코드 찾아서 예약번호 가져오고 예약번호 해당하는 리뷰 테이블 삭제하고 그다음 예약테이블 다시 삭제
		ss.registrationdelete(id); //업체 계정 삭제
		ss.storedelete(id); //매장 등록 삭제
		
		HttpSession hs = request.getSession();
		hs.removeAttribute("store");
		hs.setAttribute("storeloginstate", false);

		return "redirect:/";
	}

}