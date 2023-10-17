package com.ezen.dda.waiting;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WaitingController {
	@Autowired
	SqlSession sqlSession;
	// 웨이팅 하러 가기
	@RequestMapping(value = "/waitingInput", method = RequestMethod.GET)
	public String goWaiting(HttpServletRequest request, Model model) {
		String store_id = request.getParameter("store_id");
		model.addAttribute("store_id", store_id);
		return "waitingInput";
	}
	
	// 웨이팅 걸기
	@RequestMapping(value = "/waitingSave", method = RequestMethod.POST)
	public String waitingSave(HttpServletRequest request, Model model) {
		String store_id = request.getParameter("store_id"); // 가게 아이디
		String customer_id = request.getParameter("customer_id"); // 가게 아이디
		String name = request.getParameter("name"); // 웨이팅자 이름
		String phone = request.getParameter("phone"); // 전화번호
		int person_num = Integer.parseInt(request.getParameter("person_num")); // 인원 수
		WaitingDTO waitingDTO = new WaitingDTO(store_id, customer_id, name, phone, person_num);
		WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
		waitingService.waitingSave(waitingDTO); // 웨이팅 등록
		
		WaitingDTO dto = waitingService.waitingOut(store_id, customer_id); // 웨이팅 대기번호 출력
		model.addAttribute("waitingDTO", dto);
		return "waitingDone";
	}
	
	// 웨이팅 현황 보러가기
		@RequestMapping(value = "/mywaiting", method = RequestMethod.GET)
		public String mywaiting(HttpServletRequest request, Model model) {
			String customer_id = request.getParameter("customer_id");
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			ArrayList<WaitingDTO> waitingList = waitingService.mywaiting(customer_id);
			model.addAttribute("waitingList", waitingList);
			return "myWaiting";
		}
		
		// 대기번호 확인
		@RequestMapping(value = "/waitingdetail", method = RequestMethod.GET)
		public String waitingdetail(HttpServletRequest request, Model model) {
			String store_id = request.getParameter("store_id");
			String customer_id = request.getParameter("customer_id");
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			WaitingDTO dto = waitingService.waitingOut(store_id, customer_id); // 웨이팅 대기번호 출력
			model.addAttribute("waitingDTO", dto);
			return "waitingDetail";
		}
}
