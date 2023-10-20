package com.ezen.dda.cafe;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
			model.addAttribute("cafeList", cafeList);
			model.addAttribute("reviewList", reviewList);
			return "cafeOut";
		}
}
