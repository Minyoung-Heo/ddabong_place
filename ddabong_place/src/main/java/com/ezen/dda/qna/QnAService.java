package com.ezen.dda.qna;

import java.util.ArrayList;

public interface QnAService {
	public void questionInput(QnADTO qnaDTO); // 1:1 문의 DB 저장
	public QnADTO questionDetail(int question_num); // 문의글 상세보기
	
	// 손님용 페이지 처리
	public int cnt_customer();
	public ArrayList<QnADTO> select_customer(PageDTO dto);
	
	// 손님용 검색 페이지 처리
	public int cnt_customerSearch(String searchType, String searchContent);
	public ArrayList<QnADTO> select_customerSearch(PageDTO dto);
	
	// 업체용 페이지 처리
	public int cnt_store();
	public ArrayList<QnADTO> select_store(PageDTO dto);
	
	// 업체용 검색 페이지 처리
	public int cnt_storeSearch(String searchType, String searchContent);
	public ArrayList<QnADTO> select_storeSearch(PageDTO dto);
	
	// 답글용 페이지 처리
	public int cnt_reply();
	public ArrayList<QnADTO> select_reply(PageDTO dto);
	
	// 답글 처리
	public void stepUp(int groups, int step);
	public void reply(QnADTO qnaDTO);
	
	// 답글용 검색 페이지 처리
	public int cnt_replySearch(String searchType, String searchContent);
	public ArrayList<QnADTO> select_replySearch(PageDTO dto);
}
