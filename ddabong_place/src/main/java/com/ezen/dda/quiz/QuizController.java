package com.ezen.dda.quiz;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuizController {
	@Autowired
	SqlSession sqlSession;

//	카페 추천 퀴즈 페이즈로 이동
	@RequestMapping(value = "/quiz")
	public String caferecommend() {
		return "quiz";
	}

//	입력된 값을 비교하여 추천 카페 출력
	@RequestMapping(value = "/recommend")
	public String recommend(HttpServletRequest request, Model mo) {
		String kid = request.getParameter("kid");
		String pet = request.getParameter("pet");
		String parking = request.getParameter("parking");
		String rooftop = request.getParameter("rooftop");
		String terrace = request.getParameter("terrace");
		String notebook = request.getParameter("notebook");

		String sql = "";

		if ("노키즈존".equals(kid)) {
			sql += " feature LIKE '%노키즈존%' OR";
		}

		if ("반려견 동반 입장 O".equals(pet)) {
			sql += " feature LIKE '%반려견 동반 입장 O%' OR";
		}

		if ("주차장 O".equals(parking)) {
			sql += " feature LIKE '%주차장 O%' OR";
		}

		if ("루프탑".equals(rooftop)) {
			sql += " feature LIKE '%루프탑%' OR";
		}

		if ("테라스".equals(terrace)) {
			sql += " feature LIKE '%테라스%' OR";
		}

		if ("노트북 사용 O".equals(notebook)) {
			sql += " feature LIKE '%노트북 사용 O%' OR";
		}
       
		if (sql.equals("")) {
		} else {
			sql = sql.substring(0, sql.length() - 2);
			QuizDTO quizDTO = new QuizDTO();
			quizDTO.setSql(sql);
			QuizService sb = sqlSession.getMapper(QuizService.class);
			ArrayList<QuizDTO> list = sb.recommend(quizDTO);
			mo.addAttribute("list", list);
		}

		return "quizresult";
	}
}
