package com.ezen.dda.waiting;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
			ArrayList<WaitingDTO> totalList = waitingService.totalWaiting();
			model.addAttribute("waitingList", waitingList);
			model.addAttribute("totalList", totalList);
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
		
		// 손님 측 웨이팅 취소
		@RequestMapping(value = "/cancelwaiting", method = RequestMethod.GET)
		public String cancelcustomer(HttpServletRequest request, Model model) {
			String store_id = request.getParameter("store_id");
			int waiting_num = Integer.parseInt(request.getParameter("waiting_num"));
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			waitingService.cancelWaiting(store_id, waiting_num); // 손님 웨이팅 취소
			waitingService.updateWaitingNum(store_id, waiting_num); // 웨이팅 번호 차감
			return "redirect:/main";
		}
		
		// 가게 측 웨이팅 리스트 보기
		@RequestMapping(value = "/waitinglist", method = RequestMethod.GET)
		public String waitinglist(HttpServletRequest request, Model model) {
			String store_id = request.getParameter("store_id");
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			ArrayList<WaitingDTO> waitingList = waitingService.waitingList(store_id);
			model.addAttribute("waitingList", waitingList);
			return "storeWaitingList";
		}
		
		// 대기자 호출
		@RequestMapping(value = "/call", method = RequestMethod.GET)
		public String call(HttpServletRequest request, Model model) {
			String store_id = request.getParameter("store_id");
			int waiting_num = Integer.parseInt(request.getParameter("waiting_num"));
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			waitingService.call(store_id, waiting_num); // 대기자 호출
			waitingService.updateWaitingNum(store_id, waiting_num); // 웨이팅 번호 차감
			return "redirect:/waitinglist?store_id="+store_id;
		}
		
		// 입장 완료
		@RequestMapping(value = "/enter", method = RequestMethod.GET)
		public String enter(HttpServletRequest request, Model model) {
			String store_id = request.getParameter("store_id");
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			waitingService.enter(store_id); // 대기자 호출
			return "redirect:/main";
		}
		
		// ajax 중복 웨이팅 검사
		@ResponseBody
		@RequestMapping(value="/waitingcheck")
		public String waitcheck(String store_id, String customer_id) {
			WaitingService waitingService = sqlSession.getMapper(WaitingService.class);
			WaitingDTO dto = waitingService.waitingcheck(store_id, customer_id);
			if(dto != null) {
				return "no";
			} else {
				return "ok";
			}
		}
}
