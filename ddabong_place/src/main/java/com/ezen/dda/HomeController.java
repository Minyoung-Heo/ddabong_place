package com.ezen.dda;

import java.time.LocalDate;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.dda.cafe.CafeDTO;
import com.ezen.dda.cafe.CafeService;
import com.ezen.dda.rank.RankDTO;
import com.ezen.dda.rank.RankService;

@Controller
public class HomeController {

	@Autowired
	SqlSession sqlSession;

	@RequestMapping(value = "/")
	public String monthDDA(HttpServletRequest request, Model model) {

		HttpSession hs = request.getSession();
		hs.setAttribute("storeloginstate", false);
		hs.setAttribute("personalloginstate", false);

		// 이달의 따봉 기능
		RankService rankService = sqlSession.getMapper(RankService.class);
		int mon = LocalDate.now().getMonthValue(); // 현재 월을 숫자 1~12 로 받아옴
		String month; // 문자 월
		switch (mon) { // 숫자 월을 문자 월로 변환
		case 1:
			month = "jan";
			break;
		case 2:
			month = "feb";
			break;
		case 3:
			month = "mar";
			break;
		case 4:
			month = "apr";
			break;
		case 5:
			month = "may";
			break;
		case 6:
			month = "jun";
			break;
		case 7:
			month = "jul";
			break;
		case 8:
			month = "aug";
			break;
		case 9:
			month = "sep";
			break;
		case 10:
			month = "oct";
			break;
		case 11:
			month = "nov";
			break;
		default:
			month = "dcb";
		}
		RankDTO rankDTO = new RankDTO();
		rankDTO.setMonth(month); // 이번달 저장
		ArrayList<RankDTO> rankList = rankService.monthDDA(rankDTO);
		model.addAttribute("rankList", rankList);

		// 따봉 어워드
		ArrayList<RankDTO> awardList = rankService.awardDDA();
		model.addAttribute("awardList", awardList);

		// 예약 HOT 랭킹
		ArrayList<RankDTO> hotList = rankService.hotRank();
		model.addAttribute("hotList", hotList);

		// 리뷰 별점 평균, 리뷰 수
		CafeService cafeService = sqlSession.getMapper(CafeService.class);
		ArrayList<CafeDTO> reviewstarList = cafeService.reviewStar();
		model.addAttribute("reviewstarList", reviewstarList);

		return "main";
	}

	// 메인 팝업
	@RequestMapping(value = "/main_popup")
	public String main_popup() {
		return "main_popup";
	}

	
}
