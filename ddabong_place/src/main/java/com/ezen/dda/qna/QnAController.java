package com.ezen.dda.qna;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	// 손님 QnA로 가기
	@RequestMapping(value="/customerqna")
	public String gocustomerqna(HttpServletRequest request, PageDTO dto, Model model) {
         String nowPage = request.getParameter("nowPage"); // 처음엔 null만 들어감
         String cntPerPage = request.getParameter("cntPerPage"); // 처음엔 null만 들어감
	     QnAService qnaService = sqlSession.getMapper(QnAService.class);
        //전체 레코드 수 구하기
        int total = qnaService.cnt_customer(); // DB에서 레코드 수 가져옴
	         if(nowPage == null && cntPerPage == null) { // 처음 시작 시 둘 다 null
	            nowPage = "1"; // 시작 페이지를 1로
	            cntPerPage = "10"; // 한 페이지 당 레코드 수를 10개로
	         } else if(nowPage==null) {
	            nowPage="1";
	         } else if(cntPerPage==null) {
	        	 cntPerPage="10";
	         }      
	         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	         model.addAttribute("paging", dto);
	         model.addAttribute("list", qnaService.select_customer(dto)); // 전체 레코드 수 & 자료 행 중 start end 값 반환
	         return "customerQnA";
	      }
	
	// 손님 QnA 검색
	@RequestMapping(value = "/customerSearch")
	public String customerdsearch(HttpServletRequest request, PageDTO dto, Model model) {
		String searchType = request.getParameter("searchType"); // 검색 유형
		String searchContent = request.getParameter("searchContent"); // 검색 내용
		String nowPage = request.getParameter("nowPage"); // 처음엔 null만 들어감
        String cntPerPage = request.getParameter("cntPerPage"); // 처음엔 null만 들어감
	     QnAService qnaService = sqlSession.getMapper(QnAService.class);
       //전체 레코드 수 구하기
       int total = qnaService.cnt_customerSearch(searchType, searchContent); // DB에서 레코드 수 가져옴
	         if(nowPage == null && cntPerPage == null) { // 처음 시작 시 둘 다 null
	            nowPage = "1"; // 시작 페이지를 1로
	            cntPerPage = "10"; // 한 페이지 당 레코드 수를 10개로
	         } else if(nowPage==null) {
	            nowPage="1";
	         } else if(cntPerPage==null) {
	        	 cntPerPage="10";
	         }      
	         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	         dto.setSearchType(searchType);
	         dto.setSearchContent(searchContent);
	         model.addAttribute("paging", dto);
	         model.addAttribute("list", qnaService.select_customerSearch(dto)); // 전체 레코드 수 & 자료 행 중 start end 값 반환
	         return "customerQnA";
	}
	
	// 업체 QnA로 가기
		@RequestMapping(value="/storeqna")
		public String gostoreqna(HttpServletRequest request, PageDTO dto, Model model) {
	         String nowPage = request.getParameter("nowPage"); // 처음엔 null만 들어감
	         String cntPerPage = request.getParameter("cntPerPage"); // 처음엔 null만 들어감
		     QnAService qnaService = sqlSession.getMapper(QnAService.class);
	        //전체 레코드 수 구하기
	        int total = qnaService.cnt_store(); // DB에서 레코드 수 가져옴
		         if(nowPage == null && cntPerPage == null) { // 처음 시작 시 둘 다 null
		            nowPage = "1"; // 시작 페이지를 1로
		            cntPerPage = "10"; // 한 페이지 당 레코드 수를 10개로
		         } else if(nowPage==null) {
		            nowPage="1";
		         } else if(cntPerPage==null) {
		        	 cntPerPage="10";
		         }      
		         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		         model.addAttribute("paging", dto);
		         model.addAttribute("list", qnaService.select_store(dto)); // 전체 레코드 수 & 자료 행 중 start end 값 반환
		         return "storeQnA";
		      }
	
	// 업체 QnA 검색
	@RequestMapping(value = "/storeSearch")
	public String storesearch(HttpServletRequest request, PageDTO dto, Model model) {
		String searchType = request.getParameter("searchType"); // 검색 유형
		String searchContent = request.getParameter("searchContent"); // 검색 내용
		String nowPage = request.getParameter("nowPage"); // 처음엔 null만 들어감
        String cntPerPage = request.getParameter("cntPerPage"); // 처음엔 null만 들어감
	     QnAService qnaService = sqlSession.getMapper(QnAService.class);
       //전체 레코드 수 구하기
       int total = qnaService.cnt_storeSearch(searchType, searchContent); // DB에서 레코드 수 가져옴
	         if(nowPage == null && cntPerPage == null) { // 처음 시작 시 둘 다 null
	            nowPage = "1"; // 시작 페이지를 1로
	            cntPerPage = "10"; // 한 페이지 당 레코드 수를 10개로
	         } else if(nowPage==null) {
	            nowPage="1";
	         } else if(cntPerPage==null) {
	        	 cntPerPage="10";
	         }      
	         dto = new PageDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	         dto.setSearchType(searchType);
	         dto.setSearchContent(searchContent);
	         model.addAttribute("paging", dto);
	         model.addAttribute("list", qnaService.select_storeSearch(dto)); // 전체 레코드 수 & 자료 행 중 start end 값 반환
	         return "storeQnA";
	}
	
	// 1:1 문의 DB 저장
	@RequestMapping(value = "/questionInput", method = RequestMethod.POST)
	public String questioninput(HttpServletRequest request) {
		String userType = request.getParameter("userType"); // 회원 유형
		String questionType = request.getParameter("questionType"); // 문의 유형
		String title = request.getParameter("title"); // 제목
		String writer = request.getParameter("writer"); // 작성자
		String id = request.getParameter("id"); // 작성자 아이디
		String content = request.getParameter("content").replace("\n", "<br>"); // 문의 내용
		int pw = Integer.parseInt(request.getParameter("pw")); // 비밀번호 4자리
		QnADTO qnaDTO = new QnADTO(userType, questionType, title, writer, id, content, pw);
		QnAService qnaService = sqlSession.getMapper(QnAService.class);
		qnaService.questionInput(qnaDTO);
		if(userType.equals("손님")) {
			return "redirect:/customerqna";
		} else {
			return "redirect:/storeqna";
		}
	}
	
	// 문의 내용 보기
	@RequestMapping(value = "/qnadetail", method = RequestMethod.GET)
	public String questiondetail(HttpServletRequest request, Model model) {
		int question_num = Integer.parseInt(request.getParameter("question_num")); // 문의글 번호
		QnAService qnaService = sqlSession.getMapper(QnAService.class);
		QnADTO dto = qnaService.questionDetail(question_num);
		model.addAttribute("dto", dto);
		return "questionDetail";
	}
	
	
}
