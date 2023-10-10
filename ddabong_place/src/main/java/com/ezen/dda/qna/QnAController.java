package com.ezen.dda.qna;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnAController {
	@Autowired
	SqlSession sqlSession;
	
	// 자주하는 질문으로 가기
	@RequestMapping(value = "/qnaform")
	public String goQnA() {
		return "qnaForm";
	}
	
	// 1:1 문의하기로 가기
	@RequestMapping(value = "/question")
	public String goQuestion() {
		return "questionInput";
	}
	
	// 1:1 문의 DB 저장
	@RequestMapping(value = "/questionInput", method = RequestMethod.POST)
	public String questioninput(HttpServletRequest request) {
		String userType = request.getParameter("userType"); // 회원 유형
		String questionType = request.getParameter("questionType"); // 문의 유형
		String title = request.getParameter("title"); // 제목
		String writer = request.getParameter("writer"); // 작성자
		String id = request.getParameter("id"); // 작성자 아이디
		String content = request.getParameter("content"); // 문의 내용
		int pw = Integer.parseInt(request.getParameter("pw")); // 비밀번호 4자리
		QnADTO qnaDTO = new QnADTO(userType, questionType, title, writer, id, content, pw);
		QnAService qnaService = sqlSession.getMapper(QnAService.class);
		qnaService.questionInput(qnaDTO);
		return "questionInput";
	}
	
}
