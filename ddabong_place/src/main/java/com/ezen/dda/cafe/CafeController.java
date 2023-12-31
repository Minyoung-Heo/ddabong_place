package com.ezen.dda.cafe;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CafeController {
	@Autowired
	SqlSession sqlSession;
	
	// 전체 카페 보러가기
	@RequestMapping(value = "/gocafe")
	public String gocafe(Model model) {
		CafeService cafeService = sqlSession.getMapper(CafeService.class);
		ArrayList<CafeDTO> cafeList = cafeService.cafeOut(); // 카페 리스트
		ArrayList<CafeDTO> reviewList = cafeService.reviewStar(); // 리뷰 별점 평균, 리뷰 수
		ArrayList<CafeDTO> waitingList = cafeService.waiting_num(); // 현재 대기 인원
		
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("waitingList", waitingList);
		return "cafeOut";
	}
		
	// 지역별 카페 보러가기
	@RequestMapping(value = "/goregion", method = RequestMethod.GET)
	public String goregion(HttpServletRequest request, Model model) {
		String region_name = request.getParameter("region_name");
		CafeService cafeService = sqlSession.getMapper(CafeService.class);
		ArrayList<CafeDTO> cafeList = cafeService.cafeRegion(region_name); // 지역별 카페 리스트
		ArrayList<CafeDTO> reviewList = cafeService.reviewStar(); // 리뷰 별점 평균, 리뷰 수
		ArrayList<CafeDTO> waitingList = cafeService.waiting_num(); // 현재 대기 인원
		
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("waitingList", waitingList);
		model.addAttribute("region", region_name);
		return "cafeOut";
	}
	
	// 디저트별 카페 보러가기
		@RequestMapping(value = "/godessert", method = RequestMethod.GET)
		public String godessert(HttpServletRequest request, Model model) {
			String dessert = request.getParameter("dessert");
			CafeService cafeService = sqlSession.getMapper(CafeService.class);
			ArrayList<CafeDTO> cafeList = cafeService.cafeDessert(dessert); // 지역별 카페 리스트
			ArrayList<CafeDTO> reviewList = cafeService.reviewStar(); // 리뷰 별점 평균, 리뷰 수
			ArrayList<CafeDTO> waitingList = cafeService.waiting_num(); // 현재 대기 인원
			
			model.addAttribute("cafeList", cafeList);
			model.addAttribute("reviewList", reviewList);
			model.addAttribute("waitingList", waitingList);
			model.addAttribute("dessert", dessert);
			return "cafeOut";
		}
}
